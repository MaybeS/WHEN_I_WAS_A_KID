#include "Game.h"
#include "FSplash.h"

FSplash::FSplash()
{
}

FSplash::~FSplash()
{
}


int FSplash::Start()
{
	pGRAK = new Bitmap(Bitmap::iGRAK);
	return 0;
}

void FSplash::End()
{
	delete pGRAK;
}


void FSplash::Process()
{
	if(game.GetFrameTime() >= Game::FPS * 2.5)
	{
		game.StartState(Game::STATE_TITLE);
	}
}

void FSplash::Draw()
{
	game.m_Drawer.DrawBitmap(*pGRAK, 0, 0, Game::ScreenWidth, Game::ScreenHeight);
}

