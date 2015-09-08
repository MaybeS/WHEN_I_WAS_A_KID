#include "Drawer.h"

// ������. ���۸� ��������
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

// �� �׸���
void Drawer::Circle(int x, int y, int r)
{
	Ellipse(m_hDC, x - r, y - r, x + r, y + r);
}

// �����. Ư�� ������ ����ä��°͵� ����
void Drawer::Clear(COLORREF color)
{
	HBRUSH hbr = CreateSolidBrush(color);
	RECT rt = {0, 0, m_iWidth, m_iHeight};
	FillRect(m_hDC, &rt, hbr);
	DeleteObject(hbr);
}

// ���� ȭ�鿡 �׸��� ���
void Drawer::Draw(HDC hdc)
{
	BitBlt(hdc, 0, 0, m_iWidth, m_iHeight, m_hDC, 0, 0, SRCCOPY);
}
