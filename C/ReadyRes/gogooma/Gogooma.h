#pragma once
class Gogooma;

#include "Game.h"

#define GOGOOMA_COUNT 400

class Gogooma
{
public:
	Gogooma();
	~Gogooma();

	void Make(float x, float y);
	void MakeTopRandom();

	void Process();
	void Draw();

public:
	bool m_use;
	float m_x;
	float m_y;
	int m_w;
	int m_h;
	int m_frame;

	float m_vy;

protected:
	static Bitmap* pGogooma;
	static int iGogoomaCount;
};


