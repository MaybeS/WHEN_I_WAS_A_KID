#include "CEnemy.h"

CEnemy::CEnemy() {
	X = 300;
	Y = 40;
	MoveMode = LEFT;
	Delay = 0;
	AlphaSpeed = 0, PreKey = 0;

	EnemyBrush1 = CreateSolidBrush(RGB(0,0,255));
	EnemyBrush2 = CreateSolidBrush(RGB(0,0,128));
	EnemyPen = (HPEN)GetStockObject(NULL_PEN);

	Bullet = new CBullet(TRUE);
}

CEnemy::~CEnemy() {
	DeleteObject(EnemyBrush1);
	DeleteObject(EnemyBrush2);
	DeleteObject(EnemyPen);
	delete Bullet;
}

BOOL CEnemy::CheckHit(int _X, int _Y, int _Size) {
	return (Bullet->CheckHit(_X,_Y,_Size));
}

void CEnemy::Update(CPlayer *User, CHp *Hp) {
	srand(GetTickCount());
	if((User->CheckHit(X,Y,ENEMY_SIZE))) {
		Hp->MovHp(-3);
	}
	if((User->IsBullet())) {
		if(!Delay)	MoveMode = rand()%2+1;
		if(MoveMode == LEFT) {
			if(PreKey!=LEFT) AlphaSpeed = 0; //Check Last Key
			if(X-AlphaSpeed+1>0)
			X-=(AlphaSpeed+1);
			if(AlphaSpeed<MAX_ENEMY_SPEED) AlphaSpeed++;
			PreKey = LEFT;
		} else if(MoveMode == RIGHT) {
			if(PreKey!=RIGHT) AlphaSpeed = 0; //Check Last Key
			if(X+AlphaSpeed+1<580)
			X+=(AlphaSpeed+1);
			if(AlphaSpeed<MAX_SPEED) AlphaSpeed++;
			PreKey = RIGHT;
		}
		Delay++;
		if(Delay==6) Delay=0;
	}
	Bullet->PushBody(X+ENEMY_SIZE/2,Y);
	Bullet->Update();
}

void CEnemy::Render(HDC hdc) {
	HBRUSH OldBrush = (HBRUSH)SelectObject(hdc,EnemyBrush1);
	HPEN OldPen = (HPEN)SelectObject(hdc,EnemyPen);
	Ellipse(hdc,X,Y,X+ENEMY_SIZE,Y+ENEMY_SIZE);
	SelectObject(hdc,EnemyBrush2);
	Ellipse(hdc,(int)(X+ENEMY_SIZE*1.0/5),(int)(Y+ENEMY_SIZE*1.0/5),(int)(X+ENEMY_SIZE*4.0/5),(int)(Y+ENEMY_SIZE*4.0/5));
	SelectObject(hdc,OldBrush);
	SelectObject(hdc,OldPen);

	Bullet->Render(hdc);
}