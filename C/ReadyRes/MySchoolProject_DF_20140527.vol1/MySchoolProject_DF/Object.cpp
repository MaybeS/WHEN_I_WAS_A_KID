#include "Object.h"

void Object::Init(HBITMAP _res, HDC _back, HDC _mem)
{
	m_hBackDC = _back;
	m_hMemDC = _mem;
	m_hResource = _res;
	m_Position = makePoint(0, 0);
}