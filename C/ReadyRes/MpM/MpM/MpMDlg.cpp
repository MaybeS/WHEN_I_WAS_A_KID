
// MpMDlg.cpp : ���� ����
//

#include "stdafx.h"
#include "MpM.h"
#include "MpMDlg.h"
#include "digitalv.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// ���� ���α׷� ������ ���Ǵ� CAboutDlg ��ȭ �����Դϴ�.

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// ��ȭ ���� �������Դϴ�.
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV �����Դϴ�.

// �����Դϴ�.
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


// CMpMDlg ��ȭ ����




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


// CMpMDlg �޽��� ó����

BOOL CMpMDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// �ý��� �޴��� "����..." �޴� �׸��� �߰��մϴ�.

	// IDM_ABOUTBOX�� �ý��� ��� ������ �־�� �մϴ�.
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

	// �� ��ȭ ������ �������� �����մϴ�. ���� ���α׷��� �� â�� ��ȭ ���ڰ� �ƴ� ��쿡��
	//  �����ӿ�ũ�� �� �۾��� �ڵ����� �����մϴ�.
	SetIcon(m_hIcon, TRUE);			// ū �������� �����մϴ�.
	SetIcon(m_hIcon, FALSE);		// ���� �������� �����մϴ�.

	// TODO: ���⿡ �߰� �ʱ�ȭ �۾��� �߰��մϴ�.
	m_PlayList.InsertColumn(0, L"����",LVCFMT_CENTER, 600);
	m_Volume.SetPos(100);
	return TRUE;  // ��Ŀ���� ��Ʈ�ѿ� �������� ������ TRUE�� ��ȯ�մϴ�.
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

// ��ȭ ���ڿ� �ּ�ȭ ���߸� �߰��� ��� �������� �׸�����
//  �Ʒ� �ڵ尡 �ʿ��մϴ�. ����/�� ���� ����ϴ� MFC ���� ���α׷��� ��쿡��
//  �����ӿ�ũ���� �� �۾��� �ڵ����� �����մϴ�.

void CMpMDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // �׸��⸦ ���� ����̽� ���ؽ�Ʈ

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// Ŭ���̾�Ʈ �簢������ �������� ����� ����ϴ�.
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// �������� �׸��ϴ�.
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// ����ڰ� �ּ�ȭ�� â�� ���� ���ȿ� Ŀ���� ǥ�õǵ��� �ý��ۿ���
//  �� �Լ��� ȣ���մϴ�.
HCURSOR CMpMDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CMpMDlg::OnBnClickedBadd()
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	CFileDialog fileDlg(TRUE, _T("mp3"), _T("*.mp3"), OFN_ALLOWMULTISELECT, L"MP3 File(*.MP3)|*.MP3|�������(*.*)|*.*|");
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
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	POSITION pos = m_PlayList.GetFirstSelectedItemPosition();
	while (pos != NULL)
	{
		int nItem = m_PlayList.GetNextSelectedItem(pos);
		m_PlayList.DeleteItem(nItem);
		pos = m_PlayList.GetFirstSelectedItemPosition();  // ���Ⱑ ����Ʈ, �ٽñ� ������ ���õ� ����� ó���� ã�´�.
	} 
}

void CMpMDlg::OnBnClickedBprev()
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	if(m_nIndex-1 >= 0)
	{		
		MCIStop();
		m_PlayList.SetItemState( m_nIndex, 0, LVIS_SELECTED );//���� ������ġ�� ����
		m_nIndex--;
		m_PlayList.SetSelectionMark(m_nIndex);
		m_PlayList.SetItemState( m_nIndex, LVIS_SELECTED, LVIS_SELECTED );//���� ��ġ�� ����
		m_PlayList.EnsureVisible( m_nIndex, FALSE );                      // ��ũ��

		MCIOpen();
		MCIPlay();
	}
	m_PlayList.SetFocus();
}

void CMpMDlg::OnBnClickedBplay()
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	if(isPlay() || isPause())
		MCIStop();

	MCIOpen();
	MCIPlay();
	m_PlayList.SetFocus();
}

void CMpMDlg::OnBnClickedBpause()
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	MCIPause();	
	m_PlayList.SetFocus();
}

void CMpMDlg::OnBnClickedBstop()
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	MCIStop();
	m_PlayList.SetFocus();
}

void CMpMDlg::OnBnClickedBnext()
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	if(m_nIndex+1 < m_PlayList.GetItemCount())
	{
		MCIStop();
		m_PlayList.SetItemState( m_nIndex, 0, LVIS_SELECTED );//���� ������ ����
		m_nIndex++;
		m_PlayList.SetSelectionMark(m_nIndex);
		m_PlayList.SetItemState( m_nIndex, LVIS_SELECTED, LVIS_SELECTED );//���� ��ġ�� ����
		m_PlayList.EnsureVisible( m_nIndex, FALSE );                      // ��ũ��
		
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
		(DWORD)(LPVOID)&m_mciOpen);	//MCI_OPEN ����� �ش�.

	m_dwID = m_mciOpen.wDeviceID;				//���� ����̽� ���̵� �޴���.

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

//���� Ŭ���� ���
void CMpMDlg::OnNMDblclkList1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	m_nIndex = pNMItemActivate->iItem;//���� Ŭ���� ��ġ ����
	if(isPlay() || isPause())
		MCIStop();

	MCIOpen();
	MCIPlay();
	m_PlayList.SetFocus();
	*pResult = 0;
}

void CMpMDlg::OnNMReleasedcaptureVolume(NMHDR *pNMHDR, LRESULT *pResult)
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
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
	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰� ��/�Ǵ� �⺻���� ȣ���մϴ�.
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
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
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
	m_PlayList.SetItemState( m_nIndex, 0, LVIS_SELECTED );//���� ������ ����
	m_nIndex = rand()%m_PlayList.GetItemCount();
	m_PlayList.SetSelectionMark(m_nIndex);
	m_PlayList.SetItemState( m_nIndex, LVIS_SELECTED, LVIS_SELECTED );//���� ��ġ�� ����
	m_PlayList.EnsureVisible( m_nIndex, FALSE );                      // ��ũ��

	MCIOpen();
	MCIPlay();
		
	m_PlayList.SetFocus();
}