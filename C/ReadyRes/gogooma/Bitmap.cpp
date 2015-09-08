#include "Bitmap.h"
#include "resource.h"

const int Bitmap::BitmapIdCount = 7;
const int Bitmap::BitmapIds[] = 
{
	IDB_GOGOOMA, 
	IDB_GRAK, 
	IDB_TITLE, 
	IDB_TITLE_TEXT, 
	IDB_CHAR, 
	IDB_GAME_TEXT, 
	IDB_GAME_SCORE, 
};

const int Bitmap::iGogooma = 0;
const int Bitmap::iGRAK = 1;
const int Bitmap::iTitle = 2;
const int Bitmap::iTitleText = 3;
const int Bitmap::iChar = 4;
const int Bitmap::iGameText = 5;
const int Bitmap::iGameScore = 6;

Bitmap::Bitmap(int id)
{
	ASSERT(id >= 0);
	ASSERT(id < BitmapIdCount);

	m_hBit = (HBITMAP)LoadImage(GetModuleHandle(0), 
		MAKEINTRESOURCE(BitmapIds[id]), IMAGE_BITMAP, 0, 0, LR_DEFAULTSIZE | LR_SHARED);
	ASSERT(m_hBit);

	HDC hdc = GetDC(NULL);
	m_hDC = CreateCompatibleDC(hdc);
	ASSERT(m_hDC);

	SelectObject(m_hDC, m_hBit);
	ReleaseDC(NULL, hdc);
}

Bitmap::~Bitmap()
{
	DeleteDC(m_hDC);
}


