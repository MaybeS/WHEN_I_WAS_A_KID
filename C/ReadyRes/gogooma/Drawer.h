#pragma once

#include <windows.h>
#include <assert.h>

#ifndef ASSERT
#define ASSERT assert
#endif


class Drawer;

#include "Bitmap.h"

class Drawer
{
public:
	Drawer(int width, int height);
	~Drawer();

	void Clear(COLORREF color = RGB(0, 0, 0));

	void SetPenColor(int bold, COLORREF color);
	void SetBrushColor(COLORREF color);

	void BeginDraw();
	void EndDraw(HDC hdc);
	
	void DrawBitmap(Bitmap& bit, int x, int y, int w, int h);
	void DrawBitmap(Bitmap& bit, int x, int y, int w, int h, int sx, int sy, DWORD rop = SRCCOPY);

	void DrawMBitmap(Bitmap& bit, int x, int y, int w, int h, int sx = 0);



protected:
	HDC m_hDC;
	HBITMAP m_hBit;
	HGDIOBJ m_old;
	int m_iWidth, m_iHeight;

	HBRUSH m_hBrush;

	HPEN m_hPen;
};
