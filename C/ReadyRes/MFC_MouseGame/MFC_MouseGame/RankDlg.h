#pragma once
#include "afxwin.h"


// CRankDlg ��ȭ �����Դϴ�.

class CRankDlg : public CDialog
{
	DECLARE_DYNAMIC(CRankDlg)

public:
	CRankDlg(CWnd* pParent = NULL);   // ǥ�� �������Դϴ�.
	virtual ~CRankDlg();

// ��ȭ ���� �������Դϴ�.
	enum { IDD = IDD_DIALOG3 };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV �����Դϴ�.

	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	CListBox m_ListBox;
};
