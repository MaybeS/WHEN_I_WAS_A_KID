#include "Drawer.h"

// 생성자. 버퍼를 만들어놓음
Drawer::Drawer(int width, int height)
{
	HDC hdc = GetDC(NULL);
	m_hDC = CreateCompatibleDC(hdc);
	ASSERT(m_hDC);

	m_iWidth = width;
	m_iHeight = height;

	ASSERT(m_iWidth > 0);
	ASSERT(m_iHeight > 0);

	m_hBit = CreateCompatibleBitmap(hdc, m_iWidth, m_iHeight);
	ASSERT(m_hBit);
	m_old = SelectObject(m_hDC, m_hBit);

	ReleaseDC(NULL, hdc);

	m_hPen = NULL;
	m_hBrush = NULL;

}

// 소멸자. 정리를 함.
Drawer::~Drawer()
{
	SelectObject(m_hDC, m_old);

	SelectObject(m_hDC, GetStockObject(WHITE_BRUSH));
	DeleteObject(m_hBrush);
	SelectObject(m_hDC, GetStockObject(BLACK_PEN));
	DeleteObject(m_hPen);

	DeleteObject(m_hBit);
	DeleteDC(m_hDC);
}

// 펜 색상 지정
void Drawer::SetPenColor(int bold, COLORREF color)
{
	HPEN oldpen = m_hPen;
	m_hPen = CreatePen(PS_SOLID, bold, color);
	SelectObject(m_hDC, m_hPen);
	DeleteObject(oldpen);
}

// 브러시 색상 지정
void Drawer::SetBrushColor(COLORREF color)
{
	HBRUSH oldbrush = m_hBrush;
	m_hBrush = CreateSolidBrush(color);
	SelectObject(m_hDC, m_hBrush);
	DeleteObject(oldbrush);
}

// 지우기. 특정 색으로 가득채우는것도 가능
void Drawer::Clear(COLORREF color)
{
	HBRUSH hbr = CreateSolidBrush(color);
	RECT rt = {0, 0, m_iWidth, m_iHeight};
	FillRect(m_hDC, &rt, hbr);
	DeleteObject(hbr);
}

void Drawer::BeginDraw()
{
	Clear();
}

void Drawer::EndDraw(HDC hdc)
{
	BitBlt(hdc, 0, 0, m_iWidth, m_iHeight, m_hDC, 0, 0, SRCCOPY);
}

void Drawer::DrawBitmap(Bitmap& bit, int x, int y, int w, int h)
{
	DrawBitmap(bit, x, y, w, h, 0, 0);
}

void Drawer::DrawBitmap(Bitmap& bit, int x, int y, int w, int h, int sx, int sy, DWORD rop)
{
	BitBlt(m_hDC, x, y, w, h, bit.m_hDC, sx, sy, rop);
}

void Drawer::DrawMBitmap(Bitmap& bit, int x, int y, int w, int h, int sx)
{
	BitBlt(m_hDC, x, y, w, h, bit.m_hDC, sx, h, SRCAND);
	BitBlt(m_hDC, x, y, w, h, bit.m_hDC, sx, 0, SRCPAINT);
}


