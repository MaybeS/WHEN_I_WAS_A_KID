#include <windows.h>
#include <commctrl.h>
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
	short LineWidth;
	COLORREF LineColor;
	COLORREF PlaneColor;
	union {
		TCHAR *Text;
		BYTE *Bitmap;
		BYTE *Meta;
	};
	int Len;
	COLORREF FontColor;
	TCHAR FontFace[32];
	int FontSize;
};
DObject **arObj;
int arSize;
int arNum;
int arGrowBy;
int NowSel;
DObject dObj;
int SizeCorner;
DObject Opt;
COLORREF arColor[]={-1,RGB(0,0,0),RGB(255,255,255),RGB(255,0,0),RGB(0,255,0),
	RGB(0,0,255),RGB(255,255,0),RGB(255,0,255),RGB(0,255,255),RGB(64,64,64),
	RGB(128,128,128),RGB(192,192,192)};
HBITMAP hBackBit;
int GridX, GridY;
BOOL bGrid;
int GridLineX, GridLineY;
BOOL bGridLine;
HWND hToolBar;
int StretchMode;
LOGFONT logfont[500];
int FontNum;
TCHAR NowFile[MAX_PATH];
BOOL bModified;
struct FileHeader
{
	TCHAR szHeader[32];
	int version;
	int arNum;
};

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
void DrawTemp(const DObject *pObj);
int TrackerHitTest(int x,int y);
int NormalizeRect(RECT *prt);
BOOL CALLBACK PropertyDlgProc(HWND hDlg,UINT iMessage,WPARAM wParam,LPARAM lParam);
void MoveObjectInArray(int src,int dest);
void AdjustToGrid(int &x, int &y);
BOOL CALLBACK GridDlgProc(HWND hDlg,UINT iMessage,WPARAM wParam,LPARAM lParam);
void CreateToolBar();
void OnIdle();
void InsertBitmap(int x,int y);
void InsertMeta(int x,int y);
void PlayPlaceableMeta(HDC hdc,BYTE *pMeta,int len,RECT *rt);
BOOL CALLBACK TextDlgProc(HWND hDlg,UINT iMessage,WPARAM wParam,LPARAM lParam);
void ReEnum();
int FindFontFromFace(TCHAR *Face);
void ChangeCaption(TCHAR *Path);
void InitDoc();
void FreeDoc();
int ConfirmSave();
void New();
BOOL Save();
BOOL SaveToFile(TCHAR *Path);
BOOL SaveAs();
void Open();

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

	WndClass.hbrBackground=NULL;
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
	BOOL AllowIdle=TRUE;
	hAccel=LoadAccelerators(hInstance,MAKEINTRESOURCE(IDR_ACCELERATOR1));
	for (;;) {
		do {
			if (!GetMessage(&Message,NULL,0,0))
				goto endloop;
			if (Message.message != 0x118/*WM_SYSTIMER*/) {
				AllowIdle=TRUE;
			}
			if (!TranslateAccelerator(hWnd,hAccel,&Message)) {
				TranslateMessage(&Message);
				DispatchMessage(&Message);
			}
		} while (PeekMessage(&Message,NULL,0,0,PM_NOREMOVE));

		if (AllowIdle) {
			OnIdle();
			AllowIdle=FALSE;
		}
	}

endloop:
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
	case WM_FONTCHANGE:
		ReEnum();
		InvalidateRect(hCanvas,NULL,FALSE);
		return 0;
#ifndef _DEBUG
	case WM_QUERYENDSESSION:
	case WM_CLOSE:
		if (ConfirmSave() == IDCANCEL) {
			return TRUE;
		} else {
			break;
		}
#endif
	}
	return(DefWindowProc(hWnd,iMessage,wParam,lParam));
}

LRESULT Main_OnCreate(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	OSVERSIONINFO osv;
	
	osv.dwOSVersionInfoSize=sizeof(OSVERSIONINFO);
	GetVersionEx(&osv);
	if (osv.dwPlatformId == VER_PLATFORM_WIN32_NT) {
		StretchMode=HALFTONE;
	} else {
		StretchMode=COLORONCOLOR;
	}
	hWndMain=hWnd;
	hCanvas=CreateWindow("Canvas",NULL,WS_CHILD | WS_VISIBLE,
		0,0,0,0,hWnd,(HMENU)0,g_hInst,NULL);
	CreateToolBar();
	InitCommonControls();
	return 0;
}

LRESULT Main_OnDestroy(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	PostQuitMessage(0);
	return 0;
}

LRESULT Main_OnSize(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	RECT wrt;
	int toolheight;

	if (wParam != SIZE_MINIMIZED) {
		SendMessage(hToolBar,TB_AUTOSIZE,0,0);
		GetWindowRect(hToolBar,&wrt);
		toolheight=wrt.bottom-wrt.top;
		MoveWindow(hCanvas,0,toolheight,LOWORD(lParam),HIWORD(lParam)-toolheight,TRUE);
	}
	return 0;
}

LRESULT Main_OnCommand(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	switch(LOWORD(wParam)) {
	case IDM_FILE_NEW:
		New();
		break;
	case IDM_FILE_OPEN:
		Open();
		break;
	case IDM_FILE_SAVE:
		Save();
		break;
	case IDM_FILE_SAVEAS:
		SaveAs();
		break;
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
	case IDM_SHAPE_TEXT:
		NowTool=DT_TEXT;
		break;
	case IDM_SHAPE_BITMAP:
		NowTool=DT_BITMAP;
		break;
	case IDM_SHAPE_META:
		NowTool=DT_META;
		break;
	case IDM_SHAPE_PROPERTY:
		if (NowSel == -1) {
			DialogBoxParam(g_hInst, MAKEINTRESOURCE(IDD_PROPERTY),
				hWnd,PropertyDlgProc,(LPARAM)&Opt);
		} else {
			SendMessage(hCanvas,WM_COMMAND,MAKEWPARAM(IDM_POPUP_PROPERTY,0),0);
		}
		break;
	case IDM_SHAPE_FRONT:
		SendMessage(hCanvas,WM_COMMAND,MAKEWPARAM(IDM_POPUP_FRONT,0),0);
		break;
	case IDM_SHAPE_BACK:
		SendMessage(hCanvas,WM_COMMAND,MAKEWPARAM(IDM_POPUP_BACK,0),0);
		break;
	case IDM_SHAPE_MOSTFRONT:
		SendMessage(hCanvas,WM_COMMAND,MAKEWPARAM(IDM_POPUP_MOSTFRONT,0),0);
		break;
	case IDM_SHAPE_MOSTBACK:
		SendMessage(hCanvas,WM_COMMAND,MAKEWPARAM(IDM_POPUP_MOSTBACK,0),0);
		break;
	case IDM_EDIT_DELETE:
		SendMessage(hCanvas,WM_COMMAND,MAKEWPARAM(IDM_POPUP_DELETE,0),0);
		break;
	case IDM_TOOL_GRID:
		if (DialogBox(g_hInst,MAKEINTRESOURCE(IDD_GRID),hWnd,GridDlgProc)==IDOK) {
			InvalidateRect(hCanvas,NULL,FALSE);
		}
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
	if (NowSel != -1 && NowSel < arNum-1) {
		EnableMenuItem((HMENU)wParam, IDM_SHAPE_FRONT, MF_BYCOMMAND | MF_ENABLED);
		EnableMenuItem((HMENU)wParam, IDM_SHAPE_MOSTFRONT, MF_BYCOMMAND | MF_ENABLED);
	} else {
		EnableMenuItem((HMENU)wParam, IDM_SHAPE_FRONT, MF_BYCOMMAND | MF_GRAYED);
		EnableMenuItem((HMENU)wParam, IDM_SHAPE_MOSTFRONT, MF_BYCOMMAND | MF_GRAYED);
	}
	if (NowSel != -1 && NowSel > 0) {
		EnableMenuItem((HMENU)wParam, IDM_SHAPE_BACK, MF_BYCOMMAND | MF_ENABLED);
		EnableMenuItem((HMENU)wParam, IDM_SHAPE_MOSTBACK, MF_BYCOMMAND | MF_ENABLED);
	} else {
		EnableMenuItem((HMENU)wParam, IDM_SHAPE_BACK, MF_BYCOMMAND | MF_GRAYED);
		EnableMenuItem((HMENU)wParam, IDM_SHAPE_MOSTBACK, MF_BYCOMMAND | MF_GRAYED);
	}
	return 0;
}

LRESULT Main_OnSetFocus(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	SetFocus(hCanvas);
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
	NowTool=DT_ELLIPSE;
	DragMode=DM_NONE;
	Opt.Type=(DTool)-1;
	Opt.LineWidth=3;
	Opt.LineColor=RGB(0,0,0);
	Opt.PlaneColor=RGB(0,255,0);
	Opt.FontColor=RGB(0,0,0);
	Opt.FontSize=10;
	lstrcpy(Opt.FontFace,"굴림");
	hBackBit=NULL;
	GridX=8;
	GridY=8;
	bGrid=TRUE;
	GridLineX=8;
	GridLineY=8;
	bGridLine=TRUE;
	InitDoc();
	return 0;
}

LRESULT OnDestroy(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	if (hBackBit) {
		DeleteObject(hBackBit);
		hBackBit=NULL;
	}
	FreeDoc();
	return 0;
}

LRESULT OnPaint(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	HDC hdc;
	PAINTSTRUCT ps;
	int idx;
	HPEN hPen,hOldPen;
	HBRUSH hBrush,hOldBrush;
	RECT crt;
	HDC hMemDC;
	HBITMAP hOldBitmap;
	int x,y;
	BITMAPFILEHEADER *fh;
	BITMAPINFOHEADER *ih;
	int bx,by;
	BYTE *pRaster;
	HFONT hFont,hOldFont;
	int FontHeight;
	int FontIdx;
	LOGFONT tFont;

	hdc=BeginPaint(hWnd, &ps);
	hMemDC=CreateCompatibleDC(hdc);
	GetClientRect(hWnd,&crt);
	if (hBackBit == NULL) {
		hBackBit=CreateCompatibleBitmap(hdc,crt.right,crt.bottom);
	}
	hOldBitmap=(HBITMAP)SelectObject(hMemDC,hBackBit);
	FillRect(hMemDC,&crt,GetSysColorBrush(COLOR_WINDOW));

	if (bGridLine) {
		hPen=CreatePen(PS_SOLID,1,RGB(192,192,192));
		hOldPen=(HPEN)SelectObject(hMemDC,hPen);
		for (y=0;y<crt.bottom;y=y+GridLineY*GridY) {
			MoveToEx(hMemDC,0,y,NULL);
			LineTo(hMemDC,crt.right,y);
		}
		for (x=0;x<crt.right;x=x+GridLineX*GridX) {
			MoveToEx(hMemDC,x,0,NULL);
			LineTo(hMemDC,x,crt.bottom);
		}
		DeleteObject(SelectObject(hMemDC,hOldPen));
	}

	SetStretchBltMode(hMemDC,StretchMode);
	SetBkMode(hMemDC,TRANSPARENT);
	for (idx=0;idx<arNum;idx++) {
		if (arObj[idx]->LineColor == (COLORREF)-1) {
			hPen=(HPEN)GetStockObject(NULL_PEN);
		} else {
			hPen=CreatePen(PS_INSIDEFRAME,arObj[idx]->LineWidth,arObj[idx]->LineColor);
		}
		hOldPen=(HPEN)SelectObject(hMemDC,hPen);
		if (arObj[idx]->PlaneColor == (COLORREF)-1) {
			hBrush=(HBRUSH)GetStockObject(NULL_BRUSH);
		} else {
			hBrush=CreateSolidBrush(arObj[idx]->PlaneColor);
		}
		hOldBrush=(HBRUSH)SelectObject(hMemDC,hBrush);
		switch (arObj[idx]->Type) {
		case DT_LINE:
			if ((arObj[idx]->Flag & 0x3) == DS_LT || (arObj[idx]->Flag & 0x3) == DS_RB) {
				MoveToEx(hMemDC,arObj[idx]->rt.left,arObj[idx]->rt.top,NULL);
				LineTo(hMemDC,arObj[idx]->rt.right,arObj[idx]->rt.bottom);
			} else {
				MoveToEx(hMemDC,arObj[idx]->rt.left,arObj[idx]->rt.bottom,NULL);
				LineTo(hMemDC,arObj[idx]->rt.right,arObj[idx]->rt.top);
			}
			break;
		case DT_ELLIPSE:
			Ellipse(hMemDC,arObj[idx]->rt.left,arObj[idx]->rt.top,
				arObj[idx]->rt.right,arObj[idx]->rt.bottom);
			break;
		case DT_RECTANGLE:
			Rectangle(hMemDC,arObj[idx]->rt.left,arObj[idx]->rt.top,
				arObj[idx]->rt.right,arObj[idx]->rt.bottom);
			break;
		case DT_BITMAP:
			fh=(BITMAPFILEHEADER *)arObj[idx]->Bitmap;
			pRaster=(PBYTE)fh+fh->bfOffBits;
			ih=(BITMAPINFOHEADER *)((PBYTE)fh+sizeof(BITMAPFILEHEADER));
			bx=ih->biWidth;
			by=ih->biHeight;
			StretchDIBits(hMemDC,arObj[idx]->rt.left,arObj[idx]->rt.top,
				arObj[idx]->rt.right-arObj[idx]->rt.left,
				arObj[idx]->rt.bottom-arObj[idx]->rt.top,0,0,bx,by,
				pRaster,(BITMAPINFO *)ih,DIB_RGB_COLORS,SRCCOPY);
			break;
		case DT_META:
			PlayPlaceableMeta(hMemDC,arObj[idx]->Meta,arObj[idx]->Len,&arObj[idx]->rt);
			break;
		case DT_TEXT:
			FillRect(hMemDC,&arObj[idx]->rt,hBrush);
			FontHeight=arObj[idx]->FontSize*GetDeviceCaps(hMemDC,LOGPIXELSY)/72;
			FontIdx=FindFontFromFace(arObj[idx]->FontFace);
			if (FontIdx!=-1) {
				tFont=logfont[FontIdx];
				tFont.lfHeight=FontHeight;
				tFont.lfWidth=0;
				hFont=CreateFontIndirect(&tFont);
				hOldFont=(HFONT)SelectObject(hMemDC,hFont);
			}
			if (arObj[idx]->FontColor != (COLORREF)-1) {
				SetTextColor(hMemDC,arObj[idx]->FontColor);
				DrawText(hMemDC,arObj[idx]->Text,-1,&arObj[idx]->rt,DT_WORDBREAK);
			}
			if (FontIdx!=-1) {
				DeleteObject(SelectObject(hMemDC,hOldFont));
			}
			break;
		}
		SelectObject(hMemDC,hOldPen);
		SelectObject(hMemDC,hOldBrush);
		if (arObj[idx]->LineColor != (COLORREF)-1) {
			DeleteObject(hPen);
		}
		if (arObj[idx]->PlaneColor != (COLORREF)-1) {
			DeleteObject(hBrush);
		}
	}
	if (NowSel != -1) {
		DrawTracker(hMemDC,NowSel);
	}
	BitBlt(hdc,0,0,crt.right,crt.bottom,hMemDC,0,0,SRCCOPY);
	SelectObject(hMemDC,hOldBitmap);
	DeleteDC(hMemDC);
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
	case IDM_POPUP_PROPERTY:
		if (NowSel != -1) {
			if (DialogBoxParam(g_hInst, MAKEINTRESOURCE(IDD_PROPERTY),
				hWnd,PropertyDlgProc,(LPARAM)arObj[NowSel])==IDOK) {
				InvalidateRect(hWnd,NULL,TRUE);
				bModified=TRUE;
			}
		}
		break;
	case IDM_POPUP_FRONT:
		if (NowSel != -1 && NowSel < arNum-1) {
			MoveObjectInArray(NowSel,NowSel+1);
			NowSel=NowSel+1;
			InvalidateRect(hWnd,NULL,TRUE);
		}
		break;
	case IDM_POPUP_BACK:
		if (NowSel != -1 && NowSel > 0) {
			MoveObjectInArray(NowSel,NowSel-1);
			NowSel=NowSel-1;
			InvalidateRect(hWnd,NULL,TRUE);
		}
		break;
	case IDM_POPUP_MOSTFRONT:
		if (NowSel != -1 && NowSel < arNum-1) {
			MoveObjectInArray(NowSel,arNum-1);
			NowSel=arNum-1;
			InvalidateRect(hWnd,NULL,TRUE);
		}
		break;
	case IDM_POPUP_MOSTBACK:
		if (NowSel != -1 && NowSel > 0) {
			MoveObjectInArray(NowSel,0);
			NowSel=0;
			InvalidateRect(hWnd,NULL,TRUE);
		}
		break;
	}
	return 0;
}

LRESULT OnLButtonDown(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	int TempSel;
	int nHit;
	TCHAR *pText;

	if (NowTool==DT_TEXT) {
		pText=NULL;
		if (DialogBoxParam(g_hInst, MAKEINTRESOURCE(IDD_TEXT),hWnd,
			TextDlgProc,(LPARAM)&pText) == IDOK) {
			if (lstrlen(pText) == 0) {
				free(pText);
			} else {
				AppendObject(DT_TEXT,LOWORD(lParam),HIWORD(lParam),
					LOWORD(lParam)+200,HIWORD(lParam)+50);
				arObj[arNum-1]->Text=pText;
				arObj[arNum-1]->Len=lstrlen(pText)+1;
				arObj[arNum-1]->PlaneColor=-1;
				InvalidateRect(hWndMain,NULL,TRUE);
			}
			NowTool=DT_SELECT;
			NowSel=arNum-1;
		}
		return 0;
	}
	if (NowTool==DT_BITMAP) {
		InsertBitmap(LOWORD(lParam),HIWORD(lParam));
		return 0;
	}
	if (NowTool==DT_META) {
		InsertMeta(LOWORD(lParam),HIWORD(lParam));
		return 0;
	}
	if (NowTool==DT_SELECT) {
		nHit=TrackerHitTest(LOWORD(lParam),HIWORD(lParam));
		if (nHit != 0) {
			oldx=LOWORD(lParam);
			oldy=HIWORD(lParam);
			AdjustToGrid(oldx,oldy);
			dObj=*arObj[NowSel];
			SizeCorner=nHit;
			DrawTemp(&dObj);
			DragMode=DM_SIZE;
		} else {
			TempSel=FindObject(LOWORD(lParam),HIWORD(lParam));
			if (NowSel != TempSel) {
				NowSel=TempSel;
				InvalidateRect(hWnd,NULL,TRUE);
				UpdateWindow(hWnd);
			}
			if (NowSel != -1) {
				oldx=LOWORD(lParam);
				oldy=HIWORD(lParam);
				AdjustToGrid(oldx,oldy);
				dObj=*arObj[NowSel];
				DrawTemp(&dObj);
				DragMode=DM_MOVE;
			}
		}
	} else {
		sx=LOWORD(lParam);
		sy=HIWORD(lParam);
		AdjustToGrid(sx,sy);
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
	AdjustToGrid(ex,ey);
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
	if (DragMode==DM_MOVE) {
		DrawTemp(&dObj);
		OffsetRect(&dObj.rt,ex-oldx,ey-oldy);
		oldx=ex;
		oldy=ey;
		DrawTemp(&dObj);
	}
	if (DragMode==DM_SIZE) {
		DrawTemp(&dObj);
		switch (SizeCorner) {
		case 1:
			dObj.rt.left+=ex-oldx;
			dObj.rt.top+=ey-oldy;
			break;
		case 2:
			dObj.rt.top+=ey-oldy;
			break;
		case 3:
			dObj.rt.right+=ex-oldx;
			dObj.rt.top+=ey-oldy;
			break;
		case 4:
			dObj.rt.left+=ex-oldx;
			break;
		case 5:
			dObj.rt.right+=ex-oldx;
			break;
		case 6:
			dObj.rt.left+=ex-oldx;
			dObj.rt.bottom+=ey-oldy;
			break;
		case 7:
			dObj.rt.bottom+=ey-oldy;
			break;
		case 8:
			dObj.rt.right+=ex-oldx;
			dObj.rt.bottom+=ey-oldy;
			break;
		}
		oldx=ex;
		oldy=ey;
		DrawTemp(&dObj);
	}
	return 0;
}

LRESULT OnLButtonUp(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	RECT crt,irt;
	int SwapResult;

	if (DragMode==DM_DRAW) {
		if (AppendObject(NowTool,sx,sy,oldx,oldy)==TRUE) {
			NowSel=arNum-1;
		} else {
			NowTool=DT_SELECT;
			NowSel=-1;
		}
		InvalidateRect(hWnd,NULL,TRUE);
	}
	if (DragMode==DM_MOVE || DragMode==DM_SIZE) {
		SwapResult=NormalizeRect(&dObj.rt);
		GetClientRect(hWnd,&crt);
		InflateRect(&crt,-10,-10);
		IntersectRect(&irt,&crt,&dObj.rt);
		if (!IsRectEmpty(&irt)) {
			bModified=TRUE;
			arObj[NowSel]->rt=dObj.rt;
			arObj[NowSel]->Flag ^= SwapResult;
		}
		InvalidateRect(hWnd,NULL,TRUE);
	}
	DragMode=DM_NONE;
	ReleaseCapture();
	return 0;
}

LRESULT OnKeyDown(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	BOOL bShift, bControl;
	int dx,dy;
	RECT drt,crt,irt;
	BOOL bAction=TRUE;

	if (NowSel == -1) {
		return 0;
	}
	
	bShift=((GetKeyState(VK_SHIFT) & 0x8000) != 0); 
	bControl=((GetKeyState(VK_CONTROL) & 0x8000) != 0);
	if (bControl) {
		dx=1;
		dy=1;
	} else {
		dx=GridX;
		dy=GridY;
	}
	drt=arObj[NowSel]->rt;

	if (bShift == FALSE) {
		switch(wParam) {
		case VK_LEFT:
			OffsetRect(&drt,-dx,0);
			break;
		case VK_RIGHT:
			OffsetRect(&drt,dx,0);
			break;
		case VK_UP:
			OffsetRect(&drt,0,-dy);
			break;
		case VK_DOWN:
			OffsetRect(&drt,0,dy);
			break;
		default:
			bAction=FALSE;
			break;
		}
	} else {
		switch(wParam) {
		case VK_LEFT:
			if (drt.right > drt.left + 10) {
				drt.right -= dx;
			}
			break;
		case VK_RIGHT:
			drt.right += dx;
			break;
		case VK_UP:
			if (drt.bottom > drt.top + 10) {
				drt.bottom -=dy;
			}
			break;
		case VK_DOWN:
			drt.bottom += dy;
			break;
		default:
			bAction=FALSE;
			break;
		}
	}

	if (bAction) {
		GetClientRect(hWnd,&crt);
		InflateRect(&crt,-10,-10);
		IntersectRect(&irt,&crt,&drt);
		if (!IsRectEmpty(&irt)) {
			bModified=TRUE;
			arObj[NowSel]->rt=drt;
			InvalidateRect(hWnd,NULL,TRUE);
		}
	}
	return 0;
}

LRESULT OnSetCursor(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	POINT pt;
	int nHit;

	static TCHAR *arCursor[]={0,IDC_SIZENWSE,IDC_SIZENS,IDC_SIZENESW,IDC_SIZEWE,
		IDC_SIZEWE,IDC_SIZENESW,IDC_SIZENS,IDC_SIZENWSE};

	if (NowTool == DT_SELECT) {
		GetCursorPos(&pt);
		ScreenToClient(hWnd,&pt);
		nHit=TrackerHitTest(pt.x,pt.y);
		if (nHit != 0) {
			SetCursor(LoadCursor(NULL,arCursor[nHit]));
			return TRUE;
		}
	}
	return(DefWindowProc(hWnd,WM_SETCURSOR,wParam,lParam));
}

LRESULT OnSize(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	if (wParam != SIZE_MINIMIZED) {
		if (hBackBit) {
			DeleteObject(hBackBit);
			hBackBit=NULL;
		}
	}
	return 0;
}

LRESULT OnContextMenu(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	HMENU hMenu, hPopup;
	int TempSel;
	POINT pt;

	pt.x=LOWORD(lParam);
	pt.y=HIWORD(lParam);
	ScreenToClient(hWnd,&pt);
	TempSel=FindObject(pt.x,pt.y);
	if (NowSel != TempSel) {
		NowSel=TempSel;
		InvalidateRect(hWnd,NULL,TRUE);
		UpdateWindow(hWnd);
	}
	
	hMenu=LoadMenu(g_hInst, MAKEINTRESOURCE(IDR_POPUP));
	hPopup=GetSubMenu(hMenu, 0);
	if (NowSel == -1) {
		EnableMenuItem(hPopup, IDM_POPUP_DELETE, MF_BYCOMMAND | MF_GRAYED);
		EnableMenuItem(hPopup, IDM_POPUP_PROPERTY, MF_BYCOMMAND | MF_GRAYED);
	}

	if (NowSel == -1 || NowSel >= arNum-1) {
		EnableMenuItem(hPopup, IDM_POPUP_FRONT, MF_BYCOMMAND | MF_GRAYED);
		EnableMenuItem(hPopup, IDM_POPUP_MOSTFRONT, MF_BYCOMMAND | MF_GRAYED);
	}
	if (NowSel == -1 || NowSel <= 0) {
		EnableMenuItem(hPopup, IDM_POPUP_BACK, MF_BYCOMMAND | MF_GRAYED);
		EnableMenuItem(hPopup, IDM_POPUP_MOSTBACK, MF_BYCOMMAND | MF_GRAYED);
	}
	TrackPopupMenu(hPopup, TPM_LEFTALIGN, LOWORD(lParam), HIWORD(lParam), 
		0, hWnd, NULL);
	DestroyMenu(hMenu);
	return 0;
}

LRESULT OnLButtonDblclk(HWND hWnd,WPARAM wParam,LPARAM lParam)
{
	int TempSel;
	TCHAR *pText;

	TempSel=FindObject(LOWORD(lParam),HIWORD(lParam));
	if (TempSel == -1) {
		return 0;
	}
	if (arObj[TempSel]->Type == DT_TEXT) {
		pText=arObj[TempSel]->Text;
		if (DialogBoxParam(g_hInst, MAKEINTRESOURCE(IDD_TEXT),hWnd,
			TextDlgProc,(LPARAM)&pText) == IDOK) {
			if (lstrlen(pText) == 0) {
				DelObject(TempSel);
			} else {
				arObj[arNum-1]->Text=pText;
				arObj[arNum-1]->Len=lstrlen(pText)+1;
			}
			InvalidateRect(hWndMain,NULL,TRUE);
		}
	}
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
	arObj[arNum]->LineWidth=Opt.LineWidth;
	arObj[arNum]->LineColor=Opt.LineColor;
	arObj[arNum]->PlaneColor=Opt.PlaneColor;
	arObj[arNum]->FontColor=Opt.FontColor;
	arObj[arNum]->FontSize=Opt.FontSize;
	lstrcpy(arObj[arNum]->FontFace,Opt.FontFace);
	arNum++;
	bModified=TRUE;
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
	if (arObj[idx]->Type >= DT_TEXT && arObj[idx]->Type <= DT_META) {
		free(arObj[idx]->Text);
	}
	free(arObj[idx]);
	memmove(arObj+idx,arObj+idx+1,(arNum-idx-1)*sizeof(DObject *));
	arNum--;
	bModified=TRUE;
}

void DrawTemp(const DObject *pObj)
{
	HDC hdc;
	HPEN hPen,hOldPen;
	HBRUSH hOldBrush;

	hdc=GetDC(hCanvas);
	SetROP2(hdc,R2_XORPEN);
	hPen=CreatePen(PS_DOT,1,RGB(0,0,0));
	hOldPen=(HPEN)SelectObject(hdc,hPen);
	hOldBrush=(HBRUSH)(SelectObject(hdc,GetStockObject(NULL_BRUSH)));
	switch (pObj->Type) {
	case DT_LINE:
		if ((pObj->Flag & 0x3) == DS_LT || (pObj->Flag & 0x3) == DS_RB) {
			MoveToEx(hdc,pObj->rt.left,pObj->rt.top,NULL);
			LineTo(hdc,pObj->rt.right,pObj->rt.bottom);
		} else {
			MoveToEx(hdc,pObj->rt.left,pObj->rt.bottom,NULL);
			LineTo(hdc,pObj->rt.right,pObj->rt.top);
		}
		break;
	case DT_ELLIPSE:
		Ellipse(hdc,pObj->rt.left,pObj->rt.top,pObj->rt.right,pObj->rt.bottom);
		break;
	case DT_RECTANGLE:
	case DT_BITMAP:
	case DT_META:
	case DT_TEXT:
		Rectangle(hdc,pObj->rt.left,pObj->rt.top,pObj->rt.right,pObj->rt.bottom);
		break;
	}
	DeleteObject(SelectObject(hdc,hOldPen));
	SelectObject(hdc,hOldBrush);
	ReleaseDC(hCanvas,hdc);
} 

int TrackerHitTest(int x,int y)
{
	int i;
	RECT trt;
	POINT pt;

	if (NowSel == -1) {
		return 0;
	}

	pt.x=x;
	pt.y=y;
	for (i=1;i<=8;i++) {
		GetTrackerRect(NowSel,i,&trt);
		if (PtInRect(&trt,pt) == TRUE) {
			return i;
		}
	}
	return 0;
}

int NormalizeRect(RECT *prt)
{
	int t;
	int SwapResult=0;

	if (prt->left > prt->right) {
		t=prt->left;
		prt->left=prt->right;
		prt->right=t;
		SwapResult|=1;
	}
	if (prt->top > prt->bottom) {
		t=prt->top;
		prt->top=prt->bottom;
		prt->bottom=t;
		SwapResult|=2;
	}
	return SwapResult;
}

BOOL CALLBACK PropertyDlgProc(HWND hDlg,UINT iMessage,WPARAM wParam,LPARAM lParam)
{
	static DObject *Obj;
	LPMEASUREITEMSTRUCT lpmis;
	LPDRAWITEMSTRUCT lpdis;
	HBRUSH ColorBrush, OldBrush;
	COLORREF Color;
	int i;

	switch(iMessage) {
	case WM_INITDIALOG:
		if (FontNum==0) {
			ReEnum();
		}
		for (i=0;i<FontNum;i++) {
			SendDlgItemMessage(hDlg,IDC_CBFONTFACE,CB_ADDSTRING,0,(LPARAM)logfont[i].lfFaceName);
		}
		for (i=0;i<sizeof(arColor)/sizeof(arColor[0]);i++) {
			SendDlgItemMessage(hDlg,IDC_CBLINECOLOR,CB_ADDSTRING,0,(LPARAM)arColor[i]);
			SendDlgItemMessage(hDlg,IDC_CBPLANECOLOR,CB_ADDSTRING,0,(LPARAM)arColor[i]);
			SendDlgItemMessage(hDlg,IDC_CBFONTCOLOR,CB_ADDSTRING,0,(LPARAM)arColor[i]);
		}
		SendDlgItemMessage(hDlg,IDC_SPLINEWIDTH,UDM_SETRANGE,0,MAKELONG(10,0));

		Obj=(DObject *)lParam;
		SetDlgItemInt(hDlg,IDC_EDLINEWIDTH,Obj->LineWidth,FALSE);
		for (i=0;i<sizeof(arColor)/sizeof(arColor[0]);i++) {
			if (arColor[i] == Obj->LineColor) {
				break;
			}
		}
		SendDlgItemMessage(hDlg,IDC_CBLINECOLOR,CB_SETCURSEL,i,0);
		for (i=0;i<sizeof(arColor)/sizeof(arColor[0]);i++) {
			if (arColor[i] == Obj->PlaneColor) {
				break;
			}
		}
		SendDlgItemMessage(hDlg,IDC_CBPLANECOLOR,CB_SETCURSEL,i,0);
		SendDlgItemMessage(hDlg,IDC_SPFONTSIZE,UDM_SETRANGE,0,MAKELONG(72,6));
		SetDlgItemInt(hDlg,IDC_EDFONTSIZE,Obj->FontSize,FALSE);
		for (i=0;i<sizeof(arColor)/sizeof(arColor[0]);i++) {
			if (arColor[i] == Obj->FontColor) {
				break;
			}
		}
		SendDlgItemMessage(hDlg,IDC_CBFONTCOLOR,CB_SETCURSEL,i,0);
		for (i=0;i<FontNum;i++) {
			if (lstrcmp(logfont[i].lfFaceName,Obj->FontFace) == 0) {
				break;
			}
		}
		SendDlgItemMessage(hDlg,IDC_CBFONTFACE,CB_SETCURSEL,i,0);
		if (Obj->Type != -1) {
			if (Obj->Type != DT_TEXT) {
				EnableWindow(GetDlgItem(hDlg,IDC_EDFONTSIZE),FALSE);
				EnableWindow(GetDlgItem(hDlg,IDC_CBFONTCOLOR),FALSE);
				EnableWindow(GetDlgItem(hDlg,IDC_CBFONTFACE),FALSE);
			} else {
				EnableWindow(GetDlgItem(hDlg,IDC_EDLINEWIDTH),FALSE);
				EnableWindow(GetDlgItem(hDlg,IDC_CBLINECOLOR),FALSE);
			}
		}
		return TRUE;
		return TRUE;
	case WM_MEASUREITEM:
		lpmis=(LPMEASUREITEMSTRUCT)lParam;
		lpmis->itemHeight=24;
		return TRUE;
	case WM_DRAWITEM:
		lpdis=(LPDRAWITEMSTRUCT)lParam;

		if (lpdis->itemState & ODS_SELECTED) {
			FillRect(lpdis->hDC, &lpdis->rcItem, GetSysColorBrush(COLOR_HIGHLIGHT));
		} else {
			FillRect(lpdis->hDC, &lpdis->rcItem, GetSysColorBrush(COLOR_WINDOW));
		}

		Color=(COLORREF)SendMessage(lpdis->hwndItem, CB_GETITEMDATA, lpdis->itemID, 0);
		if (Color == (COLORREF)-1) {
			ColorBrush=(HBRUSH)GetStockObject(NULL_BRUSH);
		} else {
			ColorBrush=CreateSolidBrush(Color);
		}
		OldBrush=(HBRUSH)SelectObject(lpdis->hDC, ColorBrush);
		Rectangle(lpdis->hDC,lpdis->rcItem.left+5,lpdis->rcItem.top+2,
			lpdis->rcItem.right-5, lpdis->rcItem.bottom-2);
		SelectObject(lpdis->hDC, OldBrush);
		if (Color == (COLORREF)-1) {
			SetTextAlign(lpdis->hDC,TA_CENTER);
			SetBkMode(lpdis->hDC,TRANSPARENT);
			TextOut(lpdis->hDC,(lpdis->rcItem.right+lpdis->rcItem.left)/2,
				lpdis->rcItem.top+4,"투명",4);
		} else {
			DeleteObject(ColorBrush);
		}
		return TRUE;
	case WM_COMMAND:
		switch (wParam) {
		case IDOK:
			Obj->LineWidth=GetDlgItemInt(hDlg,IDC_EDLINEWIDTH,NULL,FALSE);
			i=SendDlgItemMessage(hDlg,IDC_CBLINECOLOR,CB_GETCURSEL,0,0);
			Obj->LineColor=arColor[i];
			i=SendDlgItemMessage(hDlg,IDC_CBPLANECOLOR,CB_GETCURSEL,0,0);
			Obj->PlaneColor=arColor[i];
			i=SendDlgItemMessage(hDlg,IDC_CBFONTCOLOR,CB_GETCURSEL,0,0);
			Obj->FontColor=arColor[i];
			Obj->FontSize=GetDlgItemInt(hDlg,IDC_EDFONTSIZE,NULL,FALSE);
			GetDlgItemText(hDlg,IDC_CBFONTFACE,Obj->FontFace,32);
			EndDialog(hDlg,IDOK);
			EndDialog(hDlg,IDOK);
			return TRUE;
		case IDCANCEL:
			EndDialog(hDlg,IDCANCEL);
			return TRUE;
		}
		break;
	}
	return FALSE;
}

void MoveObjectInArray(int src,int dest)
{
	DObject *tObject=arObj[src];
	size_t len;

	len=abs(src-dest)*sizeof(DObject *);
	if (src > dest) {
		memmove(arObj+dest+1,arObj+dest,len);
	} else {
		memmove(arObj+src,arObj+src+1,len);
	}
	arObj[dest]=tObject;
	bModified=TRUE;
}

void AdjustToGrid(int &x, int &y)
{
	if (bGrid) {
		x=x/GridX*GridX;
		y=y/GridY*GridY;
	}
}

BOOL CALLBACK GridDlgProc(HWND hDlg,UINT iMessage,WPARAM wParam,LPARAM lParam)
{
	switch(iMessage) {
	case WM_INITDIALOG:
		SetDlgItemInt(hDlg,IDC_EDGRIDX,GridX,FALSE);
		SetDlgItemInt(hDlg,IDC_EDGRIDY,GridY,FALSE);
		SetDlgItemInt(hDlg,IDC_EDGRIDLINEX,GridLineX,FALSE);
		SetDlgItemInt(hDlg,IDC_EDGRIDLINEY,GridLineY,FALSE);
		if (bGrid) CheckDlgButton(hDlg,IDC_CHKGRID,BST_CHECKED);
		if (bGridLine) CheckDlgButton(hDlg,IDC_CHKGRIDLINE,BST_CHECKED);
		return TRUE;
	case WM_COMMAND:
		switch (LOWORD(wParam)) {
		case IDOK:
			GridX=GetDlgItemInt(hDlg,IDC_EDGRIDX,NULL,FALSE);
			GridY=GetDlgItemInt(hDlg,IDC_EDGRIDY,NULL,FALSE);
			GridLineX=GetDlgItemInt(hDlg,IDC_EDGRIDLINEX,NULL,FALSE);
			GridLineY=GetDlgItemInt(hDlg,IDC_EDGRIDLINEY,NULL,FALSE);
			bGrid=(IsDlgButtonChecked(hDlg,IDC_CHKGRID)==BST_CHECKED);
			bGridLine=(IsDlgButtonChecked(hDlg,IDC_CHKGRIDLINE)==BST_CHECKED);
			EndDialog(hDlg,IDOK);
			return TRUE;
		case IDCANCEL:
			EndDialog(hDlg,IDCANCEL);
			return TRUE;
		}
		return FALSE;
	}
	return FALSE;
}

void CreateToolBar()
{
	TBBUTTON ToolBtn[]={
		{0,IDM_FILE_NEW,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0,0},
		{1,IDM_FILE_OPEN,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0,1},
		{2,IDM_FILE_SAVE,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0,2},
		{4,0,0,TBSTYLE_SEP,0,0},
		{3,IDM_EDIT_CUT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0,3},
		{4,IDM_EDIT_COPY,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0,4},
		{5,IDM_EDIT_PASTE,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0,5},
		{4,0,0,TBSTYLE_SEP,0,0},
		{6,IDM_SHAPE_SELECT,TBSTATE_ENABLED,TBSTYLE_CHECKGROUP,0,0,0,6},
		{7,IDM_SHAPE_LINE,TBSTATE_ENABLED,TBSTYLE_CHECKGROUP,0,0,0,7},
		{8,IDM_SHAPE_ELLIPSE,TBSTATE_ENABLED,TBSTYLE_CHECKGROUP,0,0,0,8},
		{9,IDM_SHAPE_RECTANGLE,TBSTATE_ENABLED,TBSTYLE_CHECKGROUP,0,0,0,9},
		{10,IDM_SHAPE_TEXT,TBSTATE_ENABLED,TBSTYLE_CHECKGROUP,0,0,0,10},
		{11,IDM_SHAPE_BITMAP,TBSTATE_ENABLED,TBSTYLE_CHECKGROUP,0,0,0,11},
		{12,IDM_SHAPE_META,TBSTATE_ENABLED,TBSTYLE_CHECKGROUP,0,0,0,12},
		{4,0,0,TBSTYLE_SEP,0,0},
		{13,IDM_SHAPE_PROPERTY,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0,0,13},
	};
	TCHAR *szToolText="새파일\0열기\0저장\0자르기\0복사\0붙이기"
		"\0선택\0선\0원\0사각형\0텍스트\0비트맵\0메타\0속성\0";

	hToolBar=CreateToolbarEx(hWndMain, WS_CHILD | WS_VISIBLE
		| TBSTYLE_TOOLTIPS | TBSTYLE_FLAT ,
		99, 14, g_hInst, IDB_TOOLBAR, ToolBtn, 17,
		16,15,16,15,sizeof(TBBUTTON));

	SendMessage(hToolBar,TB_ADDSTRING,NULL,(LPARAM)szToolText);
	SendMessage(hToolBar,TB_AUTOSIZE,0,0);
}

void OnIdle()
{
	static DTool OldTool=(DTool)-1;

	if (OldTool == NowTool) {
		return;
	}
	OldTool=NowTool;
	SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_SELECT,MAKELONG(TBSTATE_ENABLED,0));
	SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_LINE,MAKELONG(TBSTATE_ENABLED,0));
	SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_ELLIPSE,MAKELONG(TBSTATE_ENABLED,0));
	SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_RECTANGLE,MAKELONG(TBSTATE_ENABLED,0));
	SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_TEXT,MAKELONG(TBSTATE_ENABLED,0));
	SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_BITMAP,MAKELONG(TBSTATE_ENABLED,0));
	SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_META,MAKELONG(TBSTATE_ENABLED,0));
	switch (NowTool) {
	case DT_SELECT:
		SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_SELECT,
			MAKELONG(TBSTATE_CHECKED | TBSTATE_ENABLED,0));
		break;
	case DT_LINE:
		SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_LINE,
			MAKELONG(TBSTATE_CHECKED | TBSTATE_ENABLED,0));
		break;
	case DT_ELLIPSE:
		SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_ELLIPSE,
			MAKELONG(TBSTATE_CHECKED | TBSTATE_ENABLED,0));
		break;
	case DT_RECTANGLE:
		SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_RECTANGLE,
			MAKELONG(TBSTATE_CHECKED | TBSTATE_ENABLED,0));
		break;
	case DT_TEXT:
		SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_TEXT,
			MAKELONG(TBSTATE_CHECKED | TBSTATE_ENABLED,0));
		break;
	case DT_BITMAP:
		SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_BITMAP,
			MAKELONG(TBSTATE_CHECKED | TBSTATE_ENABLED,0));
		break;
	case DT_META:
		SendMessage(hToolBar,TB_SETSTATE,IDM_SHAPE_META,
			MAKELONG(TBSTATE_CHECKED | TBSTATE_ENABLED,0));
		break;
	}
}

void InsertBitmap(int x,int y)
{
	OPENFILENAME OFN;
	char lpstrFile[MAX_PATH]="";
	HANDLE hFile;
	DWORD FileSize, dwRead;
	BYTE *pBmp;
	BITMAPINFOHEADER *ih;

	memset(&OFN, 0, sizeof(OPENFILENAME));
	OFN.lStructSize = sizeof(OPENFILENAME);
	OFN.hwndOwner=hWndMain;
	OFN.lpstrFilter="비트맵 파일\0*.bmp\0모든 파일(*.*)\0*.*\0";
	OFN.lpstrFile=lpstrFile;
	OFN.nMaxFile=256;
	if (GetOpenFileName(&OFN)!=0) {
		hFile=CreateFile(lpstrFile,GENERIC_READ,0,NULL,
			OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
		if (hFile!=INVALID_HANDLE_VALUE) {
			FileSize=GetFileSize(hFile,NULL);
			pBmp=(BYTE *)malloc(FileSize);
			ReadFile(hFile,pBmp,FileSize,&dwRead,NULL);
			CloseHandle(hFile);
			if (*pBmp != 0x42 || *(pBmp+1) != 0x4d) {
				free(pBmp);
				return;
			}
			ih=(BITMAPINFOHEADER *)(pBmp+sizeof(BITMAPFILEHEADER));
			AppendObject(DT_BITMAP,x,y,x+ih->biWidth,y+ih->biHeight);
			arObj[arNum-1]->Bitmap=pBmp;
			arObj[arNum-1]->Len=FileSize;

			InvalidateRect(hWndMain,NULL,TRUE);
			NowTool=DT_SELECT;
			NowSel=arNum-1;
		}
	}
}

void InsertMeta(int x,int y)
{
	OPENFILENAME OFN;
	char lpstrFile[MAX_PATH]="";
	HANDLE hFile;
	DWORD FileSize, dwRead;
	BYTE *pMeta;

	memset(&OFN, 0, sizeof(OPENFILENAME));
	OFN.lStructSize = sizeof(OPENFILENAME);
	OFN.hwndOwner=hWndMain;
	OFN.lpstrFilter="메타 파일\0*.wmf\0모든 파일(*.*)\0*.*\0";
	OFN.lpstrFile=lpstrFile;
	OFN.nMaxFile=256;
	if (GetOpenFileName(&OFN)!=0) {
		hFile=CreateFile(lpstrFile,GENERIC_READ,0,NULL,
			OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
		if (hFile!=INVALID_HANDLE_VALUE) {
			FileSize=GetFileSize(hFile,NULL);
			pMeta=(BYTE *)malloc(FileSize);
			ReadFile(hFile,pMeta,FileSize,&dwRead,NULL);
			CloseHandle(hFile);
			if(*((DWORD *)pMeta) != 0x9ac6cdd7l) {
				free(pMeta);
				return;
			}
			AppendObject(DT_META,x,y,x+100,y+100);
			arObj[arNum-1]->Meta=pMeta;
			arObj[arNum-1]->Len=FileSize;

			InvalidateRect(hWndMain,NULL,TRUE);
			NowTool=DT_SELECT;
			NowSel=arNum-1;
		}
	}
}

#pragma pack(push)
#pragma pack(2)
typedef struct
{
	DWORD		dwKey;
	WORD		hmf;
	SMALL_RECT	bbox;
	WORD		wInch;
	DWORD		dwReserved;
	WORD		wCheckSum;
} APMHEADER, *PAPMHEADER;
#pragma pack(pop)

void PlayPlaceableMeta(HDC hdc,BYTE *pMeta,int len,RECT *rt)
{
	HENHMETAFILE hEnh;
	PAPMHEADER pHeader=(PAPMHEADER)pMeta;
	METAFILEPICT mp;

	if(pHeader->dwKey == 0x9ac6cdd7l) {
		mp.mm = MM_ANISOTROPIC;
		mp.xExt = pHeader->bbox.Right - pHeader->bbox.Left;
		mp.xExt = ( mp.xExt * 2540l ) / (DWORD)(pHeader->wInch);
		mp.yExt = pHeader->bbox.Bottom - pHeader->bbox.Top;
		mp.yExt = ( mp.yExt * 2540l ) / (DWORD)(pHeader->wInch);
		mp.hMF = NULL;

		hEnh = SetWinMetaFileBits(len, &(pMeta[sizeof(APMHEADER)]), hdc, &mp);
		PlayEnhMetaFile(hdc,hEnh,rt);
		DeleteEnhMetaFile(hEnh);
	}
}

BOOL CALLBACK TextDlgProc(HWND hDlg,UINT iMessage,WPARAM wParam,LPARAM lParam)
{
	static TCHAR **ppText;
	int len;

	switch(iMessage) {
	case WM_INITDIALOG:
		ppText=(TCHAR **)lParam;
		if (*ppText) {
			SetDlgItemText(hDlg,IDC_EDSTR,*ppText);
		}
		return TRUE;
	case WM_COMMAND:
		switch (LOWORD(wParam)) {
		case IDOK:
			len=GetWindowTextLength(GetDlgItem(hDlg,IDC_EDSTR));
			*ppText=(TCHAR *)realloc(*ppText,len+1);
			GetDlgItemText(hDlg,IDC_EDSTR,*ppText,len+1);
			EndDialog(hDlg,IDOK);
			return TRUE;
		case IDCANCEL:
			EndDialog(hDlg,IDCANCEL);
			return TRUE;
		}
		break;
	}
	return FALSE;
}

int CALLBACK EnumFamCallBack(ENUMLOGFONT FAR *lpelf, NEWTEXTMETRIC FAR *lpntm, 
							 int FontType, LPARAM lParam)
{
	if (FontNum < 500) {
		if (lpelf->elfLogFont.lfFaceName[0] != '@') {
			logfont[FontNum] = lpelf->elfLogFont;
			FontNum++;
		}
		return TRUE;
	}
	else {
		return FALSE;
	}
}

void ReEnum()
{
	HDC hdc;

	FontNum=0;
	hdc=GetDC(hWndMain);
	EnumFontFamilies(hdc, NULL, (FONTENUMPROC)EnumFamCallBack, (LPARAM)NULL);
	ReleaseDC(hWndMain, hdc);
}

int FindFontFromFace(TCHAR *Face)
{
	int i;

	if (FontNum == 0) {
		ReEnum();
	}
	for (i=0;i<FontNum;i++) {
		if (lstrcmp(logfont[i].lfFaceName,Face)==0) {
			return i;
		}
	}
	return -1;
}

void ChangeCaption(TCHAR *Path)
{
	TCHAR Cap[MAX_PATH+64];

	lstrcpy(NowFile,Path);
	wsprintf(Cap,"ApiDraw - %s",Path);
	SetWindowText(hWndMain,Cap);
}

void InitDoc()
{
	arSize=100;
	arNum=0;
	arGrowBy=50;
	arObj=(DObject **)malloc(sizeof(DObject *)*arSize);
	NowSel=-1;
	ChangeCaption("이름없음");
	bModified=FALSE;
}

void FreeDoc()
{
	int idx;

	for (idx=0;idx<arNum;idx++) {
		if (arObj[idx]->Type >= DT_TEXT && arObj[idx]->Type <= DT_META) {
			free(arObj[idx]->Text);
		}
		free(arObj[idx]);
	}
	free(arObj);
}

int ConfirmSave()
{
	int result=IDNO;
	TCHAR Mes[MAX_PATH+64];

	if (bModified) {
		wsprintf(Mes,"%s 파일이 변경되었습니다. 저장하시겠습니까?",NowFile);
		result=MessageBox(hWndMain,Mes,"알림",MB_YESNOCANCEL);
		if (result == IDCANCEL) {
			return IDCANCEL;
		}
		if (result == IDYES) {
			if (Save() == FALSE)
				return IDCANCEL;
			else 
				return IDYES;
		}
	}
	return result;
}

void New()
{
	if (ConfirmSave() == IDCANCEL) {
		return;
	}
	FreeDoc();
	InitDoc();
	InvalidateRect(hWndMain,NULL,TRUE);
}

BOOL Save()
{
	if (lstrcmp(NowFile,"이름없음")==0) {
		return SaveAs();
	} else {
		return SaveToFile(NowFile);
	}
}

BOOL SaveAs()
{
	OPENFILENAME OFN;
	TCHAR lpstrFile[MAX_PATH]="";

	memset(&OFN, 0, sizeof(OPENFILENAME));
	OFN.lStructSize = sizeof(OPENFILENAME);
	OFN.hwndOwner=hWndMain;
	OFN.lpstrFilter="ApiDrawFile(*.adr)\0*.adr\0Every File(*.*)\0*.*\0";
	OFN.lpstrFile=lpstrFile;
	OFN.nMaxFile=256;
	OFN.lpstrDefExt="adr";
	if (GetSaveFileName(&OFN)==FALSE) {
		return FALSE;
	}
	ChangeCaption(OFN.lpstrFile);
	return SaveToFile(NowFile);
}

BOOL SaveToFile(TCHAR *Path)
{
	FileHeader Header;
	HANDLE hFile;
	DWORD dwWritten;
	int idx;

	hFile=CreateFile(Path,GENERIC_WRITE,0,NULL,
		CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);
	if (hFile==INVALID_HANDLE_VALUE) {
		return FALSE;
	}

	strcpy(Header.szHeader,"ApiDraw File");
	Header.version=100;
	Header.arNum=arNum;
	WriteFile(hFile,&Header,sizeof(Header),&dwWritten,NULL);

	for (idx=0;idx<arNum;idx++) {
		WriteFile(hFile,arObj[idx],sizeof(DObject),&dwWritten,NULL);
		if (arObj[idx]->Type >= DT_TEXT && arObj[idx]->Type <= DT_META) {
			WriteFile(hFile,arObj[idx]->Text,arObj[idx]->Len,&dwWritten,NULL);
		}
	}

	CloseHandle(hFile);
	bModified=FALSE;
	return TRUE;
}

void Open()
{
	FileHeader Header;
	OPENFILENAME OFN;
	TCHAR lpstrFile[MAX_PATH]="";
	HANDLE hFile;
	DWORD dwRead;
	int idx;

	if (ConfirmSave() == IDCANCEL) {
		return;
	}
	memset(&OFN, 0, sizeof(OPENFILENAME));
	OFN.lStructSize = sizeof(OPENFILENAME);
	OFN.hwndOwner=hWndMain;
	OFN.lpstrFilter="ApiDrawFile(*.adr)\0*.adr\0Every File(*.*)\0*.*\0";
	OFN.lpstrFile=lpstrFile;
	OFN.nMaxFile=256;
	OFN.lpstrDefExt="adr";
	if (GetOpenFileName(&OFN)==FALSE) {
		return;
	}

	hFile=CreateFile(OFN.lpstrFile,GENERIC_READ,0,NULL,
		OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
	if (hFile==INVALID_HANDLE_VALUE) {
		MessageBox(hWndMain,"파일을 열 수 없습니다.","에러",MB_OK);
		return;
	}

	ReadFile(hFile,&Header,sizeof(Header),&dwRead,NULL);
	if (strcmp(Header.szHeader,"ApiDraw File") != 0) {
		MessageBox(hWndMain,"ApiDraw 파일이 아닙니다.","에러",MB_OK);
		CloseHandle(hFile);
		return;
	}
	if (Header.version != 100) {
		MessageBox(hWndMain,"버전이 1.0이 아닙니다.","에러",MB_OK);
		CloseHandle(hFile);
		return;
	}

	FreeDoc();
	InitDoc();

	arNum=Header.arNum;
	if (arNum >= arSize) {
		arSize=arNum+arGrowBy;
		arObj=(DObject **)realloc(arObj,sizeof(DObject *)*arSize);
	}
	for (idx=0;idx<arNum;idx++) {
		arObj[idx]=(DObject *)malloc(sizeof(DObject));
		ReadFile(hFile,arObj[idx],sizeof(DObject),&dwRead,NULL);
		if (arObj[idx]->Type >= DT_TEXT && arObj[idx]->Type <= DT_META) {
			arObj[idx]->Text=(TCHAR *)malloc(arObj[idx]->Len);
			ReadFile(hFile,arObj[idx]->Text,arObj[idx]->Len,&dwRead,NULL);
		}
	}
	CloseHandle(hFile);
	InvalidateRect(hWndMain,NULL,TRUE);
	ChangeCaption(OFN.lpstrFile);
}
