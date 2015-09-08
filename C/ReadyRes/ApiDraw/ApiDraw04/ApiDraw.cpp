#include <windows.h>
#include "resource.h"

// 매크로 정의
#define TRSIZE 4
#define DS_LT 0
#define DS_RT 1
#define DS_LB 2
#define DS_RB 3

// 타입 및 전역 변수
HINSTANCE g_hInst;
HWND hWndMain;
LPCTSTR lpszClass=TEXT("ApiDraw");
HWND hCanvas;
enum DTool { DT_SELECT, DT_LINE, DT_ELLIPSE, DT_RECTANGLE, DT_TEXT, 
	DT_BITMAP, DT_META };
enum DMode { DM_NONE, DM_DRAW, DM_MOVE, DM_SIZE };
DTool NowTool;
DMode DragMode;
int sx,sy,oldx,oldy;
struct DObject
{
	DTool Type;
	RECT rt;
	unsigned short Flag;
};
DObject **arObj;
int arSize;
int arNum;
int arGrowBy;
int NowSel;

// 함수 원형
LRESULT Main_OnCreate(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT Main_OnDestroy(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT Main_OnSize(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT Main_OnCommand(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT Main_OnInitMenu(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT Main_OnSetFocus(HWND hWnd,WPARAM wParam,LPARAM lParam);

LRESULT OnCreate(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnDestroy(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnPaint(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnCommand(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnLButtonDown(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnMouseMove(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnLButtonUp(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnKeyDown(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnSetCursor(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnSize(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnContextMenu(HWND hWnd,WPARAM wParam,LPARAM lParam);
LRESULT OnLButtonDblclk(HWND hWnd,WPARAM wParam,LPARAM lParam);

LRESULT CALLBACK WndProc(HWND,UINT,WPARAM,LPARAM);
LRESULT CALLBACK CanvasProc(HWND,UINT,WPARAM,LPARAM);
BOOL AppendObject(DTool Type,int x1,int y1,int x2,int y2);
BOOL AppendObject(DTool Type,RECT *prt);
int FindObject(int x, int y);
void GetTrackerRect(int idx,int nTrack,RECT *trt);
void DrawTracker(HDC hdc,int idx);
void DelObject(int idx);

int APIENTRY WinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance
	  ,LPSTR lpszCmdParam,int nCmdShow)
{
	HWND hWnd;
	MSG Message;
	WNDCLASS WndClass;
	g_hInst=hInstance;
	
	WndClass.cbClsExtra=0;
	WndClass.cbWndExtra=0;
	WndClass.hbrBackground=NULL;
	WndClass.hCursor=LoadCursor(NULL,IDC_ARROW);
	WndClass.hIcon=LoadIcon(hInstance,MAKEINTRESOURCE(IDI_APIDRAW));
	WndClass.hInstance=hInstance;
	WndClass.lpfnWndProc=WndProc;
	WndClass.lpszClassName=lpszClass;
	WndClass.lpszMenuName=MAKEINTRESOURCE(IDR_MENU1);
	WndClass.style=0;
	RegisterClass(&WndClass);

	WndClass.hbrBackground=(HBRUSH)(COLOR_WINDOW+1);
	WndClass.lpfnWndProc=CanvasProc;
	WndClass.lpszClassName="Canvas";
	WndClass.lpszMenuName=NULL;
	WndClass.style=CS_DBLCLKS;
	RegisterClass(&WndClass);

	hWnd=CreateWindow(lpszClass,lpszClass,WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,
		NULL,(HMENU)NULL,hInstance,NULL);
	ShowWindow(hWnd,nCmdShow);
	
	HACCEL hAccel;
	hAccel=LoadAccelerators(hInstance,MAKEINTRESOURCE(IDR_ACCELERATOR1));
	while(GetMessage(&Message,0,0,0)) {
		if (!TranslateAccelerator(hWnd,hAccel,&Message)) {
			TranslateMessage(&Message);
			DispatchMessage(&Message);
		}
	}
	return (int)Message.wParam;
}

// 메인 윈도우의 메시지 처리 함수
LRESULT CALLBACK WndProc(HWND hWnd,UINT iMessage,WPARAM wParam,LPARAM lParam)
{
	switch(iMessage) {
	case WM_CREATE:
		return Main_OnCreate(hWnd,wParam,lParam);
	case WM_DESTROY:
		return Main_OnDestroy(hWnd,wParam,lParam);
	case WM_SIZE:
		return Main_OnSize(hWnd,wParam,lParam);
	case WM_COMMAND:
		return Main_OnCommand(hWnd,wParam,lParam);
	case WM_INITMENU:
		return Main_OnInitMenu(hWnd,wParam,lParam);
	case WM_SETFOCUS:
		return Main_OnSetFocus(hWnd,wParam,lParam);
	}
	return(DefWindowProc(hWnd,iMessage,wParam,lParam));
}

LRESULT Main_OnCreate(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	hWndMain=hWnd;
	hCanvas=CreateWindow("Canvas",NULL,WS_CHILD | WS_VISIBLE,
		0,0,0,0,hWnd,(HMENU)0,g_hInst,NULL);
	return 0;
}

LRESULT Main_OnDestroy(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	PostQuitMessage(0);
	return 0;
}

LRESULT Main_OnSize(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	if (wParam != SIZE_MINIMIZED) {
		MoveWindow(hCanvas,0,0,LOWORD(lParam),HIWORD(lParam),TRUE);
	}
	return 0;
}

LRESULT Main_OnCommand(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	switch(LOWORD(wParam)) {
	case IDM_FILE_EXIT:
		DestroyWindow(hWnd);
		break;
	case IDM_SHAPE_SELECT:
		NowTool=DT_SELECT;
		break;
	case IDM_SHAPE_LINE:
		NowTool=DT_LINE;
		break;
	case IDM_SHAPE_ELLIPSE:
		NowTool=DT_ELLIPSE;
		break;
	case IDM_SHAPE_RECTANGLE:
		NowTool=DT_RECTANGLE;
		break;
	case IDM_EDIT_DELETE:
		SendMessage(hCanvas,WM_COMMAND,MAKEWPARAM(IDM_POPUP_DELETE,0),0);
		break;
	}
	return 0;
}

LRESULT Main_OnInitMenu(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	UINT MenuItem;
	for (MenuItem=IDM_SHAPE_SELECT;MenuItem<=IDM_SHAPE_META;MenuItem++) {
		CheckMenuItem((HMENU)wParam,MenuItem,MF_BYCOMMAND | MF_UNCHECKED);
	}
	CheckMenuItem((HMENU)wParam,IDM_SHAPE_SELECT+NowTool,MF_BYCOMMAND | MF_CHECKED);
	return 0;
}

LRESULT Main_OnSetFocus(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	return 0;
}

// 캔버스 윈도우의 메시지 처리 함수
LRESULT CALLBACK CanvasProc(HWND hWnd,UINT iMessage,WPARAM wParam,LPARAM lParam)
{
	switch(iMessage) {
	case WM_CREATE:
		return OnCreate(hWnd,wParam,lParam);
	case WM_DESTROY:
		return OnDestroy(hWnd,wParam,lParam);
	case WM_PAINT:
		return OnPaint(hWnd,wParam,lParam);
	case WM_COMMAND:
		return OnCommand(hWnd,wParam,lParam);
	case WM_LBUTTONDOWN:
		return OnLButtonDown(hWnd,wParam,lParam);
	case WM_MOUSEMOVE:
		return OnMouseMove(hWnd,wParam,lParam);
	case WM_LBUTTONUP:
		return OnLButtonUp(hWnd,wParam,lParam);
	case WM_KEYDOWN:
		return OnKeyDown(hWnd,wParam,lParam);
	case WM_SETCURSOR:
		return OnSetCursor(hWnd,wParam,lParam);
	case WM_SIZE:
		return OnSize(hWnd,wParam,lParam);
	case WM_CONTEXTMENU:
		return OnContextMenu(hWnd,wParam,lParam);
	case WM_LBUTTONDBLCLK:
		return OnLButtonDblclk(hWnd,wParam,lParam);
	}
	return(DefWindowProc(hWnd,iMessage,wParam,lParam));
}

LRESULT OnCreate(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	NowTool=DT_LINE;
	DragMode=DM_NONE;
	arSize=100;
	arNum=0;
	arGrowBy=50;
	arObj=(DObject **)malloc(sizeof(DObject *)*arSize);
	NowSel=-1;
	return 0;
}

LRESULT OnDestroy(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	int idx;

	for (idx=0;idx<arNum;idx++) {
		free(arObj[idx]);
	}
	free(arObj);
	return 0;
}

LRESULT OnPaint(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	HDC hdc;
	PAINTSTRUCT ps;
	int idx;

	hdc=BeginPaint(hWnd, &ps);
	for (idx=0;idx<arNum;idx++) {
		switch (arObj[idx]->Type) {
		case DT_LINE:
			if ((arObj[idx]->Flag & 0x3) == DS_LT || (arObj[idx]->Flag & 0x3) == DS_RB) {
				MoveToEx(hdc,arObj[idx]->rt.left,arObj[idx]->rt.top,NULL);
				LineTo(hdc,arObj[idx]->rt.right,arObj[idx]->rt.bottom);
			} else {
				MoveToEx(hdc,arObj[idx]->rt.left,arObj[idx]->rt.bottom,NULL);
				LineTo(hdc,arObj[idx]->rt.right,arObj[idx]->rt.top);
			}
			break;
		case DT_ELLIPSE:
			Ellipse(hdc,arObj[idx]->rt.left,arObj[idx]->rt.top,
				arObj[idx]->rt.right,arObj[idx]->rt.bottom);
			break;
		case DT_RECTANGLE:
			Rectangle(hdc,arObj[idx]->rt.left,arObj[idx]->rt.top,
				arObj[idx]->rt.right,arObj[idx]->rt.bottom);
			break;
		}
	}
	if (NowSel != -1) {
		DrawTracker(hdc,NowSel);
	}
	EndPaint(hWnd, &ps);
	return 0;
}

LRESULT OnCommand(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	switch(LOWORD(wParam)) {
	case IDM_POPUP_DELETE:
		if (NowSel != -1) {
			DelObject(NowSel);
			NowSel=-1;
			InvalidateRect(hWnd,NULL,TRUE);
		}
		break;
	}
	return 0;
}

LRESULT OnLButtonDown(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	int TempSel;

	if (NowTool==DT_SELECT) {
		TempSel=FindObject(LOWORD(lParam),HIWORD(lParam));
		if (NowSel != TempSel) {
			NowSel=TempSel;
			InvalidateRect(hWnd,NULL,TRUE);
			UpdateWindow(hWnd);
		}
	} else {
		sx=LOWORD(lParam);
		sy=HIWORD(lParam);
		oldx=sx;
		oldy=sy;
		DragMode=DM_DRAW;
	}
	SetCapture(hWnd);
	return 0;
}

LRESULT OnMouseMove(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	int ex,ey;
	HDC hdc;

	ex=(int)(short)LOWORD(lParam);
	ey=(int)(short)HIWORD(lParam);
	if (DragMode==DM_DRAW) {
		hdc=GetDC(hWnd);
		SetROP2(hdc,R2_NOTXORPEN);
		SelectObject(hdc,GetStockObject(NULL_BRUSH));
		switch (NowTool) {
		case DT_LINE:
			MoveToEx(hdc,sx,sy,NULL);
			LineTo(hdc,oldx,oldy);
			MoveToEx(hdc,sx,sy,NULL);
			LineTo(hdc,ex,ey);
			break;
		case DT_ELLIPSE:
			Ellipse(hdc,sx,sy,oldx,oldy);
			Ellipse(hdc,sx,sy,ex,ey);
			break;
		case DT_RECTANGLE:
			Rectangle(hdc,sx,sy,oldx,oldy);
			Rectangle(hdc,sx,sy,ex,ey);
			break;
		}
		oldx=ex;
		oldy=ey;
		ReleaseDC(hWnd,hdc);
	}
	return 0;
}

LRESULT OnLButtonUp(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	if (DragMode==DM_DRAW) {
		if (AppendObject(NowTool,sx,sy,oldx,oldy)==TRUE) {
			NowSel=arNum-1;
		} else {
			NowTool=DT_SELECT;
			NowSel=-1;
		}
		InvalidateRect(hWnd,NULL,TRUE);
	}
	DragMode=DM_NONE;
	ReleaseCapture();
	return 0;
}

LRESULT OnKeyDown(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	return 0;
}

LRESULT OnSetCursor(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	return(DefWindowProc(hWnd,WM_SETCURSOR,wParam,lParam));
}

LRESULT OnSize(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	return 0;
}

LRESULT OnContextMenu(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	return 0;
}

LRESULT OnLButtonDblclk(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	return 0;
}

// 일반 함수
BOOL AppendObject(DTool Type,int x1,int y1,int x2,int y2)
{
	if (Type == DT_LINE) {
		if (x1 == x2 && y1 == y2) {
			return FALSE;
		}
	} else {
		if (x1 == x2 || y1 == y2) {
			return FALSE;
		}
	}

	if (arNum >= arSize) {
		arSize+=arGrowBy;
		arObj=(DObject **)realloc(arObj,sizeof(DObject *)*arSize);
	}

	arObj[arNum]=(DObject *)malloc(sizeof(DObject));
	arObj[arNum]->Type=Type;
	arObj[arNum]->rt.left=min(x1,x2);
	arObj[arNum]->rt.right=max(x1,x2);
	arObj[arNum]->rt.top=min(y1,y2);
	arObj[arNum]->rt.bottom=max(y1,y2);
	if (x1<x2) {
		if (y1<y2) {
			arObj[arNum]->Flag=DS_LT;
		} else {
			arObj[arNum]->Flag=DS_LB;
		}
	} else {
		if (y1<y2) {
			arObj[arNum]->Flag=DS_RT;
		} else {
			arObj[arNum]->Flag=DS_RB;
		}
	}
	arNum++;
	return TRUE;
}

BOOL AppendObject(DTool Type,RECT *prt)
{
	return AppendObject(Type,prt->left,prt->top,prt->right,prt->bottom);
}


int FindObject(int x, int y)
{
	int idx;
	POINT pt;

	pt.x=x;
	pt.y=y;
	for (idx=arNum-1;idx>=0;idx--) {
		if (PtInRect(&arObj[idx]->rt,pt)==TRUE) {
			return idx;
		}
	}
	return -1;
}

void DrawTracker(HDC hdc,int idx)
{
	RECT rt;
	int i;

	if (idx == -1) return;
	for (i=1;i<=8;i++) {
		GetTrackerRect(idx,i,&rt);
		Rectangle(hdc,rt.left,rt.top,rt.right,rt.bottom);
	}
}

void GetTrackerRect(int idx,int nTrack,RECT *trt)
{
	int tx,ty;
	RECT *ort=&arObj[idx]->rt;
	switch (nTrack) {
	case 1:
		tx=ort->left;
		ty=ort->top;
		break;
	case 2:
		tx=ort->left+(ort->right-ort->left)/2;
		ty=ort->top;
		break;
	case 3:
		tx=ort->right;
		ty=ort->top;
		break;
	case 4:
		tx=ort->left;
		ty=ort->top+(ort->bottom-ort->top)/2;
		break;
	case 5:
		tx=ort->right;
		ty=ort->top+(ort->bottom-ort->top)/2;
		break;
	case 6:
		tx=ort->left;
		ty=ort->bottom;
		break;
	case 7:
		tx=ort->left+(ort->right-ort->left)/2;
		ty=ort->bottom;
		break;
	case 8:
		tx=ort->right;
		ty=ort->bottom;
		break;
	}
	SetRect(trt,tx-TRSIZE,ty-TRSIZE,tx+TRSIZE,ty+TRSIZE);
}

void DelObject(int idx)
{
	free(arObj[idx]);
	memmove(arObj+idx,arObj+idx+1,(arNum-idx-1)*sizeof(DObject *));
	arNum--;
}








