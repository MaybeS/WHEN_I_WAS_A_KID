#include <windows.h>
#include "CGameHost.h"
#include "Resource.h"

/*
Helped by
제갈(ykpk3733) - 코딩 스타일
초롱이(minchoro123) - 프로젝트 진행을 위한 압축해제
고또(kottodat) - C++ 클래스의 구조에 대한 자세한 설명
도약(djm03178) - C++ 클래스의 구조에 대한 설명
하늘그네(gmlakd4u) - 테스트, 버그 검출

	Shooting Game Ver 1.1.1

	Shooting Game Ver 1.1.3
	 - Create Enemy AI
	 - Create Enemy Bullet
*/

LRESULT CALLBACK WndProc(HWND,UINT,WPARAM,LPARAM);
HINSTANCE g_hInst;
LPCTSTR lpszClass = TEXT("Game Made by G o D - (mk34252@nate.com)");

int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpszCmdParam, int nCmdShow) {
		if(FindWindow(NULL,lpszClass)) { //If There is Same Window
		MessageBox(HWND_DESKTOP,TEXT("Game is running!"),TEXT("G A M E"),MB_OK); //Alert
		return 1; // Exit
	}
	g_hInst = hInstance;
	WNDCLASS WndClass = { CS_HREDRAW | CS_VREDRAW,WndProc,0,0,hInstance,
		LoadIcon(NULL,IDI_APPLICATION),LoadCursor(NULL,IDC_ARROW),
		(HBRUSH)GetStockObject(WHITE_BRUSH),NULL,lpszClass };
	RegisterClass(&WndClass);
	HWND hWnd = CreateWindow(lpszClass,lpszClass,WS_OVERLAPPED|WS_SYSMENU
		|WS_MINIMIZEBOX|WS_CAPTION,100,100,600,500,NULL,
		(HMENU)NULL,hInstance,NULL);
	ShowWindow(hWnd,nCmdShow);
	MSG Message;
	while(GetMessage(&Message,NULL,0,0)) {
			TranslateMessage(&Message);
			DispatchMessage(&Message);
	}
	return (int)Message.wParam;
}

CGameHost *GameHost; //Main Game

LRESULT CALLBACK WndProc(HWND hWnd, UINT iMessage, WPARAM wParam, LPARAM lParam)
{
	PAINTSTRUCT ps;
	HDC hdc, hMemDC;
	HBITMAP OldBit;
	static HBITMAP hLoading;
	static BOOL bLoading;
	static int Time;
	TCHAR Str[128];
	int n, k;

	switch(iMessage) {
	case WM_CREATE:
		GameHost = NULL; //Init
		bLoading = TRUE;
		hLoading = LoadBitmap(g_hInst,MAKEINTRESOURCE(IDB_LOADING));
		SetTimer(hWnd,2,3000,NULL); //Set Loading Timer
		Time = 0;
		return 0;
	case WM_TIMER:
		if(wParam==1) { //Host Update Timer
			if(GameHost) {
			if(GetAsyncKeyState(VK_LEFT) & 0x8000) { //If Pressed Key
				GameHost->KeyUpdate(VK_LEFT);
				InvalidateRect(hWnd,0,0);
			} else if(GetAsyncKeyState(VK_RIGHT) & 0x8000) {
				GameHost->KeyUpdate(VK_RIGHT);
				InvalidateRect(hWnd,0,0);
			} else if(GetAsyncKeyState(VK_UP) & 0x8000) {
				GameHost->KeyUpdate(VK_UP);
				InvalidateRect(hWnd,0,0);
			} else if(GetAsyncKeyState(VK_DOWN) & 0x8000) {
				GameHost->KeyUpdate(VK_DOWN);
				InvalidateRect(hWnd,0,0);
			} 
			if(GetAsyncKeyState(VK_SPACE) & 0x8000) {
				GameHost->KeyUpdate(VK_SPACE);
				InvalidateRect(hWnd,0,0);
			}
			n = GameHost->Update();
			if(n==1) {
				delete GameHost;
				GameHost = NULL;
				MessageBox(hWnd,TEXT("Lose!"),TEXT("G o D"),NULL);
			} else if(n==2) {
				delete GameHost;
				GameHost = NULL;
				wsprintf(Str,TEXT("Win! Time:%d\n Retry?"),(int)(Time/4));
				k = MessageBox(hWnd,Str,TEXT("G o D"),MB_YESNO);
				if(k==IDYES) {
					GameHost = new CGameHost(g_hInst);
				} else {
					;
				}
			}
			InvalidateRect(hWnd,NULL,FALSE);
			Time++;
			}
		} if(wParam==2) { //Loading Timer
			bLoading = FALSE; //Begin Game
			GameHost = new CGameHost(g_hInst);
			SetTimer(hWnd,1,25,NULL); //Set Host Update Timer
			InvalidateRect(hWnd,NULL,FALSE);
			KillTimer(hWnd,2);
		}
		return 0;
	case WM_PAINT:
		hdc = BeginPaint(hWnd,&ps);
		if(GameHost)
			GameHost->Render(hdc); //Render
		if(bLoading) { //While Loading
			hMemDC = CreateCompatibleDC(hdc);
			OldBit = (HBITMAP)SelectObject(hMemDC,hLoading);
			BitBlt(hdc,0,0,600,500,hMemDC,0,0,SRCCOPY);
			SelectObject(hMemDC,OldBit);
			DeleteDC(hMemDC); //Draw Loading Bitmap
		}
		EndPaint(hWnd,&ps);
		return 0;
	case WM_DESTROY:
		KillTimer(hWnd,1); //DeInit
		if(GameHost)
			delete GameHost;
		DeleteObject(hLoading);
		PostQuitMessage(0);
		return 0;
	}
	return (DefWindowProc(hWnd,iMessage,wParam,lParam));
}