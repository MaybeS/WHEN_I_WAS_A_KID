#pragma once

#include "Frame.h"

class FSplash : public FFrame
{
public:
	FSplash();
	virtual ~FSplash();

	virtual int Start();
	virtual void End();

	virtual void Process();
	virtual void Draw();

public:
	Bitmap* pGRAK;
};
