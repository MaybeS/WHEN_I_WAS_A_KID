#include <windows.h>
#include <time.h>
#include "resource1.h"
LRESULT CALLBACK WndProc(HWND,UINT,WPARAM,LPARAM);
HINSTANCE g_hInst;
LPCTSTR lpszClass=TEXT("First");
void MyDraw(HWND hWnd, HDC hDC);

int APIENTRY WinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance
					 ,LPSTR lpszCmdParam,int nCmdShow)
{
	HWND hWnd;
	MSG Message;
	WNDCLASS WndClass;
	g_hInst=hInstance;

	WndClass.cbClsExtra=0;
	WndClass.cbWndExtra=0;
	WndClass.hbrBackground=(HBRUSH)GetStockObject(WHITE_BRUSH);
	WndClass.hCursor=LoadCursor(NULL,IDC_ARROW);
	WndClass.hIcon=LoadIcon(NULL,IDI_APPLICATION);
	WndClass.hInstance=hInstance;
	WndClass.lpfnWndProc=WndProc;
	WndClass.lpszClassName=lpszClass;
	WndClass.lpszMenuName=NULL;
	WndClass.style=CS_HREDRAW | CS_VREDRAW;
	RegisterClass(&WndClass);

	hWnd=CreateWindow(lpszClass,lpszClass,WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT,CW_USEDEFAULT,800,600,
		NULL,(HMENU)NULL,hInstance,NULL);
	ShowWindow(hWnd,nCmdShow);

	while (GetMessage(&Message,NULL,0,0)) {
		TranslateMessage(&Message);
		DispatchMessage(&Message);
	}
	return (int)Message.wParam;
}


HBITMAP g_Dice[6];

int g_Player1[5];
int g_Player2[5];


LRESULT CALLBACK WndProc(HWND hWnd,UINT iMessage,WPARAM wParam,LPARAM lParam)
{
	HDC hdc;	
	PAINTSTRUCT ps;
	int i;

	switch (iMessage) 
	{
	case WM_CREATE:		
		g_Dice[0] = LoadBitmap(g_hInst,MAKEINTRESOURCE(IDB_BITMAP1));
		g_Dice[1] = LoadBitmap(g_hInst,MAKEINTRESOURCE(IDB_BITMAP2));
		g_Dice[2] = LoadBitmap(g_hInst,MAKEINTRESOURCE(IDB_BITMAP3));
		g_Dice[3] = LoadBitmap(g_hInst,MAKEINTRESOURCE(IDB_BITMAP4));
		g_Dice[4] = LoadBitmap(g_hInst,MAKEINTRESOURCE(IDB_BITMAP5));
		g_Dice[5] = LoadBitmap(g_hInst,MAKEINTRESOURCE(IDB_BITMAP6));
		srand(time(NULL));

		CreateWindow(TEXT("button"),TEXT("Button"),WS_CHILD | WS_VISIBLE | 
			BS_PUSHBUTTON,350,400,100,25,hWnd,(HMENU)1004,g_hInst,NULL);
		break;
	case WM_COMMAND:
		switch (LOWORD(wParam)) 
		{		
		case 1004:
			for(i=0;i < 5;i++)
				g_Player1[i] = (rand()%5)+1;
			for(i=0;i < 5;i++)
				g_Player2[i] = (rand()%5)+1;

			InvalidateRect(hWnd,NULL,FALSE);
		break;
		}
		return 0;	
	
	case WM_PAINT:
		hdc = BeginPaint(hWnd, &ps);
		MyDraw(hWnd, hdc);
		EndPaint(hWnd, &ps);
		return 0;
	case WM_DESTROY:
		
		PostQuitMessage(0);
		return 0;
	}
	return(DefWindowProc(hWnd,iMessage,wParam,lParam));
}

void MyDraw(HWND hWnd, HDC hDC)
{
	HDC hMemDC,hMemDC2;
	HBITMAP hBackBit,hOldBitmap;
	RECT rect={0,0,800,600};
	hMemDC=CreateCompatibleDC(hDC);
	hBackBit=CreateCompatibleBitmap(hDC,800,600);
	hOldBitmap=(HBITMAP)SelectObject(hMemDC,hBackBit);
	
	FillRect(hMemDC, &rect, (HBRUSH)GetStockObject(WHITE_BRUSH));

	TextOut(hMemDC,200,80,"PLAYER1", strlen("PLAYER1"));
	for(int i=0;i < 5;i++)
	{	
		hMemDC2=CreateCompatibleDC(hDC);
		SelectObject(hMemDC2,g_Dice[g_Player1[i]]);	
		BitBlt(hMemDC,200+(i*80),100,48,48,hMemDC2,0,0,SRCCOPY);
		DeleteDC(hMemDC2);			
	}

	TextOut(hMemDC,200,280,"PLAYER2", strlen("PLAYER2"));
	for(int i=0;i < 5;i++)
	{	
		hMemDC2=CreateCompatibleDC(hDC);
		SelectObject(hMemDC2,g_Dice[g_Player2[i]]);	
		BitBlt(hMemDC,200+(i*80),300,48,48,hMemDC2,0,0,SRCCOPY);
		DeleteDC(hMemDC2);			
	}

	BitBlt(hDC,0,0,800,600,hMemDC,0,0,SRCCOPY);

	SelectObject(hMemDC,hOldBitmap);
	DeleteObject(hBackBit);
	DeleteDC(hMemDC);
}