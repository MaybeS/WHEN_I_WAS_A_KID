#pragma once
#include "Header.h"

class Object
{
protected:
	HDC m_hBackDC, m_hMemDC;
	HBITMAP m_hResource;
	CGPoint m_Position;

public:
	virtual void Init(HBITMAP _res, HDC _back, HDC _mem);
	virtual void Draw() = 0;
	virtual void Tick() = 0;

	virtual void SetPosition(CGPoint _pos) { m_Position = _pos; }
	virtual CGPoint GetPosition() { return m_Position; }

};