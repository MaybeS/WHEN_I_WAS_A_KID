#pragma once

#include <windows.h>
#include "Drawer.h"

class Particle
{
public:
	Particle();
	~Particle();

	void Start(float x, float y);
	void Process();
	void Draw(Drawer& drawer);

protected:
	bool m_use;
	float m_x, m_y;
	float m_vx, m_vy;
	int m_time;
	int m_life;
};
