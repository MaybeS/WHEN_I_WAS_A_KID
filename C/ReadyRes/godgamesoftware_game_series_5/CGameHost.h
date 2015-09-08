#ifndef _CGAMEHOST_H_
#define _CGAMEHOST_H_

#include <windows.h>
#include "CPlayer.h"
#include "CHp.h"
#include "CEnemy.h"

class CGameHost {
	HBITMAP BgGround; //BgGround
	CPlayer *Player;
	CHp *PlayerHp, *EnemyHp;
	CEnemy *Enemy;
public:
	CGameHost(HINSTANCE);
	~CGameHost();

	void Render(HDC);
	void KeyUpdate(WPARAM);
	int Update();

	void DrawBgGround(HDC);
	void DrawHp(HDC);
};

#endif