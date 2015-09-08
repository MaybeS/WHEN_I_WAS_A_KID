#include "Game.h"
#include "FTitle.h"

FTitle::FTitle()
{
}

FTitle::~FTitle()
{
}


int FTitle::Start()
{
	int i;
	for(i = 0; i < GOGOOMA_COUNT; i++)
	{
		gogoomas[i].m_use = false;
	}

	pTitle = new Bitmap(Bitmap::iTitle);
	pTitleText = new Bitmap(Bitmap::iTitleText);
	return 0;
}

void FTitle::End()
{
	delete pTitle;
	delete pTitleText;
}


void FTitle::Process()
{
	if(game.m_Input.GetKeyState(VK_SPACE))
	{
		game.StartState(Game::STATE_GAME);
	}

	int i;
	for(i = 0; i < GOGOOMA_COUNT; i++)
	{
		gogoomas[i].Process();
	}

	if(game.GetFrameTime() % (Game::FPS / 6) == 0)
	{
		MakeGogooma();
	}
}

void FTitle::Draw()
{
	game.m_Drawer.DrawBitmap(*pTitle, 0, 0, Game::ScreenWidth, Game::ScreenHeight);
	
	int i;
	for(i = 0; i < GOGOOMA_COUNT; i++)
	{
		gogoomas[i].Draw();
	}

	if(game.GetFrameTime() / 20 % 2 == 0)
	{
		game.m_Drawer.DrawBitmap(*pTitleText, Game::ScreenWidth / 2 - 320 / 2, Game::ScreenHeight - 180, 320, 60, 0, 0, SRCAND);
	}
}

int FTitle::MakeGogooma()
{
	int i;
	for(i = 0; i < GOGOOMA_COUNT; i++)
	{
		if(gogoomas[i].m_use) continue;
		gogoomas[i].MakeTopRandom();
		return i;
	}
	return -1;
}

