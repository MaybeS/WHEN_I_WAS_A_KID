#include "Drawer.h"

// 생성자. 버퍼를 만들어놓음
Drawer::Drawer(int width, int height)
{
	HDC hdc = GetDC(NULL);
	m_hDC = CreateCompatibleDC(hdc);

	m_iWidth = width;
	m_iHeight = height;

	m_hBit = CreateCompatibleBitmap(hdc, m_iWidth, m_iHeight);
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

// 원 그리기
void Drawer::Circle(int x, int y, int r)
{
	Ellipse(m_hDC, x - r, y - r, x + r, y + r);
}

// 지우기. 특정 색으로 가득채우는것도 가능
void Drawer::Clear(COLORREF color)
{
	HBRUSH hbr = CreateSolidBrush(color);
	RECT rt = {0, 0, m_iWidth, m_iHeight};
	FillRect(m_hDC, &rt, hbr);
	DeleteObject(hbr);
}

// 실제 화면에 그릴때 사용
void Drawer::Draw(HDC hdc)
{
	BitBlt(hdc, 0, 0, m_iWidth, m_iHeight, m_hDC, 0, 0, SRCCOPY);
}
