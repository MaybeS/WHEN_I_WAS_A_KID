#pragma once
//
// �׷� A.K. �� ����
// ���� ���ϱ�
// ���۱��� �׷� A.K. ���� �ֽ��ϴ�.
// keytouch32 @ naver.com
// http://blog.naver.com/keytouch32
// 
// ������ ������, ��ó�� �����ž��ϰ�
// �н� �̿��� �ҽ������ �����մϴ�.
// Copyright GRAK all rights reserved.
// (�̰� �������� ����� ����)
// ���¼ҽ� ��������� ���۱��� �ִ°� �ƽ���??
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
