VERSION 5.00
Begin VB.Form login 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'ũ�� ���� ��ȭ ����
   Caption         =   "Login Page MayTryArk ::: FlyToSky:::"
   ClientHeight    =   4065
   ClientLeft      =   135
   ClientTop       =   690
   ClientWidth     =   7095
   Icon            =   "Form.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "Form.frx":11C2
   MousePointer    =   99  '����� ����
   ScaleHeight     =   4065
   ScaleWidth      =   7095
   ShowInTaskbar   =   0   'False
   Begin VB.Frame sdfaaa 
      Height          =   4050
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7080
      Begin VB.Timer ��¦ 
         Interval        =   500
         Left            =   4200
         Top             =   3600
      End
      Begin VB.CommandButton �ݱ� 
         BackColor       =   &H000000FF&
         Caption         =   "x"
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
         Left            =   4440
         MaskColor       =   &H000000FF&
         Style           =   1  '�׷���
         TabIndex        =   35
         Top             =   120
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.CommandButton �ø��� 
         Caption         =   "��"
         Height          =   255
         Left            =   8400
         TabIndex        =   34
         Top             =   3600
         Width           =   255
      End
      Begin VB.CommandButton ������ 
         Caption         =   "��"
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
         Left            =   8640
         TabIndex        =   33
         Top             =   3600
         Width           =   255
      End
      Begin VB.Frame ĳ������ 
         Caption         =   "ĳ���� ����"
         Height          =   1695
         Left            =   120
         TabIndex        =   25
         Top             =   5160
         Width           =   4455
         Begin VB.CommandButton Command8 
            Caption         =   "Game Start"
            Height          =   375
            Left            =   120
            TabIndex        =   27
            Top             =   1320
            Width           =   2055
         End
         Begin VB.CommandButton Command6 
            Caption         =   "���� ����"
            Height          =   375
            Left            =   2160
            TabIndex        =   26
            Top             =   1320
            Width           =   1695
         End
         Begin VB.Label Label8 
            Caption         =   "���̵� :"
            BeginProperty Font 
               Name            =   "����"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   840
            Width           =   975
         End
         Begin VB.Label Label9 
            Caption         =   "���� :"
            BeginProperty Font 
               Name            =   "����"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   28
            Top             =   360
            Width           =   735
         End
      End
      Begin VB.Frame ���� 
         Caption         =   "����"
         Height          =   1695
         Left            =   120
         TabIndex        =   20
         Top             =   5160
         Width           =   4455
         Begin VB.CommandButton Command7 
            Caption         =   "Game Start"
            Height          =   375
            Left            =   120
            TabIndex        =   22
            Top             =   1320
            Width           =   2055
         End
         Begin VB.CommandButton Command9 
            Caption         =   "ĳ���� ���� ����"
            Height          =   375
            Left            =   2160
            TabIndex        =   21
            Top             =   1320
            Width           =   1695
         End
         Begin VB.Label Label10 
            BorderStyle     =   1  '���� ����
            Caption         =   "��ġ�ȳ��� : ����"
            BeginProperty Font 
               Name            =   "����ü"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            TabIndex        =   24
            Top             =   960
            Width           =   4215
         End
         Begin VB.Label Label11 
            BorderStyle     =   1  '���� ����
            Caption         =   "::: Beta �׽��� ����:::       ��۹ٶ�"
            BeginProperty Font 
               Name            =   "����ü"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   615
            Left            =   120
            TabIndex        =   23
            Top             =   240
            Width           =   4215
         End
      End
      Begin VB.CommandButton Command5 
         BackColor       =   &H000000FF&
         Caption         =   "����"
         Height          =   375
         Left            =   5640
         MaskColor       =   &H000000FF&
         Style           =   1  '�׷���
         TabIndex        =   19
         Top             =   3600
         Width           =   1335
      End
      Begin VB.CommandButton Command3 
         Caption         =   "���̵����"
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
         Left            =   2520
         TabIndex        =   17
         Top             =   3360
         Width           =   1095
      End
      Begin VB.CommandButton Command2 
         Caption         =   "���������"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   14
         Top             =   3120
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Ȯ��"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1440
         Picture         =   "Form.frx":14CC
         TabIndex        =   13
         Top             =   3120
         Width           =   975
      End
      Begin VB.Frame fl 
         Caption         =   "�α���"
         Height          =   1695
         Left            =   120
         TabIndex        =   8
         Top             =   1320
         Width           =   4455
         Begin VB.TextBox Text2 
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   18
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            IMEMode         =   3  '��� ����
            Left            =   1080
            MouseIcon       =   "Form.frx":17D6
            PasswordChar    =   "*"
            TabIndex        =   12
            Top             =   960
            Width           =   3255
         End
         Begin VB.TextBox Text1 
            DragIcon        =   "Form.frx":21E0
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   18
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1080
            MouseIcon       =   "Form.frx":2BEA
            TabIndex        =   11
            Top             =   240
            Width           =   3255
         End
         Begin VB.Label Label2 
            Caption         =   "PW"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   20.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   120
            TabIndex        =   10
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label1 
            Caption         =   "ID"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   20.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   120
            TabIndex        =   9
            Top             =   240
            Width           =   375
         End
      End
      Begin VB.Timer Timer1 
         Interval        =   1000
         Left            =   -240
         Top             =   3840
      End
      Begin VB.Label ep 
         BorderStyle     =   1  '���� ����
         Caption         =   $"Form.frx":35F4
         Height          =   3495
         Left            =   4680
         TabIndex        =   32
         Top             =   120
         Visible         =   0   'False
         Width           =   4215
      End
      Begin VB.Label episode 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "Episode"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   4680
         TabIndex        =   31
         ToolTipText     =   "IEpisodeI"
         Top             =   3600
         Width           =   855
      End
      Begin VB.Label Label5 
         BorderStyle     =   1  '���� ����
         Caption         =   "Update"
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
         Left            =   3720
         TabIndex        =   30
         Top             =   3360
         Width           =   615
      End
      Begin VB.Label ar 
         Caption         =   "  "
         Height          =   255
         Left            =   4920
         TabIndex        =   18
         Top             =   5000
         Width           =   495
      End
      Begin VB.Label Label4 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   11.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4200
         TabIndex        =   16
         Top             =   3000
         Width           =   375
      End
      Begin VB.Label Label3 
         Caption         =   "�˻��Ⱦ��̵� ��:"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   11.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2520
         TabIndex        =   15
         Top             =   3000
         Width           =   1695
      End
      Begin VB.Label lblCompanyProduct 
         AutoSize        =   -1  'True
         Caption         =   "MayTryArk"
         BeginProperty Font 
            Name            =   "����"
            Size            =   18
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   465
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   1905
      End
      Begin VB.Label lblProductName 
         AutoSize        =   -1  'True
         Caption         =   "DragonStriker��"
         BeginProperty Font 
            Name            =   "����"
            Size            =   24
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   630
         Left            =   360
         TabIndex        =   6
         Top             =   720
         Width           =   3720
      End
      Begin VB.Label lblPlatform 
         Alignment       =   1  '������ ����
         AutoSize        =   -1  'True
         Caption         =   "::DragonStriker::"
         BeginProperty Font 
            Name            =   "����"
            Size            =   15.75
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   4650
         TabIndex        =   5
         Top             =   2280
         Width           =   2340
      End
      Begin VB.Label lblVersion 
         Alignment       =   1  '������ ����
         AutoSize        =   -1  'True
         Caption         =   "Beta Ver[0.1.42]"
         BeginProperty Font 
            Name            =   "����"
            Size            =   12
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   4875
         TabIndex        =   4
         Top             =   2640
         Width           =   2055
      End
      Begin VB.Label lblWarning 
         Caption         =   "Copyright��2009 [DragonStriker] All rights Reserved"
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   3720
         Width           =   4575
      End
      Begin VB.Label lblCompany 
         Caption         =   "ȸ�� : Algokorea"
         Height          =   255
         Left            =   5520
         TabIndex        =   2
         Top             =   3360
         Width           =   1455
      End
      Begin VB.Label lblCopyright 
         Caption         =   "���۱� : jiun0623   ���۱� : heonsheen"
         Height          =   375
         Left            =   5280
         TabIndex        =   1
         Top             =   3000
         Width           =   1695
      End
      Begin VB.Image imgLogo 
         BorderStyle     =   1  '���� ����
         Height          =   2025
         Left            =   4680
         Picture         =   "Form.frx":3B26
         Stretch         =   -1  'True
         Top             =   240
         Width           =   2295
      End
   End
   Begin VB.Menu MakeID 
      Caption         =   "���̵����"
      Index           =   1
   End
   Begin VB.Menu DelID 
      Caption         =   "���̵����"
      Index           =   2
   End
   Begin VB.Menu Updatedate 
      Caption         =   "Update"
      Index           =   3
   End
   Begin VB.Menu EpisodeTxt 
      Caption         =   "Episode"
      Index           =   4
   End
End
Attribute VB_Name = "login"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ed
Private Sub ������_Click()

If ep.Top >= -1320 Then
ep.Top = (ep.Top) - 160
ep.Height = (ep.Height) + 160
End If

End Sub

Private Sub �ݱ�_Click()

ep.Visible = False
sdfaaa.Width = 7080
login.Width = 7260
�ݱ�.Visible = False

End Sub

Private Sub ��¦_Timer()
If episode.ToolTipText = "IEpisodeI" Then
episode.ForeColor = &HFFFF&
episode.ToolTipText = "lEpisodel"
ElseIf episode.ToolTipText = "lEpisodel" Then
episode.ForeColor = &H0&
episode.ToolTipText = "IEpisodeI"
End If
End Sub

Private Sub �ø���_Click()

If ep.Top < 120 Then

ep.Top = (ep.Top) + 160
ep.Height = (ep.Height) - 160

End If

End Sub

Private Sub Command1_Click()

If Command1.Caption = "Ȯ��" Then


Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3

Input #1, a1, a2
Input #2, b1, b2
Input #3, c1, c2

If Text1.Text = a1 And Text2.Text = a2 Then
ed = a1
ar.Caption = 1
fl.Top = 5000
����.Top = 1320
ĳ������.Top = 5000
Command1.Caption = "�α׾ƿ�"
Command2.Caption = "��������"
ElseIf Text1.Text = b1 And Text2.Text = b2 Then
ed = b1
ar.Caption = 2
fl.Top = 5000
����.Top = 1320
ĳ������.Top = 5000
Command1.Caption = "�α׾ƿ�"
Command2.Caption = "��������"
ElseIf Text1.Text = c1 And Text2.Text = c2 Then
ed = c1
ar.Caption = 3
fl.Top = 5000
����.Top = 1320
ĳ������.Top = 5000
Command1.Caption = "�α׾ƿ�"
Command2.Caption = "��������"
Else

djee = MsgBox("���̵� ��й�ȣ�� �����ʽ��ϴ�.", vbCritical, "����02FESED55")

End If

Close #1, #2, #3

ElseIf Command1.Caption = "�α׾ƿ�" Then

fl.Top = 1320
����.Top = 5000
ĳ������.Top = 5000
Command1.Caption = "Ȯ��"
Command2.Caption = "���������"

End If

End Sub

Private Sub Command2_Click()

If Command2.Caption = "���������" Then

If Label4.Caption <> "3" Then

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Input #1, a
If a = "1" Then
Close #1
Open "C:\Program Files\DragonStriker\ip1.dll" For Output As #1
id = InputBox("���̵� �����ÿ�", "��������1�ܰ�")
If Len(id) >= 4 Then
pw = InputBox("��й�ȣ�� �����ÿ�", "��������2�ܰ�")
If Len(pw) >= 4 Then
na = InputBox("�̸��� �����ÿ�", "��������3�ܰ�")
If Len(na) >= 2 Then
Print #1, id
Print #1, pw
Print #1, na
Label4.Caption = Label4.Caption + "1"
exe = MsgBox("�Ϸ�Ǿ����ϴ�.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #1, "1"
Print #1, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #1, "1"
Print #1, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #1, "1"
Print #1, "1"
End If
Close #1, #2, #3

Else
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Input #2, a
If a = "1" Then
Close #2
Open "C:\Program Files\DragonStriker\ip2.dll" For Output As #2
id = InputBox("���̵� �����ÿ�", "��������1�ܰ�")
If Len(id) >= 4 Then
pw = InputBox("��й�ȣ�� �����ÿ�", "��������2�ܰ�")
If Len(pw) >= 4 Then
na = InputBox("�̸��� �����ÿ�", "��������3�ܰ�")
If Len(na) >= 2 Then
Print #2, id
Print #2, pw
Print #2, na
Label4.Caption = Label4.Caption + 1
exe = MsgBox("�Ϸ�Ǿ����ϴ�.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
Input #3, a
If a = "1" Then
Close #3
Open "C:\Program Files\DragonStriker\ip3.dll" For Output As #3
id = InputBox("���̵� �����ÿ�", "��������1�ܰ�")
If Len(id) >= 4 Then
pw = InputBox("��й�ȣ�� �����ÿ�", "��������2�ܰ�")
If Len(pw) >= 4 Then
na = InputBox("�̸��� �����ÿ�", "��������3�ܰ�")
If Len(na) >= 2 Then
Print #3, id
Print #3, pw
Print #3, na
Label4.Caption = Label4.Caption + 1
exe = MsgBox("�Ϸ�Ǿ����ϴ�.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
Close #1, #2, #3

End If
End If
Close #1, #2, #3
End If

Close #1, #2, #3
ElseIf Command2.Caption = "��������" Then

ElseIf Label4.Caption = 3 Then

elo = MsgBox("���̵��ǰ����� 3���� ������ �����ϴ�", vbCritical, "���̵� 3/3 ���� 0022FF09")

End If

ElseIf Command2.Caption = "��������" Then

If ar.Caption = 1 Then
rt = ed
ElseIf ar.Caption = 2 Then
rt = ed
ElseIf ar.Caption = 3 Then
rt = ed
End If

guswo = MsgBox("���� �̰���(" & ed & ")��(��) �����Ͻðڽ��ϱ�?", vbYesNo, "��������_ N/Y")

If guswo = 6 Then

If ar.Caption = 1 Then
Open "C:\Program Files\DragonStriker\ip1.dll" For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave1.dll" For Output As #1
Print #1, 1: Print #1, "�ʺ���": Print #1, 0: Print #1, 50: Print #1, 50: Print #1, 25: Print #1, 25: Print #1, "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��": Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0

Close #1, #2, #3

Label4.Caption = Label4.Caption - 1
ElseIf ar.Caption = 2 Then
Open "C:\Program Files\DragonStriker\ip2.dll" For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave2.dll" For Output As #2
Print #2, 1: Print #2, "�ʺ���": Print #2, 0: Print #2, 50: Print #2, 50: Print #2, 25: Print #2, 25: Print #2, "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��": Print #2, 5: Print #2, 5: Print #2, 5: Print #2, 5: Print #2, 0: Print #2, 0: Print #2, 0: Print #2, 0: Print #2, 0: Print #2, 0

Close #1, #2, #3

Label4.Caption = Label4.Caption - 1
ElseIf ar.Caption = 3 Then
Open "C:\Program Files\DragonStriker\ip3.dll" For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave3.dll" For Output As #3
Print #3, 1: Print #3, "�ʺ���": Print #3, 0: Print #3, 50: Print #3, 50: Print #3, 25: Print #3, 25: Print #3, "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��": Print #3, 5: Print #3, 5: Print #3, 5: Print #3, 5: Print #3, 0: Print #3, 0: Print #3, 0: Print #3, 0: Print #3, 0: Print #3, 0

Close #1, #2, #3
Label4.Caption = Label4.Caption - 1
End If
guswo = MsgBox("����(" & ed & ")��(��) �����Ϸ��߽��ϴ�.", vbOKOnly, "��������Y")
ElseIf guswo = 7 Then
guswo = MsgBox("����(" & ed & ")��(��) ��������߽��ϴ�.", vbOKOnly, "��������N")
End If

End If

End Sub

Private Sub Command3_Click()
����.Visible = True
End Sub
Private Sub Command5_Click()
End
End Sub
Private Sub Command6_Click()
����.Top = 1320
ĳ������.Top = 5000
fl.Top = 5000
End Sub
Private Sub Command8_Click()
login.Visible = False
map.Visible = True
End Sub
Private Sub Command7_Click()
login.Visible = False
map.Visible = True

End Sub
Private Sub Command9_Click()
ĳ������.Top = 1320
����.Top = 5000
fl.Top = 5000
End Sub
Private Sub DelID_Click(Index As Integer)
����.Visible = True
End Sub
Private Sub episode_Click()

If ep.Visible = False Then

ep.Visible = True
sdfaaa.Width = 9000
login.Width = 9195
�ݱ�.Visible = True
��¦.Interval = 0
episode.ForeColor = &H0&
ElseIf ep.Visible = True Then

ep.Visible = False
sdfaaa.Width = 7080
login.Width = 7260
�ݱ�.Visible = False
��¦.Interval = 0
episode.ForeColor = &H0&
End If

End Sub
Private Sub EpisodeTxt_Click(Index As Integer)
If ep.Visible = False Then

ep.Visible = True
sdfaaa.Width = 9000
login.Width = 9195
�ݱ�.Visible = True
��¦.Interval = 0
episode.ForeColor = &H0&
ElseIf ep.Visible = True Then

ep.Visible = False
sdfaaa.Width = 7080
login.Width = 7260
�ݱ�.Visible = False
��¦.Interval = 0
episode.ForeColor = &H0&
End If
End Sub
Private Sub Form_Load()
Close #1, #2, #3
Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
Input #1, a
Input #2, b
Input #3, c

If a = "1" Then

Else
crt = crt + 1
End If
If b = "1" Then

Else
crt = crt + 1
End If
If c = "1" Then

Else
crt = crt + 1
End If


Label4.Caption = crt

Close #1, #2, #3
End Sub

Private Sub Label5_Click()
diew = MsgBox("���� ���������� ������� �ʽ��ϴ�.", vbCritical, "����FE231")
�ּҼ���.Visible = True
End Sub
Private Sub lblCopyright_Click()
wi = MsgBox("[���۱� : jiun0623&heonsheen] [������ : heonsheen&jiun0623] [���۱Ⱓ : 08.12.05~09.5.05) ", vbOKCancel, "About Maker")
End Sub
Private Sub MakeID_Click(Index As Integer)

If Label4.Caption <> "3" Then

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Input #1, a
If a = "1" Then
Close #1
Open "C:\Program Files\DragonStriker\ip1.dll" For Output As #1
id = InputBox("���̵� �����ÿ�", "��������1�ܰ�")
If Len(id) >= 4 Then
pw = InputBox("��й�ȣ�� �����ÿ�", "��������2�ܰ�")
If Len(pw) >= 4 Then
na = InputBox("�̸��� �����ÿ�", "��������3�ܰ�")
If Len(na) >= 2 Then
Print #1, id
Print #1, pw
Print #1, na
Label4.Caption = Label4.Caption + "1"
exe = MsgBox("�Ϸ�Ǿ����ϴ�.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #1, "1"
Print #1, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #1, "1"
Print #1, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #1, "1"
Print #1, "1"
End If
Close #1, #2, #3

Else
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Input #2, a
If a = "1" Then
Close #2
Open "C:\Program Files\DragonStriker\ip2.dll" For Output As #2
id = InputBox("���̵� �����ÿ�", "��������1�ܰ�")
If Len(id) >= 4 Then
pw = InputBox("��й�ȣ�� �����ÿ�", "��������2�ܰ�")
If Len(pw) >= 4 Then
na = InputBox("�̸��� �����ÿ�", "��������3�ܰ�")
If Len(na) >= 2 Then
Print #2, id
Print #2, pw
Print #2, na
Label4.Caption = Label4.Caption + 1
exe = MsgBox("�Ϸ�Ǿ����ϴ�.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
Input #3, a
If a = "1" Then
Close #3
Open "C:\Program Files\DragonStriker\ip3.dll" For Output As #3
id = InputBox("���̵� �����ÿ�", "��������1�ܰ�")
If Len(id) >= 4 Then
pw = InputBox("��й�ȣ�� �����ÿ�", "��������2�ܰ�")
If Len(pw) >= 4 Then
na = InputBox("�̸��� �����ÿ�", "��������3�ܰ�")
If Len(na) >= 2 Then
Print #3, id
Print #3, pw
Print #3, na
Label4.Caption = Label4.Caption + 1
exe = MsgBox("�Ϸ�Ǿ����ϴ�.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
exe = MsgBox("������Է��Ͻʽÿ�", vbCritical, "�����ڵ�00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
Close #1, #2, #3

End If
End If
Close #1, #2, #3
End If

Close #1, #2, #3

End If

End Sub
Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 13 Then

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3

Input #1, a1, a2
Input #2, b1, b2
Input #3, c1, c2

If Text1.Text = a1 And Text2.Text = a2 Then
ed = a1
ar.Caption = 1
fl.Top = 5000
����.Top = 1320
ĳ������.Top = 5000
Command1.Caption = "�α׾ƿ�"
Command2.Caption = "��������"
ElseIf Text1.Text = b1 And Text2.Text = b2 Then
ed = b1
ar.Caption = 2
fl.Top = 5000
����.Top = 1320
ĳ������.Top = 5000
Command1.Caption = "�α׾ƿ�"
Command2.Caption = "��������"
ElseIf Text1.Text = c1 And Text2.Text = c2 Then
ed = c1
ar.Caption = 3
fl.Top = 5000
����.Top = 1320
ĳ������.Top = 5000
Command1.Caption = "�α׾ƿ�"
Command2.Caption = "��������"
Else

djee = MsgBox("���̵� ��й�ȣ�� �����ʽ��ϴ�.", vbCritical, "����02FESED55")

End If

Close #1, #2, #3

End

End If

End Sub
Private Sub Text2_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 13 Then

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3

Input #1, a1, a2
Input #2, b1, b2
Input #3, c1, c2

If Text1.Text = a1 And Text2.Text = a2 Then
ed = a1
ar.Caption = 1
fl.Top = 5000
����.Top = 1320
ĳ������.Top = 5000
Command1.Caption = "�α׾ƿ�"
Command2.Caption = "��������"
ElseIf Text1.Text = b1 And Text2.Text = b2 Then
ed = b1
ar.Caption = 2
fl.Top = 5000
����.Top = 1320
ĳ������.Top = 5000
Command1.Caption = "�α׾ƿ�"
Command2.Caption = "��������"
ElseIf Text1.Text = c1 And Text2.Text = c2 Then
ed = c1
ar.Caption = 3
fl.Top = 5000
����.Top = 1320
ĳ������.Top = 5000
Command1.Caption = "�α׾ƿ�"
Command2.Caption = "��������"
Else

djee = MsgBox("���̵� ��й�ȣ�� �����ʽ��ϴ�.", vbCritical, "����02FESED55")

End If

Close #1, #2, #3

End If

End Sub
Private Sub Updatedate_Click(Index As Integer)
diew = MsgBox("���� ���������� ������� �ʽ��ϴ�.", vbCritical, "����FE231")
�ּҼ���.Visible = True
End Sub
