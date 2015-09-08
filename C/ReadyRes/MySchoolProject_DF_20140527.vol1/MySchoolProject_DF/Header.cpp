#include "Header.h"

CGPoint makePoint(float _x, float _y)
{
	CGPoint p;
	p.x = _x;
	p.y = _y;
	return p;
}

#define CCP(___X, ___Y)	makePoint(___X, ___Y)