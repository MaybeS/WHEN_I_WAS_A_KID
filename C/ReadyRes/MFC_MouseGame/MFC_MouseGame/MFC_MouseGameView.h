
// MFC_MouseGameView.h : CMFC_MouseGameView Ŭ������ �������̽�
//


#pragma once

#define TARGET_MAX 10 //Ÿ���� ����

class CMFC_MouseGameView : public CView
{
protected: // serialization������ ��������ϴ�.
	CMFC_MouseGameView();
	DECLARE_DYNCREATE(CMFC_MouseGameView)

// Ư���Դϴ�.
public:
	CMFC_MouseGameDoc* GetDocument() const;

// �۾��Դϴ�.
public:
	int m_nScore;
	int m_nLevel;
	int m_nTime;//
	BOOL m_bCheck[TARGET_MAX];//���콺 Ŭ�� üũ
	int m_nSuccess[TARGET_MAX];//������ ȹ���ߴ���(0:���� ȹ�� ���� 1:���� ȹ�� ���� 2:�˻� ��)

	CRect m_rtOkClick[TARGET_MAX];//���콺�� ���� �� ����
	CRect m_rtNoClick[TARGET_MAX];//5������ ���� ���ƾ� �� ����
	int m_nSize[5];//������ ���� ũ�� ����
	
	CBitmap m_CBitMap[7];//
	CPoint  m_ptPoint[TARGET_MAX];//���콺 ���� ��ǥ
	CPoint  m_ptNotTargetPoint[TARGET_MAX];//�� �ٴ��� ���� ��ǥ
	int		m_nNotTargetPointCount;//m_ptNotTargetPoint�� �迭 ���ڸ� ī��Ʈ��

	int m_nRandMove1[TARGET_MAX];//���� 5�� ��� �����̴� Ÿ���� ����
	int m_nRandMove2[TARGET_MAX];
	time_t m_CurrentTime;
	time_t m_OldTime;
	int m_nTargetCount;
	
	void RankName();
// �������Դϴ�.
public:
	virtual void OnDraw(CDC* pDC);  // �� �並 �׸��� ���� �����ǵǾ����ϴ�.
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);

// �����Դϴ�.
public:
	virtual ~CMFC_MouseGameView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// ������ �޽��� �� �Լ�
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

#ifndef _DEBUG  // MFC_MouseGameView.cpp�� ����� ����
inline CMFC_MouseGameDoc* CMFC_MouseGameView::GetDocument() const
   { return reinterpret_cast<CMFC_MouseGameDoc*>(m_pDocument); }
#endif

