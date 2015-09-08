#include "Particle.h"
#include <math.h>

#ifndef PI
#define PI 3.141592f
#endif

// ������. �ʱ� �ʿ��Ѱ͵� �غ�
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

// �Ҹ���. �����Ұ� ����. ������ ���߰ŵ�. (��?) 
Particle::~Particle()
{
}

// Ư�� ��ǥ���� ����.
void Particle::Start(float x, float y)
{
	// ����� �������
	m_use = true;
	// x, y ��ǥ
	m_x = x;
	m_y = y;
	// �ӷ�
	m_vx = 0.0f;
	m_vy = 0.0f;
	// ���� ���� �ð�
	m_time = 0;
	// ����. �̽ð��� �Ѿ�� �����
	m_life = 150 + rand() % 60;

	// �ʱ� �ӷ���... �׷��� ���� ��� ��.
	m_vy = -6.0f;
}

// ��⼭ �Ź� ó���Ұ͵��� ��
void Particle::Process()
{
	if(!m_use) return; // �����ϸ� �Ұ� ����

	// ������ �ð��� �ٵ� ;��;
	if(++m_time >= m_life)
	{
		m_use = false;
	}

	// �ӷ¸�ŭ �̵�
	m_x += m_vx;
	m_y += m_vy;

	// �����ð� �̻� ������ ����!! ����
	if(m_time == 40)
	{
		float angle = (float)(rand() % 3600) / 10.0f;
		float power = (float)(rand() % 700) / 100.0f;
		m_vx = power * (float)cos(angle * PI / 180.0f);
		m_vy = power * (float)-sin(angle * PI / 180.0f) - 6.0f;
	}
	
	// ���η� ������ �ӵ��� ����
	m_vx *= 0.96f;

	// ������ �������� ������ ����
	if(m_time > 40)
	{
		m_vy *= 0.94f;
		m_vy += 0.1f;
	}
}

// �׸�
void Particle::Draw(Drawer& drawer)
{
	if(!m_use) return;
	drawer.Circle((int)m_x, (int)m_y, 2);
}

