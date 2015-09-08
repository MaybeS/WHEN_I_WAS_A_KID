VERSION 5.00
Begin VB.Form 사용자정보 
   BorderStyle     =   4  '고정 도구 창
   Caption         =   "Ver Beta 0.1.2410249"
   ClientHeight    =   4185
   ClientLeft      =   255
   ClientTop       =   1680
   ClientWidth     =   7125
   ClipControls    =   0   'False
   Icon            =   "사용자정보.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "사용자정보.frx":000C
   ScaleHeight     =   4185
   ScaleWidth      =   7125
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Height          =   4125
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7065
      Begin VB.Label HC 
         BorderStyle     =   1  '단일 고정
         Caption         =   "How Creadit About!"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   20.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   120
         TabIndex        =   9
         Top             =   2880
         Width           =   3975
      End
      Begin VB.Image imgLogo 
         Height          =   2385
         Left            =   120
         Picture         =   "사용자정보.frx":0316
         Stretch         =   -1  'True
         Top             =   240
         Width           =   2175
      End
      Begin VB.Label lblCopyright 
         Caption         =   "저작권 : jiun0623& heonsheen"
         Height          =   195
         Left            =   4560
         TabIndex        =   4
         Top             =   3060
         Width           =   2415
      End
      Begin VB.Label lblCompany 
         Caption         =   "회사 : FlyToSky"
         Height          =   255
         Left            =   4560
         TabIndex        =   3
         Top             =   3360
         Width           =   2415
      End
      Begin VB.Label lblWarning 
         Caption         =   "경고 : 무단복사 및 무단 배포는 최대 8천만원이하 의 벌금과 징역 4년 입니다."
         Height          =   195
         Left            =   120
         TabIndex        =   2
         Top             =   3720
         Width           =   6855
      End
      Begin VB.Label lblVersion 
         Alignment       =   1  '오른쪽 맞춤
         AutoSize        =   -1  'True
         Caption         =   "Ver 0.1.2410249   Beta"
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   12
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   4125
         TabIndex        =   5
         Top             =   2700
         Width           =   2745
      End
      Begin VB.Label lblPlatform 
         Alignment       =   1  '오른쪽 맞춤
         AutoSize        =   -1  'True
         Caption         =   "FTA"
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   15.75
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   6300
         TabIndex        =   6
         Top             =   2340
         Width           =   555
      End
      Begin VB.Label lblProductName 
         AutoSize        =   -1  'True
         Caption         =   "DragonStriker"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   32.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   840
         Left            =   2520
         TabIndex        =   8
         Top             =   1140
         Width           =   4305
      End
      Begin VB.Label ip 
         Alignment       =   1  '오른쪽 맞춤
         Caption         =   "이 제품은 다음 사용자에게 사용이 허가되었습니다."
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   6855
      End
      Begin VB.Label lblCompanyProduct 
         AutoSize        =   -1  'True
         Caption         =   "Algo Korea[MayTryArk]"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   18
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   465
         Left            =   2355
         TabIndex        =   7
         Top             =   705
         Width           =   4260
      End
   End
End
Attribute VB_Name = "사용자정보"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
Input #1, a1
Input #2, a2
Input #3, a3

If login.ar.Caption = 1 Then
ip.Caption = "이 제품은 " & a1 & " 에게 사용이 허가되었습니다."
ElseIf login.ar.Caption = 2 Then
ip.Caption = "이 제품은 " & a2 & " 에게 사용이 허가되었습니다."
ElseIf login.ar.Caption = 3 Then
ip.Caption = "이 제품은 " & a3 & " 에게 사용이 허가되었습니다."
End If

Close #1, #2, #3

End Sub
Private Sub HC_Click()

ck = MsgBox("Ver 0.1.2410249 Made '2009.3.8'~'2009.3.13'", vbOKOnly, "How Creadit About!")
ck = MsgBox("Made By 'jiun0623' & 'heonsheen' ", vbOKOnly, "How Creadit About!")
ck = MsgBox("Coding by 'jiun0623' & 'heonsheen'", vbOKOnly, "How Creadit About!")
ck = MsgBox("Image by 'jiun0623'", vbOKOnly, "How Creadit About!")
ck = MsgBox("Episode by 'heonsheen'", vbOKOnly, "How Creadit About!")
ck = MsgBox("Sound by 'jiun0623'", vbOKOnly, "How Creadit About!")
ck = MsgBox("Skill & Stat by 'jiun0623' & 'heonsheen'", vbOKOnly, "How Creadit About!")
ck = MsgBox("Inv & 키세팅 by 'jiun0623'", vbOKOnly, "How Creadit About!")
ck = MsgBox("Copy right by ⓒ2009 ㈜DraognStriker Made By 'jiun0623' & 'heonsheen'", vbOKOnly, "How Creadit About!")

End Sub
