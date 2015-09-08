#pragma once

#include <windows.h>
#include <assert.h>

#ifndef ASSERT
#define ASSERT assert
#endif


class Bitmap;

#include "Drawer.h"

class Bitmap
{
public:
	Bitmap(int id);
	~Bitmap();

public:
	static const int iGogooma;
	static const int iGRAK;
	static const int iTitle;
	static const int iTitleText;
	static const int iChar;
	static const int iGameText;
	static const int iGameScore;

protected:
	friend class Drawer;
	HBITMAP m_hBit;
	HDC m_hDC;

	static const int BitmapIdCount;
	static const int BitmapIds[];
};
