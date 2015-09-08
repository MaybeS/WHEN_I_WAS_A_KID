#include "Drawer.h"

// ������. ���۸� ��������
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

// �Ҹ���. ������ ��.
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

// �� ���� ����
void Drawer::SetPenColor(int bold, COLORREF color)
{
	HPEN oldpen = m_hPen;
	m_hPen = CreatePen(PS_SOLID, bold, color);
	SelectObject(m_hDC, m_hPen);
	DeleteObject(oldpen);
}

// �귯�� ���� ����
void Drawer::SetBrushColor(COLORREF color)
{
	HBRUSH oldbrush = m_hBrush;
	m_hBrush = CreateSolidBrush(color);
	SelectObject(m_hDC, m_hBrush);
	DeleteObject(oldbrush);
}

// �����. Ư�� ������ ����ä��°͵� ����
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


