VERSION 5.00
Begin VB.Form ���� 
   Caption         =   "���̵� �ʱ�ȭ ���α׷�: Made By jiun0623"
   ClientHeight    =   2475
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4530
   LinkTopic       =   "Form1"
   ScaleHeight     =   2475
   ScaleWidth      =   4530
   StartUpPosition =   3  'Windows �⺻��
   Begin VB.Frame Frame1 
      Height          =   1215
      Left            =   1080
      TabIndex        =   1
      Top             =   0
      Width           =   3375
      Begin VB.CommandButton Command2 
         Caption         =   "����"
         Height          =   855
         Left            =   2280
         TabIndex        =   5
         Top             =   240
         Width           =   975
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Option3"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   840
         Visible         =   0   'False
         Width           =   2055
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Option2"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   520
         Visible         =   0   'False
         Width           =   2055
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Option1"
         Height          =   180
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Visible         =   0   'False
         Width           =   2055
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "�ʱ�ȭ"
      Height          =   1095
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   855
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  '���� ����
      Caption         =   $"�ʱ�ȭ.frx":0000
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   120
      TabIndex        =   6
      Top             =   1320
      Width           =   4335
   End
End
Attribute VB_Name = "����"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

Close #1, #2, #3

di = MsgBox("������  �ʱ�ȭ �Ͻðڽ��ϱ�?(�ʱ�ȭ�ϸ� ��� ������ ���󰩴ϴ�.)", vbYesNo, "�ʱ�ȭ")

If di = 6 Then

Open "c:\dragonstriker\ip1.dll" For Output As #1
Print #1, 1
Print #1, 1
Open "c:\dragonstriker\ip2.dll" For Output As #2
Print #2, 1
Print #2, 1
Open "c:\dragonstriker\ip3.dll" For Output As #3
Print #3, 1
Print #3, 1

Close #1, #2, #3

Open "c:\dragonstriker\ip1.dll" For Input As #1
Open "c:\dragonstriker\ip2.dll" For Input As #2
Open "c:\dragonstriker\ip3.dll" For Input As #3
Input #1, a1
Input #2, a2
Input #3, a3

If a1 <> 1 Then

Option1.Caption = a1
Option1.Visible = True

Else

Option1.Caption = a1
Option1.Visible = False

End If
If a2 <> 1 Then

Option2.Caption = a2
Option2.Visible = True

Else

Option2.Caption = a1
Option2.Visible = False

End If
If a3 <> 1 Then

Option3.Caption = a3
Option3.Visible = True

Else

Option3.Caption = a1
Option3.Visible = False

End If

Close #1, #2, #3

dj = MsgBox("��� ���̵� �ʱ�ȭ �Ǿ����ϴ�", vbOKOnly, "�ʱ�ȭ �۵�")

ElseIf di = 7 Then

dj = MsgBox("�ʱ�ȭ�� ��� �Ǿ����ϴ�", vbCritical, "�ʱ�ȭ ���")

End If

End Sub

Private Sub Command2_Click()

Close #1, #2, #3

If Option1.Value = True Then

Open "c:\dragonstriker\ip1.dll" For Output As #1
Print #1, 1
Print #1, 1

End If
If Option2.Value = True Then

Open "c:\dragonstriker\ip2.dll" For Output As #2
Print #2, 1
Print #2, 1

End If
If Option3.Value = True Then

Open "c:\dragonstriker\ip3.dll" For Output As #3
Print #3, 1
Print #3, 1

End If

Close #1, #2, #3

Open "c:\dragonstriker\ip1.dll" For Input As #1
Open "c:\dragonstriker\ip2.dll" For Input As #2
Open "c:\dragonstriker\ip3.dll" For Input As #3
Input #1, a1
Input #2, a2
Input #3, a3

If a1 <> 1 Then

Option1.Caption = a1
Option1.Visible = True

Else

Option1.Caption = a1
Option1.Visible = False

End If
If a2 <> 1 Then

Option2.Caption = a2
Option2.Visible = True

Else

Option2.Caption = a1
Option2.Visible = False

End If
If a3 <> 1 Then

Option3.Caption = a3
Option3.Visible = True

Else

Option3.Caption = a1
Option3.Visible = False

End If

Close #1, #2, #3


If Option1.Value = False And Option2.Value = False And Option3.Value = False Then

diww = MsgBox("���� �ɼ�üũ���� �ɼ��� �����ϼ���", vbCritical, "����00FF221")

End If
Close #1, #2, #3
End Sub

Private Sub Form_Load()

Close #1, #2, #3

Open "c:\dragonstriker\ip1.dll" For Input As #1
Open "c:\dragonstriker\ip2.dll" For Input As #2
Open "c:\dragonstriker\ip3.dll" For Input As #3
Input #1, a1
Input #2, a2
Input #3, a3

If a1 <> 1 Then

Option1.Caption = a1
Option1.Visible = True

Else

Option1.Caption = a1
Option1.Visible = False

End If
If a2 <> 1 Then

Option2.Caption = a2
Option2.Visible = True

Else

Option2.Caption = a1
Option2.Visible = False

End If
If a3 <> 1 Then

Option3.Caption = a3
Option3.Visible = True

Else

Option3.Caption = a1
Option3.Visible = False

End If

Close #1, #2, #3

End Sub
