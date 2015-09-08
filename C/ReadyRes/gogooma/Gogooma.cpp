#include "Game.h"
#include "Gogooma.h"

Bitmap* Gogooma::pGogooma = NULL;
int Gogooma::iGogoomaCount = 0;

Gogooma::Gogooma()
{
	m_use = false;
	m_w = 32;
	m_h = 64;

	if(iGogoomaCount == 0)
	{
		pGogooma = new Bitmap(Bitmap::iGogooma);
	}
	iGogoomaCount++;
}

Gogooma::~Gogooma()
{
	iGogoomaCount--;
	if(iGogoomaCount == 0)
	{
		delete pGogooma;
		pGogooma = NULL;
	}
}

void Gogooma::Make(float x, float y)
{
	m_use = true;
	m_x = x;
	m_y = y;
	m_frame = 0;
	m_vy = 1.0f;
}

void Gogooma::MakeTopRandom()
{
	Make((float)(rand() % Game::ScreenWidth - m_w / 2), (float)-m_h);
}

void Gogooma::Process()
{
	if(!m_use) return;

	m_y += m_vy;
	m_vy += 0.2f;
	if(m_y > Game::ScreenHeight - m_h)
	{
		m_y = (float)(Game::ScreenHeight - m_h);
		if(++m_frame > 16)
		{
			m_use = false;
		}
	}
}

void Gogooma::Draw()
{
	if(!m_use) return;
	ASSERT(pGogooma);

	Game& game = Game::GetGame();

	game.m_Drawer.DrawMBitmap(*pGogooma, (int)m_x, (int)m_y, m_w, m_h, m_frame * m_w);
}



