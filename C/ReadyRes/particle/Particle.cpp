#include "Particle.h"
#include <math.h>

#ifndef PI
#define PI 3.141592f
#endif

// 생성자. 초기 필요한것들 준비
Particle::Particle()
{
	m_use = false;
	m_x = 0.0f;
	m_y = 0.0f;
	m_vx = 0.0f;
	m_vy = 0.0f;
	m_time = 0;
	m_life = 0;
}

// 소멸자. 정리할거 없음. 엄마가 다했거든. (응?) 
Particle::~Particle()
{
}

// 특정 좌표에서 시작.
void Particle::Start(float x, float y)
{
	// 요놈이 사용유무
	m_use = true;
	// x, y 좌표
	m_x = x;
	m_y = y;
	// 속력
	m_vx = 0.0f;
	m_vy = 0.0f;
	// 현재 생명 시간
	m_time = 0;
	// 생명. 이시간을 넘어가면 사라짐
	m_life = 150 + rand() % 60;

	// 초기 속력을... 그래서 위로 쏘도록 함.
	m_vy = -6.0f;
}

// 요기서 매번 처리할것들을 함
void Particle::Process()
{
	if(!m_use) return; // 사용안하면 할게 없음

	// 생명의 시간이 다됨 ;ㅅ;
	if(++m_time >= m_life)
	{
		m_use = false;
	}

	// 속력만큼 이동
	m_x += m_vx;
	m_y += m_vy;

	// 일정시간 이상 지나면 폭죽!! 터짐
	if(m_time == 40)
	{
		float angle = (float)(rand() % 3600) / 10.0f;
		float power = (float)(rand() % 700) / 100.0f;
		m_vx = power * (float)cos(angle * PI / 180.0f);
		m_vy = power * (float)-sin(angle * PI / 180.0f) - 6.0f;
	}
	
	// 가로로 퍼지는 속도를 줄임
	m_vx *= 0.96f;

	// 터지고 나서부터 밑으로 떨짐
	if(m_time > 40)
	{
		m_vy *= 0.94f;
		m_vy += 0.1f;
	}
}

// 그림
void Particle::Draw(Drawer& drawer)
{
	if(!m_use) return;
	drawer.Circle((int)m_x, (int)m_y, 2);
}

