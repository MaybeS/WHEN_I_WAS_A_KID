#include <windows.h>
#include "resource.h"

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
	
	while(GetMessage(&Message,0,0,0)) {
		TranslateMessage(&Message);
		DispatchMessage(&Message);
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
	case IDM_SHAPE_LINE:
		NowTool=DT_LINE;
		break;
	case IDM_SHAPE_ELLIPSE:
		NowTool=DT_ELLIPSE;
		break;
	case IDM_SHAPE_RECTANGLE:
		NowTool=DT_RECTANGLE;
		break;
	}
	return 0;
}

LRESULT Main_OnInitMenu(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
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
	return 0;
}

LRESULT OnDestroy(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	return 0;
}

LRESULT OnPaint(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	HDC hdc;
	PAINTSTRUCT ps;

	hdc=BeginPaint(hWnd, &ps);
	EndPaint(hWnd, &ps);
	return 0;
}

LRESULT OnCommand(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	return 0;
}

LRESULT OnLButtonDown(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	sx=LOWORD(lParam);
	sy=HIWORD(lParam);
	oldx=sx;
	oldy=sy;
	DragMode=DM_DRAW;
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

