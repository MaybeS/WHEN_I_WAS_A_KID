#pragma once
class Character;

#include "Game.h"

class Character
{
public:
	Character();
	~Character();

	void Make(float x);

	void Process();
	void Draw();

	void Move(int dir);

public:
	bool m_use;
	float m_x;
	float m_y;
	int m_w;
	int m_h;

	float m_vx;

protected:
	static Bitmap* pChar;
	static int iCharCount;
};


