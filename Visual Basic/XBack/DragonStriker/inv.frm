VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form inv 
   BorderStyle     =   4  '���� ���� â
   Caption         =   "�κ��丮 [Ver 3.63402]"
   ClientHeight    =   5595
   ClientLeft      =   9825
   ClientTop       =   6240
   ClientWidth     =   5340
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "������� Bold"
      Size            =   9
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "inv.frx":0000
   MousePointer    =   99  '����� ����
   ScaleHeight     =   5595
   ScaleWidth      =   5340
   ShowInTaskbar   =   0   'False
   Begin VB.Timer tag��� 
      Interval        =   1
      Left            =   0
      Top             =   4680
   End
   Begin VB.Frame �κ��丮t 
      Caption         =   "�κ��丮------------------------------------------------------------------"
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
      Left            =   120
      TabIndex        =   6
      Top             =   0
      Width           =   4815
   End
   Begin VB.Frame moneyttt 
      Height          =   735
      Left            =   0
      TabIndex        =   2
      Top             =   4800
      Width           =   5295
      Begin VB.Label money 
         Alignment       =   1  '������ ����
         BorderStyle     =   1  '���� ����
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   840
         TabIndex        =   5
         Top             =   240
         Width           =   3855
      End
      Begin VB.Label Moneyt 
         Caption         =   "Money :"
         ForeColor       =   &H000080FF&
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   735
      End
      Begin VB.Label moneytt 
         Alignment       =   2  '��� ����
         Caption         =   "��"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   14.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000080FF&
         Height          =   375
         Left            =   4800
         TabIndex        =   3
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.CommandButton �ݱ� 
      BackColor       =   &H000000FF&
      Caption         =   "x"
      Height          =   285
      Left            =   5040
      MaskColor       =   &H000000FF&
      Style           =   1  '�׷���
      TabIndex        =   0
      Top             =   0
      Width           =   300
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   4455
      Left            =   0
      TabIndex        =   1
      Top             =   360
      Width           =   5295
      _ExtentX        =   9340
      _ExtentY        =   7858
      _Version        =   393216
      Tabs            =   4
      TabsPerRow      =   4
      TabHeight       =   520
      TabCaption(0)   =   "���"
      TabPicture(0)   =   "inv.frx":030A
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "SSTab2"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "fw1121"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "�Һ�"
      TabPicture(1)   =   "inv.frx":0326
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "t����t"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "ȭ��ttt"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).ControlCount=   2
      TabCaption(2)   =   "��Ÿ"
      TabPicture(2)   =   "inv.frx":0342
      Tab(2).ControlEnabled=   0   'False
      Tab(2).ControlCount=   0
      TabCaption(3)   =   "��ų��"
      TabPicture(3)   =   "inv.frx":035E
      Tab(3).ControlEnabled=   0   'False
      Tab(3).ControlCount=   0
      Begin VB.Frame fw1121 
         Caption         =   "ã������ ���"
         Height          =   3975
         Left            =   3360
         TabIndex        =   13
         Top             =   360
         Width           =   1815
         Begin VB.Label ���� 
            Alignment       =   1  '������ ����
            Caption         =   "0"
            Height          =   255
            Left            =   1080
            TabIndex        =   19
            Top             =   3000
            Width           =   495
         End
         Begin VB.Label ����ttt 
            Caption         =   "���ݼӵ�:"
            Height          =   255
            Left            =   120
            TabIndex        =   18
            Top             =   3000
            Width           =   855
         End
         Begin VB.Label �˸� 
            Alignment       =   1  '������ ����
            Caption         =   "            "
            Height          =   255
            Left            =   480
            TabIndex        =   17
            Top             =   2040
            Width           =   1215
         End
         Begin VB.Label �˸�ttt 
            Caption         =   "�˸�:"
            Height          =   255
            Left            =   120
            TabIndex        =   16
            Top             =   2040
            Width           =   495
         End
         Begin VB.Label ������ݷ� 
            Alignment       =   1  '������ ����
            Caption         =   "0"
            Height          =   255
            Left            =   720
            TabIndex        =   15
            Top             =   2520
            Width           =   855
         End
         Begin VB.Label ���ݷ�tttt 
            Caption         =   "���ݷ�:"
            Height          =   255
            Left            =   120
            TabIndex        =   14
            Top             =   2520
            Width           =   615
         End
         Begin VB.Image ���빫�� 
            BorderStyle     =   1  '���� ����
            Height          =   1575
            Left            =   120
            Picture         =   "inv.frx":037A
            Stretch         =   -1  'True
            Top             =   360
            Width           =   1575
         End
      End
      Begin TabDlg.SSTab SSTab2 
         Height          =   3855
         Left            =   120
         TabIndex        =   9
         Top             =   480
         Width           =   3135
         _ExtentX        =   5530
         _ExtentY        =   6800
         _Version        =   393216
         Tabs            =   4
         TabsPerRow      =   4
         TabHeight       =   520
         TabCaption(0)   =   "��"
         TabPicture(0)   =   "inv.frx":68CF0
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "��(11)"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).Control(1)=   "��(10)"
         Tab(0).Control(1).Enabled=   0   'False
         Tab(0).Control(2)=   "��(8)"
         Tab(0).Control(2).Enabled=   0   'False
         Tab(0).Control(3)=   "��(7)"
         Tab(0).Control(3).Enabled=   0   'False
         Tab(0).Control(4)=   "��(9)"
         Tab(0).Control(4).Enabled=   0   'False
         Tab(0).Control(5)=   "��(6)"
         Tab(0).Control(5).Enabled=   0   'False
         Tab(0).Control(6)=   "��(4)"
         Tab(0).Control(6).Enabled=   0   'False
         Tab(0).Control(7)=   "��(3)"
         Tab(0).Control(7).Enabled=   0   'False
         Tab(0).Control(8)=   "��(5)"
         Tab(0).Control(8).Enabled=   0   'False
         Tab(0).Control(9)=   "��(2)"
         Tab(0).Control(9).Enabled=   0   'False
         Tab(0).Control(10)=   "��(1)"
         Tab(0).Control(10).Enabled=   0   'False
         Tab(0).ControlCount=   11
         TabCaption(1)   =   "������"
         TabPicture(1)   =   "inv.frx":68D0C
         Tab(1).ControlEnabled=   0   'False
         Tab(1).ControlCount=   0
         TabCaption(2)   =   "Ȱ"
         TabPicture(2)   =   "inv.frx":68D28
         Tab(2).ControlEnabled=   0   'False
         Tab(2).ControlCount=   0
         TabCaption(3)   =   "�غ���"
         TabPicture(3)   =   "inv.frx":68D44
         Tab(3).ControlEnabled=   0   'False
         Tab(3).ControlCount=   0
         Begin VB.Image �� 
            Height          =   330
            Index           =   1
            Left            =   360
            Picture         =   "inv.frx":68D60
            Tag             =   "���"
            ToolTipText     =   "0"
            Top             =   600
            Width           =   345
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   2
            Left            =   1560
            Picture         =   "inv.frx":693D2
            Tag             =   "û����"
            ToolTipText     =   "0"
            Top             =   600
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   5
            Left            =   1560
            Picture         =   "inv.frx":69AD4
            Tag             =   "Ȳ��"
            ToolTipText     =   "0"
            Top             =   1440
            Width           =   345
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   3
            Left            =   2640
            Picture         =   "inv.frx":6A1D6
            Tag             =   "��ö��"
            ToolTipText     =   "0"
            Top             =   600
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   4
            Left            =   360
            Picture         =   "inv.frx":6A8D8
            Tag             =   "�ʰ�ö��"
            ToolTipText     =   "0"
            Top             =   1440
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   6
            Left            =   2640
            Picture         =   "inv.frx":6AFDA
            Tag             =   "����ŷ�ҵ�"
            ToolTipText     =   "0"
            Top             =   1440
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   9
            Left            =   2640
            Picture         =   "inv.frx":6B6DC
            Tag             =   "���ֹ�����"
            ToolTipText     =   "0"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   7
            Left            =   360
            Picture         =   "inv.frx":6BDDE
            Tag             =   "�ͽ����μҵ�"
            ToolTipText     =   "0"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   8
            Left            =   1560
            Picture         =   "inv.frx":6C4E0
            Tag             =   "������Ż�ҵ�"
            ToolTipText     =   "0"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   10
            Left            =   360
            Picture         =   "inv.frx":6CBE2
            Tag             =   "�� ���"
            ToolTipText     =   "0"
            Top             =   3120
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   375
            Index           =   11
            Left            =   1560
            Picture         =   "inv.frx":6D2E4
            Tag             =   "�ı��ǰ�"
            ToolTipText     =   "0"
            Top             =   3120
            Width           =   360
         End
      End
      Begin VB.Frame ȭ��ttt 
         Caption         =   "ȭ��"
         Height          =   3735
         Left            =   -71640
         TabIndex        =   8
         Top             =   480
         Width           =   1815
         Begin VB.Frame �������ȭ��ttt 
            Caption         =   "�������ȭ��"
            Height          =   975
            Left            =   120
            TabIndex        =   10
            Top             =   240
            Width           =   1575
            Begin VB.Label ȭ��� 
               Caption         =   "9"
               Height          =   255
               Left            =   840
               TabIndex        =   12
               Top             =   600
               Width           =   615
            End
            Begin VB.Label ���ݷ�ttt 
               Caption         =   "���ݷ� : "
               Height          =   255
               Left            =   120
               TabIndex        =   11
               Top             =   600
               Width           =   615
            End
            Begin VB.Image arr 
               Height          =   255
               Left            =   120
               ToolTipText     =   "1"
               Top             =   240
               Width           =   1215
            End
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   8
            Left            =   1800
            Picture         =   "inv.frx":6DA2E
            ToolTipText     =   "1"
            Top             =   3240
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   7
            Left            =   1800
            Picture         =   "inv.frx":6DAC5
            ToolTipText     =   "1"
            Top             =   2640
            Width           =   1065
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   6
            Left            =   1800
            Picture         =   "inv.frx":6DB6B
            ToolTipText     =   "1"
            Top             =   2040
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   5
            Left            =   1800
            Picture         =   "inv.frx":6DC01
            ToolTipText     =   "100"
            Top             =   1440
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   4
            Left            =   120
            Picture         =   "inv.frx":6DC6C
            ToolTipText     =   "0"
            Top             =   3240
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   3
            Left            =   120
            Picture         =   "inv.frx":6DD02
            ToolTipText     =   "0"
            Top             =   2640
            Width           =   1065
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   2
            Left            =   120
            Picture         =   "inv.frx":6DDA8
            ToolTipText     =   "0"
            Top             =   2040
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   1
            Left            =   120
            Picture         =   "inv.frx":6DE3E
            ToolTipText     =   "0"
            Top             =   1440
            Width           =   945
         End
      End
      Begin VB.Frame t����t 
         Caption         =   "����"
         Height          =   3735
         Left            =   -74880
         TabIndex        =   7
         Top             =   480
         Width           =   3135
         Begin VB.Timer Timer1 
            Interval        =   1
            Left            =   1920
            Top             =   3120
         End
         Begin VB.Image ���� 
            Height          =   450
            Index           =   11
            Left            =   1680
            Picture         =   "inv.frx":6DEAA
            Tag             =   "77m1000"
            ToolTipText     =   "0"
            Top             =   2040
            Width           =   390
         End
         Begin VB.Image ���� 
            Height          =   405
            Index           =   8
            Left            =   2400
            Picture         =   "inv.frx":6E0C9
            Tag             =   "74h350"
            ToolTipText     =   "0"
            Top             =   1200
            Width           =   405
         End
         Begin VB.Image ���� 
            Height          =   465
            Index           =   9
            Left            =   240
            Picture         =   "inv.frx":6E1F6
            Tag             =   "75m100"
            ToolTipText     =   "0"
            Top             =   2040
            Width           =   465
         End
         Begin VB.Image ���� 
            Height          =   435
            Index           =   4
            Left            =   2400
            Picture         =   "inv.frx":6E36E
            Tag             =   "68h1500"
            ToolTipText     =   "0"
            Top             =   360
            Width           =   465
         End
         Begin VB.Image ���� 
            Height          =   480
            Index           =   5
            Left            =   240
            Picture         =   "inv.frx":6E73A
            Tag             =   "70h400"
            ToolTipText     =   "0"
            Top             =   1200
            Width           =   480
         End
         Begin VB.Image ���� 
            Height          =   465
            Index           =   2
            Left            =   840
            Picture         =   "inv.frx":6E975
            Tag             =   "66m50"
            ToolTipText     =   "0"
            Top             =   360
            Width           =   225
         End
         Begin VB.Image ���� 
            Height          =   465
            Index           =   1
            Left            =   240
            Picture         =   "inv.frx":6EE44
            Tag             =   "65h50"
            ToolTipText     =   "0"
            Top             =   360
            Width           =   225
         End
         Begin VB.Image ���� 
            Height          =   420
            Index           =   3
            Left            =   1560
            Picture         =   "inv.frx":6F301
            Tag             =   "67h150"
            ToolTipText     =   "0"
            Top             =   360
            Width           =   420
         End
         Begin VB.Image ���� 
            Height          =   360
            Index           =   10
            Left            =   960
            Picture         =   "inv.frx":6F4A4
            Tag             =   "76m500"
            ToolTipText     =   "0"
            Top             =   2160
            Width           =   375
         End
         Begin VB.Image ���� 
            Height          =   345
            Index           =   7
            Left            =   1560
            Picture         =   "inv.frx":6F68C
            Tag             =   "72h750"
            ToolTipText     =   "0"
            Top             =   1320
            Width           =   465
         End
         Begin VB.Image ���� 
            Height          =   495
            Index           =   12
            Left            =   2400
            Picture         =   "inv.frx":6F9E4
            Tag             =   "78m300"
            ToolTipText     =   "0"
            Top             =   2040
            Width           =   495
         End
         Begin VB.Image ���� 
            Height          =   315
            Index           =   6
            Left            =   960
            Picture         =   "inv.frx":6FBF5
            Tag             =   "71h500"
            ToolTipText     =   "0"
            Top             =   1320
            Width           =   375
         End
      End
   End
End
Attribute VB_Name = "inv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim i
Private Sub ��_Click(Index As Integer)
���빫��.Picture = ��(Index).Picture
�˸�.Caption = ��(Index).Tag
������ݷ�.Caption = Mid(������.��(Index).ToolTipText, 4)
  If Index = 1 Then
  ����.Caption = "����"
  ElseIf Index = 2 Then
  ����.Caption = "����"
  ElseIf Index = 3 Then
  ����.Caption = "����"
  ElseIf Index = 4 Then
  ����.Caption = "����"
  ElseIf Index = 5 Then
  ����.Caption = "����"
  ElseIf Index = 6 Then
  ����.Caption = "����"
  ElseIf Index = 7 Then
  ����.Caption = "����"
  ElseIf Index = 8 Then
  ����.Caption = "����"
  ElseIf Index = 9 Then
  ����.Caption = "����"
  ElseIf Index = 10 Then
  ����.Caption = "����"
  ElseIf Index = 11 Then
  ����.Caption = "����"
  End If
End Sub

Private Sub �ݱ�_Click()
inv.Visible = False
End Sub
Private Sub ����_Click(Index As Integer)

tr = Index

If Val(����(tr).ToolTipText) > 0 Then

yu = Mid(����(tr).Tag, 3, 1)
se = Mid(����(tr).Tag, 4)

If yu = "m" Then

  If (Val(map.mpn.Caption) + Val(se)) > Val(map.mpm.Caption) Then
  map.mpn.Caption = Val(map.mpn.Caption) + Val(se)
  cmp = map.mpn.Caption
  Else
  map.mpn.Caption = Val(map.mpm.Caption) + Val(se)
  cmp = map.mpn.Caption
  End If
  
ElseIf yu = "h" Then

  If Val(map.hpn.Caption) + Val(se) > Val(map.hpm.Caption) Then
  map.hpn.Caption = Val(map.hpn.Caption) + Val(se)
  chp = map.hpn.Caption
  Else
  map.hpn.Caption = Val(map.hpn.Caption) + Val(se)
  chp = map.hpn.Caption
  End If
  
End If


����(tr).ToolTipText = (Val(����(tr).ToolTipText) - 1)

End If

End Sub

Private Sub arrow_Click(Index As Integer)
  i = Index
If arrow(i).ToolTipText > 0 Then
 arr.Tag = 1
  arr.ToolTipText = Index
  arr.Picture = arrow(i).Picture
  ȭ���.Caption = (i * 10) - Int((i * 10) / 10) - Int((i * 10) / 20) - Int((i * 10) / 30) - Int((i * 10) / 40)
Else
djwp = MsgBox("�����Ͻ� ȭ���� ������ 0 �̸� �Դϴ�.", vbCritical, "ȭ�����00FFTS")
End If

End Sub
Private Sub Form_Load()
  i = 1
If arrow(i).ToolTipText >= 0 Then
  arr.Tag = 1
  arr.ToolTipText = 1
  arr.Picture = arrow(i).Picture
  ȭ���.Caption = (i * 10) - Int((i * 10) / 10) - Int((i * 10) / 20) - Int((i * 10) / 30) - Int((i * 10) / 40)
Else
djwp = MsgBox("�����Ͻ� ȭ���� ������ 0 �̸� �Դϴ�.", vbCritical, "ȭ�����00FFTS")
End If

End Sub

Private Sub Timer1_Timer()
cnt = 0
For i = 1 To 4
cnt = cnt + arrow(i).ToolTipText
Next i
If cnt = 0 Then
arr.Tag = 0
End If
End Sub
