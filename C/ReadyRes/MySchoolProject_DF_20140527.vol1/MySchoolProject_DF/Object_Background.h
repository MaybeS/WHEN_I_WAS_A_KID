#pragma once
#include "Header.h"
#include "Object.h"

class Object_Background : public Object
{
public:
	void InitWithBackground(HBITMAP _res, HDC _back, HDC _mem);
	virtual void Draw();
	virtual void Tick();
};