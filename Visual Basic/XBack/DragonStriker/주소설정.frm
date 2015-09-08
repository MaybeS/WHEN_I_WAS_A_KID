VERSION 5.00
Begin VB.Form 주소설정 
   BorderStyle     =   4  '고정 도구 창
   Caption         =   "주소설정 Ver0.27312 Made By jiun0623&heonsheen[미완성]"
   ClientHeight    =   3570
   ClientLeft      =   13995
   ClientTop       =   330
   ClientWidth     =   5220
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "주소설정.frx":0000
   MousePointer    =   99  '사용자 정의
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
      Caption         =   "업데이트"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
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
   Begin VB.CommandButton 업데이트적용 
      Caption         =   "확인"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
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
   Begin VB.Timer 확인타이머 
      Interval        =   1
      Left            =   3840
      Top             =   1200
   End
   Begin VB.TextBox 주소 
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      MouseIcon       =   "주소설정.frx":030A
      ScrollBars      =   1  '수평
      TabIndex        =   0
      Text            =   "C:\DragonStriker\update\update1.ds"
      Top             =   120
      Width           =   4455
   End
   Begin VB.Label 열닫 
      Alignment       =   2  '가운데 맞춤
      BorderStyle     =   1  '단일 고정
      Caption         =   "▶"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
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
      BorderStyle     =   1  '단일 고정
      Caption         =   "현재 최신버전으로 업데이트됨"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
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
   Begin VB.Label 미리보기 
      Alignment       =   2  '가운데 맞춤
      BorderStyle     =   1  '단일 고정
      Caption         =   "내용 미리보기"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
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
   Begin VB.Label 미리 
      BorderStyle     =   1  '단일 고정
      Caption         =   "없음"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
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
Attribute VB_Name = "주소설정"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub 업데이트적용_Click()

미리보기.Caption = 주소.Text

If 주소.Text = "C:\Program Files\DragonStriker\Update\Update1.ds" Then

Open "C:\Program Files\DragonStriker\update1.ds" For Input As #1
Input #1, n

미리.Caption = n
Close #1

Else

doopp = MsgBox("주소가 알맞지 않습니다.", vbCritical, "Critical")

End If

End Sub
Private Sub 열닫_Click()
If 열닫.Caption = "▶" Then
주소설정.Width = 8910
열닫.Caption = "◀"
ElseIf 열닫.Caption = "◀" Then
주소설정.Width = 5310
열닫.Caption = "▶"
End If
End Sub
Private Sub update_Click()

If upok.Caption = "현재 최신버전으로 업데이트됨" Then

sk = MsgBox("이미 최신버전으로의 업데이트가 끝났습니다.", vbCritical, "Critical")

ElseIf upok.Caption = "업데이트가 남아있음" Then

End If

End Sub
