
// MpMDlg.h : 헤더 파일
//

#pragma once
#include "afxcmn.h"
#include <MMSystem.h>

// CMpMDlg 대화 상자
class CMpMDlg : public CDialog
{
// 생성입니다.
public:
	CMpMDlg(CWnd* pParent = NULL);	// 표준 생성자입니다.
	
	DWORD m_dwID;

	MCI_OPEN_PARMS m_mciOpen;
	MCI_PLAY_PARMS m_mciPlay;

	int m_nIndex;
// 대화 상자 데이터입니다.
	enum { IDD = IDD_MPM_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV 지원입니다.


// 구현입니다.
protected:
	HICON m_hIcon;

	// 생성된 메시지 맵 함수
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
