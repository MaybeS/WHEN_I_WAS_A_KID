#include <windows.h>
#include <math.h>

LRESULT CALLBACK WndProc(HWND,UINT,WPARAM,LPARAM);
HINSTANCE g_hInst;
LPCTSTR lpszClass = TEXT("Curve - SecondMk");

double Sin[1800];

void Init() {
	int i;

	for(i=0;i<1800;i++) {
		Sin[i] = sin((i/10.0)*3.14/180);
	}
}

int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpszCmdParam, int nCmdShow)
{
	MSG Message;
	WNDCLASS WndClass;
	HWND hWnd;
	hInstance = g_hInst;

	WndClass.cbClsExtra = 0;
	WndClass.cbWndExtra = 0;
	WndClass.hbrBackground = (HBRUSH)GetStockObject(BLACK_BRUSH);
	WndClass.hCursor = LoadCursor(NULL,IDC_ARROW);
	WndClass.hIcon = LoadIcon(NULL,IDI_APPLICATION);
	WndClass.hInstance = hInstance;
	WndClass.lpfnWndProc = WndProc;
	WndClass.lpszClassName = lpszClass;
	WndClass.lpszMenuName = NULL;
	WndClass.style = CS_HREDRAW | CS_VREDRAW;
	RegisterClass(&WndClass);

	hWnd = CreateWindow(lpszClass,lpszClass,WS_OVERLAPPEDWINDOW,100,100,600,500,NULL,(HMENU)NULL,hInstance,NULL);
	ShowWindow(hWnd,nCmdShow);

	while(GetMessage(&Message,NULL,0,0)) {
		TranslateMessage(&Message);
		DispatchMessage(&Message);
	}
	return (int)Message.wParam;
}

LRESULT CALLBACK WndProc(HWND hWnd, UINT iMessage, WPARAM wParam, LPARAM lParam)
{
	HDC hdc, hMemDC;
	PAINTSTRUCT ps;

	HBITMAP hBit, OldBit;

	HPEN hPen;
	HPEN OldPen;

	int i;
	static int x;
	static int y;
	int dx, dy;
	int dis;
	double per;

	static int k;

	TCHAR szText[1024];
	static HFONT hFont;
	HFONT OldFont;

	switch(iMessage) {
	case WM_CREATE:
		Init();
		hFont = CreateFont(13,0,0,0,0,0,0,0,HANGEUL_CHARSET,0,0,0,FF_ROMAN|VARIABLE_PITCH,
			TEXT("µ¸¿ò"));
		SetTimer(hWnd,1,10,NULL);
		return 0;
	case WM_TIMER:
		if(wParam==1) {
			k+=2;
			if(k>180) k=0;
			InvalidateRect(hWnd,NULL,FALSE);
		}
		return 0;
	case WM_MOUSEMOVE:
		x = LOWORD(lParam);
		y = HIWORD(lParam);
		InvalidateRect(hWnd,NULL,FALSE);
		return 0;
	case WM_PAINT:
		hdc = BeginPaint(hWnd,&ps);
		hMemDC = CreateCompatibleDC(hdc);
		hBit = CreateCompatibleBitmap(hdc,600,500);
		OldBit = (HBITMAP)SelectObject(hMemDC,hBit);

		SetBkMode(hMemDC,TRANSPARENT);
		SetTextColor(hMemDC,RGB(255,255,255));
		OldFont = (HFONT)SelectObject(hMemDC,hFont);
		wsprintf(szText,TEXT("Made by SecondMk(mk34252)"));
		TextOut(hMemDC,10,10,szText,lstrlen(szText));
		wsprintf(szText,TEXT("http://blog.naver.com/mk34252"));
		TextOut(hMemDC,10,25,szText,lstrlen(szText));
		wsprintf(szText,TEXT("http://cafe.naver.com/godgamesoftware"));
		TextOut(hMemDC,10,40,szText,lstrlen(szText));
		SelectObject(hMemDC,OldFont);

		for(i=0;i<12000;i+=8) {
			dx = i/10-200+k;
			dy = (int)(Sin[i%1800]*200+200);
			dis = ((x-dx)*(x-dx) + (y-dy)*(y-dy));
			per = 50 - ((dis/6100.0));

			if(per<0.0) {
				per += 50;
				hPen = CreatePen(PS_SOLID,1,RGB((int)(per*5.1),0,(int)(per*5.1)));
			} else {
				per += 50;
				hPen = CreatePen(PS_SOLID,1,RGB(255,(int)((per-50.0)*5.1),255));
			}
			OldPen = (HPEN)SelectObject(hMemDC,hPen);
			MoveToEx(hMemDC,i/10-200+k,(int)(Sin[i%1800]*200+200),NULL);
			LineTo(hMemDC,i/10+40-200+k,(int)(Sin[i%1800]*200+200));
			SelectObject(hMemDC,OldPen);
			DeleteObject(hPen);
		}

		BitBlt(hdc,0,0,600,500,hMemDC,0,0,SRCCOPY);
		SelectObject(hMemDC,OldBit);
		DeleteObject(hBit);
		DeleteDC(hMemDC);
		EndPaint(hWnd,&ps);
		return 0;
	case WM_DESTROY:
		DeleteObject(hFont);
		KillTimer(hWnd,1);
		PostQuitMessage(0);
		return 0;
	}
	return (DefWindowProc(hWnd,iMessage,wParam,lParam));
}