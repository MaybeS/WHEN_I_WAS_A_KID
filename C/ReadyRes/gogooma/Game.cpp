#include "Game.h"

Game* Game::m_pGame = NULL;

const int Game::ScreenWidth = 640;
const int Game::ScreenHeight = 480;
const int Game::FPS = 60;
const int Game::MSPF = 15;

Game& Game::GetGame()
{
	ASSERT(m_pGame);
	return *m_pGame;
}



Game::Game()
: m_Drawer(ScreenWidth, ScreenHeight)
{
	m_bStarted = false;
}

Game::~Game()
{
	End();
}


int Game::Start()
{
	if(m_bStarted) return 1;
	if(m_pGame != NULL) return 2;
	m_pGame = this;

	m_bStarted = true;
	m_iState = -1;
	m_iPrevState = -1;
	m_iNextState = -1;

	srand(GetTickCount());

	int i = 0;
	m_pFrames[i++] = new FSplash;
	m_pFrames[i++] = new FTitle;
	m_pFrames[i++] = new FGame;
	ASSERT(i == STATE_MAX);

	ChangeState(0);
	return 0;
}

void Game::End()
{
	if(!m_bStarted) return;

	int i;
	for(i = 0; i < STATE_MAX; i++)
	{
		delete m_pFrames[i];
	}

	m_bStarted = false;
}


void Game::Process()
{
	m_Input.Process();

	if(m_iState >= 0 && m_iState < STATE_MAX)
	{
		m_pFrames[m_iState]->Process();
	}
	m_iFrame++;
	if(m_iNextState > 0)
	{
		ChangeState(m_iNextState);
		m_iNextState = -1;
	}
}

void Game::Draw(HDC hdc)
{
	m_Drawer.BeginDraw();
	if(m_iState >= 0 && m_iState < STATE_MAX)
	{
		m_pFrames[m_iState]->Draw();
	}
	m_Drawer.EndDraw(hdc);
}

int Game::ChangeState(int newstate)
{
	if(m_iState >= 0 && m_iState < STATE_MAX)
	{
		m_pFrames[m_iState]->End();
	}
	m_iPrevState = m_iState;
	m_iState = newstate;
	m_iFrame = 0;
	if(m_iState >= 0 && m_iState < STATE_MAX)
	{
		m_pFrames[m_iState]->Start();
	}
	return m_iPrevState;
}

void Game::StartState(int newstate)
{
	m_iNextState = newstate;
}





void Game::SetWindowSize(HWND hWnd)
{
	RECT rt = {0, 0, ScreenWidth, ScreenHeight};
	AdjustWindowRectEx(&rt, GetWindowLong(hWnd, GWL_STYLE), GetMenu(hWnd)? TRUE: FALSE, GetWindowLong(hWnd, GWL_EXSTYLE));
	SetWindowPos(hWnd, NULL, 0, 0, 
		rt.right - rt.left, rt.bottom - rt.top, SWP_NOZORDER | SWP_NOMOVE);
}
