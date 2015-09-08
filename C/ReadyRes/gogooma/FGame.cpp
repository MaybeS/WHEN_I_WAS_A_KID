#include "Game.h"
#include "FGame.h"

FGame::FGame()
{
}

FGame::~FGame()
{
}


int FGame::Start()
{
	int i;
	for(i = 0; i < GOGOOMA_COUNT; i++)
	{
		gogoomas[i].m_use = false;
	}
	character.Make((float)(Game::ScreenWidth / 2 - character.m_w / 2));

	pGameText = new Bitmap(Bitmap::iGameText);
	pGameScore = new Bitmap(Bitmap::iGameScore);

	iScore = 0;

	return 0;
}

void FGame::End()
{
	delete pGameText;
	delete pGameScore;
}


void FGame::Process()
{
	// 虐焊靛 涝仿 贸府
	if(game.m_Input.GetKeyState(VK_LEFT))
	{
		character.Move(0);
	}
	if(game.m_Input.GetKeyState(VK_RIGHT))
	{
		character.Move(2);
	}
	if(!character.m_use && game.m_Input.GetKeyState(VK_SPACE) == KEY_PRESS)
	{
		game.StartState(Game::STATE_GAME);
	}

	// 绊备付 积己 贸府
	static int iRapid = 0;
	if(game.GetFrameTime() < Game.FPS * 20)
	{
		iRapid = 6;
	}
	else if(game.GetFrameTime() < Game.FPS * 40)
	{
		iRapid = 10;
	}
	else if(game.GetFrameTime() < Game.FPS * 60)
	{
		iRapid = 14;
	}
	else if(game.GetFrameTime() < Game.FPS * 80)
	{
		iRapid = 20;
	}
	else if(game.GetFrameTime() < Game.FPS * 100)
	{
		iRapid = 30;
	}

	if(game.GetFrameTime() % (Game::FPS / iRapid) == 0)
	{
		MakeGogooma();
	}

	Collision();

	character.Process();

	int i;
	for(i = 0; i < GOGOOMA_COUNT; i++)
	{
		gogoomas[i].Process();
		if(gogoomas[i].m_frame == 1 && character.m_use)
		{
			iScore++;
		}
	}
}

void FGame::Draw()
{
	game.m_Drawer.Clear(RGB(255, 255, 255));
	
	character.Draw();

	int i;
	for(i = 0; i < GOGOOMA_COUNT; i++)
	{
		gogoomas[i].Draw();
	}


	char s[256];

	if(character.m_use)
	{
		sprintf(s, "%d", iScore);

		for(i = 0; i < (int)strlen(s); i++)
		{
			if(s[i] >= '0' && s[i] <= '9')
			{
				game.m_Drawer.DrawBitmap(*pGameScore, 10 + i * 15, 10, 15, 30, (s[i] - '0') * 15, 0, SRCAND);
			}
		}
	}
	else
	{
		game.m_Drawer.DrawBitmap(*pGameText, Game::ScreenWidth / 2 - 320 / 2, 120, 320, 80, 0, 0, SRCAND);
		sprintf(s, "%9d", iScore);

		for(i = 0; i < (int)strlen(s); i++)
		{
			if(s[i] >= '0' && s[i] <= '9')
			{
				game.m_Drawer.DrawBitmap(*pGameScore, Game::ScreenWidth / 2 - 320 / 2 + 40 + i * 15, 120 + 26, 
					15, 30, (s[i] - '0') * 15, 0, SRCAND);
			}
		}
	}

}

int FGame::MakeGogooma()
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

void FGame::Collision()
{
	int i;
	for(i = 0; i < GOGOOMA_COUNT; i++)
	{
		if(!gogoomas[i].m_use) continue;
		if(gogoomas[i].m_frame > 0) continue;
		if(gogoomas[i].m_x < character.m_x + character.m_w - 8 && 
			gogoomas[i].m_y < character.m_y + character.m_h &&
			gogoomas[i].m_x + gogoomas[i].m_w >= character.m_x + 8 &&
			gogoomas[i].m_y + gogoomas[i].m_h >= character.m_y + 8)
		{
			character.m_use = false;
		}
	}
}


