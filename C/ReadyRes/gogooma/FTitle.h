#pragma once

#include "Frame.h"
#include "Gogooma.h"

class FTitle : public FFrame
{
public:
	FTitle();
	virtual ~FTitle();

	virtual int Start();
	virtual void End();

	virtual void Process();
	virtual void Draw();


	int MakeGogooma();

public:
	Gogooma gogoomas[GOGOOMA_COUNT];
	Bitmap* pTitle;
	Bitmap* pTitleText;
};
