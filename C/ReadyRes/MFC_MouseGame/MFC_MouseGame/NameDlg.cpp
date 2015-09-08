// NameDlg.cpp : 구현 파일입니다.
//

#include "stdafx.h"
#include "MFC_MouseGame.h"
#include "NameDlg.h"


// CNameDlg 대화 상자입니다.

IMPLEMENT_DYNAMIC(CNameDlg, CDialog)

CNameDlg::CNameDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CNameDlg::IDD, pParent)
	, m_sEdit(_T(""))
{

}

CNameDlg::~CNameDlg()
{
}

void CNameDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Text(pDX, IDC_EDIT1, m_sEdit);
}


BEGIN_MESSAGE_MAP(CNameDlg, CDialog)
END_MESSAGE_MAP()


// CNameDlg 메시지 처리기입니다.
