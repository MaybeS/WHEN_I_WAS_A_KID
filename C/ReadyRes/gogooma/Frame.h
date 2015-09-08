#pragma once
class FFrame;

#include "Game.h"

class FFrame
{
public:
	FFrame();
	virtual ~FFrame();

	virtual int Start()=0;
	virtual void End()=0;

	virtual void Process();
	virtual void Draw();

protected:
	Game& game;
};
