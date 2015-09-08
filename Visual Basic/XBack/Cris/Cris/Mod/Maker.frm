VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "Tabctl32.ocx"
Begin VB.Form Maker 
   Caption         =   "CrisMoD Maker"
   ClientHeight    =   8070
   ClientLeft      =   105
   ClientTop       =   435
   ClientWidth     =   11535
   LinkTopic       =   "Form1"
   ScaleHeight     =   8070
   ScaleWidth      =   11535
   StartUpPosition =   3  'Windows 기본값
   Begin TabDlg.SSTab Tx 
      Height          =   5685
      Left            =   120
      TabIndex        =   16
      Top             =   2280
      Width           =   11295
      _ExtentX        =   19923
      _ExtentY        =   10028
      _Version        =   393216
      Style           =   1
      Tabs            =   1
      TabsPerRow      =   15
      TabHeight       =   441
      TabMaxWidth     =   706
      TabCaption(0)   =   "일반 변수"
      TabPicture(0)   =   "Maker.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Dlist"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      Begin VB.ListBox Dlist 
         Height          =   5100
         ItemData        =   "Maker.frx":001C
         Left            =   120
         List            =   "Maker.frx":001E
         TabIndex        =   17
         Top             =   360
         Width           =   3015
      End
   End
   Begin VB.TextBox Te 
      Alignment       =   1  '오른쪽 맞춤
      Appearance      =   0  '평면
      Height          =   270
      Index           =   5
      Left            =   720
      TabIndex        =   12
      Top             =   1800
      Width           =   735
   End
   Begin VB.TextBox Te 
      Alignment       =   1  '오른쪽 맞춤
      Appearance      =   0  '평면
      Height          =   270
      Index           =   4
      Left            =   720
      TabIndex        =   11
      Top             =   1560
      Width           =   735
   End
   Begin VB.TextBox Te 
      Alignment       =   1  '오른쪽 맞춤
      Appearance      =   0  '평면
      Height          =   270
      Index           =   3
      Left            =   720
      TabIndex        =   10
      Top             =   1320
      Width           =   735
   End
   Begin VB.TextBox Te 
      Alignment       =   1  '오른쪽 맞춤
      Appearance      =   0  '평면
      Height          =   270
      Index           =   2
      Left            =   720
      TabIndex        =   9
      Top             =   1080
      Width           =   735
   End
   Begin VB.ComboBox LanC 
      Height          =   300
      ItemData        =   "Maker.frx":0020
      Left            =   4680
      List            =   "Maker.frx":0022
      TabIndex        =   14
      Text            =   "언어"
      Top             =   120
      Width           =   1095
   End
   Begin VB.ComboBox GenC 
      Appearance      =   0  '평면
      Height          =   300
      ItemData        =   "Maker.frx":0024
      Left            =   720
      List            =   "Maker.frx":002E
      TabIndex        =   13
      Text            =   "성별"
      Top             =   840
      Width           =   735
   End
   Begin VB.TextBox Te 
      Alignment       =   1  '오른쪽 맞춤
      Appearance      =   0  '평면
      Height          =   270
      Index           =   0
      Left            =   720
      TabIndex        =   8
      Top             =   600
      Width           =   735
   End
   Begin VB.CommandButton LanAddB 
      Caption         =   "언어추가"
      Height          =   255
      Left            =   1440
      TabIndex        =   7
      Top             =   120
      Width           =   1335
   End
   Begin VB.ComboBox LanList 
      Height          =   300
      ItemData        =   "Maker.frx":003A
      Left            =   120
      List            =   "Maker.frx":0068
      TabIndex        =   6
      Text            =   "언어"
      Top             =   120
      Width           =   1215
   End
   Begin VB.Line LY 
      Index           =   1
      X1              =   120
      X2              =   11400
      Y1              =   2160
      Y2              =   2160
   End
   Begin VB.Label Lx 
      AutoSize        =   -1  'True
      BackStyle       =   0  '투명
      Caption         =   "현재 편집중인 언어 :"
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   6
      Left            =   2880
      TabIndex        =   15
      Top             =   120
      Width           =   1680
   End
   Begin VB.Line LY 
      Index           =   0
      X1              =   120
      X2              =   11400
      Y1              =   480
      Y2              =   480
   End
   Begin VB.Label Lx 
      AutoSize        =   -1  'True
      BackStyle       =   0  '투명
      Caption         =   "비고 :"
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   5
      Left            =   120
      TabIndex        =   5
      Top             =   1800
      Width           =   480
   End
   Begin VB.Label Lx 
      AutoSize        =   -1  'True
      BackStyle       =   0  '투명
      Caption         =   "체중 :"
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   4
      Left            =   120
      TabIndex        =   4
      Top             =   1560
      Width           =   480
   End
   Begin VB.Label Lx 
      AutoSize        =   -1  'True
      BackStyle       =   0  '투명
      Caption         =   "신장 :"
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   3
      Left            =   120
      TabIndex        =   3
      Top             =   1320
      Width           =   480
   End
   Begin VB.Label Lx 
      AutoSize        =   -1  'True
      BackStyle       =   0  '투명
      Caption         =   "나이 :"
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   2
      Left            =   120
      TabIndex        =   2
      Top             =   1080
      Width           =   480
   End
   Begin VB.Label Lx 
      AutoSize        =   -1  'True
      BackStyle       =   0  '투명
      Caption         =   "성별 :"
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   480
   End
   Begin VB.Label Lx 
      AutoSize        =   -1  'True
      BackStyle       =   0  '투명
      Caption         =   "이름 :"
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   480
   End
End
Attribute VB_Name = "Maker"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
On Error Resume Next
Dim XString As String, XCnt As Integer
XString = "": XCnt = 0
Open ("Word.Dat") For Input As #1
Do
            Line Input #1, XString
    If Trim(XString) = "" Then
    ElseIf Left(XString, 1) = "[" Then
    ElseIf Left(XString, 1) = "!" Then
    Else
            If XString = "##" Then Exit Do
            Dlist.AddItem XString, Dlist.ListCount
            XCnt = XCnt + 1
    End If
Loop

End Sub
Private Sub LanAddB_Click()
On Error Resume Next
For i = 0 To LanC.ListCount
    If LanC.List(i) = LanList.List(LanList.ListIndex) Then
        Exit Sub
    Else
    End If
Next i
LanC.AddItem LanList.List(LanList.ListIndex), LanC.ListCount
End Sub
