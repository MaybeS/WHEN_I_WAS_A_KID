#pragma once


// CLevel 대화 상자입니다.

class CLevel : public CDialog
{
	DECLARE_DYNAMIC(CLevel)

public:
	CLevel(CWnd* pParent = NULL);   // 표준 생성자입니다.
	virtual ~CLevel();

// 대화 상자 데이터입니다.
	enum { IDD = IDD_DIALOG1 };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 지원입니다.

	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedOk();
};
