
// RunProgramDlg.h : ��� ����
//

#pragma once


// CRunProgramDlg ��ȭ ����
class CRunProgramDlg : public CDialog
{
// �����Դϴ�.
public:
	CRunProgramDlg(CWnd* pParent = NULL);	// ǥ�� �������Դϴ�.

// ��ȭ ���� �������Դϴ�.
	enum { IDD = IDD_RUNPROGRAM_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV �����Դϴ�.


// �����Դϴ�.
protected:
	HICON m_hIcon;

	// ������ �޽��� �� �Լ�
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedInter();
	afx_msg void OnBnClickedCal();
	afx_msg void OnBnClickedGom();
	afx_msg void OnBnClickedMemo();
};
