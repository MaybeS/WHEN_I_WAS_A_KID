// RankDlg.cpp : 구현 파일입니다.
//

#include "stdafx.h"
#include "MFC_MouseGame.h"
#include "RankDlg.h"
#include <atlconv.h>

// CRankDlg 대화 상자입니다.

IMPLEMENT_DYNAMIC(CRankDlg, CDialog)

CRankDlg::CRankDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CRankDlg::IDD, pParent)
{

}

CRankDlg::~CRankDlg()
{
}

void CRankDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_LIST1, m_ListBox);
}


BEGIN_MESSAGE_MAP(CRankDlg, CDialog)
END_MESSAGE_MAP()


// CRankDlg 메시지 처리기입니다.

BOOL CRankDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// TODO:  여기에 추가 초기화 작업을 추가합니다.
	FILE *fp = fopen("rank.txt", "r");
	char str[256];
	wchar_t wstr[256];

	while(1)
	{
		if(fgets(str, 256, fp) == NULL) break;//파일에서 한줄을 읽어옴
		USES_CONVERSION;
		wcscpy(wstr, A2W(str));//멀티바이트를 유니코드로
		m_ListBox.AddString(wstr);//리스트 박스에 추가(자동 소트됨)
	}

	fclose(fp);
	return TRUE;  // return TRUE unless you set the focus to a control
	// 예외: OCX 속성 페이지는 FALSE를 반환해야 합니다.
}
