#include "Object_Background.h"

void Object_Background::InitWithBackground(HBITMAP _res, HDC _back, HDC _mem)
{
	Object::Init(_res, _back, _mem);
}
void Object_Background::Draw()
{
	HBITMAP b = (HBITMAP)SelectObject(m_hMemDC, m_hResource);
	
	BitBlt(m_hBackDC, 0, 0, 1400, 600, m_hMemDC, 0, 0, SRCCOPY);
	SelectObject(m_hMemDC, b);
}
void Object_Background::Tick() {}