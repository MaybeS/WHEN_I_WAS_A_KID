
// MpMDlg.cpp : 구현 파일
//

#include "stdafx.h"
#include "MpM.h"
#include "MpMDlg.h"
#include "digitalv.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// 응용 프로그램 정보에 사용되는 CAboutDlg 대화 상자입니다.

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// 대화 상자 데이터입니다.
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 지원입니다.

// 구현입니다.
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()


// CMpMDlg 대화 상자




CMpMDlg::CMpMDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMpMDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CMpMDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_PLAYSTATE, m_PlayState);
	DDX_Control(pDX, IDC_VOLUME, m_Volume);
	DDX_Control(pDX, IDC_LIST1, m_PlayList);
}

BEGIN_MESSAGE_MAP(CMpMDlg, CDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BADD, &CMpMDlg::OnBnClickedBadd)
	ON_BN_CLICKED(IDC_BDEL, &CMpMDlg::OnBnClickedBdel)
	ON_BN_CLICKED(IDC_BPREV, &CMpMDlg::OnBnClickedBprev)
	ON_BN_CLICKED(IDC_BPLAY, &CMpMDlg::OnBnClickedBplay)
	ON_BN_CLICKED(IDC_BPAUSE, &CMpMDlg::OnBnClickedBpause)
	ON_BN_CLICKED(IDC_BSTOP, &CMpMDlg::OnBnClickedBstop)
	ON_BN_CLICKED(IDC_BNEXT, &CMpMDlg::OnBnClickedBnext)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST1, &CMpMDlg::OnNMDblclkList1)	
	ON_NOTIFY(NM_RELEASEDCAPTURE, IDC_VOLUME, &CMpMDlg::OnNMReleasedcaptureVolume)
	ON_WM_TIMER()
	ON_NOTIFY(NM_RELEASEDCAPTURE, IDC_PLAYSTATE, &CMpMDlg::OnNMReleasedcapturePlaystate)
END_MESSAGE_MAP()


// CMpMDlg 메시지 처리기

BOOL CMpMDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// 시스템 메뉴에 "정보..." 메뉴 항목을 추가합니다.

	// IDM_ABOUTBOX는 시스템 명령 범위에 있어야 합니다.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// 이 대화 상자의 아이콘을 설정합니다. 응용 프로그램의 주 창이 대화 상자가 아닐 경우에는
	//  프레임워크가 이 작업을 자동으로 수행합니다.
	SetIcon(m_hIcon, TRUE);			// 큰 아이콘을 설정합니다.
	SetIcon(m_hIcon, FALSE);		// 작은 아이콘을 설정합니다.

	// TODO: 여기에 추가 초기화 작업을 추가합니다.
	m_PlayList.InsertColumn(0, L"제목",LVCFMT_CENTER, 600);
	m_Volume.SetPos(100);
	return TRUE;  // 포커스를 컨트롤에 설정하지 않으면 TRUE를 반환합니다.
}

void CMpMDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// 대화 상자에 최소화 단추를 추가할 경우 아이콘을 그리려면
//  아래 코드가 필요합니다. 문서/뷰 모델을 사용하는 MFC 응용 프로그램의 경우에는
//  프레임워크에서 이 작업을 자동으로 수행합니다.

void CMpMDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // 그리기를 위한 디바이스 컨텍스트

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// 클라이언트 사각형에서 아이콘을 가운데에 맞춥니다.
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// 아이콘을 그립니다.
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// 사용자가 최소화된 창을 끄는 동안에 커서가 표시되도록 시스템에서
//  이 함수를 호출합니다.
HCURSOR CMpMDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CMpMDlg::OnBnClickedBadd()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CFileDialog fileDlg(TRUE, _T("mp3"), _T("*.mp3"), OFN_ALLOWMULTISELECT, L"MP3 File(*.MP3)|*.MP3|모든파일(*.*)|*.*|");
	DWORD dwMaxFile = 4096;
	fileDlg.m_ofn.nMaxFile = dwMaxFile;
	TCHAR* pchBuffer = new TCHAR[dwMaxFile];
	memset(pchBuffer, 0x00, sizeof(pchBuffer));
	fileDlg.m_ofn.lpstrFile = pchBuffer; 

	POSITION Pos;
	CString strPathName;
	CString fileName;

	if(fileDlg.DoModal() == IDOK)
	{
		Pos = fileDlg.GetStartPosition();
		while(Pos)
		{				
			strPathName = fileDlg.GetNextPathName(Pos);
			
			m_PlayList.InsertItem(m_PlayList.GetItemCount(), strPathName);			
		}
	}
	//SetWindowText(fileName);

	delete [] pchBuffer;
}

void CMpMDlg::OnBnClickedBdel()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	POSITION pos = m_PlayList.GetFirstSelectedItemPosition();
	while (pos != NULL)
	{
		int nItem = m_PlayList.GetNextSelectedItem(pos);
		m_PlayList.DeleteItem(nItem);
		pos = m_PlayList.GetFirstSelectedItemPosition();  // 여기가 포인트, 다시금 나머지 선택된 목록의 처음을 찾는다.
	} 
}

void CMpMDlg::OnBnClickedBprev()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	if(m_nIndex-1 >= 0)
	{		
		MCIStop();
		m_PlayList.SetItemState( m_nIndex, 0, LVIS_SELECTED );//이전 선택위치를 지움
		m_nIndex--;
		m_PlayList.SetSelectionMark(m_nIndex);
		m_PlayList.SetItemState( m_nIndex, LVIS_SELECTED, LVIS_SELECTED );//현재 위치를 선택
		m_PlayList.EnsureVisible( m_nIndex, FALSE );                      // 스크롤

		MCIOpen();
		MCIPlay();
	}
	m_PlayList.SetFocus();
}

void CMpMDlg::OnBnClickedBplay()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	if(isPlay() || isPause())
		MCIStop();

	MCIOpen();
	MCIPlay();
	m_PlayList.SetFocus();
}

void CMpMDlg::OnBnClickedBpause()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	MCIPause();	
	m_PlayList.SetFocus();
}

void CMpMDlg::OnBnClickedBstop()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	MCIStop();
	m_PlayList.SetFocus();
}

void CMpMDlg::OnBnClickedBnext()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	if(m_nIndex+1 < m_PlayList.GetItemCount())
	{
		MCIStop();
		m_PlayList.SetItemState( m_nIndex, 0, LVIS_SELECTED );//이전 선택을 지움
		m_nIndex++;
		m_PlayList.SetSelectionMark(m_nIndex);
		m_PlayList.SetItemState( m_nIndex, LVIS_SELECTED, LVIS_SELECTED );//현재 위치를 선택
		m_PlayList.EnsureVisible( m_nIndex, FALSE );                      // 스크롤
		
		MCIOpen();
		MCIPlay();
	}	
	m_PlayList.SetFocus();
}

DWORD CMpMDlg::GetMCIState(int state)
{
	DWORD dwMode;

	MCI_STATUS_PARMS mciStatusParms;
	mciStatusParms.dwItem = state;

	mciSendCommand(m_dwID, MCI_STATUS, MCI_STATUS_ITEM, (DWORD)(LPVOID)&mciStatusParms);
	dwMode = (LONG)mciStatusParms.dwReturn;	

	return dwMode;
}

void CMpMDlg::MCIOpen()
{
	CString fname;

	m_nIndex = m_PlayList.GetSelectionMark();
	fname = m_PlayList.GetItemText(m_nIndex, 0);

	m_mciOpen.lpstrElementName = fname;
	m_mciOpen.lpstrDeviceType = L"mpegvideo";

	mciSendCommand(NULL,MCI_OPEN,MCI_OPEN_ELEMENT|MCI_OPEN_TYPE,
		(DWORD)(LPVOID)&m_mciOpen);	//MCI_OPEN 명령을 준다.

	m_dwID = m_mciOpen.wDeviceID;				//열린 디바이스 아이디를 받느다.

	GetDlgItem(IDC_TITLE)->SetWindowText(GetTitle(fname));
}
void CMpMDlg::MCIPlay()
{
	mciSendCommand(m_dwID, MCI_PLAY, MCI_NOTIFY,(DWORD)&m_mciPlay);	
	SetTimer(0,1000,NULL);
}
void CMpMDlg::MCIPause()
{
	mciSendCommand(m_dwID,MCI_PAUSE,MCI_NOTIFY,(DWORD)(LPVOID) &m_mciPlay);
}
void CMpMDlg::MCIStop()
{
	mciSendCommand(m_dwID, MCI_CLOSE, 0, NULL);
}
BOOL CMpMDlg::isPlay()
{
	if(GetMCIState(MCI_STATUS_MODE) == MCI_MODE_PLAY)
		return TRUE;

	return FALSE;
}
BOOL CMpMDlg::isPause()
{
	if(GetMCIState(MCI_STATUS_MODE) == MCI_MODE_PAUSE)
		return TRUE;

	return FALSE;
}
BOOL CMpMDlg::isStop()
{
	if(GetMCIState(MCI_STATUS_MODE) == MCI_MODE_STOP)
		return TRUE;

	return FALSE;
}

void CMpMDlg::SetVolume(DWORD dwVolume)
{
	MCI_DGV_SETAUDIO_PARMS p; 

	if( dwVolume > 100 ) dwVolume = 100; 
	if( dwVolume < 0   ) dwVolume = 0; 

	dwVolume *= 10; 

	p.dwCallback = 0; 
	p.dwItem     = MCI_DGV_SETAUDIO_VOLUME; 
	p.dwValue    = dwVolume; 
	p.dwOver     = 0; 
	p.lpstrAlgorithm = NULL; 
	p.lpstrQuality   = NULL; 

	mciSendCommand( m_dwID, MCI_SETAUDIO, 
		MCI_DGV_SETAUDIO_VALUE | MCI_DGV_SETAUDIO_ITEM, (DWORD)(LPVOID)&p ); 
}

//더블 클릭할 경우
void CMpMDlg::OnNMDblclkList1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	m_nIndex = pNMItemActivate->iItem;//더블 클릭한 위치 저장
	if(isPlay() || isPause())
		MCIStop();

	MCIOpen();
	MCIPlay();
	m_PlayList.SetFocus();
	*pResult = 0;
}

void CMpMDlg::OnNMReleasedcaptureVolume(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	SetVolume(m_Volume.GetPos());
	*pResult = 0;
}

DWORD CMpMDlg::GetPlayTime()
{
	DWORD playtime = GetMCIState(MCI_STATUS_LENGTH);
	
	return playtime;
}
DWORD CMpMDlg::GetCurrentPos()
{
	DWORD currenttime = GetMCIState(MCI_STATUS_POSITION);

	return currenttime;
}

void CMpMDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.
	int nCurTime = int(GetCurrentPos() / 1000 );
	int nLength = int(GetPlayTime() / 1000 );
	CString strTimer;
	if( nLength > 0 )
	{
		int nCur2 = nCurTime%60;
		CString szCur2;
		szCur2.Format(L"%02d", nCur2);

		int nLen2 = nLength%60;
		CString szLen2;
		szLen2.Format(L"%02d", nLen2);

		strTimer.Format(L"%2d:%s/%2d:%s", nCurTime/60, szCur2, nLength/60, szLen2);		
		int nPer = nCurTime*100/nLength;		
		
		GetDlgItem(IDC_PLAYTIME)->SetWindowText(strTimer);
		m_PlayState.SetPos(nPer);
		UpdateData(FALSE);

		if( nPer == 100 )
		{
			if(((CButton*)GetDlgItem(IDC_CAGAIN))->GetCheck() == BST_CHECKED)
			{
				KillTimer(0);
				OnBnClickedBplay();
			}
			else if(((CButton*)GetDlgItem(IDC_CRANDEM))->GetCheck() == BST_CHECKED)
			{
				KillTimer(0);
				RandomPlay();
			}
			else
			{
				KillTimer(0);
				OnBnClickedBnext();
			}
		}		
	}
	CDialog::OnTimer(nIDEvent);
}

void CMpMDlg::OnNMReleasedcapturePlaystate(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	SetPosition(m_PlayState.GetPos() * GetPlayTime() / 100);
	*pResult = 0;
}

void CMpMDlg::SetPosition(DWORD dwPosition)
{
	MCI_SEEK_PARMS mciSeekParms;
	mciSeekParms.dwTo = dwPosition;

	mciSendCommand(m_dwID, MCI_SEEK, MCI_TO, (DWORD)(LPVOID)&mciSeekParms);
	MCIPlay();
}

CString CMpMDlg::GetTitle(CString strFile)
{
	CString strResult, strTemp;

	int nPos = strFile.ReverseFind(TCHAR('\\'));
	if (nPos == -1)
		return strResult;

	strTemp = strFile.Right(strFile.GetLength() - 1 - nPos);

	int nTemp = strTemp.GetLength() - 4;
	strResult = strTemp.Left(nTemp);

	return strResult;
}

void CMpMDlg::RandomPlay()
{		
	m_PlayList.SetItemState( m_nIndex, 0, LVIS_SELECTED );//이전 선택을 지움
	m_nIndex = rand()%m_PlayList.GetItemCount();
	m_PlayList.SetSelectionMark(m_nIndex);
	m_PlayList.SetItemState( m_nIndex, LVIS_SELECTED, LVIS_SELECTED );//현재 위치를 선택
	m_PlayList.EnsureVisible( m_nIndex, FALSE );                      // 스크롤

	MCIOpen();
	MCIPlay();
		
	m_PlayList.SetFocus();
}