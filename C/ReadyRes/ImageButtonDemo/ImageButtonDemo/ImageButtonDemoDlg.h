
// ImageButtonDemoDlg.h : ��� ����
//

#pragma once


// CImageButtonDemoDlg ��ȭ ����
class CImageButtonDemoDlg : public CDialog
{
// �����Դϴ�.
public:
	CImageButtonDemoDlg(CWnd* pParent = NULL);	// ǥ�� �������Դϴ�.

	CBitmapButton* pmyButton1;
	CBitmapButton* pmyButton2;
// ��ȭ ���� �������Դϴ�.
	enum { IDD = IDD_IMAGEBUTTONDEMO_DIALOG };

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
	
};
