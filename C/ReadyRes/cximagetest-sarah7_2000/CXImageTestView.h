// CXImageTestView.h : iCCXImageTestView 클래스의 인터페이스
//


#pragma once
#include "ximage.h"

class CCXImageTestView : public CView
{
protected: // serialization에서만 만들어집니다.
	CCXImageTestView();
	DECLARE_DYNCREATE(CCXImageTestView)

// 특성
public:
	CCXImageTestDoc* GetDocument() const;
	CxImage	   *m_pImage;	
	BOOL		m_bClick;
	CPoint		m_ptPosion;
	int			m_nSizeX, m_nSizeY;
	float		m_fAngle;

// 작업
public:

// 재정의
	public:
	virtual void OnDraw(CDC* pDC);  // 이 뷰를 그리기 위해 재정의되었습니다.
virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);

// 구현
public:
	virtual ~CCXImageTestView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// 메시지 맵 함수를 생성했습니다.
protected:
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg BOOL OnEraseBkgnd(CDC* pDC);
};

#ifndef _DEBUG  // CXImageTestView.cpp의 디버그 버전
inline CCXImageTestDoc* CCXImageTestView::GetDocument() const
   { return reinterpret_cast<CCXImageTestDoc*>(m_pDocument); }
#endif

