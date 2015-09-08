#include <windows.h>
#define CLASSNAME "particle"

#include "Drawer.h"
#include "Particle.h"

// 필요한것들 정의
#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480
#define PARTICLE_COUNT 300

// 클래스
Drawer drawer(SCREEN_WIDTH, SCREEN_HEIGHT);
Particle particles[PARTICLE_COUNT];

// 윈도우 프로시저
LRESULT CALLBACK WndProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	switch(uMsg)
	{
	case WM_CREATE:
		{
			// 시작시 초기화할것들..
			srand(GetTickCount());

			RECT rt = {0, 0, SCREEN_WIDTH, SCREEN_HEIGHT};
			AdjustWindowRectEx(&rt, GetWindowLong(hWnd, GWL_STYLE), GetMenu(hWnd)? TRUE: FALSE, GetWindowLong(hWnd, GWL_EXSTYLE));
			SetWindowPos(hWnd, NULL, GetSystemMetrics(SM_CXSCREEN) / 2 - (rt.right - rt.left) / 2, 
				GetSystemMetrics(SM_CYSCREEN) / 2 - (rt.bottom - rt.top) / 2, 
				rt.right - rt.left, rt.bottom - rt.top, SWP_NOZORDER);
			SetTimer(hWnd, 0, 15, NULL);

			// 색깔
			drawer.SetPenColor(1, RGB(255, 0, 0));
			drawer.SetBrushColor(RGB(255, 255, 0));
		}
		return 0;
	case WM_TIMER:
		{
			// 타이머를 돌려서 뻘짓을 함
			int i;
			for(i = 0; i < PARTICLE_COUNT; i++)
			{
				particles[i].Process();
			}
			InvalidateRect(hWnd, NULL, FALSE);
		}
		return 0;
	case WM_LBUTTONDOWN:
		{
			// 클릭하면 폭죽을 생성함!!
			int i;
			for(i = 0; i < PARTICLE_COUNT; i++)
			{
				particles[i].Start((float)SCREEN_WIDTH / 2, (float)SCREEN_HEIGHT - 40);
			}
		}
		return 0;
	case WM_PAINT:
		{
			// 요긴 그려주는곳.
			PAINTSTRUCT ps;
			HDC hdc = BeginPaint(hWnd, &ps);
			
			// 지우고
			drawer.Clear(/*RGB(255, 255, 255)*/);

			// 그리고
			int i;
			for(i = 0; i < PARTICLE_COUNT; i++)
			{
				particles[i].Draw(drawer);
			}

			// 한꺼번에 보여주고
			drawer.Draw(hdc);

			EndPaint(hWnd, &ps);
		}
		return 0;
	case WM_DESTROY:
		// 정리하는곳
		KillTimer(hWnd, 0);
		PostQuitMessage(0);
		return 0;
	}
	return DefWindowProc(hWnd, uMsg, wParam, lParam);
}

// 여긴 별거 없으니 보지마셈.
int WINAPI WinMain(HINSTANCE hInst, HINSTANCE, LPSTR, int nCmdShow)
{
	WNDCLASS wc = {CS_HREDRAW | CS_VREDRAW, WndProc, 0, 0, hInst, 0, 
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

	while(GetMessage(&msg, 0, 0, 0))
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
	return msg.wParam;
}

