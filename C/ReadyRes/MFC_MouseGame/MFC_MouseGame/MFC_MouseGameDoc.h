
// MFC_MouseGameDoc.h : CMFC_MouseGameDoc Ŭ������ �������̽�
//


#pragma once


class CMFC_MouseGameDoc : public CDocument
{
protected: // serialization������ ��������ϴ�.
	CMFC_MouseGameDoc();
	DECLARE_DYNCREATE(CMFC_MouseGameDoc)

// Ư���Դϴ�.
public:

// �۾��Դϴ�.
public:

// �������Դϴ�.
public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);

// �����Դϴ�.
public:
	virtual ~CMFC_MouseGameDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// ������ �޽��� �� �Լ�
protected:
	DECLARE_MESSAGE_MAP()
};


