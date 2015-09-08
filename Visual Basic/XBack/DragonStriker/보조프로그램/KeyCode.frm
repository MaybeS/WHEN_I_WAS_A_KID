VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "KeyCode Beta Ver 1.1"
   ClientHeight    =   1890
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   2640
   LinkTopic       =   "Form1"
   ScaleHeight     =   1890
   ScaleWidth      =   2640
   StartUpPosition =   3  'Windows 기본값
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   1440
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.Label Label2 
      Alignment       =   2  '가운데 맞춤
      BorderStyle     =   1  '단일 고정
      Caption         =   "복사모드"
      Height          =   255
      Left            =   840
      TabIndex        =   1
      Top             =   1080
      Width           =   1695
   End
   Begin VB.Label Label1 
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   21.75
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   2415
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Label1.Caption = KeyCode
End Sub
Private Sub Label2_Click()
If Label2.Caption = "복사모드" Then
Text1.Visible = True
Text1.Text = Label1.Caption
Label2.Caption = "복사모드 해제"
ElseIf Label2.Caption = "복사모드 해제" Then
Text1.Visible = False
Text1.Text = Label1.Caption
Label2.Caption = "복사모드"
End If
End Sub
