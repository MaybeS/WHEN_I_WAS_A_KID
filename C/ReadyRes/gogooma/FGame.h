#pragma once

#include "Frame.h"

#include "Gogooma.h"
#include "Character.h"

class FGame : public FFrame
{
public:
	FGame();
	virtual ~FGame();

	virtual int Start();
	virtual void End();

	virtual void Process();
	virtual void Draw();


	virtual void Collision();
	
	int MakeGogooma();

public:
	Gogooma gogoomas[GOGOOMA_COUNT];
	Character character;
	Bitmap* pGameText;
	Bitmap* pGameScore;
	int iScore;
};
