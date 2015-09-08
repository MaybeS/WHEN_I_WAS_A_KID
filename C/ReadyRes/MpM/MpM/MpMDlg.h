
// MpMDlg.h : ��� ����
//

#pragma once
#include "afxcmn.h"
#include <MMSystem.h>

// CMpMDlg ��ȭ ����
class CMpMDlg : public CDialog
{
// �����Դϴ�.
public:
	CMpMDlg(CWnd* pParent = NULL);	// ǥ�� �������Դϴ�.
	
	DWORD m_dwID;

	MCI_OPEN_PARMS m_mciOpen;
	MCI_PLAY_PARMS m_mciPlay;

	int m_nIndex;
// ��ȭ ���� �������Դϴ�.
	enum { IDD = IDD_MPM_DIALOG };

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
	afx_msg void OnBnClickedBadd();
	afx_msg void OnBnClickedBdel();
	CSliderCtrl m_PlayState;
	CSliderCtrl m_Volume;
	CListCtrl m_PlayList;
	afx_msg void OnBnClickedBprev();
	afx_msg void OnBnClickedBplay();
	afx_msg void OnBnClickedBpause();
	afx_msg void OnBnClickedBstop();
	afx_msg void OnBnClickedBnext();
	DWORD GetMCIState(int state);
	void MCIOpen();
	void MCIPlay();
	void MCIPause();
	void MCIStop();
	BOOL isPlay();
	BOOL isPause();
	BOOL isStop();
	void SetVolume(DWORD dwVolume);
	DWORD GetPlayTime();
	DWORD GetCurrentPos();
	void SetPosition(DWORD dwPosition);
	CString GetTitle(CString strFile);
	void RandomPlay();

	afx_msg void OnNMDblclkList1(NMHDR *pNMHDR, LRESULT *pResult);	
	afx_msg void OnNMReleasedcaptureVolume(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnNMReleasedcapturePlaystate(NMHDR *pNMHDR, LRESULT *pResult);
};
