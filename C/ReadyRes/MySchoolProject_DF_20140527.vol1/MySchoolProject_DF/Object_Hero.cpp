#include "Object_Hero.h"

void Object_Hero::InitWithBackground(HBITMAP _res, HDC _back, HDC _mem)
{
	Object::Init(_res, _back, _mem);
}
void Object_Hero::Draw()
{
	HBITMAP b = (HBITMAP)SelectObject(m_hMemDC, m_hResource);

	CGPoint pos = this->GetPosition();
	
	BitBlt(m_hBackDC, pos.x, pos.y, 54, 144, m_hMemDC, 0, 10, SRCCOPY);
	SelectObject(m_hMemDC, b);
}
void Object_Hero::Tick()
{
	CGPoint pos = this->GetPosition();
	if(GetAsyncKeyState(VK_LEFT))
		pos.x -= 1;
	else if(GetAsyncKeyState(VK_RIGHT))
		pos.x += 1;
	else if(GetAsyncKeyState(VK_UP))
		pos.y -= 1;
	else if(GetAsyncKeyState(VK_DOWN))
		pos.y += 1;
	this->SetPosition(pos);
}