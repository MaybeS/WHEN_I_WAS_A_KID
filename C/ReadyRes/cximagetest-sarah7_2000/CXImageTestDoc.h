// CXImageTestDoc.h : CCXImageTestDoc Ŭ������ �������̽�
//


#pragma once

class CCXImageTestDoc : public CDocument
{
protected: // serialization������ ��������ϴ�.
	CCXImageTestDoc();
	DECLARE_DYNCREATE(CCXImageTestDoc)

// Ư��
public:

// �۾�
public:

// ������
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);

// ����
public:
	virtual ~CCXImageTestDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// �޽��� �� �Լ��� �����߽��ϴ�.
protected:
	DECLARE_MESSAGE_MAP()
};


