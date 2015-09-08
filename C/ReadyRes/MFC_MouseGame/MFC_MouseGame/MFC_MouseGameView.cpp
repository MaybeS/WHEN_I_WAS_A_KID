
// MFC_MouseGameView.cpp : CMFC_MouseGameView Ŭ������ ����
//

#include "stdafx.h"
#include "MFC_MouseGame.h"

#include "MFC_MouseGameDoc.h"
#include "MFC_MouseGameView.h"
#include "time.h"
#include "Level.h"
#include "NameDlg.h"
#include "rankdlg.h"
#include <locale.h>
#include <atlconv.h>


#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CMFC_MouseGameView

IMPLEMENT_DYNCREATE(CMFC_MouseGameView, CView)

BEGIN_MESSAGE_MAP(CMFC_MouseGameView, CView)
	// ǥ�� �μ� ����Դϴ�.
	ON_COMMAND(ID_FILE_PRINT, &CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, &CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, &CMFC_MouseGameView::OnFilePrintPreview)
	ON_WM_CREATE()
	ON_WM_TIMER()
	ON_WM_LBUTTONDOWN()
	ON_WM_RBUTTONDOWN()
END_MESSAGE_MAP()

// CMFC_MouseGameView ����/�Ҹ�

CMFC_MouseGameView::CMFC_MouseGameView()
{
	// TODO: ���⿡ ���� �ڵ带 �߰��մϴ�.
	
}	

CMFC_MouseGameView::~CMFC_MouseGameView()
{
	for(int i=0;i < 6;i++)
	{
		DeleteObject(m_CBitMap[i]);		
	}
}

BOOL CMFC_MouseGameView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: CREATESTRUCT cs�� �����Ͽ� ���⿡��
	//  Window Ŭ���� �Ǵ� ��Ÿ���� �����մϴ�.

	return CView::PreCreateWindow(cs);
}

// CMFC_MouseGameView �׸���

void CMFC_MouseGameView::OnDraw(CDC* pDC)
{
	CMFC_MouseGameDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	// TODO: ���⿡ ���� �����Ϳ� ���� �׸��� �ڵ带 �߰��մϴ�.
	CDC dc,BackDC;
	CBitmap *OldBitmap, BackBitmap;
	CString str;
	CRect rect;
	GetClientRect(&rect);


	//�ĸ� ���� ����
	BackBitmap.CreateCompatibleBitmap(pDC, rect.right, rect.bottom);
	BackDC.CreateCompatibleDC(pDC);
	OldBitmap=BackDC.SelectObject(&BackBitmap);
	
	dc.CreateCompatibleDC(pDC);
	
	//��� ���
	dc.SelectObject(&m_CBitMap[6]);
	BackDC.BitBlt(0, 0, 800, 600, &dc,0,0,SRCCOPY);


	for(int i=0;i < TARGET_MAX;i++)
	{
		if(m_nSuccess[i] == 2)//���콺�� �ʴ����� ��� ���� �׸��� ���
		{		
			//��ǥ ���� ���
			dc.SelectObject(&m_CBitMap[m_nLevel]);
			BackDC.BitBlt(m_rtOkClick[i].left, m_rtOkClick[i].top,
				m_nSize[m_nLevel],m_nSize[m_nLevel], &dc,0,0,SRCCOPY);

			if(m_nLevel == 4)//���� 5�� ��� ���� ���� �߰� ���
			{	
				dc.SelectObject(&m_CBitMap[5]);
				BackDC.BitBlt(m_rtNoClick[i].left, m_rtNoClick[i].top,
					m_nSize[m_nLevel],m_nSize[m_nLevel], &dc,0,0,SRCCOPY);
			}

			dc.SelectObject(OldBitmap);
		}
		
		//
		if(m_nSuccess[i] == 1)
			str.Format(L"����");//������ �Ծ��ٸ�
		else if(m_nSuccess[i] == 0)
			str.Format(L"����");//������ �￴�ٸ�
		if(m_nSuccess[i] < 2)
			BackDC.TextOut(m_ptPoint[i].x, m_ptPoint[i].y, str);//���� ���� ���� ���		
		
	}

	str.Format(L"����");
	for(int i=0;i < m_nNotTargetPointCount;i++)
	{
		BackDC.TextOut(m_ptNotTargetPoint[i].x, m_ptNotTargetPoint[i].y, str);//���� ���� ���		
	}

	str.Format(L"Score : %d Level : %d", m_nScore, m_nLevel+1);
	BackDC.TextOut(100,50, str);
	
	//����۸� ������۷�(���̴� ȭ��)
	pDC->BitBlt(0, 0, rect.right, rect.bottom, &BackDC,0,0,SRCCOPY);

	dc.DeleteDC();
	BackDC.DeleteDC();
}


// CMFC_MouseGameView �μ�


void CMFC_MouseGameView::OnFilePrintPreview()
{
	AFXPrintPreview(this);
}

BOOL CMFC_MouseGameView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// �⺻���� �غ�
	return DoPreparePrinting(pInfo);
}

void CMFC_MouseGameView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: �μ��ϱ� ���� �߰� �ʱ�ȭ �۾��� �߰��մϴ�.
}

void CMFC_MouseGameView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: �μ� �� ���� �۾��� �߰��մϴ�.
}

void CMFC_MouseGameView::OnRButtonUp(UINT nFlags, CPoint point)
{
	ClientToScreen(&point);
	OnContextMenu(this, point);
}

void CMFC_MouseGameView::OnContextMenu(CWnd* pWnd, CPoint point)
{
	theApp.GetContextMenuManager()->ShowPopupMenu(IDR_POPUP_EDIT, point.x, point.y, this, TRUE);
}


// CMFC_MouseGameView ����

#ifdef _DEBUG
void CMFC_MouseGameView::AssertValid() const
{
	CView::AssertValid();
}

void CMFC_MouseGameView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CMFC_MouseGameDoc* CMFC_MouseGameView::GetDocument() const // ����׵��� ���� ������ �ζ������� �����˴ϴ�.
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CMFC_MouseGameDoc)));
	return (CMFC_MouseGameDoc*)m_pDocument;
}
#endif //_DEBUG


// CMFC_MouseGameView �޽��� ó����

int CMFC_MouseGameView::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CView::OnCreate(lpCreateStruct) == -1)
		return -1;

	// TODO:  ���⿡ Ư��ȭ�� �ۼ� �ڵ带 �߰��մϴ�.
	return 0;
}

void CMFC_MouseGameView::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰� ��/�Ǵ� �⺻���� ȣ���մϴ�.
	CRect rect;
	int i;

	switch(nIDEvent)
	{
	case 0:
		for(i=0;i < TARGET_MAX;i++)
		{		
			if(!m_bCheck[i])
			{
				//m_nScore -= 10;
			}
		}
		GetClientRect(&rect);//Ŭ���̾�Ʈ�� ũ�⸦ ����
		
		for(i=0;i < TARGET_MAX;i++)
		{		
			m_rtOkClick[i].left = rand() % (rect.right-128);
			m_rtOkClick[i].top = rand() % (rect.bottom-128);//Ŭ���̾�Ʈ ũ�⿡ �°� ��ġ ����
			m_rtOkClick[i].right = m_rtOkClick[i].left + m_nSize[m_nLevel];
			m_rtOkClick[i].bottom = m_rtOkClick[i].top + m_nSize[m_nLevel];//������ �°� ũ�� ����
			m_bCheck[i] = FALSE;//���콺 �ʴ������� �ʱ�ȭ
			m_nSuccess[i] = 2;//������ �Ծ�����
			
		}
		if(m_nLevel == 4)//���� 5�� ��� ���� �׸��� ��ġ ����
		{
			for(i=0;i < TARGET_MAX;i++)
			{			
				m_rtNoClick[i].left = rand() % (rect.right-128);
				m_rtNoClick[i].top = rand() % (rect.bottom-128);
				m_rtNoClick[i].right = m_rtNoClick[i].left + m_nSize[m_nLevel];
				m_rtNoClick[i].bottom = m_rtNoClick[i].top + m_nSize[m_nLevel];

				m_nRandMove1[i] = rand() % 4;
				m_nRandMove2[i] = rand() % 4;
			}
		}
		m_nTargetCount = TARGET_MAX;//Ÿ���� ���� �ʱ�ȭ
		m_nNotTargetPointCount = 0;

		InvalidateRect(NULL);//ȭ�� ����
		break;	

	case 1://���� 5�� ��� ��Ʈ���� �����̰�
		int n;
		n = 3;//�����̴� �ӵ�

		for(i=0;i < TARGET_MAX;i++)
		{		
			switch(m_nRandMove1[i])
			{
			case 0:
				m_rtOkClick[i].left += n;
				m_rtOkClick[i].right += n;
				break;
			case 1:
				m_rtOkClick[i].left -= n;
				m_rtOkClick[i].right -= n;
				break;
			case 2:
				m_rtOkClick[i].top += n;
				m_rtOkClick[i].bottom += n;
				break;
			case 3:
				m_rtOkClick[i].top -= n;
				m_rtOkClick[i].bottom -= n;
				break;
			}
			switch(m_nRandMove2[i])
			{
			case 0:
				m_rtNoClick[i].left += n;
				m_rtNoClick[i].right += n;
				break;
			case 1:
				m_rtNoClick[i].left -= n;
				m_rtNoClick[i].right -= n;
				break;
			case 2:
				m_rtNoClick[i].top += n;
				m_rtNoClick[i].bottom += n;
				break;
			case 3:
				m_rtNoClick[i].top -= n;
				m_rtNoClick[i].bottom -= n;
				break;
			}
		}
		InvalidateRect(NULL);//ȭ�� ����
		break;
	}
	CView::OnTimer(nIDEvent);
}

void CMFC_MouseGameView::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰� ��/�Ǵ� �⺻���� ȣ���մϴ�.
	int nCount = m_nTargetCount;

	for(int i=0;i < TARGET_MAX;i++)
	{	
		if(m_nSuccess[i] == 2)
		{
			if(m_rtOkClick[i].PtInRect(point))//�׸��� ������ ���콺�� ��� �ִٸ�
			{
				m_nScore += 10;

				if(m_nScore >= 100 && m_nLevel == 0 )
				{
					m_nLevel++;//������ �ø�
					KillTimer(0);//Ÿ�̸Ӹ� ����
					m_nTime -= 200;//Ÿ�̸� �ð��� ����
					SetTimer(0, m_nTime, NULL);//Ÿ�̸� �ٽ� ����

				}else if(m_nScore >= 200 && m_nLevel == 1 )
				{
					m_nLevel++;
					KillTimer(0);
					m_nTime -= 200;
					SetTimer(0, m_nTime, NULL);

				}else if(m_nScore >= 300 && m_nLevel == 2 )
				{
					m_nLevel++;
					KillTimer(0);
					m_nTime -= 200;
					SetTimer(0, m_nTime, NULL);

				}else if(m_nScore >= 400 && m_nLevel == 3 )
				{
					m_nLevel++;
					KillTimer(0);
					m_nTime -= 200;
					SetTimer(0, m_nTime, NULL);
					SetTimer(1, 100, NULL);

				}else if(m_nScore >= 500 && m_nLevel == 4 )//500���� �Ǹ� ���� ����
				{				
					KillTimer(0);
					KillTimer(1);//��� Ÿ�̸� ����
					time(&m_CurrentTime);
					MessageBox(L"Clear");
					RankName();				
				}			
				m_nSuccess[i] = 1;
				m_nTargetCount--;
				m_ptPoint[i] = point;
			}

			if(m_nLevel == 4)//���� 5�ϰ��
			{
				if(m_rtNoClick[i].PtInRect(point))//���� �׸��� ������ ���콺�� ����ִٸ�
				{			
					m_nScore -= 10;
					m_nSuccess[i] = 0;
					m_ptPoint[i] = point;
				}

			}
		}
	}
		
	//�浹 �˻� �� m_nTargetCount�� ���� ��ȭ�� ���ٸ� �ǹٴ��� ������� ��Ÿ��
	if(nCount == m_nTargetCount)
	{		
		m_nScore -= 10;//�׸��� ���� ������ ��� ���� ����
		
		m_ptNotTargetPoint[m_nNotTargetPointCount++] = point;//���� ��ġ ����				
	}
	

	//m_nScore -= 10;
	//m_nSuccess[i] = 0;
	//m_ptPoint[i] = point;//���� ��ġ ����		
	//InvalidateRect(NULL);

	InvalidateRect(NULL);
	CView::OnLButtonDown(nFlags, point);
}

void CMFC_MouseGameView::OnRButtonDown(UINT nFlags, CPoint point)
{
	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰� ��/�Ǵ� �⺻���� ȣ���մϴ�.
	
	CView::OnRButtonDown(nFlags, point);
}

void CMFC_MouseGameView::OnInitialUpdate()
{
	CView::OnInitialUpdate();

	// TODO: ���⿡ Ư��ȭ�� �ڵ带 �߰� ��/�Ǵ� �⺻ Ŭ������ ȣ���մϴ�.
	srand( (unsigned)time( NULL ) );//���� �ʱ�ȭ
	m_nScore = 0;
	m_nLevel = 0;
	m_nTime = 2000;//ó�� �ð��� 2�ʷ� �ʱ�ȭ
	
	
	for(int i=0;i < TARGET_MAX;i++)
	{	
		m_bCheck[i] = TRUE;//���콺�� Ŭ���ߴ��� üũ
		m_nSuccess[i] = 2;//������ �Ծ�����
	}

	//���̵��� ���� ������
	m_nSize[0] = 128;
	m_nSize[1] = 96;
	m_nSize[2] = 64;
	m_nSize[3] = 48;
	m_nSize[4] = 32;

	//�̹��� �ε�
	m_CBitMap[0].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP128));
	m_CBitMap[1].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP96));
	m_CBitMap[2].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP64));
	m_CBitMap[3].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP48));
	m_CBitMap[4].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP32));
	m_CBitMap[5].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP_X));
	m_CBitMap[6].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP_BACK));


	CLevel dlg;

	dlg.DoModal();//������ �����ϱ� ���� ��ȭ����	
}

void CMFC_MouseGameView::RankName()
{
	CNameDlg dlg;
	
	FILE *fp = fopen("rank.txt", "a");
	
	char str[256];	
	

	if(dlg.DoModal() == IDOK)//�̸��� �Է� ������
	{
		USES_CONVERSION;
		strcpy(str, W2A(dlg.m_sEdit.GetBuffer(0)));//�����ڵ带 ��Ƽ����Ʈ��
		fprintf(fp, "%ld�� -> ", m_CurrentTime-m_OldTime);
		fprintf(fp, "%s\n", str);//���Ͽ� ����
		
	}
	fclose(fp);

	CRankDlg rank;//��ŷ �����ִ� â ���
	rank.DoModal();

	CLevel level;//����
	level.DoModal();
}