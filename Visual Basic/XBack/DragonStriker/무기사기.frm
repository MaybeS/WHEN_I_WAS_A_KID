VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form ������ 
   BorderStyle     =   4  '���� ���� â
   Caption         =   "���ΰ� ��ȭ"
   ClientHeight    =   3390
   ClientLeft      =   2760
   ClientTop       =   3675
   ClientWidth     =   6000
   ControlBox      =   0   'False
   Icon            =   "������.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "������.frx":030A
   ScaleHeight     =   3390
   ScaleWidth      =   6000
   ShowInTaskbar   =   0   'False
   Begin VB.Timer �������� 
      Interval        =   1
      Left            =   4440
      Top             =   3360
   End
   Begin VB.Frame ��Ÿt 
      Height          =   1455
      Left            =   4440
      TabIndex        =   7
      Top             =   1800
      Width           =   1455
      Begin VB.Frame ������2 
         Height          =   495
         Left            =   120
         TabIndex        =   28
         Top             =   840
         Width           =   1215
         Begin VB.Frame ������1 
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   120
            Width           =   975
         End
      End
      Begin VB.Label money 
         Alignment       =   1  '������ ����
         BorderStyle     =   1  '���� ����
         Caption         =   "0"
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
         TabIndex        =   9
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label montext 
         Caption         =   "�����ִµ� :"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame ���� 
      Caption         =   "����"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   120
      TabIndex        =   6
      Top             =   120
      Width           =   4215
      Begin VB.Frame s��������t 
         Caption         =   "��������"
         Height          =   2775
         Left            =   2880
         TabIndex        =   13
         Top             =   240
         Width           =   1215
         Begin VB.Label ȿ��st 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "ȿ��"
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
            TabIndex        =   19
            Top             =   2040
            Width           =   975
         End
         Begin VB.Label ����st 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "����(1)"
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
            TabIndex        =   18
            Top             =   2400
            Width           =   975
         End
         Begin VB.Label psmoney 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "����"
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
            TabIndex        =   17
            Top             =   1680
            Width           =   975
         End
         Begin VB.Label ����t 
            Caption         =   "����:"
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
            TabIndex        =   16
            Top             =   1440
            Width           =   975
         End
         Begin VB.Label ps�� 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ǰ��"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Left            =   120
            TabIndex        =   15
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label ��ǰ��t 
            Caption         =   "��ǰ��:"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   14
            Top             =   960
            Width           =   975
         End
         Begin VB.Image �����̹���s 
            Height          =   465
            Left            =   120
            Top             =   240
            Width           =   225
         End
      End
      Begin VB.Frame s��Ÿ��t 
         Caption         =   "��Ÿ��"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         TabIndex        =   12
         Top             =   2160
         Width           =   2655
         Begin VB.Image ���� 
            Height          =   495
            Index           =   12
            Left            =   720
            Picture         =   "������.frx":0614
            Tag             =   "���"
            ToolTipText     =   "Mp:300"
            Top             =   240
            Width           =   495
         End
         Begin VB.Image ���� 
            Height          =   450
            Index           =   11
            Left            =   1800
            Picture         =   "������.frx":0825
            Tag             =   "�Ϻ���"
            ToolTipText     =   "Mp:1000"
            Top             =   240
            Width           =   390
         End
         Begin VB.Image ���� 
            Height          =   465
            Index           =   10
            Left            =   120
            Picture         =   "������.frx":0A44
            Tag             =   "���޹�"
            ToolTipText     =   "Mp:100"
            Top             =   240
            Width           =   465
         End
         Begin VB.Image ���� 
            Height          =   360
            Index           =   9
            Left            =   1320
            Picture         =   "������.frx":0BBC
            Tag             =   "����"
            ToolTipText     =   "Mp:500"
            Top             =   360
            Width           =   375
         End
      End
      Begin VB.Frame s���İŸ�t 
         Caption         =   "���İŸ�"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         TabIndex        =   11
         Top             =   1200
         Width           =   2655
         Begin VB.Image ���� 
            Height          =   405
            Index           =   8
            Left            =   1920
            Picture         =   "������.frx":0DA4
            Tag             =   "õ�����"
            ToolTipText     =   "Hp:350"
            Top             =   240
            Width           =   405
         End
         Begin VB.Image ���� 
            Height          =   480
            Index           =   5
            Left            =   120
            Picture         =   "������.frx":0ED1
            Tag             =   "��������"
            ToolTipText     =   "Hp:400"
            Top             =   240
            Width           =   480
         End
         Begin VB.Image ���� 
            Height          =   345
            Index           =   6
            Left            =   720
            Picture         =   "������.frx":110C
            Tag             =   "����"
            ToolTipText     =   "Hp:500"
            Top             =   360
            Width           =   465
         End
         Begin VB.Image ���� 
            Height          =   315
            Index           =   7
            Left            =   1320
            Picture         =   "������.frx":1464
            Tag             =   "�����ġ��"
            ToolTipText     =   "Hp:750"
            Top             =   360
            Width           =   375
         End
      End
      Begin VB.Frame s���ǰ�t 
         Caption         =   "���ǰ�"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   2655
         Begin VB.Image ���� 
            Height          =   420
            Index           =   3
            Left            =   840
            Picture         =   "������.frx":162F
            Tag             =   "�Ͼ����"
            ToolTipText     =   "Hp:150"
            Top             =   240
            Width           =   420
         End
         Begin VB.Image ���� 
            Height          =   465
            Index           =   1
            Left            =   120
            Picture         =   "������.frx":17D2
            Tag             =   "�������꽺"
            ToolTipText     =   "Hp:50"
            Top             =   240
            Width           =   225
         End
         Begin VB.Image ���� 
            Height          =   465
            Index           =   2
            Left            =   480
            Picture         =   "������.frx":1C8F
            Tag             =   "�����꽺"
            ToolTipText     =   "Mp:50"
            Top             =   240
            Width           =   225
         End
         Begin VB.Image ���� 
            Height          =   435
            Index           =   4
            Left            =   1440
            Picture         =   "������.frx":215E
            Tag             =   "�λ�����"
            ToolTipText     =   "Hp:1500"
            Top             =   240
            Width           =   465
         End
      End
   End
   Begin VB.Frame �� 
      Caption         =   "��"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   120
      TabIndex        =   5
      Top             =   6600
      Width           =   4215
   End
   Begin VB.Frame �ɼ�t 
      Height          =   1695
      Left            =   4440
      TabIndex        =   1
      Top             =   120
      Width           =   1455
      Begin VB.CommandButton �ȱ� 
         Caption         =   "�ȱ�"
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
         Left            =   120
         TabIndex        =   4
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton ��� 
         Caption         =   "���"
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
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton exit 
         Caption         =   "������"
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
         Left            =   120
         TabIndex        =   2
         Top             =   1200
         Width           =   1215
      End
   End
   Begin VB.Frame ���� 
      Caption         =   "����"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   120
      TabIndex        =   0
      Top             =   3360
      Width           =   4215
      Begin VB.Frame a��������t 
         Caption         =   "��������"
         Height          =   2775
         Left            =   2880
         TabIndex        =   21
         Top             =   240
         Width           =   1215
         Begin VB.Image �����̹���a 
            Height          =   465
            Left            =   120
            Top             =   240
            Width           =   225
         End
         Begin VB.Label Label6 
            Caption         =   "��ǰ��:"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   27
            Top             =   960
            Width           =   975
         End
         Begin VB.Label at�� 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ǰ��"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Left            =   120
            TabIndex        =   26
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label4 
            Caption         =   "����:"
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
            TabIndex        =   25
            Top             =   1440
            Width           =   975
         End
         Begin VB.Label atmoney 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "����"
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
            TabIndex        =   24
            Top             =   1680
            Width           =   975
         End
         Begin VB.Label ���� 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "����"
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
            TabIndex        =   23
            Top             =   2400
            Width           =   975
         End
         Begin VB.Label ȿ��at 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "ȿ��"
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
            TabIndex        =   22
            Top             =   2040
            Width           =   975
         End
      End
      Begin TabDlg.SSTab SSTab1 
         Height          =   2775
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   2565
         _ExtentX        =   4524
         _ExtentY        =   4895
         _Version        =   393216
         Tabs            =   4
         TabsPerRow      =   4
         TabHeight       =   520
         TabCaption(0)   =   "��"
         TabPicture(0)   =   "������.frx":252A
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "��(1)"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).Control(1)=   "��(2)"
         Tab(0).Control(1).Enabled=   0   'False
         Tab(0).Control(2)=   "��(5)"
         Tab(0).Control(2).Enabled=   0   'False
         Tab(0).Control(3)=   "��(3)"
         Tab(0).Control(3).Enabled=   0   'False
         Tab(0).Control(4)=   "��(4)"
         Tab(0).Control(4).Enabled=   0   'False
         Tab(0).Control(5)=   "��(6)"
         Tab(0).Control(5).Enabled=   0   'False
         Tab(0).Control(6)=   "��(9)"
         Tab(0).Control(6).Enabled=   0   'False
         Tab(0).Control(7)=   "��(7)"
         Tab(0).Control(7).Enabled=   0   'False
         Tab(0).Control(8)=   "��(8)"
         Tab(0).Control(8).Enabled=   0   'False
         Tab(0).Control(9)=   "��(10)"
         Tab(0).Control(9).Enabled=   0   'False
         Tab(0).Control(10)=   "��(11)"
         Tab(0).Control(10).Enabled=   0   'False
         Tab(0).ControlCount=   11
         TabCaption(1)   =   "������"
         TabPicture(1)   =   "������.frx":2546
         Tab(1).ControlEnabled=   0   'False
         Tab(1).ControlCount=   0
         TabCaption(2)   =   "Ȱ"
         TabPicture(2)   =   "������.frx":2562
         Tab(2).ControlEnabled=   0   'False
         Tab(2).ControlCount=   0
         TabCaption(3)   =   "�̿ϼ�"
         TabPicture(3)   =   "������.frx":257E
         Tab(3).ControlEnabled=   0   'False
         Tab(3).ControlCount=   0
         Begin VB.Image �� 
            Height          =   375
            Index           =   11
            Left            =   1080
            Picture         =   "������.frx":259A
            Tag             =   "�ı��ǰ�"
            ToolTipText     =   "A+:90"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   10
            Left            =   120
            Picture         =   "������.frx":2CE4
            Tag             =   "�� ���"
            ToolTipText     =   "A+:75"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   8
            Left            =   1080
            Picture         =   "������.frx":33E6
            Tag             =   "������Ż�ҵ�"
            ToolTipText     =   "A+:45"
            Top             =   1680
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   7
            Left            =   120
            Picture         =   "������.frx":3AE8
            Tag             =   "�ͽ����μҵ�"
            ToolTipText     =   "A+:45"
            Top             =   1680
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   9
            Left            =   2040
            Picture         =   "������.frx":41EA
            Tag             =   "���ֹ�����"
            ToolTipText     =   "A+:60"
            Top             =   1680
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   6
            Left            =   2040
            Picture         =   "������.frx":48EC
            Tag             =   "����ŷ�ҵ�"
            ToolTipText     =   "A+:36"
            Top             =   1080
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   4
            Left            =   120
            Picture         =   "������.frx":4FEE
            Tag             =   "�ʰ�ö��"
            ToolTipText     =   "A+:25"
            Top             =   1080
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   3
            Left            =   2040
            Picture         =   "������.frx":56F0
            Tag             =   "��ö��"
            ToolTipText     =   "A+:17"
            Top             =   480
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   5
            Left            =   1080
            Picture         =   "������.frx":5DF2
            Tag             =   "Ȳ��"
            ToolTipText     =   "A+:29"
            Top             =   1080
            Width           =   345
         End
         Begin VB.Image �� 
            Height          =   360
            Index           =   2
            Left            =   1080
            Picture         =   "������.frx":64F4
            Tag             =   "û����"
            ToolTipText     =   "A+:10"
            Top             =   480
            Width           =   360
         End
         Begin VB.Image �� 
            Height          =   330
            Index           =   1
            Left            =   120
            Picture         =   "������.frx":6BF6
            Tag             =   "���"
            ToolTipText     =   "A+:5"
            Top             =   480
            Width           =   345
         End
      End
   End
   Begin VB.Label ind 
      Caption         =   "1"
      Height          =   255
      Left            =   4560
      TabIndex        =   30
      Top             =   4200
      Width           =   1335
   End
End
Attribute VB_Name = "������"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ps, psc, tu, dj, inve

Private Sub ��_Click(Index As Integer)
ind.Caption = Index
i = Index
End Sub
Private Sub ��������_Timer()

inve = Val(ind.Caption)

If map.����üũ.Caption = "����" Then

�����̹���s.Picture = ����(inve).Picture
ps��.Caption = ����(inve).Tag
kr = Mid(����(inve).ToolTipText, 4)
tr = Mid(����(inve).ToolTipText, 1, 2)
ȿ��st.Caption = ����(inve).ToolTipText
If tr = "Hp" Then
tu = kr + (kr / 10)
ps��.ForeColor = &HFF&
ElseIf tr = "Mp" Then
tu = kr * 2
ps��.ForeColor = &HFF0000
End If

ElseIf map.����üũ.Caption = "����" Then

�����̹���a.Picture = ��(inve).Picture
at��.Caption = ��(inve).Tag
kr = Mid(��(inve).ToolTipText, 4)
tr = Mid(��(inve).ToolTipText, 1, 2)
ȿ��at.Caption = ��(inve).ToolTipText
����.Caption = ("Lv " & (Val(ind.Caption) * 5))
  If Val(ind.Caption) = 8 Then
  ����.Caption = ("Lv 35")
  End If
tu = kr * 200 + (Int(kr / 10)) * 50 + (Int(kr / 20)) * 50 + (Int((kr / 45) + 0.5)) * 50

ElseIf map.����üũ.Caption = "��" Then

End If

psmoney.Caption = tu * dj
atmoney.Caption = tu
Money.Caption = inv.Money.Caption

End Sub
Private Sub ���_Click()

If inve = 0 Then
oper = MsgBox("������������ �ּ���", vbCritical, "���ǻ��")
Else

If map.����üũ.Caption = "����" Then
tp = psmoney.Caption: sw = 1
ElseIf map.����üũ.Caption = "����" Then
tp = atmoney.Caption: sw = 2
ElseIf map.����üũ.Caption = "��" Then

End If

If Val(inv.Money.Caption) >= tp Then
inv.Money.Caption = Val(inv.Money.Caption) - tp
  If sw = 1 Then
  inv.����(inve).ToolTipText = Val(inv.����(inve).ToolTipText) + dj
  ElseIf sw = 2 Then
  inv.��(inve).ToolTipText = Val(inv.��(inve).ToolTipText) + 1
  End If
Else
dpk = MsgBox("��尡 �����մϴ�. ��带 Ȯ�����ּ���", vbCritical, "������")
End If

End If

End Sub
Private Sub ����st_Click()
dj = InputBox("������ �Է��ϼ���.(1~1000)", "������ΰ��� ��ȭ")
If 0 < dj And dj < 1001 Then
psc = Int(dj)
����st.Caption = "����(" & dj & ")"
Else
dj = 1
dpk = MsgBox("1~1000�� ������ �Է��ϼ���", vbCritical, "������ΰ��� ��ȭ")
dj = 1
End If
End Sub
Private Sub ����_Click()
If map.����üũ.Caption = "����" Then

End If
End Sub

Private Sub ����_Click(Index As Integer)
ind.Caption = Index
i = Index
End Sub
Private Sub exit_Click()
������.Visible = False
inve = 0
End Sub
Private Sub Form_Load()
dj = 1: tu = 0
End Sub

