// 매우매우 옛날에 만들어둔 클래스..
// 약간 변형. 그래서 매우 구식임 :(

#pragma once
#include <WINDOWS.H>

#define KEY_NONE 0
#define KEY_PRESS 1
#define KEY_HOLD 2
#define KEY_RELEASE 3

#define KEY_DOWNED(X) ((X) == KEY_PRESS || (X) == KEY_HOLD)

class GInput
{
public:
	GInput();
	~GInput();

	void Process();

	void KeyDown(int key);
	void KeyUp(int key);
	void MouseMove(short x, short y);

	int GetKeyState(int key);

	BYTE keys[256];
	short mousex, mousey;
protected:
	BYTE data[256];
};

#define GINPUT_HANDLER(X) \
	case WM_KEYDOWN: \
		(X).KeyDown(wParam); \
		return 0; \
	case WM_KEYUP: \
		(X).KeyUp(wParam); \
		return 0; \
	case WM_MOUSEMOVE: \
		(X).MouseMove((short)LOWORD(lParam), (short)HIWORD(lParam)); \
		return 0; \
	case WM_LBUTTONDOWN: \
		(X).MouseMove((short)LOWORD(lParam), (short)HIWORD(lParam)); \
		(X).KeyDown(VK_LBUTTON); \
		return 0; \
	case WM_LBUTTONUP: \
		(X).MouseMove((short)LOWORD(lParam), (short)HIWORD(lParam)); \
		(X).KeyUp(VK_LBUTTON); \
		return 0; \
	case WM_RBUTTONDOWN: \
		(X).MouseMove((short)LOWORD(lParam), (short)HIWORD(lParam)); \
		(X).KeyDown(VK_RBUTTON); \
		return 0; \
	case WM_RBUTTONUP: \
		(X).MouseMove((short)LOWORD(lParam), (short)HIWORD(lParam)); \
		(X).KeyUp(VK_RBUTTON); \
		return 0; \
	case WM_MBUTTONDOWN: \
		(X).MouseMove((short)LOWORD(lParam), (short)HIWORD(lParam)); \
		(X).KeyDown(VK_MBUTTON); \
		return 0; \
	case WM_MBUTTONUP: \
		(X).MouseMove((short)LOWORD(lParam), (short)HIWORD(lParam)); \
		(X).KeyUp(VK_MBUTTON); \
		return 0; \
	;

