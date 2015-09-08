VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   4  '고정 도구 창
   Caption         =   "글자만들기  Ver 0.8"
   ClientHeight    =   5910
   ClientLeft      =   45
   ClientTop       =   270
   ClientWidth     =   13455
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5910
   ScaleWidth      =   13455
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows 기본값
   Begin VB.Frame Frame2 
      Caption         =   "종류"
      Height          =   975
      Left            =   12000
      TabIndex        =   9
      Top             =   2400
      Width           =   1215
      Begin VB.OptionButton Op2 
         Caption         =   "선"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   600
         Width           =   975
      End
      Begin VB.OptionButton Op1 
         Caption         =   "원"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "색"
      Height          =   1815
      Left            =   12000
      TabIndex        =   2
      Top             =   480
      Width           =   1215
      Begin VB.OptionButton Option1 
         Caption         =   "White"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Black"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   480
         Width           =   855
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Red"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   720
         Width           =   735
      End
      Begin VB.OptionButton Option4 
         Caption         =   "Blue"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   960
         Width           =   735
      End
      Begin VB.OptionButton Option5 
         Caption         =   "Green"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1200
         Width           =   855
      End
      Begin VB.OptionButton Option6 
         Caption         =   "Yellow"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   1440
         Width           =   975
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "make"
      Height          =   255
      Left            =   12600
      TabIndex        =   1
      Top             =   120
      Width           =   735
   End
   Begin VB.TextBox Text1 
      Height          =   270
      Left            =   12120
      TabIndex        =   0
      Top             =   120
      Width           =   495
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Cls
AutoRedraw = True
Randomize
s = Text1.Text
Print s

If Op1.Value = True Then
    
    If Option1.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Circle (x * 30, y * 30 + 300), 80, vbWhite
        End If
      Next x
    Next y
    
    ElseIf Option2.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Circle (x * 30, y * 30 + 300), 80, vbBlack
        End If
      Next x
    Next y
    
    ElseIf Option3.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Circle (x * 30, y * 30 + 300), 80, vbRed
        End If
      Next x
    Next y
    
    ElseIf Option4.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 180 Step 5
        If Point(x, y) = 0 Then
          Circle (x * 30, y * 30 + 300), 80, vbBlue
        End If
      Next x
    Next y
    
    ElseIf Option5.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Circle (x * 30, y * 30 + 300), 80, vbGreen
        End If
      Next x
    Next y
    
    ElseIf Option6.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Circle (x * 30, y * 30 + 300), 80, vbYellow
        End If
      Next x
    Next y
    
    Else
    
    dj = MsgBox("색을 선택하여 주십시오.", vbCritical, "글자만들기 Ver0.8")
    
    End If

ElseIf Op2.Value = True Then
    
    If Option1.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Line (x * 30, y * 30 + 300)-(x * 30 + 300, y * 30 + 330), vbWhite
        End If
      Next x
    Next y
    
    ElseIf Option2.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Line (x * 30, y * 30 + 300)-(x * 30 + 300, y * 30 + 330), vbBlack
        End If
      Next x
    Next y
    
    ElseIf Option3.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Line (x * 30, y * 30 + 300)-(x * 30 + 300, y * 30 + 330), vbRed
        End If
      Next x
    Next y
    
    ElseIf Option4.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 180 Step 5
        If Point(x, y) = 0 Then
          Line (x * 30, y * 30 + 300)-(x * 30 + 300, y * 30 + 330), vbBlue
        End If
      Next x
    Next y
    
    ElseIf Option5.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Line (x * 30, y * 30 + 300)-(x * 30 + 300, y * 30 + 330), vbGreen
        End If
      Next x
    Next y
    
    ElseIf Option6.Value = True Then
    
    For y = 0 To 150 Step 5
      For x = 0 To 500 Step 5
        If Point(x, y) = 0 Then
          Line (x * 30, y * 30 + 300)-(x * 30 + 300, y * 30 + 330), vbYellow
        End If
      Next x
    Next y
    
    Else
    
    dj = MsgBox("색을 선택하여 주십시오.", vbCritical, "글자만들기 Ver0.8")
    
    End If

Else

 dj = MsgBox("종류를 선택하여 주십시오.", vbCritical, "글자만들기 Ver0.8")

End If

End Sub
