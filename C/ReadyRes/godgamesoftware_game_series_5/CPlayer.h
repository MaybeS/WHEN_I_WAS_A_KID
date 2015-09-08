#ifndef _CPLAYER_H_
#define _CPLAYER_H_

#include <windows.h>
#include <vector>
#include <iostream>
#include "CEnemy_Player.h"
using namespace std;
#define MAX_SPEED 5


class CPlayer {
	HBITMAP hPlayerBit;
	int X, Y;
	const int Size;
	int AlphaSpeed;
	int PreKey;
	vector<CPlayerBody*> Body;
	CBullet *Bullet;

	void DrawPlayerBody(HDC);
	void DrawPlayer(HDC);

	void PushBody(int PosX, int PosY);
	void PopBody();

	/////////////////////////////////////////
	void Attack();
public:
	CPlayer(HINSTANCE);
	~CPlayer();

	void KeyUpdate(SHORT);
	void Update(CEnemy*, CHp*);
	void Render(HDC);

	BOOL CheckHit(int,int,int);
	BOOL IsBullet();
};

#endif