#include <windows.h>
#include "resource.h"
HINSTANCE g_hInst;
HBITMAP Bit_Cat, Bit_Dog, Bit_Dest;
int g_nState, g_nSelect, g_nDest;
RECT Rect_Cat, Rect_Dog;
POINT Point_Dest[5];

LRESULT CALLBACK WndProc(HWND hwnd, UINT imsg, WPARAM wParam, LPARAM Iparam);
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hprevlnstance, LPSTR IpszCmdLine, int nCmdShow)
{
	HWND hwnd;
	MSG msg;
	WNDCLASS WndClass;
	g_hInst=hInstance;

	WndClass.style = CS_HREDRAW | CS_VREDRAW;
	WndClass.lpfnWndProc = WndProc;
	WndClass.cbClsExtra = 0;
	WndClass.cbWndExtra = 0;
	WndClass.hInstance = hInstance;
	WndClass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
	WndClass.hCursor = LoadCursor(NULL, IDC_ARROW);
	WndClass.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH);
	WndClass.lpszMenuName = NULL;
	WndClass.lpszClassName = "Test";
	RegisterClass(&WndClass);
	hwnd = CreateWindow("Test", "Test", WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		640,//CW_USEDEFAULT,
		480,//CW_USEDEFAULT,
		NULL,
		NULL,
		hInstance,
		NULL
		);
	ShowWindow(hwnd, nCmdShow);
	UpdateWindow(hwnd);
	while(GetMessage(&msg, NULL, 0, 0))
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
	return (int)msg.wParam;
}

LRESULT CALLBACK WndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
{
	HDC hdc;
	PAINTSTRUCT ps;

	switch (iMsg)
	{
	case WM_CREATE:
		Bit_Cat=LoadBitmap(g_hInst, MAKEINTRESOURCE(IDB_CAT));
		Bit_Dog=LoadBitmap(g_hInst, MAKEINTRESOURCE(IDB_DOG));
		Bit_Dest=LoadBitmap(g_hInst, MAKEINTRESOURCE(IDB_DEST));
				
		Rect_Cat.left = 250;
		Rect_Cat.top = 200;//고양이의 초기 위치
		Rect_Cat.right = Rect_Cat.left+40;
		Rect_Cat.bottom = Rect_Cat.top+80;
		
		Rect_Dog.left = 350;
		Rect_Dog.top = 200;//개의 초기위치
		Rect_Dog.right = Rect_Dog.left+40;
		Rect_Dog.bottom = Rect_Dog.top+80;

		//움직일 5군데 좌표
		Point_Dest[0].x	= 100;
		Point_Dest[0].y	= 100;	
		
		Point_Dest[1].x	= 500;
		Point_Dest[1].y	= 100;	
		
		Point_Dest[2].x	= 500;
		Point_Dest[2].y	= 400;	
		
		Point_Dest[3].x	= 100;
		Point_Dest[3].y	= 400;	
		
		Point_Dest[4].x	= 300;
		Point_Dest[4].y	= 300;	
			
		break;
	case WM_PAINT:
		hdc = BeginPaint(hwnd, &ps);
		
		HDC MemDC;
		HBITMAP OldBitmap;
		
		MemDC=CreateCompatibleDC(hdc);//비트맵을 그리기 위한 메모리
		
		//고양이 개 선택 화면일 경우
		if(g_nState == 0)
		{			
			//고양이 그리기
			OldBitmap=(HBITMAP)SelectObject(MemDC, Bit_Cat);
			BitBlt(hdc, Rect_Cat.left,Rect_Cat.top,40,80,MemDC,0,0,SRCCOPY);

			//개 그리기
			SelectObject(MemDC, Bit_Dog);
			BitBlt(hdc, Rect_Dog.left,Rect_Dog.top,40,80,MemDC,0,0,SRCCOPY);

			if(g_nSelect == 0)//고양이 선택일 경우
			{
				SelectObject(MemDC, Bit_Dest);
				BitBlt(hdc, Rect_Cat.left,Rect_Cat.top-48,48,48,MemDC,0,0,SRCCOPY);
			}
			else if(g_nSelect == 1)
			{
				SelectObject(MemDC, Bit_Dest);
				BitBlt(hdc, Rect_Dog.left,Rect_Dog.top-48,48,48,MemDC,0,0,SRCCOPY);
			}
			
		}else if(g_nState == 1)//캐릭터를 움직일 경우
		{
			SelectObject(MemDC, Bit_Dest);
			BitBlt(hdc, Point_Dest[g_nDest].x, Point_Dest[g_nDest].y,48,48,MemDC,0,0,SRCCOPY);//움직일 위치 그리기

			if(g_nSelect == 0)//고양이를 선택했을 경우
			{
				OldBitmap=(HBITMAP)SelectObject(MemDC, Bit_Cat);
				BitBlt(hdc, Rect_Cat.left,Rect_Cat.top,40,80,MemDC,0,0,SRCCOPY);
			}
			else if(g_nSelect == 1)//개 선택
			{
				OldBitmap=(HBITMAP)SelectObject(MemDC, Bit_Dog);
				BitBlt(hdc, Rect_Dog.left,Rect_Dog.top,40,80,MemDC,0,0,SRCCOPY);
			}			
		}

		SelectObject(MemDC,OldBitmap);
		DeleteDC(MemDC);
		EndPaint(hwnd, &ps);
		break;	
	case WM_KEYDOWN:
		if(g_nState == 0)//고양이 개 선택 화면일 경우
		{
			switch(wParam)
			{
			case VK_LEFT:
				g_nSelect = 0;
				break;
			case VK_RIGHT:
				g_nSelect = 1;
				break;
			case VK_SPACE:
				g_nState = 1;
				break;
			}
		}else if(g_nState == 1)//선택해서 움직일경우
		{
			if(g_nSelect == 0)//고양이를 선택했을 경우
			{
				switch(wParam)
				{
				case VK_LEFT:
					Rect_Cat.left	-= 10;
					Rect_Cat.right	-= 10;
					break;
				case VK_UP:					
					Rect_Cat.top	-= 10;					
					Rect_Cat.bottom	-= 10;					
					break;
				case VK_RIGHT:
					Rect_Cat.left	+= 10;					
					Rect_Cat.right	+= 10;					
					break;
				case VK_DOWN:					
					Rect_Cat.top	+= 10;					
					Rect_Cat.bottom	+= 10;					
					break;				
				}
				if(PtInRect(&Rect_Cat, Point_Dest[g_nDest]))//캐릭터를 이동해서 지정한 위치로 간다면 위치 변경
				{
					g_nDest++;//다음위치로
					if(g_nDest > 4)//5군대를 지나왔다면 종료
						PostQuitMessage(0);
				}
			}else if(g_nSelect == 1)//개를 선택했을 경우
			{
				switch(wParam)
				{
				case VK_LEFT:
					Rect_Dog.left	-= 10;	
					Rect_Dog.right	-= 10;	
					break;
				case VK_UP:					
					Rect_Dog.top	-= 10;					
					Rect_Dog.bottom	-= 10;					
					break;
				case VK_RIGHT:
					Rect_Dog.left	+= 10;					
					Rect_Dog.right	+= 10;					
					break;
				case VK_DOWN:					
					Rect_Dog.top	+= 10;					
					Rect_Dog.bottom	+= 10;					
					break;				
				}
				if(PtInRect(&Rect_Dog, Point_Dest[g_nDest]))
				{
					g_nDest++;
					if(g_nDest > 4)
						PostQuitMessage(0);
				}
			}			
		}
		InvalidateRect(hwnd,NULL,TRUE);//화면 그리기
		break;
	case WM_DESTROY:
		PostQuitMessage(0);
		break;

	}
	return DefWindowProc(hwnd, iMsg, wParam, lParam);
}
