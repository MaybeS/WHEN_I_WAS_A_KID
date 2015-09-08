// Level.cpp : 구현 파일입니다.
//
#include "stdafx.h"
#include "MFC_MouseGame.h"
#include "MFC_MouseGameDoc.h"
#include "MFC_MouseGameView.h"
#include "MainFrm.h"
#include "Level.h"

// CLevel 대화 상자입니다.

IMPLEMENT_DYNAMIC(CLevel, CDialog)

CLevel::CLevel(CWnd* pParent /*=NULL*/)
	: CDialog(CLevel::IDD, pParent)
{

}

CLevel::~CLevel()
{
}

void CLevel::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CLevel, CDialog)
	ON_BN_CLICKED(IDOK, &CLevel::OnBnClickedOk)
END_MESSAGE_MAP()


// CLevel 메시지 처리기입니다.

BOOL CLevel::OnInitDialog()
{
	CDialog::OnInitDialog();

	// TODO:  여기에 추가 초기화 작업을 추가합니다.
	CComboBox *combo = (CComboBox*)GetDlgItem(IDC_COMBO1);
	combo->AddString(L"1");
	combo->AddString(L"2");
	combo->AddString(L"3");
	combo->AddString(L"4");
	combo->AddString(L"5");//콤보 박스에 숫자 넣기
	combo->SetCurSel(0);//첫번째 아이템이 선택 되게

	return TRUE;  // return TRUE unless you set the focus to a control
	// 예외: OCX 속성 페이지는 FALSE를 반환해야 합니다.
}

void CLevel::OnBnClickedOk()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.	
	CMFC_MouseGameView *pView = (CMFC_MouseGameView *)
		((CFrameWnd*)AfxGetApp()->GetMainWnd())->GetActiveView();
		
	CComboBox *combo = (CComboBox*)GetDlgItem(IDC_COMBO1);
	CString str;

	combo->GetLBText(combo->GetCurSel(), str);//선택된 콤보 박스에서 문자열 값 얻어옴
	
	//초기화
	pView->m_nScore = 0;
	pView->m_nLevel = 0;
	pView->m_nTime = 2000;//처음 시간을 2초로 초기화
	
	for(int i=0;i < TARGET_MAX;i++)
	{	
		pView->m_bCheck[i] = TRUE;//마우스를 클릭했는지 체크
		pView->m_nSuccess[i] = 2;//점수를 먹었는지
	}
	//뷰에 있는 멤버 변수의 값을 변경
	if(str == "1")
	{
		pView->m_nLevel = 0;
		pView->m_nTime = 2000;
	}else if(str == "2")
	{
		pView->m_nLevel = 1;
		pView->m_nTime = 1800;
	}else if(str == "3")
	{
		pView->m_nLevel = 2;
		pView->m_nTime = 1600;
	}else if(str == "4")
	{
		pView->m_nLevel = 3;
		pView->m_nTime = 1400;
	}else if(str == "5")
	{
		pView->m_nLevel = 4;
		pView->m_nTime = 1200;
		pView->SetTimer(1, 100, NULL);
	} 
	pView->SetTimer(0, pView->m_nTime, NULL);//타이머 시작
	time(&pView->m_OldTime);//순위를 매기기 위해 시작시간을 저장
	OnOK();
}
