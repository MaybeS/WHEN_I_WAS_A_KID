
// RunProgram.h : PROJECT_NAME ���� ���α׷��� ���� �� ��� �����Դϴ�.
//

#pragma once

#ifndef __AFXWIN_H__
	#error "PCH�� ���� �� ������ �����ϱ� ���� 'stdafx.h'�� �����մϴ�."
#endif

#include "resource.h"		// �� ��ȣ�Դϴ�.


// CRunProgramApp:
// �� Ŭ������ ������ ���ؼ��� RunProgram.cpp�� �����Ͻʽÿ�.
//

class CRunProgramApp : public CWinAppEx
{
public:
	CRunProgramApp();

// �������Դϴ�.
	public:
	virtual BOOL InitInstance();

// �����Դϴ�.

	DECLARE_MESSAGE_MAP()
};

extern CRunProgramApp theApp;