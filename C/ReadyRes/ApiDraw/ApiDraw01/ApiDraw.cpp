#include <windows.h>
#include "resource.h"

LRESULT CALLBACK WndProc(HWND,UINT,WPARAM,LPARAM);
LRESULT CALLBACK CanvasProc(HWND,UINT,WPARAM,LPARAM);
HINSTANCE g_hInst;
HWND hWndMain;
LPCTSTR lpszClass=TEXT("ApiDraw");

// 타입 및 전역 변수
HWND hCanvas;
enum DTool { DT_LINE, DT_ELLIPSE, DT_RECTANGLE };
enum DMode { DM_NONE, DM_DRAW };
DTool NowTool;
DMode DragMode;
int sx,sy,oldx,oldy;

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
	WndClass.hIcon=LoadIcon(NULL,IDI_APPLICATION);
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
		hWndMain=hWnd;
		hCanvas=CreateWindow("Canvas",NULL,WS_CHILD | WS_VISIBLE,
			0,0,0,0,hWnd,(HMENU)0,g_hInst,NULL);
		return 0;
	case WM_SIZE:
		if (wParam != SIZE_MINIMIZED) {
			MoveWindow(hCanvas,0,0,LOWORD(lParam),HIWORD(lParam),TRUE);
		}
		return 0;
	case WM_COMMAND:
		switch(LOWORD(wParam)) {
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
	case WM_DESTROY:
		PostQuitMessage(0);
		return 0;
	}
	return(DefWindowProc(hWnd,iMessage,wParam,lParam));
}

// 캔버스 윈도우의 메시지 처리 함수
LRESULT CALLBACK CanvasProc(HWND hWnd,UINT iMessage,WPARAM wParam,LPARAM lParam)
{
	int ex,ey;
	HDC hdc;

	switch(iMessage) {
	case WM_CREATE:
		NowTool=DT_LINE;
		DragMode=DM_NONE;
		return 0;
	case WM_LBUTTONDOWN:
		sx=LOWORD(lParam);
		sy=HIWORD(lParam);
		oldx=sx;
		oldy=sy;
		DragMode=DM_DRAW;
		SetCapture(hWnd);
		return 0;
	case WM_MOUSEMOVE:
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
	case WM_LBUTTONUP:
		DragMode=DM_NONE;
		ReleaseCapture();
		return 0;
	}
	return(DefWindowProc(hWnd,iMessage,wParam,lParam));
}

