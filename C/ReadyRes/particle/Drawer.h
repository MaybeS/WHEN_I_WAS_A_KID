#pragma once

#include <windows.h>

class Drawer
{
public:
	Drawer(int width, int height);
	~Drawer();

	void Clear(COLORREF color = RGB(0, 0, 0));
	void SetPenColor(int bold, COLORREF color);
	void SetBrushColor(COLORREF color);
	void Circle(int x, int y, int r);
	void Draw(HDC hdc);

protected:
	HDC m_hDC;
	HBITMAP m_hBit;
	HGDIOBJ m_old;
	int m_iWidth, m_iHeight;

	HBRUSH m_hBrush;

	HPEN m_hPen;
};
