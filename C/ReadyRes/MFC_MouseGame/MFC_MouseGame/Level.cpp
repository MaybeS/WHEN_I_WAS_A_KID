// Level.cpp : ���� �����Դϴ�.
//
#include "stdafx.h"
#include "MFC_MouseGame.h"
#include "MFC_MouseGameDoc.h"
#include "MFC_MouseGameView.h"
#include "MainFrm.h"
#include "Level.h"

// CLevel ��ȭ �����Դϴ�.

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


// CLevel �޽��� ó�����Դϴ�.

BOOL CLevel::OnInitDialog()
{
	CDialog::OnInitDialog();

	// TODO:  ���⿡ �߰� �ʱ�ȭ �۾��� �߰��մϴ�.
	CComboBox *combo = (CComboBox*)GetDlgItem(IDC_COMBO1);
	combo->AddString(L"1");
	combo->AddString(L"2");
	combo->AddString(L"3");
	combo->AddString(L"4");
	combo->AddString(L"5");//�޺� �ڽ��� ���� �ֱ�
	combo->SetCurSel(0);//ù��° �������� ���� �ǰ�

	return TRUE;  // return TRUE unless you set the focus to a control
	// ����: OCX �Ӽ� �������� FALSE�� ��ȯ�ؾ� �մϴ�.
}

void CLevel::OnBnClickedOk()
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.	
	CMFC_MouseGameView *pView = (CMFC_MouseGameView *)
		((CFrameWnd*)AfxGetApp()->GetMainWnd())->GetActiveView();
		
	CComboBox *combo = (CComboBox*)GetDlgItem(IDC_COMBO1);
	CString str;

	combo->GetLBText(combo->GetCurSel(), str);//���õ� �޺� �ڽ����� ���ڿ� �� ����
	
	//�ʱ�ȭ
	pView->m_nScore = 0;
	pView->m_nLevel = 0;
	pView->m_nTime = 2000;//ó�� �ð��� 2�ʷ� �ʱ�ȭ
	
	for(int i=0;i < TARGET_MAX;i++)
	{	
		pView->m_bCheck[i] = TRUE;//���콺�� Ŭ���ߴ��� üũ
		pView->m_nSuccess[i] = 2;//������ �Ծ�����
	}
	//�信 �ִ� ��� ������ ���� ����
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
	pView->SetTimer(0, pView->m_nTime, NULL);//Ÿ�̸� ����
	time(&pView->m_OldTime);//������ �ű�� ���� ���۽ð��� ����
	OnOK();
}
