#include<windows.h>
class CHDC2DIB
{
private:
	HDC MemDC;
	HBITMAP hBitmap;
	HBITMAP hOldBitmap;
	BITMAPINFO bInfo;
private:
	VOID CreateCompatibleObjects(HDC hDC, int Width, int Height)
	{
		MemDC=CreateCompatibleDC(hDC);
		hBitmap=CreateCompatibleBitmap(hDC, Width, Height);
		hOldBitmap=(HBITMAP)SelectObject(MemDC, hBitmap);
	}
	VOID DeleteCompatibleObjects()
	{
		SelectObject(MemDC, hOldBitmap);
		DeleteObject(hBitmap);
		DeleteDC(MemDC);
	}
public:
	CHDC2DIB()
	{
		bInfo.bmiHeader.biSize=sizeof(BITMAPINFOHEADER);
		bInfo.bmiHeader.biPlanes=1;
		bInfo.bmiHeader.biBitCount=32;
		bInfo.bmiHeader.biCompression=BI_RGB;
	}
	BOOL HDC2DIB(HDC hDC, RGBQUAD *Buffer, int X, int Y, int Width, int Height)
	{
		BOOL bReturn=FALSE;
		CreateCompatibleObjects(hDC, Width, Height);
		bInfo.bmiHeader.biWidth=Width;
		bInfo.bmiHeader.biHeight=Height;
		if(BitBlt(MemDC, 0, 0, Width, Height, hDC, X, Y, SRCCOPY))
		{
			if(GetDIBits(MemDC, hBitmap, 0, Height, Buffer, &bInfo, DIB_RGB_COLORS))
			{
				bReturn=TRUE;
			}
		}
		DeleteCompatibleObjects();
		return bReturn;
	}
	BOOL DIB2HDC(HDC hDC, RGBQUAD *Buffer, int X, int Y, int Width, int Height)
	{
		BOOL bReturn=FALSE;
		CreateCompatibleObjects(hDC, Width, Height);
		bInfo.bmiHeader.biWidth=Width;
		bInfo.bmiHeader.biHeight=Height;
		if(SetDIBits(MemDC, hBitmap, 0, Height, Buffer, &bInfo, DIB_RGB_COLORS))
		{
			if(BitBlt(hDC, X, Y, Width, Height, MemDC, 0, 0, SRCCOPY))
			{
				bReturn=TRUE;
			}
		}
		DeleteCompatibleObjects();
		return bReturn;
	}
};
int main(void)
{
	RGBQUAD Buffer[300*300];
	HDC MyDC=GetDC(FindWindow("ConsoleWindowClass", NULL)), DesktopDC=GetDC(0);
	SetConsoleTitle("CHDC2DIB Example");
	system("mode con:cols=36 lines=18");
	CONSOLE_CURSOR_INFO cci;
	cci.bVisible=FALSE;
	cci.dwSize=10;
	SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &cci);
	CHDC2DIB h2d;
	POINT Point;
	while(true)
	{
		GetCursorPos(&Point);
		h2d.HDC2DIB(DesktopDC, Buffer, Point.x-150, Point.y-150, 300, 300);
		for(int i=0;i<300;i++)
		{
			for(int j=0;j<300;j++)
			{
				int t=(300-j-1)*300+i;
				Buffer[t].rgbRed=255-Buffer[t].rgbRed;
				Buffer[t].rgbGreen=255-Buffer[t].rgbGreen;
				Buffer[t].rgbBlue=255-Buffer[t].rgbBlue;
			}
		}
		h2d.DIB2HDC(MyDC, Buffer, 0, 0, 300, 300);
		Sleep(10);
	}
	return 0;
}