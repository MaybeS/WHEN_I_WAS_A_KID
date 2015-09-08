// CXImageTestView.cpp : CCXImageTestView 클래스의 구현
//

#include "stdafx.h"
#include "CXImageTest.h"

#include "CXImageTestDoc.h"
#include "CXImageTestView.h"
#include ".\cximagetestview.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CCXImageTestView

IMPLEMENT_DYNCREATE(CCXImageTestView, CView)

BEGIN_MESSAGE_MAP(CCXImageTestView, CView)
	// 표준 인쇄 명령입니다.
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
	ON_WM_LBUTTONDOWN()
	ON_WM_MOUSEMOVE()
	ON_WM_ERASEBKGND()
END_MESSAGE_MAP()

// CCXImageTestView 생성/소멸

CCXImageTestView::CCXImageTestView()
{
	// TODO: 여기에 생성 코드를 추가합니다.
	m_bClick = FALSE;
	m_fAngle = 0.0f;
}

CCXImageTestView::~CCXImageTestView()
{
	
}

BOOL CCXImageTestView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: CREATESTRUCT cs를 수정하여 여기에서
	// Window 클래스 또는 스타일을 수정합니다.

	return CView::PreCreateWindow(cs);
}

// CCXImageTestView 그리기

void CCXImageTestView::OnDraw(CDC* pDC)
{
	CCXImageTestDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	// TODO: 여기에 원시 데이터에 대한 그리기 코드를 추가합니다.
	if(m_pImage)
	{
		RGBQUAD a={255,255,255,0};
		m_pImage = new CxImage;
		m_pImage->Load("k.jpg", m_pImage->GetType());
		m_pImage->FloodFill(0,0, a);

		pDC->SetStretchBltMode(COLORONCOLOR);
		m_pImage->Rotate(m_fAngle);
		m_pImage->Draw(pDC->GetSafeHdc(), CRect(150, 150, 
				m_pImage->GetWidth()/50, m_pImage->GetHeight()/50));
		
		if(m_pImage)
			delete m_pImage;
	}

}


// CCXImageTestView 인쇄

BOOL CCXImageTestView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// 기본적인 준비
	return DoPreparePrinting(pInfo);
}

void CCXImageTestView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: 인쇄하기 전에 추가 초기화 작업을 추가합니다.
}

void CCXImageTestView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: 인쇄 후 정리 작업을 추가합니다.
}


// CCXImageTestView 진단

#ifdef _DEBUG
void CCXImageTestView::AssertValid() const
{
	CView::AssertValid();
}

void CCXImageTestView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CCXImageTestDoc* CCXImageTestView::GetDocument() const // 디버그되지 않은 버전은 인라인으로 지정됩니다.
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CCXImageTestDoc)));
	return (CCXImageTestDoc*)m_pDocument;
}
#endif //_DEBUG


// CCXImageTestView 메시지 처리기

void CCXImageTestView::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.	
	if(m_bClick)
		m_bClick = FALSE;
	else
		m_bClick = TRUE;

	if(m_bClick)
	{
		m_ptPosion.x = point.x;
		m_ptPosion.y = point.y;
	}
	CView::OnLButtonDown(nFlags, point);
}

void CCXImageTestView::OnMouseMove(UINT nFlags, CPoint point)
{
	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.
	if(m_bClick)
	{
		m_fAngle = m_ptPosion.x - point.x;
		
		m_fAngle = (int)m_fAngle % 360;

		InvalidateRect(NULL,FALSE);		
	}
	CView::OnMouseMove(nFlags, point);
}

BOOL CCXImageTestView::OnEraseBkgnd(CDC* pDC)
{
	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.

	return CView::OnEraseBkgnd(pDC);	
}
