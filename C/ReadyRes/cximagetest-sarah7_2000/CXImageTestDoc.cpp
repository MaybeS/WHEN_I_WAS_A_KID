// CXImageTestDoc.cpp : CCXImageTestDoc 클래스의 구현
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


// CCXImageTestDoc 생성/소멸

CCXImageTestDoc::CCXImageTestDoc()
{
	// TODO: 여기에 일회성 생성 코드를 추가합니다.

}

CCXImageTestDoc::~CCXImageTestDoc()
{
}

BOOL CCXImageTestDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: 여기에 다시 초기화 코드를 추가합니다.
	// SDI 문서는 이 문서를 다시 사용합니다.

	return TRUE;
}




// CCXImageTestDoc serialization

void CCXImageTestDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: 여기에 저장 코드를 추가합니다.
	}
	else
	{
		// TODO: 여기에 로딩 코드를 추가합니다.
	}
}


// CCXImageTestDoc 진단

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


// CCXImageTestDoc 명령
