#pragma once
//
// 그렌 A.K. 가 만든
// 고구마 피하기
// 저작권은 그렌 A.K. 에게 있습니다.
// keytouch32 @ naver.com
// http://blog.naver.com/keytouch32
// 
// 배포는 자유나, 출처를 밝히셔야하고
// 학습 이외의 소스사용은 금지합니다.
// Copyright GRAK all rights reserved.
// (이거 오랫만에 적어본다 ㅋㅋ)
// 오픈소스 프리웨어라도 저작권은 있는거 아시죠??
//

class Game;

#include <windows.h>
#include <stdio.h>
#include <assert.h>

#ifndef ASSERT
#define ASSERT assert
#endif



#include "Drawer.h"
#include "GInput.h"



#include "FSplash.h"
#include "FTitle.h"
#include "FGame.h"


class Game
{
public:
	Game();
	~Game();

	int Start();
	void End();

	void Process();
	void Draw(HDC hdc);

	enum GameStates
	{
		STATE_SPLASH=0,
		STATE_TITLE,
		STATE_GAME,
		STATE_MAX
	};

	void StartState(int newstate);


public:
	void SetWindowSize(HWND hWnd);

public:
	static Game* m_pGame;
	static Game& GetGame();
	static const int ScreenWidth;
	static const int ScreenHeight;
	static const int FPS;
	static const int MSPF;

	int GetFrameTime()
	{
		return m_iFrame;
	}

	Drawer m_Drawer;
	GInput m_Input;

protected:

	bool m_bStarted;
	int ChangeState(int newstate);
	int m_iState;
	int m_iPrevState;
	int m_iFrame;

	int m_iNextState;

	FFrame* m_pFrames[STATE_MAX];
};
