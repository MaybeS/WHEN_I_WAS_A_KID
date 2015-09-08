// CXImageTestView.cpp : CCXImageTestView Ŭ������ ����
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
	// ǥ�� �μ� ����Դϴ�.
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
	ON_WM_LBUTTONDOWN()
	ON_WM_MOUSEMOVE()
	ON_WM_ERASEBKGND()
END_MESSAGE_MAP()

// CCXImageTestView ����/�Ҹ�

CCXImageTestView::CCXImageTestView()
{
	// TODO: ���⿡ ���� �ڵ带 �߰��մϴ�.
	m_bClick = FALSE;
	m_fAngle = 0.0f;
}

CCXImageTestView::~CCXImageTestView()
{
	
}

BOOL CCXImageTestView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: CREATESTRUCT cs�� �����Ͽ� ���⿡��
	// Window Ŭ���� �Ǵ� ��Ÿ���� �����մϴ�.

	return CView::PreCreateWindow(cs);
}

// CCXImageTestView �׸���

void CCXImageTestView::OnDraw(CDC* pDC)
{
	CCXImageTestDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	// TODO: ���⿡ ���� �����Ϳ� ���� �׸��� �ڵ带 �߰��մϴ�.
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


// CCXImageTestView �μ�

BOOL CCXImageTestView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// �⺻���� �غ�
	return DoPreparePrinting(pInfo);
}

void CCXImageTestView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: �μ��ϱ� ���� �߰� �ʱ�ȭ �۾��� �߰��մϴ�.
}

void CCXImageTestView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: �μ� �� ���� �۾��� �߰��մϴ�.
}


// CCXImageTestView ����

#ifdef _DEBUG
void CCXImageTestView::AssertValid() const
{
	CView::AssertValid();
}

void CCXImageTestView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CCXImageTestDoc* CCXImageTestView::GetDocument() const // ����׵��� ���� ������ �ζ������� �����˴ϴ�.
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CCXImageTestDoc)));
	return (CCXImageTestDoc*)m_pDocument;
}
#endif //_DEBUG


// CCXImageTestView �޽��� ó����

void CCXImageTestView::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰� ��/�Ǵ� �⺻���� ȣ���մϴ�.	
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
	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰� ��/�Ǵ� �⺻���� ȣ���մϴ�.
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
	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰� ��/�Ǵ� �⺻���� ȣ���մϴ�.

	return CView::OnEraseBkgnd(pDC);	
}
