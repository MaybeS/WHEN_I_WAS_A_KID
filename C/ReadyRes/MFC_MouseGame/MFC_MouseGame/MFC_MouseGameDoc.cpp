
// MFC_MouseGameDoc.cpp : CMFC_MouseGameDoc Ŭ������ ����
//

#include "stdafx.h"
#include "MFC_MouseGame.h"

#include "MFC_MouseGameDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CMFC_MouseGameDoc

IMPLEMENT_DYNCREATE(CMFC_MouseGameDoc, CDocument)

BEGIN_MESSAGE_MAP(CMFC_MouseGameDoc, CDocument)
END_MESSAGE_MAP()


// CMFC_MouseGameDoc ����/�Ҹ�

CMFC_MouseGameDoc::CMFC_MouseGameDoc()
{
	// TODO: ���⿡ ��ȸ�� ���� �ڵ带 �߰��մϴ�.

}

CMFC_MouseGameDoc::~CMFC_MouseGameDoc()
{
}

BOOL CMFC_MouseGameDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: ���⿡ ���ʱ�ȭ �ڵ带 �߰��մϴ�.
	// SDI ������ �� ������ �ٽ� ����մϴ�.

	return TRUE;
}




// CMFC_MouseGameDoc serialization

void CMFC_MouseGameDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: ���⿡ ���� �ڵ带 �߰��մϴ�.
	}
	else
	{
		// TODO: ���⿡ �ε� �ڵ带 �߰��մϴ�.
	}
}


// CMFC_MouseGameDoc ����

#ifdef _DEBUG
void CMFC_MouseGameDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CMFC_MouseGameDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG


// CMFC_MouseGameDoc ���
