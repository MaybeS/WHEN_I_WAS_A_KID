VERSION 5.00
Begin VB.Form quest 
   BorderStyle     =   4  '���� ���� â
   Caption         =   "Quest"
   ClientHeight    =   5235
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5250
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5235
   ScaleWidth      =   5250
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows �⺻��
   Begin VB.Frame tfa 
      Caption         =   "��������"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3375
      Left            =   120
      TabIndex        =   3
      Top             =   1800
      Width           =   5055
      Begin VB.Timer questtimer 
         Interval        =   1
         Left            =   4560
         Top             =   600
      End
      Begin VB.Timer listtimer 
         Interval        =   1
         Left            =   4560
         Top             =   240
      End
      Begin VB.Label qt 
         BorderStyle     =   1  '���� ����
         Height          =   735
         Left            =   120
         TabIndex        =   6
         Top             =   2520
         Width           =   4815
      End
      Begin VB.Label las 
         BorderStyle     =   1  '���� ����
         Height          =   2175
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   4815
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1695
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   5055
      Begin VB.ListBox questlist 
         Height          =   1320
         ItemData        =   "quest.frx":0000
         Left            =   120
         List            =   "quest.frx":001C
         TabIndex        =   1
         Top             =   240
         Width           =   2775
      End
      Begin VB.Label lat 
         BorderStyle     =   1  '���� ����
         Caption         =   "�⺻����"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3000
         TabIndex        =   4
         Top             =   240
         Width           =   1935
      End
      Begin VB.Label la 
         BorderStyle     =   1  '���� ����
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   3000
         TabIndex        =   2
         Top             =   600
         Width           =   1935
      End
   End
End
Attribute VB_Name = "quest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim qi, que, qus, sst
Private Sub Form_Load()
sst = que
End Sub
Private Sub listtimer_Timer()

gw = map.quest1.Caption
For i = 1 To Len(gw)
  If Mid(gw, i, 1) = ":" Then
  que = Mid(gw, 1, i - 1)
  qus = Mid(gw, i + 1)
  End If
Next i

End Sub

Private Sub questlist_Click()
qi = questlist.ListIndex

If qi = 0 Then
  If que = 0 Then
    la.Caption = "�������� : 1             ���� : Lv1�̻�            ���� �轺Ʈ :����"
    las.Caption = "���������� ã�ư� ����"
    qt.Caption = "[Tip] ���������� �ʱ޳���������1 ���ִ�."
  ElseIf que = 2 Then
    la.Caption = "�������� : 1             ���� : Lv1�̻�            ���� �轺Ʈ :����"
    las.Caption = "��������1�� 5 �������                " & (5 - qus) & "���� ����"
    qt.Caption = "[Tip]ũ��Ƽ�� ��ġ�� ������ ����"
  ElseIf que = 2 And qus >= 5 Then
    la.Caption = "�������� : 1             ���� : Lv1�̻�            ���� �轺Ʈ :����"
    las.Caption = "���������� ���� 1�� ���´� ���������� ã�ư� ����"
    qt.Caption = "[Tip] ���������� �ʱ޳���������1 ���ִ�."
  ElseIf que = 4 Then
    la.Caption = "�������� : 1             ���� : Lv1�̻�            ���� �轺Ʈ :����"
    las.Caption = "��������2�� 7 �������                " & (7 - qus) & "���� ����"
    qt.Caption = "[Tip]��������2�� �������� �����Ƿ� �밡�ٸ� ��� ����,"
  ElseIf que = 4 And qus >= 7 Then
    la.Caption = "�������� : 1             ���� : Lv1�̻�            ���� �轺Ʈ :����"
    las.Caption = "���������� ���� 2�� ���´� ���������� ã�ư� ����"
    qt.Caption = "[Tip] ���������� �ʱ޳���������1 ���ִ�."
  ElseIf que = 6 Then
    la.Caption = "�������� : 1             ���� : Lv1�̻�            ���� �轺Ʈ :����"
    las.Caption = "��������3�� 5 �������                " & (5 - qus) & "���� ����"
    qt.Caption = "[Tip] ���������� �ʱ޳���������1 ���ִ�."
  ElseIf que = 6 And qus >= 5 Then
    la.Caption = "�������� : 1             ���� : Lv1�̻�            ���� �轺Ʈ :����"
    las.Caption = "���������� ���� 3�� ���´� ���������� ã�ư� ����"
    qt.Caption = "[Tip] ���������� �ʱ޳���������1 ���ִ�."
  ElseIf que = 8 Then
    la.Caption = "�������� : 1             ���� : Lv1�̻�            ���� �轺Ʈ :����"
    las.Caption = "���������� 10���� ���                " & (10 - qus) & "���� ����"
    qt.Caption = "[Tip] ���������� �ʱ޳���������1 ���ִ�."
  ElseIf que = 8 And qus >= 10 Then
    la.Caption = "�������� : 1             ���� : Lv1�̻�            ���� �轺Ʈ :����"
    las.Caption = "���������� ���� 4�� ���´� ���������� ã�ư� ����"
    qt.Caption = "[Tip] ���������� �ʱ޳���������1 ���ִ�."
  ElseIf que > 8 Then
    la.Caption = "�������� : 30            ���� : Lv30�̻�           ���� �轺Ʈ :����"
    las.Caption = "���������� ã�ư� ���� ���� ���� ������ ��ٸ����ִ�."
    qt.Caption = "[Tip] ���������� �ʱ޳���������1 ���ִ�."
  End If
ElseIf qi = 1 Then
    la.Caption = "�������� : 10            ���� : Lv10�̻�           ���� �轺Ʈ :����"
    las.Caption = "10�� �Ǹ� �˾Ƽ� ���������� ���ش�. 10�� ���� [Lv" & (10 - Val(map.lv.Caption)) & "����]"
    qt.Caption = "[Tip] ���������� ������ �ϸ� ���� ���� �������� �ϽǼ� �ֽ��ϴ�."
ElseIf qi = 2 Then
    la.Caption = "�غ���"
    las.Caption = "�غ���"
    qt.Caption = "�غ���"
ElseIf qi = 3 Then
    la.Caption = "�غ���"
    las.Caption = "�غ���"
    qt.Caption = "�غ���"
ElseIf qi = 4 Then
    la.Caption = "�غ���"
    las.Caption = "�غ���"
    qt.Caption = "�غ���"
ElseIf qi = 5 Then
    la.Caption = "�غ���"
    las.Caption = "�غ���"
    qt.Caption = "�غ���"
ElseIf qi = 6 Then
    la.Caption = "�غ���"
    las.Caption = "�غ���"
    qt.Caption = "�غ���"
ElseIf qi = 7 Then
    la.Caption = "�غ���"
    las.Caption = "�غ���"
    qt.Caption = "�غ���"
End If

End Sub
Private Sub questtimer_Timer()

If sst <> que Then

If que = 2 Then
questlist.List(0) = "���������� ����1"
ElseIf que = 2 And qus >= 5 Then
questlist.List(0) = "���������� ����1�� ��"
ElseIf que = 4 Then
questlist.List(0) = "���������� ����2"
ElseIf que = 4 And qus >= 7 Then
questlist.List(0) = "���������� ����2�� ��"
ElseIf que = 6 Then
questlist.List(0) = "���������� ����3"
ElseIf que = 6 And qus >= 5 Then
questlist.List(0) = "���������� ����3�� ��"
ElseIf que = 8 Then
questlist.List(0) = "���������� ����4"
ElseIf que = 8 And qus >= 10 Then
questlist.List(0) = "���������� ����4�� ��"
ElseIf que > 8 Then
End If

sst = que

End If

End Sub
