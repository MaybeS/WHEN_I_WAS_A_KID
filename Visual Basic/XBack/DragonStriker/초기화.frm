VERSION 5.00
Begin VB.Form ���� 
   BorderStyle     =   4  '���� ���� â
   Caption         =   "Made By jiun0623 & heonsheen"
   ClientHeight    =   2475
   ClientLeft      =   390
   ClientTop       =   570
   ClientWidth     =   4530
   Icon            =   "�ʱ�ȭ.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "�ʱ�ȭ.frx":030A
   MousePointer    =   99  '����� ����
   ScaleHeight     =   2475
   ScaleWidth      =   4530
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   4335
      Begin VB.CommandButton �ʱ�ȭ 
         Caption         =   "�ʱ�ȭ"
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
         Left            =   3480
         TabIndex        =   7
         Top             =   720
         Width           =   735
      End
      Begin VB.CommandButton �����÷� 
         Caption         =   "�����÷�"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   3480
         TabIndex        =   6
         Top             =   240
         Width           =   735
      End
      Begin VB.CommandButton Command2 
         Caption         =   "����"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   2880
         MouseIcon       =   "�ʱ�ȭ.frx":045C
         TabIndex        =   4
         Top             =   240
         Width           =   615
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Option3"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   840
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Option2"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   520
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Option1"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Visible         =   0   'False
         Width           =   2655
      End
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  '���� ����
      Caption         =   $"�ʱ�ȭ.frx":0766
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
      TabIndex        =   5
      Top             =   1320
      Width           =   4335
   End
End
Attribute VB_Name = "����"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub �����÷�_Click()
On Error GoTo SS
    overflo = MsgBox("���ϳ��� �Ѿ ���� ��ǻ�Ϳ��ִ� ���������� �ٽ� ��� �ؾ��մϴ�.", vbOKOnly, "OverFlo")
    overflo = MsgBox("DragonStriker ��� ������ ã�ƺ��ϴ�.[Ȯ���� �����ּ���]", vbOKOnly, "OverFlo")
Open "C:\Program Files\DragonStriker\Update\backup.ds" For Input As #1
Input #1, tts
    overflo = MsgBox(tts & "������ �����÷� ��ġ �Դϴ�. Ȯ���� �����ּ���", vbOKOnly, "��ġ��")
Open "C:\Program Files\DragonStriker\ip1.dll" For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave1.dll" For Output As #1
    Print #1, 0
    Print #1, 0
    Print #1, 0
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        If i = 69 Then
        Print #1, "���"
        ElseIf i = 73 Then
        Print #1, "�κ�"
        ElseIf i = 75 Then
        Print #1, "��ų"
        ElseIf i = 83 Then
        Print #1, "����"
        ElseIf i = 77 Then
        Print #1, "�޴�"
        Else
        Print #1, 0
        End If
      End If
    Next i
Print #1, 1: Print #1, "�ʺ���": Print #1, 0: Print #1, 50: Print #1, 50: Print #1, 25: Print #1, 25: Print #1, "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��": Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0
For i = 1 To 28
Print #1, 0
Next i
For i = 1 To 28
Print #1, 0
Next i
Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip2.dll" For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave2.dll" For Output As #1
    Print #1, 0
    Print #1, 0
    Print #1, 0
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        If i = 69 Then
        Print #1, "���"
        ElseIf i = 73 Then
        Print #1, "�κ�"
        ElseIf i = 75 Then
        Print #1, "��ų"
        ElseIf i = 83 Then
        Print #1, "����"
        ElseIf i = 77 Then
        Print #1, "�޴�"
        Else
        Print #1, 0
        End If
      End If
    Next i
Print #1, 1: Print #1, "�ʺ���": Print #1, 0: Print #1, 50: Print #1, 50: Print #1, 25: Print #1, 25: Print #1, "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��": Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0
For i = 1 To 28
Print #1, 0
Next i
For i = 1 To 28
Print #1, 0
Next i
Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip3.dll " For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave3.dll" For Output As #1
    Print #1, 0
    Print #1, 0
    Print #1, 0
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        If i = 69 Then
        Print #1, "���"
        ElseIf i = 73 Then
        Print #1, "�κ�"
        ElseIf i = 75 Then
        Print #1, "��ų"
        ElseIf i = 83 Then
        Print #1, "����"
        ElseIf i = 77 Then
        Print #1, "�޴�"
        Else
        Print #1, 0
        End If
      End If
    Next i
Print #1, 1: Print #1, "�ʺ���": Print #1, 0: Print #1, 50: Print #1, 50: Print #1, 25: Print #1, 25: Print #1, "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��": Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0
For i = 1 To 28
Print #1, 0
Next i
For i = 1 To 28
Print #1, 0
Next i
Close #1, #2, #3
SS:
    overflo = MsgBox("������ �߰ߵ��� ������ �����ϴ�. 0.1.6208 �̻��� �������� �� ��ġ ���ֽñ� �ٶ��ϴ�.", vbCritical, "�����÷ο���")
    overflo = MsgBox("http://cafe.naver.com/dsjah  ���� �ٿ�ε� �����Ǽ� �ֽ��ϴ�.", vbOKOnly, "")
End Sub

Private Sub Command2_Click()

Close #1, #2, #3

If Option1.Value = True Then

Open "C:\Program Files\DragonStriker\ip1.dll" For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave1.dll" For Output As #1
    Print #1, 0
    Print #1, 0
    Print #1, 0
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        If i = 69 Then
        Print #1, "���"
        ElseIf i = 73 Then
        Print #1, "�κ�"
        ElseIf i = 75 Then
        Print #1, "��ų"
        ElseIf i = 83 Then
        Print #1, "����"
        ElseIf i = 77 Then
        Print #1, "�޴�"
        Else
        Print #1, 0
        End If
      End If
    Next i
Print #1, 1: Print #1, "�ʺ���": Print #1, 0: Print #1, 50: Print #1, 50: Print #1, 25: Print #1, 25: Print #1, "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��": Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0
For i = 1 To 28
Print #1, 0
Next i
For i = 1 To 28
Print #1, 0
Next i
Close #1, #2, #3

End If
If Option2.Value = True Then

Open "C:\Program Files\DragonStriker\ip2.dll" For Output As #2
Print #2, 1
Print #2, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave2.dll" For Output As #2
    Print #1, 0
    Print #1, 0
    Print #1, 0
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        If i = 69 Then
        Print #2, "���"
        ElseIf i = 73 Then
        Print #2, "�κ�"
        ElseIf i = 75 Then
        Print #2, "��ų"
        ElseIf i = 83 Then
        Print #2, "����"
        ElseIf i = 77 Then
        Print #2, "�޴�"
        Else
        Print #2, 0
        End If
      End If
    Next i
Print #2, 1: Print #2, "�ʺ���": Print #2, 0: Print #2, 50: Print #2, 50: Print #2, 25: Print #2, 25: Print #2, "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��": Print #2, 5: Print #2, 5: Print #2, 5: Print #2, 5: Print #2, 0: Print #2, 0: Print #2, 0: Print #2, 0: Print #2, 0: Print #2, 0
For i = 1 To 28
Print #2, 0
Next i
For i = 1 To 28
Print #2, 0
Next i
Close #1, #2, #3

End If
If Option3.Value = True Then

Open "C:\Program Files\DragonStriker\ip3.dll" For Output As #3
Print #3, 1
Print #3, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave3.dll" For Output As #3
    Print #1, 0
    Print #1, 0
    Print #1, 0
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        If i = 69 Then
        Print #3, "���"
        ElseIf i = 73 Then
        Print #3, "�κ�"
        ElseIf i = 75 Then
        Print #3, "��ų"
        ElseIf i = 83 Then
        Print #3, "����"
        ElseIf i = 77 Then
        Print #3, "�޴�"
        Else
        Print #3, 0
       End If
      End If
    Next i
Print #3, 1: Print #3, "�ʺ���": Print #3, 0: Print #3, 50: Print #3, 50: Print #3, 25: Print #3, 25: Print #3, "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��": Print #3, 5: Print #3, 5: Print #3, 5: Print #3, 5: Print #3, 0: Print #3, 0: Print #3, 0: Print #3, 0: Print #3, 0: Print #3, 0
For i = 1 To 28
Print #3, 0
Next i
For i = 1 To 28
Print #3, 0
Next i
Close #1, #2, #3

End If

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
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


login.Label4.Caption = crt

Close #1, #2, #3


End Sub

Private Sub Form_Load()

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
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

