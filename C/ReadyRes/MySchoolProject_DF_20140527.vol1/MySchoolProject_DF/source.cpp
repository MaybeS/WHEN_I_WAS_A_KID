/*
충돌 체크를 하는 방법:
거리 fDistance를 구하는데, 서로 차지하기로 한 범위(모든 방향에 대해서)가 일정 값 미만이 되어서 겹치면, 두 객체는 충돌한 것으로 볼 수 있다.
*/

// 더블 버퍼링

#include "Header.h"
#include "resource.h"

#include "Object_Background.h"
#include "Object_Hero.h"

#define WINDOW_WIDTH	1400
#define WINDOW_HEIGHT	600

HDC g_hBackBufferDC = NULL;
HDC g_hMemDC = NULL;
HBITMAP g_hBackBufferBitmap = NULL;
SIZE g_WinSize;

HBITMAP g_hBitmapBG;
HBITMAP g_hBitmapHero;

Object_Background*	g_pBGA = NULL;
Object_Hero*		g_pHero = NULL;

void Draw(HWND hWnd)
{
	g_pBGA->Draw();
	g_pHero->Draw();
	InvalidateRect(hWnd, NULL, false);
}
void Tick()
{
	g_pHero->Tick();
}

LRESULT CALLBACK WndProc(HWND, UINT, WPARAM, LPARAM);
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, LPSTR strCmdLine, int nShowCmd)
{
	WNDCLASSEX wcex;
	memset(&wcex, 0, sizeof(wcex));

	wcex.cbSize							= sizeof(wcex);
	wcex.style							= CS_HREDRAW | CS_VREDRAW;
	wcex.hbrBackground					= (HBRUSH)GetStockObject(WHITE_BRUSH);
	wcex.hCursor						= LoadCursor(NULL, IDC_ARROW);
	wcex.hIcon							= LoadIcon(NULL, IDI_APPLICATION);
	wcex.hInstance						= hInstance;
	wcex.cbClsExtra						= 0;
	wcex.cbWndExtra						= 0;
	wcex.hIconSm						= NULL;
	wcex.lpszMenuName					= NULL;
	wcex.lpfnWndProc					= WndProc;
	wcex.lpszClassName					= L"MyWindow";
	RegisterClassEx(&wcex);

	// HWND : 핸들
	HWND hWnd = CreateWindow(L"MyWindow", L"Caption", WS_OVERLAPPEDWINDOW,
		0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, NULL, NULL, hInstance, NULL);

	if(hWnd == NULL)
	{
		MessageBox(NULL, L"윈도우 생성 실패", L"에러", MB_ICONERROR | MB_OK);
		return -1;
	}

	ShowWindow(hWnd, SW_SHOW);

	MSG msg;
	memset(&msg, 0, sizeof(msg));
	while(msg.message != WM_QUIT) // while 문을 돌면서 늘 메시지가 있는지 아니면 다른 행동을 할 것인지 체크할 수 있다!
	{
		if(g_pHero != NULL && g_pBGA != NULL)
		{	
			Draw(hWnd);
			Tick();
		}
		if(PeekMessage(&msg, NULL, 0, 0, PM_REMOVE)) // PeekMessage를 통한 메시지 얻어오기
		{
			TranslateMessage(&msg); // 키값 조사
			DispatchMessage(&msg); // 메시지 처리
		}
	}

	return 0;
}

LRESULT CALLBACK WndProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	switch(uMsg)
	{
	case WM_CREATE:
		{
			// 더블 버퍼링 기본 코드
			HDC hDC = GetDC(hWnd);

			g_hBackBufferDC = CreateCompatibleDC(hDC);
			g_hMemDC = CreateCompatibleDC(hDC);

			RECT rt;

			GetClientRect(hWnd, &rt);
			g_WinSize.cx = rt.right - rt.left;
			g_WinSize.cy = rt.bottom - rt.top;

			g_hBackBufferBitmap = CreateCompatibleBitmap(hDC, g_WinSize.cx, g_WinSize.cy);

			SelectObject(g_hBackBufferDC, g_hBackBufferBitmap);

			ReleaseDC(hWnd, hDC);
			//

			// 이번 프로젝트에서 추가

			HINSTANCE ins = (HINSTANCE)GetWindowLong(hWnd, GWL_HINSTANCE);

			g_hBitmapBG = LoadBitmap(ins, MAKEINTRESOURCE(IDB_BITMAP3));
			g_hBitmapHero = LoadBitmap(ins, MAKEINTRESOURCE(IDB_BITMAP1));

			// 배경
			g_pBGA = new Object_Background();
			g_pBGA->InitWithBackground(g_hBitmapBG, g_hBackBufferDC, g_hMemDC);

			// 주인공
			g_pHero = new Object_Hero();
			g_pHero->InitWithBackground(g_hBitmapHero, g_hBackBufferDC, g_hMemDC);

			break;
		}
	case WM_PAINT:
		{
			PAINTSTRUCT ps;
			HDC hDC = BeginPaint(hWnd, &ps);

			BitBlt(hDC, 0, 0, g_WinSize.cx, g_WinSize.cy, g_hBackBufferDC, 0, 0, SRCCOPY); // 백버퍼 DC의 내용을 화면으로 고속복사
		
			EndPaint(hWnd, &ps);
			break;
		}

	case WM_DESTROY:
		DeleteDC(g_hBackBufferDC);
		DeleteDC(g_hMemDC);
		DeleteObject(g_hBackBufferBitmap);

		delete g_pBGA;
		delete g_pHero;
		g_pBGA = NULL;
		g_pHero = NULL;



		PostQuitMessage(0);
		break;
	}

	return DefWindowProc(hWnd, uMsg, wParam, lParam);
}