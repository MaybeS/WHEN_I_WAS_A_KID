// NameDlg.cpp : ���� �����Դϴ�.
//

#include "stdafx.h"
#include "MFC_MouseGame.h"
#include "NameDlg.h"


// CNameDlg ��ȭ �����Դϴ�.

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


// CNameDlg �޽��� ó�����Դϴ�.
