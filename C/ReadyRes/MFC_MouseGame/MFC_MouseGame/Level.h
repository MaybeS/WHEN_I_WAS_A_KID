#pragma once


// CLevel ��ȭ �����Դϴ�.

class CLevel : public CDialog
{
	DECLARE_DYNAMIC(CLevel)

public:
	CLevel(CWnd* pParent = NULL);   // ǥ�� �������Դϴ�.
	virtual ~CLevel();

// ��ȭ ���� �������Դϴ�.
	enum { IDD = IDD_DIALOG1 };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV �����Դϴ�.

	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedOk();
};
