
// MFC_MouseGame.h : MFC_MouseGame ���� ���α׷��� ���� �� ��� ����
//
#pragma once

#ifndef __AFXWIN_H__
	#error "PCH�� ���� �� ������ �����ϱ� ���� 'stdafx.h'�� �����մϴ�."
#endif

#include "resource.h"       // �� ��ȣ�Դϴ�.


// CMFC_MouseGameApp:
// �� Ŭ������ ������ ���ؼ��� MFC_MouseGame.cpp�� �����Ͻʽÿ�.
//

class CMFC_MouseGameApp : public CWinAppEx
{
public:
	CMFC_MouseGameApp();


// �������Դϴ�.
public:
	virtual BOOL InitInstance();

// �����Դϴ�.
	UINT  m_nAppLook;
	BOOL  m_bHiColorIcons;

	virtual void PreLoadState();
	virtual void LoadCustomState();
	virtual void SaveCustomState();

	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CMFC_MouseGameApp theApp;
