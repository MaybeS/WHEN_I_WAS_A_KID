// CXImageTest.h : CXImageTest ���� ���α׷��� ���� �� ��� ����
//
#pragma once

#ifndef __AFXWIN_H__
	#error PCH���� �� ������ �����ϱ� ���� 'stdafx.h'�� �����Ͻʽÿ�.
#endif

#include "resource.h"       // �� ��ȣ


// CCXImageTestApp:
// �� Ŭ������ ������ ���ؼ��� CXImageTest.cpp�� �����Ͻʽÿ�.
//

class CCXImageTestApp : public CWinApp
{
public:
	CCXImageTestApp();


// ������
public:
	virtual BOOL InitInstance();

// ����
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCXImageTestApp theApp;
