#include "Game.h"
#include "Character.h"

Bitmap* Character::pChar = NULL;
int Character::iCharCount = 0;

Character::Character()
{
	m_w = 32;
	m_h = 64;

	if(iCharCount == 0)
	{
		pChar = new Bitmap(Bitmap::iChar);
	}
	iCharCount++;
}

Character::~Character()
{
	iCharCount--;
	if(iCharCount == 0)
	{
		delete pChar;
		pChar = NULL;
	}
}

void Character::Make(float x)
{
	m_use = true;
	m_x = x;
	m_y = (float)(Game::ScreenHeight - m_h);
	m_vx = 0.0f;
}

void Character::Process()
{
	if(!m_use) return;
	m_x += m_vx;
	m_vx *= 0.95f;

	if(m_x < 0)
	{
		m_x = 0;
		m_vx = 0.0f;
	}
	else if(m_x > Game::ScreenWidth - m_w)
	{
		m_x = (float)(Game::ScreenWidth - m_w);
		m_vx = 0.0f;
	}
}

void Character::Draw()
{
	if(!m_use) return;
	ASSERT(pChar);
	Game& game = Game::GetGame();

	game.m_Drawer.DrawMBitmap(*pChar, (int)m_x, (int)m_y, m_w, m_h, 0);
}

void Character::Move(int dir)
{
	if(!m_use) return;
	switch(dir)
	{
	case 0:
		{
			m_vx -= 0.5f;
		}
		break;
	case 2:
		{
			m_vx += 0.5f;
		}
		break;
	}
}

