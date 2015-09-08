// CXImageTestView.h : iCCXImageTestView Ŭ������ �������̽�
//


#pragma once
#include "ximage.h"

class CCXImageTestView : public CView
{
protected: // serialization������ ��������ϴ�.
	CCXImageTestView();
	DECLARE_DYNCREATE(CCXImageTestView)

// Ư��
public:
	CCXImageTestDoc* GetDocument() const;
	CxImage	   *m_pImage;	
	BOOL		m_bClick;
	CPoint		m_ptPosion;
	int			m_nSizeX, m_nSizeY;
	float		m_fAngle;

// �۾�
public:

// ������
	public:
	virtual void OnDraw(CDC* pDC);  // �� �並 �׸��� ���� �����ǵǾ����ϴ�.
virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);

// ����
public:
	virtual ~CCXImageTestView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// �޽��� �� �Լ��� �����߽��ϴ�.
protected:
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg BOOL OnEraseBkgnd(CDC* pDC);
};

#ifndef _DEBUG  // CXImageTestView.cpp�� ����� ����
inline CCXImageTestDoc* CCXImageTestView::GetDocument() const
   { return reinterpret_cast<CCXImageTestDoc*>(m_pDocument); }
#endif

