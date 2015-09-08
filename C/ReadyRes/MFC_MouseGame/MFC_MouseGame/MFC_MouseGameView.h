
// MFC_MouseGameView.h : CMFC_MouseGameView 클래스의 인터페이스
//


#pragma once

#define TARGET_MAX 10 //타겟의 갯수

class CMFC_MouseGameView : public CView
{
protected: // serialization에서만 만들어집니다.
	CMFC_MouseGameView();
	DECLARE_DYNCREATE(CMFC_MouseGameView)

// 특성입니다.
public:
	CMFC_MouseGameDoc* GetDocument() const;

// 작업입니다.
public:
	int m_nScore;
	int m_nLevel;
	int m_nTime;//
	BOOL m_bCheck[TARGET_MAX];//마우스 클릭 체크
	int m_nSuccess[TARGET_MAX];//점수를 획득했는지(0:점수 획득 실패 1:점수 획득 성공 2:검사 전)

	CRect m_rtOkClick[TARGET_MAX];//마우스로 찍어야 할 상자
	CRect m_rtNoClick[TARGET_MAX];//5레벨에 찍지 말아야 할 상자
	int m_nSize[5];//레벨에 따라 크기 저장
	
	CBitmap m_CBitMap[7];//
	CPoint  m_ptPoint[TARGET_MAX];//마우스 찍은 좌표
	CPoint  m_ptNotTargetPoint[TARGET_MAX];//맨 바닥을 찍은 좌표
	int		m_nNotTargetPointCount;//m_ptNotTargetPoint의 배열 인자를 카운트함

	int m_nRandMove1[TARGET_MAX];//레벨 5일 경우 움직이는 타겟의 방향
	int m_nRandMove2[TARGET_MAX];
	time_t m_CurrentTime;
	time_t m_OldTime;
	int m_nTargetCount;
	
	void RankName();
// 재정의입니다.
public:
	virtual void OnDraw(CDC* pDC);  // 이 뷰를 그리기 위해 재정의되었습니다.
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);

// 구현입니다.
public:
	virtual ~CMFC_MouseGameView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// 생성된 메시지 맵 함수
protected:
	afx_msg void OnFilePrintPreview();
	afx_msg void OnRButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnContextMenu(CWnd* pWnd, CPoint point);
	DECLARE_MESSAGE_MAP()
public:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
	virtual void OnInitialUpdate();
};

#ifndef _DEBUG  // MFC_MouseGameView.cpp의 디버그 버전
inline CMFC_MouseGameDoc* CMFC_MouseGameView::GetDocument() const
   { return reinterpret_cast<CMFC_MouseGameDoc*>(m_pDocument); }
#endif

