
// MFC_MouseGameView.cpp : CMFC_MouseGameView 클래스의 구현
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
	// 표준 인쇄 명령입니다.
	ON_COMMAND(ID_FILE_PRINT, &CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, &CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, &CMFC_MouseGameView::OnFilePrintPreview)
	ON_WM_CREATE()
	ON_WM_TIMER()
	ON_WM_LBUTTONDOWN()
	ON_WM_RBUTTONDOWN()
END_MESSAGE_MAP()

// CMFC_MouseGameView 생성/소멸

CMFC_MouseGameView::CMFC_MouseGameView()
{
	// TODO: 여기에 생성 코드를 추가합니다.
	
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
	// TODO: CREATESTRUCT cs를 수정하여 여기에서
	//  Window 클래스 또는 스타일을 수정합니다.

	return CView::PreCreateWindow(cs);
}

// CMFC_MouseGameView 그리기

void CMFC_MouseGameView::OnDraw(CDC* pDC)
{
	CMFC_MouseGameDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	// TODO: 여기에 원시 데이터에 대한 그리기 코드를 추가합니다.
	CDC dc,BackDC;
	CBitmap *OldBitmap, BackBitmap;
	CString str;
	CRect rect;
	GetClientRect(&rect);


	//후면 버퍼 생성
	BackBitmap.CreateCompatibleBitmap(pDC, rect.right, rect.bottom);
	BackDC.CreateCompatibleDC(pDC);
	OldBitmap=BackDC.SelectObject(&BackBitmap);
	
	dc.CreateCompatibleDC(pDC);
	
	//배경 출력
	dc.SelectObject(&m_CBitMap[6]);
	BackDC.BitBlt(0, 0, 800, 600, &dc,0,0,SRCCOPY);


	for(int i=0;i < TARGET_MAX;i++)
	{
		if(m_nSuccess[i] == 2)//마우스를 않눌렀을 경우 찍을 그림을 출력
		{		
			//목표 상자 출력
			dc.SelectObject(&m_CBitMap[m_nLevel]);
			BackDC.BitBlt(m_rtOkClick[i].left, m_rtOkClick[i].top,
				m_nSize[m_nLevel],m_nSize[m_nLevel], &dc,0,0,SRCCOPY);

			if(m_nLevel == 4)//레벨 5일 경우 방해 상자 추가 출력
			{	
				dc.SelectObject(&m_CBitMap[5]);
				BackDC.BitBlt(m_rtNoClick[i].left, m_rtNoClick[i].top,
					m_nSize[m_nLevel],m_nSize[m_nLevel], &dc,0,0,SRCCOPY);
			}

			dc.SelectObject(OldBitmap);
		}
		
		//
		if(m_nSuccess[i] == 1)
			str.Format(L"성공");//점수를 먹었다면
		else if(m_nSuccess[i] == 0)
			str.Format(L"실패");//점수가 깍였다면
		if(m_nSuccess[i] < 2)
			BackDC.TextOut(m_ptPoint[i].x, m_ptPoint[i].y, str);//성공 실패 글자 출력		
		
	}

	str.Format(L"실패");
	for(int i=0;i < m_nNotTargetPointCount;i++)
	{
		BackDC.TextOut(m_ptNotTargetPoint[i].x, m_ptNotTargetPoint[i].y, str);//실패 글자 출력		
	}

	str.Format(L"Score : %d Level : %d", m_nScore, m_nLevel+1);
	BackDC.TextOut(100,50, str);
	
	//백버퍼를 전면버퍼로(보이는 화면)
	pDC->BitBlt(0, 0, rect.right, rect.bottom, &BackDC,0,0,SRCCOPY);

	dc.DeleteDC();
	BackDC.DeleteDC();
}


// CMFC_MouseGameView 인쇄


void CMFC_MouseGameView::OnFilePrintPreview()
{
	AFXPrintPreview(this);
}

BOOL CMFC_MouseGameView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// 기본적인 준비
	return DoPreparePrinting(pInfo);
}

void CMFC_MouseGameView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: 인쇄하기 전에 추가 초기화 작업을 추가합니다.
}

void CMFC_MouseGameView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: 인쇄 후 정리 작업을 추가합니다.
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


// CMFC_MouseGameView 진단

#ifdef _DEBUG
void CMFC_MouseGameView::AssertValid() const
{
	CView::AssertValid();
}

void CMFC_MouseGameView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CMFC_MouseGameDoc* CMFC_MouseGameView::GetDocument() const // 디버그되지 않은 버전은 인라인으로 지정됩니다.
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CMFC_MouseGameDoc)));
	return (CMFC_MouseGameDoc*)m_pDocument;
}
#endif //_DEBUG


// CMFC_MouseGameView 메시지 처리기

int CMFC_MouseGameView::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CView::OnCreate(lpCreateStruct) == -1)
		return -1;

	// TODO:  여기에 특수화된 작성 코드를 추가합니다.
	return 0;
}

void CMFC_MouseGameView::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.
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
		GetClientRect(&rect);//클라이언트의 크기를 얻어옴
		
		for(i=0;i < TARGET_MAX;i++)
		{		
			m_rtOkClick[i].left = rand() % (rect.right-128);
			m_rtOkClick[i].top = rand() % (rect.bottom-128);//클라이언트 크기에 맞게 위치 생성
			m_rtOkClick[i].right = m_rtOkClick[i].left + m_nSize[m_nLevel];
			m_rtOkClick[i].bottom = m_rtOkClick[i].top + m_nSize[m_nLevel];//레벨에 맞게 크기 저장
			m_bCheck[i] = FALSE;//마우스 않누룸으로 초기화
			m_nSuccess[i] = 2;//점수를 먹었는지
			
		}
		if(m_nLevel == 4)//레벨 5일 경우 방해 그림의 위치 생성
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
		m_nTargetCount = TARGET_MAX;//타겟의 갯수 초기화
		m_nNotTargetPointCount = 0;

		InvalidateRect(NULL);//화면 갱신
		break;	

	case 1://레벨 5일 경우 비트냅을 움직이게
		int n;
		n = 3;//움직이는 속도

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
		InvalidateRect(NULL);//화면 갱신
		break;
	}
	CView::OnTimer(nIDEvent);
}

void CMFC_MouseGameView::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.
	int nCount = m_nTargetCount;

	for(int i=0;i < TARGET_MAX;i++)
	{	
		if(m_nSuccess[i] == 2)
		{
			if(m_rtOkClick[i].PtInRect(point))//그림의 영역에 마우스가 들어 있다면
			{
				m_nScore += 10;

				if(m_nScore >= 100 && m_nLevel == 0 )
				{
					m_nLevel++;//레벨을 올림
					KillTimer(0);//타이머를 끝냄
					m_nTime -= 200;//타이머 시간을 줄임
					SetTimer(0, m_nTime, NULL);//타이머 다시 시작

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

				}else if(m_nScore >= 500 && m_nLevel == 4 )//500점이 되면 게임 종료
				{				
					KillTimer(0);
					KillTimer(1);//모든 타이머 종료
					time(&m_CurrentTime);
					MessageBox(L"Clear");
					RankName();				
				}			
				m_nSuccess[i] = 1;
				m_nTargetCount--;
				m_ptPoint[i] = point;
			}

			if(m_nLevel == 4)//레벨 5일경우
			{
				if(m_rtNoClick[i].PtInRect(point))//방해 그림의 영역에 마우스가 들어있다면
				{			
					m_nScore -= 10;
					m_nSuccess[i] = 0;
					m_ptPoint[i] = point;
				}

			}
		}
	}
		
	//충돌 검사 후 m_nTargetCount가 값이 변화가 없다면 맨바닥을 찍었음을 나타냄
	if(nCount == m_nTargetCount)
	{		
		m_nScore -= 10;//그림을 찍지 못했을 경우 점수 감소
		
		m_ptNotTargetPoint[m_nNotTargetPointCount++] = point;//찍은 위치 저장				
	}
	

	//m_nScore -= 10;
	//m_nSuccess[i] = 0;
	//m_ptPoint[i] = point;//찍은 위치 저장		
	//InvalidateRect(NULL);

	InvalidateRect(NULL);
	CView::OnLButtonDown(nFlags, point);
}

void CMFC_MouseGameView::OnRButtonDown(UINT nFlags, CPoint point)
{
	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.
	
	CView::OnRButtonDown(nFlags, point);
}

void CMFC_MouseGameView::OnInitialUpdate()
{
	CView::OnInitialUpdate();

	// TODO: 여기에 특수화된 코드를 추가 및/또는 기본 클래스를 호출합니다.
	srand( (unsigned)time( NULL ) );//난수 초기화
	m_nScore = 0;
	m_nLevel = 0;
	m_nTime = 2000;//처음 시간을 2초로 초기화
	
	
	for(int i=0;i < TARGET_MAX;i++)
	{	
		m_bCheck[i] = TRUE;//마우스를 클릭했는지 체크
		m_nSuccess[i] = 2;//점수를 먹었는지
	}

	//난이도에 따른 사이즈
	m_nSize[0] = 128;
	m_nSize[1] = 96;
	m_nSize[2] = 64;
	m_nSize[3] = 48;
	m_nSize[4] = 32;

	//이미지 로딩
	m_CBitMap[0].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP128));
	m_CBitMap[1].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP96));
	m_CBitMap[2].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP64));
	m_CBitMap[3].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP48));
	m_CBitMap[4].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP32));
	m_CBitMap[5].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP_X));
	m_CBitMap[6].LoadBitmap(MAKEINTRESOURCE(IDB_BITMAP_BACK));


	CLevel dlg;

	dlg.DoModal();//레벨을 설정하기 위한 대화상자	
}

void CMFC_MouseGameView::RankName()
{
	CNameDlg dlg;
	
	FILE *fp = fopen("rank.txt", "a");
	
	char str[256];	
	

	if(dlg.DoModal() == IDOK)//이름을 입력 받으면
	{
		USES_CONVERSION;
		strcpy(str, W2A(dlg.m_sEdit.GetBuffer(0)));//유니코드를 멀티바이트로
		fprintf(fp, "%ld초 -> ", m_CurrentTime-m_OldTime);
		fprintf(fp, "%s\n", str);//파일에 저장
		
	}
	fclose(fp);

	CRankDlg rank;//랭킹 보여주는 창 띄움
	rank.DoModal();

	CLevel level;//레벨
	level.DoModal();
}