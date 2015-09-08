#include <windows.h>
#define CLASSNAME "gogooma"

#include "resource.h"

// 클래스
#include "Game.h"
Game game;

// 윈도우 프로시저
LRESULT CALLBACK WndProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	switch(uMsg)
	{
	case WM_CREATE:
		{
			// 시작시 초기화할것들..
			if(game.Start())
			{
				MessageBox(hWnd, "Game Start failed.", CLASSNAME, MB_OK | MB_ICONERROR);
				DestroyWindow(hWnd);
				return -1;
			}
			game.SetWindowSize(hWnd);
			
			//SetTimer(hWnd, 0, Game::MSPF, NULL);
		}
		return 0;
	case WM_TIMER:
		{
			InvalidateRect(hWnd, NULL, FALSE);
		}
		return 0;
	case WM_PAINT:
		{
			// 요긴 그려주는곳.
			PAINTSTRUCT ps;
			HDC hdc = BeginPaint(hWnd, &ps);
			
			EndPaint(hWnd, &ps);
		}
		return 0;
	case WM_DESTROY:
		// 정리하는곳
		KillTimer(hWnd, 0);
		PostQuitMessage(0);
		return 0;

	GINPUT_HANDLER(game.m_Input);

	}
	return DefWindowProc(hWnd, uMsg, wParam, lParam);
}

// 여긴 별거 없으니 보지마셈.
int WINAPI WinMain(HINSTANCE hInst, HINSTANCE, LPSTR, int nCmdShow)
{
	WNDCLASS wc = {CS_HREDRAW | CS_VREDRAW, WndProc, 0, 0, hInst, 
		LoadIcon(hInst, MAKEINTRESOURCE(IDI_APP)), 
		LoadCursor(NULL, IDC_ARROW), (HBRUSH)(COLOR_WINDOW + 1), 0, CLASSNAME};
	if(!RegisterClass(&wc))
	{
		MessageBox(NULL, "RegisterClass failed.", CLASSNAME, MB_OK | MB_ICONERROR);
		return -1;
	}
	HWND hWnd = CreateWindow(CLASSNAME, CLASSNAME, WS_OVERLAPPED | WS_SYSMENU | WS_CAPTION, 
		CW_USEDEFAULT, CW_USEDEFAULT, 0, 0, 0, 0, hInst, NULL);
	ShowWindow(hWnd, nCmdShow);

	if(hWnd == NULL)
	{
		MessageBox(NULL, "CreateWindow failed.", CLASSNAME, MB_OK | MB_ICONERROR);
		return -1;
	}

	MSG msg;
	DWORD dwLast = 0;

	while(1)
	{
		if(PeekMessage(&msg, 0, 0, 0, PM_REMOVE))
		{
			if(msg.message == WM_QUIT) break;
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
		else
		{
			if(GetTickCount() - dwLast >= (DWORD)Game::MSPF)
			{
				dwLast = GetTickCount();
				game.Process();
				HDC hdc = GetDC(hWnd);
				game.Draw(hdc);
				ReleaseDC(hWnd, hdc);
			}
			Sleep(1);
		}
	}
	return msg.wParam;
}

