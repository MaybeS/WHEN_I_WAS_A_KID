// RankDlg.cpp : ���� �����Դϴ�.
//

#include "stdafx.h"
#include "MFC_MouseGame.h"
#include "RankDlg.h"
#include <atlconv.h>

// CRankDlg ��ȭ �����Դϴ�.

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


// CRankDlg �޽��� ó�����Դϴ�.

BOOL CRankDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// TODO:  ���⿡ �߰� �ʱ�ȭ �۾��� �߰��մϴ�.
	FILE *fp = fopen("rank.txt", "r");
	char str[256];
	wchar_t wstr[256];

	while(1)
	{
		if(fgets(str, 256, fp) == NULL) break;//���Ͽ��� ������ �о��
		USES_CONVERSION;
		wcscpy(wstr, A2W(str));//��Ƽ����Ʈ�� �����ڵ��
		m_ListBox.AddString(wstr);//����Ʈ �ڽ��� �߰�(�ڵ� ��Ʈ��)
	}

	fclose(fp);
	return TRUE;  // return TRUE unless you set the focus to a control
	// ����: OCX �Ӽ� �������� FALSE�� ��ȯ�ؾ� �մϴ�.
}
