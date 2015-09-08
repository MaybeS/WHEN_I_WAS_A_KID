#include "GInput.h"

GInput::GInput()
{
	ZeroMemory(keys, sizeof(keys));
	ZeroMemory(data, sizeof(data));
}

GInput::~GInput()
{
}

void GInput::Process()
{
	int i;
	for(i=0; i<256; i++)
	{
		if(data[i])
		{
			if(keys[i] == KEY_NONE || keys[i] == KEY_RELEASE) keys[i] = KEY_PRESS;
			else if(keys[i] == KEY_PRESS) keys[i] = KEY_HOLD;
		}
		else
		{
			if(keys[i] == KEY_PRESS || keys[i] == KEY_HOLD) keys[i] = KEY_RELEASE;
			else if(keys[i] == KEY_RELEASE) keys[i] = KEY_NONE;
		}
	}
}

void GInput::KeyDown(int key)
{
	data[key] = 1;
}

void GInput::KeyUp(int key)
{
	data[key] = 0;
}

void GInput::MouseMove(short x, short y)
{
	mousex = x;
	mousey = y;
}

int GInput::GetKeyState(int key)
{
	return keys[key];
}

