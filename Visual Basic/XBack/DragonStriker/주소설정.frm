VERSION 5.00
Begin VB.Form �ּҼ��� 
   BorderStyle     =   4  '���� ���� â
   Caption         =   "�ּҼ��� Ver0.27312 Made By jiun0623&heonsheen[�̿ϼ�]"
   ClientHeight    =   3570
   ClientLeft      =   13995
   ClientTop       =   330
   ClientWidth     =   5220
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "�ּҼ���.frx":0000
   MousePointer    =   99  '����� ����
   ScaleHeight     =   3570
   ScaleWidth      =   5220
   ShowInTaskbar   =   0   'False
   Begin VB.FileListBox File1 
      Height          =   3330
      Left            =   7320
      TabIndex        =   9
      Top             =   120
      Width           =   1455
   End
   Begin VB.DirListBox Dir1 
      Height          =   3030
      Left            =   5280
      TabIndex        =   8
      Top             =   480
      Width           =   1935
   End
   Begin VB.DriveListBox Drive1 
      Height          =   300
      Left            =   5280
      TabIndex        =   7
      Top             =   120
      Width           =   1935
   End
   Begin VB.CommandButton update 
      Caption         =   "������Ʈ"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2295
      Left            =   4800
      TabIndex        =   5
      Top             =   600
      Width           =   375
   End
   Begin VB.CommandButton ������Ʈ���� 
      Caption         =   "Ȯ��"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4680
      TabIndex        =   4
      Top             =   120
      Width           =   495
   End
   Begin VB.Timer Ȯ��Ÿ�̸� 
      Interval        =   1
      Left            =   3840
      Top             =   1200
   End
   Begin VB.TextBox �ּ� 
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      MouseIcon       =   "�ּҼ���.frx":030A
      ScrollBars      =   1  '����
      TabIndex        =   0
      Text            =   "C:\DragonStriker\update\update1.ds"
      Top             =   120
      Width           =   4455
   End
   Begin VB.Label ���� 
      Alignment       =   2  '��� ����
      BorderStyle     =   1  '���� ����
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
      Height          =   495
      Left            =   4800
      TabIndex        =   6
      Top             =   3000
      Width           =   375
   End
   Begin VB.Label upok 
      BorderStyle     =   1  '���� ����
      Caption         =   "���� �ֽŹ������� ������Ʈ��"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   15.75
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   3000
      Width           =   4575
   End
   Begin VB.Label �̸����� 
      Alignment       =   2  '��� ����
      BorderStyle     =   1  '���� ����
      Caption         =   "���� �̸�����"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   4575
   End
   Begin VB.Label �̸� 
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
      Height          =   1935
      Left            =   120
      TabIndex        =   1
      Top             =   960
      Width           =   4575
   End
End
Attribute VB_Name = "�ּҼ���"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ������Ʈ����_Click()

�̸�����.Caption = �ּ�.Text

If �ּ�.Text = "C:\Program Files\DragonStriker\Update\Update1.ds" Then

Open "C:\Program Files\DragonStriker\update1.ds" For Input As #1
Input #1, n

�̸�.Caption = n
Close #1

Else

doopp = MsgBox("�ּҰ� �˸��� �ʽ��ϴ�.", vbCritical, "Critical")

End If

End Sub
Private Sub ����_Click()
If ����.Caption = "��" Then
�ּҼ���.Width = 8910
����.Caption = "��"
ElseIf ����.Caption = "��" Then
�ּҼ���.Width = 5310
����.Caption = "��"
End If
End Sub
Private Sub update_Click()

If upok.Caption = "���� �ֽŹ������� ������Ʈ��" Then

sk = MsgBox("�̹� �ֽŹ��������� ������Ʈ�� �������ϴ�.", vbCritical, "Critical")

ElseIf upok.Caption = "������Ʈ�� ��������" Then

End If

End Sub
