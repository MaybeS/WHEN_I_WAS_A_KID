// CXImageTestDoc.cpp : CCXImageTestDoc Ŭ������ ����
//

#include "stdafx.h"
#include "CXImageTest.h"

#include "CXImageTestDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CCXImageTestDoc

IMPLEMENT_DYNCREATE(CCXImageTestDoc, CDocument)

BEGIN_MESSAGE_MAP(CCXImageTestDoc, CDocument)
END_MESSAGE_MAP()


// CCXImageTestDoc ����/�Ҹ�

CCXImageTestDoc::CCXImageTestDoc()
{
	// TODO: ���⿡ ��ȸ�� ���� �ڵ带 �߰��մϴ�.

}

CCXImageTestDoc::~CCXImageTestDoc()
{
}

BOOL CCXImageTestDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: ���⿡ �ٽ� �ʱ�ȭ �ڵ带 �߰��մϴ�.
	// SDI ������ �� ������ �ٽ� ����մϴ�.

	return TRUE;
}




// CCXImageTestDoc serialization

void CCXImageTestDoc::Serialize(CArchive& ar)
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


// CCXImageTestDoc ����

#ifdef _DEBUG
void CCXImageTestDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CCXImageTestDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG


// CCXImageTestDoc ���
