VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form map 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  '단일 고정
   Caption         =   "RPG_DragonStriker: Ver BETA TEST 0.1.420748"
   ClientHeight    =   5790
   ClientLeft      =   135
   ClientTop       =   690
   ClientWidth     =   14850
   ControlBox      =   0   'False
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "Form1.frx":11C2
   MousePointer    =   99  '사용자 정의
   ScaleHeight     =   5790
   ScaleWidth      =   14850
   Visible         =   0   'False
   WhatsThisHelp   =   -1  'True
   Begin VB.Timer Ti2 
      Interval        =   500
      Left            =   1800
      Tag             =   "0"
      Top             =   360
   End
   Begin VB.Timer Ti 
      Interval        =   1000
      Left            =   1440
      Top             =   360
   End
   Begin VB.Timer 데미지표시2 
      Interval        =   170
      Left            =   2160
      Top             =   360
   End
   Begin VB.Timer 큌슬롯 
      Interval        =   1
      Left            =   11280
      Top             =   4200
   End
   Begin VB.Timer 렉걸림 
      Interval        =   1
      Left            =   7920
      Top             =   0
   End
   Begin VB.Timer npc위치 
      Interval        =   1
      Left            =   7560
      Top             =   0
   End
   Begin VB.Timer 몬스터hp 
      Interval        =   1
      Left            =   7200
      Top             =   0
   End
   Begin VB.Frame 메뉴 
      BackColor       =   &H00FFC0C0&
      Caption         =   "메뉴"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   2055
      Left            =   6600
      TabIndex        =   59
      Top             =   -5000
      Width           =   1935
      Begin VB.Label Label6 
         BackStyle       =   0  '투명
         Caption         =   "▼"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1560
         TabIndex        =   65
         Top             =   0
         Width           =   255
      End
      Begin VB.Label Label5 
         Alignment       =   2  '가운데 맞춤
         BackColor       =   &H00FF8080&
         Caption         =   "[미완성]"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   64
         Top             =   1680
         Width           =   1695
      End
      Begin VB.Label Label4 
         Alignment       =   2  '가운데 맞춤
         BackColor       =   &H00FF8080&
         Caption         =   "[미완성]"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   63
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label Label2 
         Alignment       =   2  '가운데 맞춤
         BackColor       =   &H00FF8080&
         Caption         =   "버전 정보"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   62
         Top             =   960
         Width           =   1695
      End
      Begin VB.Label 키셋팅 
         Alignment       =   2  '가운데 맞춤
         BackColor       =   &H00FF8080&
         Caption         =   "키셋팅"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   61
         Top             =   600
         Width           =   1695
      End
      Begin VB.Label save 
         Alignment       =   2  '가운데 맞춤
         BackColor       =   &H00FF8080&
         Caption         =   "Save"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   60
         Top             =   240
         Width           =   1695
      End
   End
   Begin VB.Timer 몬스터위치 
      Interval        =   1
      Left            =   0
      Top             =   360
   End
   Begin VB.Timer 화살 
      Interval        =   10
      Left            =   1080
      Top             =   360
   End
   Begin VB.Timer 보스전용 
      Interval        =   60000
      Left            =   720
      Top             =   360
   End
   Begin VB.Timer m이동 
      Interval        =   500
      Left            =   360
      Top             =   360
   End
   Begin VB.Timer mgen 
      Interval        =   5000
      Left            =   6840
      Top             =   0
   End
   Begin VB.Timer 점프 
      Interval        =   300
      Left            =   6480
      Top             =   0
   End
   Begin VB.Frame 퀵슬롯놓는곳 
      Height          =   1695
      Left            =   11725
      TabIndex        =   42
      Top             =   3840
      Width           =   3135
      Begin VB.Label pdpd 
         BackStyle       =   0  '투명
         Caption         =   "PaDw"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   2190
         TabIndex        =   50
         Top             =   1350
         Width           =   495
      End
      Begin VB.Label endend 
         BackStyle       =   0  '투명
         Caption         =   "End"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   1250
         TabIndex        =   49
         Top             =   1350
         Width           =   495
      End
      Begin VB.Label deldel 
         BackStyle       =   0  '투명
         Caption         =   "Del"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   270
         TabIndex        =   48
         Top             =   1350
         Width           =   375
      End
      Begin VB.Label pupu 
         BackStyle       =   0  '투명
         Caption         =   "PaUP"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   2200
         TabIndex        =   47
         Top             =   650
         Width           =   495
      End
      Begin VB.Label homehome 
         BackStyle       =   0  '투명
         Caption         =   "Home"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   1250
         TabIndex        =   46
         Top             =   650
         Width           =   495
      End
      Begin VB.Label insins 
         BackStyle       =   0  '투명
         Caption         =   "Ins"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   270
         TabIndex        =   45
         Top             =   600
         Width           =   375
      End
      Begin VB.Image pd 
         BorderStyle     =   1  '단일 고정
         Height          =   615
         Left            =   2160
         Picture         =   "Form1.frx":14CC
         Stretch         =   -1  'True
         Top             =   960
         Width           =   735
      End
      Begin VB.Image pu 
         BorderStyle     =   1  '단일 고정
         Height          =   615
         Left            =   2160
         Picture         =   "Form1.frx":69E42
         Stretch         =   -1  'True
         Top             =   240
         Width           =   735
      End
      Begin VB.Image en 
         BorderStyle     =   1  '단일 고정
         Height          =   615
         Left            =   1200
         Picture         =   "Form1.frx":D27B8
         Stretch         =   -1  'True
         Top             =   960
         Width           =   735
      End
      Begin VB.Image hom 
         BorderStyle     =   1  '단일 고정
         Height          =   615
         Left            =   1200
         Picture         =   "Form1.frx":13B12E
         Stretch         =   -1  'True
         Top             =   240
         Width           =   735
      End
      Begin VB.Image del 
         BorderStyle     =   1  '단일 고정
         Height          =   615
         Left            =   240
         Picture         =   "Form1.frx":1A3AA4
         Stretch         =   -1  'True
         Top             =   960
         Width           =   735
      End
      Begin VB.Image ins 
         BorderStyle     =   1  '단일 고정
         Height          =   615
         Left            =   240
         Picture         =   "Form1.frx":20C41A
         Stretch         =   -1  'True
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.Timer 중요사항올리기 
      Interval        =   7500
      Left            =   6120
      Top             =   0
   End
   Begin VB.Timer exp퍼센트 
      Interval        =   1
      Left            =   5400
      Top             =   0
   End
   Begin VB.Timer exp표시 
      Interval        =   1
      Left            =   5040
      Top             =   0
   End
   Begin VB.Timer mp표시 
      Interval        =   1
      Left            =   4320
      Top             =   0
   End
   Begin VB.Timer hp표시 
      Interval        =   1
      Left            =   4680
      Top             =   0
   End
   Begin VB.Timer upefect 
      Interval        =   1
      Left            =   1800
      Top             =   0
   End
   Begin VB.Timer 캐릭터가맞는데미지 
      Interval        =   170
      Left            =   2520
      Top             =   0
   End
   Begin VB.Timer 뎀지표시 
      Interval        =   170
      Left            =   2160
      Top             =   0
   End
   Begin VB.Timer hp버그방지 
      Interval        =   1
      Left            =   3960
      Top             =   0
   End
   Begin VB.Timer hp젠 
      Interval        =   8000
      Left            =   3600
      Top             =   0
   End
   Begin VB.Timer 내용타이머 
      Interval        =   1
      Left            =   3240
      Top             =   0
   End
   Begin VB.Timer 대화내용조절 
      Interval        =   1
      Left            =   2880
      Top             =   0
   End
   Begin VB.Timer mon 
      Interval        =   1
      Left            =   1440
      Top             =   0
   End
   Begin VB.Timer ah 
      Interval        =   500
      Left            =   1080
      Top             =   0
   End
   Begin VB.Timer as 
      Interval        =   1000
      Left            =   720
      Top             =   0
   End
   Begin VB.CommandButton 말하기 
      Caption         =   "말하기"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   9000
      TabIndex        =   25
      ToolTipText     =   "이 버튼을 누르면 말을 할수있습니다. [치트키있음]"
      Top             =   3960
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   120
      MouseIcon       =   "Form1.frx":274D90
      TabIndex        =   24
      Text            =   "대화할 내용을 입력하세요"
      Top             =   3960
      Visible         =   0   'False
      Width           =   8775
   End
   Begin VB.Timer 이동 
      Interval        =   1
      Left            =   360
      Top             =   0
   End
   Begin VB.Timer npc 
      Interval        =   500
      Left            =   5760
      Top             =   0
   End
   Begin VB.Frame Frame2 
      Height          =   1215
      Left            =   50
      TabIndex        =   0
      Top             =   4320
      Width           =   14775
      Begin VB.Frame lvF 
         Height          =   495
         Left            =   120
         TabIndex        =   1
         Top             =   600
         Width           =   975
         Begin VB.Label lv 
            Alignment       =   2  '가운데 맞춤
            Caption         =   "1"
            BeginProperty Font 
               Name            =   "굴림"
               Size            =   9
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   2
            Top             =   170
            Width           =   735
         End
      End
      Begin WMPLibCtl.WindowsMediaPlayer wma1 
         Height          =   495
         Left            =   9960
         TabIndex        =   77
         Top             =   600
         Visible         =   0   'False
         Width           =   495
         URL             =   "C:\DragonStriker\root\sound\02BattleOfRose.wma"
         rate            =   1
         balance         =   0
         currentPosition =   0
         defaultFrame    =   ""
         playCount       =   1
         autoStart       =   -1  'True
         currentMarker   =   0
         invokeURLs      =   -1  'True
         baseURL         =   ""
         volume          =   50
         mute            =   0   'False
         uiMode          =   "full"
         stretchToFit    =   0   'False
         windowlessVideo =   0   'False
         enabled         =   -1  'True
         enableContextMenu=   -1  'True
         fullScreen      =   0   'False
         SAMIStyle       =   ""
         SAMILang        =   ""
         SAMIFilename    =   ""
         captioningID    =   ""
         enableErrorDialogs=   0   'False
         _cx             =   873
         _cy             =   873
      End
      Begin VB.Label 크래딧 
         BackStyle       =   0  '투명
         BorderStyle     =   1  '단일 고정
         Caption         =   "jiun0623^heonsheen CopyRightⓒ2008     :::::::    J and H    ::::::::         Algo Korea"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   9960
         TabIndex        =   44
         Top             =   120
         Width           =   1695
      End
      Begin VB.Label expexp 
         Alignment       =   2  '가운데 맞춤
         BackStyle       =   0  '투명
         Caption         =   "0 %"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   8040
         TabIndex        =   33
         Top             =   720
         Width           =   975
      End
      Begin VB.Shape exp통 
         BorderWidth     =   2
         Height          =   375
         Left            =   7560
         Top             =   720
         Width           =   2000
      End
      Begin VB.Shape mp통 
         BorderWidth     =   2
         Height          =   375
         Left            =   4560
         Top             =   720
         Width           =   1995
      End
      Begin VB.Shape hp통 
         BorderWidth     =   2
         Height          =   375
         Left            =   1800
         Top             =   720
         Width           =   1995
      End
      Begin VB.Label 장비 
         Alignment       =   2  '가운데 맞춤
         BorderStyle     =   1  '단일 고정
         Caption         =   "장비(E)"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4800
         TabIndex        =   22
         Top             =   120
         Width           =   735
      End
      Begin VB.Label 스텟 
         Alignment       =   2  '가운데 맞춤
         BorderStyle     =   1  '단일 고정
         Caption         =   "스텟(S)"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3960
         TabIndex        =   21
         Tag             =   "0"
         Top             =   120
         Width           =   735
      End
      Begin VB.Label 스킬 
         Alignment       =   2  '가운데 맞춤
         BorderStyle     =   1  '단일 고정
         Caption         =   "스킬(K)"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3120
         TabIndex        =   20
         Tag             =   "0"
         Top             =   120
         Width           =   735
      End
      Begin VB.Label 인벤토리 
         Alignment       =   2  '가운데 맞춤
         BorderStyle     =   1  '단일 고정
         Caption         =   "인벤토리(I)"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2040
         TabIndex        =   19
         Top             =   120
         Width           =   975
      End
      Begin VB.Label 맵표시 
         Caption         =   "알고리즘이 하빈이에게 미치는 영향을 분석한 곳"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   6600
         TabIndex        =   18
         Top             =   120
         Width           =   3255
      End
      Begin VB.Label 맵표시나타내기 
         Caption         =   "현재 위치 : "
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   5760
         TabIndex        =   17
         Top             =   120
         Width           =   855
      End
      Begin VB.Shape hpc 
         BorderWidth     =   2
         FillColor       =   &H000000FF&
         FillStyle       =   0  '단색
         Height          =   375
         Left            =   1800
         Top             =   720
         Width           =   1995
      End
      Begin VB.Label hpm 
         Alignment       =   2  '가운데 맞춤
         Caption         =   "50"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3000
         TabIndex        =   16
         Top             =   480
         Width           =   735
      End
      Begin VB.Label hp슬래시 
         Caption         =   "/"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2760
         TabIndex        =   15
         Top             =   480
         Width           =   135
      End
      Begin VB.Label hpn 
         Alignment       =   2  '가운데 맞춤
         Caption         =   "50"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1920
         TabIndex        =   14
         Top             =   480
         Width           =   735
      End
      Begin VB.Label hp나타내기 
         Caption         =   "HP"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H008080FF&
         Height          =   375
         Left            =   1320
         TabIndex        =   13
         Top             =   720
         Width           =   375
      End
      Begin VB.Label mp나타내기 
         Caption         =   "MP"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF8080&
         Height          =   375
         Left            =   3960
         TabIndex        =   12
         Top             =   720
         Width           =   525
      End
      Begin VB.Shape mpc 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         FillColor       =   &H00FF0000&
         FillStyle       =   0  '단색
         Height          =   375
         Left            =   4560
         Top             =   720
         Width           =   1995
      End
      Begin VB.Label mpn 
         Alignment       =   2  '가운데 맞춤
         Caption         =   "25"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4680
         TabIndex        =   11
         Top             =   480
         Width           =   615
      End
      Begin VB.Label mp슬래시 
         Caption         =   "/"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   5400
         TabIndex        =   10
         Top             =   480
         Width           =   135
      End
      Begin VB.Label mpm 
         Alignment       =   2  '가운데 맞춤
         Caption         =   "25"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   5640
         TabIndex        =   9
         Top             =   480
         Width           =   735
      End
      Begin VB.Shape exp 
         FillColor       =   &H0000FFFF&
         FillStyle       =   0  '단색
         Height          =   375
         Left            =   7560
         Top             =   720
         Width           =   15
      End
      Begin VB.Label exp나타내기 
         Caption         =   "EXP"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0080FFFF&
         Height          =   375
         Left            =   6840
         TabIndex        =   8
         Top             =   720
         Width           =   615
      End
      Begin VB.Label expp 
         Alignment       =   2  '가운데 맞춤
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   8640
         TabIndex        =   7
         Top             =   480
         Width           =   855
      End
      Begin VB.Label expn 
         Alignment       =   2  '가운데 맞춤
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   7560
         TabIndex        =   6
         Top             =   480
         Width           =   855
      End
      Begin VB.Label exp슬래시 
         Caption         =   "/"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   8520
         TabIndex        =   5
         Top             =   480
         Width           =   135
      End
      Begin VB.Label job 
         Alignment       =   2  '가운데 맞춤
         BorderStyle     =   1  '단일 고정
         Caption         =   "초보자"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
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
         Top             =   240
         Width           =   975
      End
      Begin VB.Label Menu 
         Alignment       =   2  '가운데 맞춤
         BorderStyle     =   1  '단일 고정
         Caption         =   "메뉴(M)"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   3
         Top             =   120
         Width           =   735
      End
   End
   Begin MSComctlLib.StatusBar sb 
      Align           =   2  '아래 맞춤
      Height          =   240
      Left            =   0
      TabIndex        =   78
      Top             =   5550
      Width           =   14850
      _ExtentX        =   26194
      _ExtentY        =   423
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2293
            MinWidth        =   2293
            Text            =   "DragonStriker"
            TextSave        =   "DragonStriker"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3881
            MinWidth        =   3881
            Text            =   "시간"
            TextSave        =   "시간"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3969
            MinWidth        =   3969
            Text            =   "게임상 시간 : 00 : 00 : 00"
            TextSave        =   "게임상 시간 : 00 : 00 : 00"
         EndProperty
      EndProperty
   End
   Begin VB.Label quest1 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8880
      TabIndex        =   79
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label 영창 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "무한 검제"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   26.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   735
      Left            =   240
      TabIndex        =   76
      Top             =   960
      Visible         =   0   'False
      Width           =   14295
   End
   Begin VB.Label 데미지2 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   2040
      TabIndex        =   75
      Top             =   2280
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label 내데미지 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   2040
      TabIndex        =   31
      Top             =   2280
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label jobit 
      Alignment       =   1  '오른쪽 맞춤
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   74
      Top             =   600
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label 지우기 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      BorderStyle     =   1  '단일 고정
      Caption         =   "지우기"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   13800
      TabIndex        =   73
      Top             =   1875
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Image npc전직관 
      Height          =   1290
      Left            =   840
      Picture         =   "Form1.frx":27579A
      Stretch         =   -1  'True
      Top             =   2520
      Visible         =   0   'False
      Width           =   705
   End
   Begin VB.Label 닫기 
      Alignment       =   2  '가운데 맞춤
      BackColor       =   &H000000FF&
      BorderStyle     =   1  '단일 고정
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   0
      TabIndex        =   40
      Top             =   0
      Width           =   375
   End
   Begin VB.Label 많이올리기 
      Alignment       =   2  '가운데 맞춤
      BackColor       =   &H00FFC0C0&
      Caption         =   "▲"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   14640
      TabIndex        =   72
      Top             =   720
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label 많이내리기 
      Alignment       =   2  '가운데 맞춤
      BackColor       =   &H00C0C0FF&
      Caption         =   "▼"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   14640
      TabIndex        =   71
      Top             =   1680
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label 내용창열기 
      Alignment       =   2  '가운데 맞춤
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  '단일 고정
      Caption         =   "내용창"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   14280
      TabIndex        =   37
      Top             =   0
      Width           =   615
   End
   Begin VB.Label 늘리기줄이기 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  '단일 고정
      Caption         =   "  -"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   11760
      TabIndex        =   35
      ToolTipText     =   "중요사항 표시창을 줄입니다."
      Top             =   0
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.Label 올리기 
      Alignment       =   2  '가운데 맞춤
      BackColor       =   &H0000FF00&
      BorderStyle     =   1  '단일 고정
      Caption         =   "↑"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   14640
      TabIndex        =   39
      Top             =   450
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label 내리기 
      Alignment       =   2  '가운데 맞춤
      BackColor       =   &H000080FF&
      BorderStyle     =   1  '단일 고정
      Caption         =   "↓"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   14640
      TabIndex        =   38
      Top             =   1920
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label 중요사항알림 
      Alignment       =   2  '가운데 맞춤
      BackColor       =   &H00FFC0C0&
      Caption         =   "-중요사항을표시합니다.-"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   11760
      TabIndex        =   36
      Top             =   0
      Visible         =   0   'False
      Width           =   3135
   End
   Begin VB.Label 중요사항 
      BackColor       =   &H00C0FFC0&
      Height          =   1725
      Left            =   11760
      TabIndex        =   34
      Top             =   450
      Visible         =   0   'False
      Width           =   3135
   End
   Begin VB.Label 상인체크 
      Alignment       =   2  '가운데 맞춤
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   69
      Top             =   360
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Image arrow 
      Height          =   240
      Index           =   4
      Left            =   5400
      Picture         =   "Form1.frx":27593D
      Top             =   2280
      Visible         =   0   'False
      Width           =   945
   End
   Begin VB.Image arrow 
      Height          =   240
      Index           =   3
      Left            =   5160
      Picture         =   "Form1.frx":2759A9
      Top             =   2280
      Visible         =   0   'False
      Width           =   945
   End
   Begin VB.Image arrow 
      Height          =   240
      Index           =   2
      Left            =   5280
      Picture         =   "Form1.frx":275A15
      Top             =   2280
      Visible         =   0   'False
      Width           =   945
   End
   Begin VB.Image arrow 
      Height          =   240
      Index           =   1
      Left            =   5520
      Picture         =   "Form1.frx":275A81
      Top             =   2280
      Visible         =   0   'False
      Width           =   945
   End
   Begin VB.Label Name1 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "Name"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   255
      Left            =   2040
      TabIndex        =   66
      Top             =   3840
      Width           =   1695
   End
   Begin VB.Image c1 
      Height          =   1110
      Left            =   2520
      Picture         =   "Form1.frx":275AED
      Stretch         =   -1  'True
      Top             =   2620
      Width           =   495
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   4
      Left            =   9480
      TabIndex        =   41
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   3
      Left            =   7320
      TabIndex        =   29
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   2
      Left            =   4080
      TabIndex        =   28
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   1
      Left            =   1440
      TabIndex        =   27
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label 하빈이 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "하빈이"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   255
      Left            =   10680
      TabIndex        =   23
      Top             =   2280
      Width           =   615
   End
   Begin VB.Image npc하빈이 
      Height          =   1200
      Left            =   10680
      Picture         =   "Form1.frx":276157
      Stretch         =   -1  'True
      Top             =   2565
      Width           =   465
   End
   Begin VB.Image m 
      Height          =   2280
      Index           =   18
      Left            =   3600
      Picture         =   "Form1.frx":276253
      Stretch         =   -1  'True
      Tag             =   "2500"
      ToolTipText     =   "1440"
      Top             =   -3560
      Width           =   2235
   End
   Begin VB.Image m 
      Height          =   840
      Index           =   17
      Left            =   6600
      Picture         =   "Form1.frx":276858
      Stretch         =   -1  'True
      Tag             =   "75"
      ToolTipText     =   "2880"
      Top             =   -2120
      Width           =   915
   End
   Begin VB.Image m 
      Height          =   840
      Index           =   16
      Left            =   8280
      Picture         =   "Form1.frx":276E5D
      Stretch         =   -1  'True
      Tag             =   "75"
      ToolTipText     =   "2880"
      Top             =   -2120
      Width           =   915
   End
   Begin VB.Image m 
      Height          =   840
      Index           =   15
      Left            =   5400
      Picture         =   "Form1.frx":277462
      Stretch         =   -1  'True
      Tag             =   "75"
      ToolTipText     =   "2880"
      Top             =   -2120
      Width           =   915
   End
   Begin VB.Image m 
      Height          =   840
      Index           =   14
      Left            =   3120
      Picture         =   "Form1.frx":277A67
      Stretch         =   -1  'True
      Tag             =   "75"
      ToolTipText     =   "2880"
      Top             =   -2120
      Width           =   915
   End
   Begin VB.Image 연금술사전직교관 
      Height          =   1575
      Left            =   3360
      Picture         =   "Form1.frx":27806C
      Stretch         =   -1  'True
      Top             =   -5000
      Width           =   735
   End
   Begin VB.Image 전사전직교관 
      Height          =   1575
      Left            =   9720
      Picture         =   "Form1.frx":27817C
      Stretch         =   -1  'True
      Top             =   -5000
      Width           =   1335
   End
   Begin VB.Image 마법사전직교관 
      Height          =   1395
      Left            =   6360
      Picture         =   "Form1.frx":2782B5
      Stretch         =   -1  'True
      Top             =   -5000
      Width           =   1035
   End
   Begin VB.Image 궁수전직교관 
      Height          =   1560
      Left            =   8040
      Picture         =   "Form1.frx":278452
      Stretch         =   -1  'True
      Top             =   -5000
      Width           =   1875
   End
   Begin VB.Image 전직교관 
      Height          =   1050
      Left            =   8400
      Picture         =   "Form1.frx":2785B1
      Top             =   30000
      Width           =   585
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "350"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Index           =   13
      Left            =   10200
      TabIndex        =   58
      ToolTipText     =   "480"
      Top             =   -4280
      Width           =   1335
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "350"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Index           =   12
      Left            =   5520
      TabIndex        =   57
      ToolTipText     =   "480"
      Top             =   -4280
      Width           =   1215
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "350"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Index           =   11
      Left            =   2040
      TabIndex        =   56
      ToolTipText     =   "480"
      Top             =   -4280
      Width           =   1215
   End
   Begin VB.Image m 
      Height          =   2535
      Index           =   13
      Left            =   9240
      Picture         =   "Form1.frx":278754
      Stretch         =   -1  'True
      ToolTipText     =   "1200"
      Top             =   -3800
      Width           =   2415
   End
   Begin VB.Image m 
      Height          =   2535
      Index           =   12
      Left            =   5400
      Picture         =   "Form1.frx":278D1B
      Stretch         =   -1  'True
      ToolTipText     =   "1200"
      Top             =   -3800
      Width           =   2295
   End
   Begin VB.Image m 
      Height          =   2535
      Index           =   11
      Left            =   1920
      Picture         =   "Form1.frx":2792E0
      Stretch         =   -1  'True
      ToolTipText     =   "1200"
      Top             =   -3800
      Width           =   2295
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   10
      Left            =   11280
      TabIndex        =   55
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   9
      Left            =   8280
      TabIndex        =   54
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   8
      Left            =   6120
      TabIndex        =   53
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   7
      Left            =   4320
      TabIndex        =   52
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   6
      Left            =   840
      TabIndex        =   51
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   855
   End
   Begin VB.Image m 
      Height          =   1635
      Index           =   10
      Left            =   10680
      Picture         =   "Form1.frx":2798A7
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1455
   End
   Begin VB.Image m 
      Height          =   1620
      Index           =   9
      Left            =   8160
      Picture         =   "Form1.frx":279E4F
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1425
   End
   Begin VB.Image m 
      Height          =   1635
      Index           =   8
      Left            =   6120
      Picture         =   "Form1.frx":27A3F7
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1455
   End
   Begin VB.Image m 
      Height          =   1620
      Index           =   7
      Left            =   3720
      Picture         =   "Form1.frx":27A9A3
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1425
   End
   Begin VB.Image m 
      Height          =   1620
      Index           =   6
      Left            =   840
      Picture         =   "Form1.frx":27AF4F
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1425
   End
   Begin VB.Label 데미지 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   2040
      TabIndex        =   30
      Top             =   2280
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Image map2 
      Height          =   780
      Left            =   0
      Picture         =   "Form1.frx":27B4F7
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   14880
   End
   Begin VB.Label 내용 
      Alignment       =   2  '가운데 맞춤
      BorderStyle     =   1  '단일 고정
      Caption         =   "대화할 내용이 출력됩니다."
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   2160
      TabIndex        =   26
      Top             =   1440
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label up 
      Alignment       =   2  '가운데 맞춤
      BackColor       =   &H0000FF00&
      Caption         =   "           LEVEL UP!"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   2160
      TabIndex        =   32
      Top             =   2040
      Width           =   1200
   End
   Begin VB.Image m 
      Height          =   1095
      Index           =   1
      Left            =   1560
      Picture         =   "Form1.frx":284AD9
      Stretch         =   -1  'True
      ToolTipText     =   "2620"
      Top             =   2625
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image m 
      Height          =   1095
      Index           =   5
      Left            =   11880
      Picture         =   "Form1.frx":2850B0
      Stretch         =   -1  'True
      ToolTipText     =   "2625"
      Top             =   2625
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image m 
      Height          =   1080
      Index           =   4
      Left            =   9240
      Picture         =   "Form1.frx":285687
      Stretch         =   -1  'True
      ToolTipText     =   "2640"
      Top             =   2640
      Visible         =   0   'False
      Width           =   915
   End
   Begin VB.Image m 
      Height          =   1140
      Index           =   2
      Left            =   3840
      Picture         =   "Form1.frx":285C5E
      Stretch         =   -1  'True
      ToolTipText     =   "2580"
      Top             =   2580
      Visible         =   0   'False
      Width           =   1035
   End
   Begin VB.Image m 
      Height          =   1095
      Index           =   3
      Left            =   7440
      Picture         =   "Form1.frx":286235
      Stretch         =   -1  'True
      ToolTipText     =   "2640"
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image C표지판 
      Height          =   1305
      Left            =   5160
      Picture         =   "Form1.frx":28680C
      Stretch         =   -1  'True
      Top             =   2520
      Visible         =   0   'False
      Width           =   1170
   End
   Begin VB.Image c마을판 
      Height          =   1305
      Left            =   240
      OLEDragMode     =   1  '자동
      OLEDropMode     =   2  '자동
      Picture         =   "Form1.frx":286C88
      Stretch         =   -1  'True
      Top             =   2520
      Visible         =   0   'False
      Width           =   1170
   End
   Begin VB.Image door2 
      Height          =   1860
      Left            =   -120
      OLEDropMode     =   2  '자동
      Picture         =   "Form1.frx":28717F
      Stretch         =   -1  'True
      Top             =   1875
      Visible         =   0   'False
      Width           =   1485
   End
   Begin VB.Image door1 
      Height          =   1620
      Left            =   13560
      Picture         =   "Form1.frx":287931
      Stretch         =   -1  'True
      Top             =   2120
      Visible         =   0   'False
      WhatsThisHelpID =   9999
      Width           =   1410
   End
   Begin VB.Image npc분수 
      Height          =   2175
      Left            =   5400
      Picture         =   "Form1.frx":2880E3
      Stretch         =   -1  'True
      Tag             =   "1"
      Top             =   1560
      Visible         =   0   'False
      Width           =   2655
   End
   Begin VB.Label 물약상인1 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "물약상인"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF80FF&
      Height          =   255
      Left            =   11040
      TabIndex        =   70
      Top             =   2160
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label mh 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   5
      Left            =   11640
      TabIndex        =   43
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label 무기상인1 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "무기상인"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF00FF&
      Height          =   255
      Left            =   3240
      TabIndex        =   68
      Top             =   2040
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label 방어구상인1 
      Alignment       =   2  '가운데 맞춤
      BackStyle       =   0  '투명
      Caption         =   "방어구상인"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF00FF&
      Height          =   255
      Left            =   8520
      TabIndex        =   67
      Top             =   2280
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image npc방어구상인1 
      Height          =   1335
      Left            =   8520
      Picture         =   "Form1.frx":289CE6
      Stretch         =   -1  'True
      Top             =   2520
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Image npc무기상인1 
      Height          =   1440
      Left            =   3240
      Picture         =   "Form1.frx":28A32E
      Stretch         =   -1  'True
      Top             =   2340
      Visible         =   0   'False
      Width           =   1680
   End
   Begin VB.Image npc물약상인1 
      Height          =   1455
      Left            =   11040
      Picture         =   "Form1.frx":28AE38
      Stretch         =   -1  'True
      Top             =   2400
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Image mapi 
      Height          =   3735
      Index           =   1
      Left            =   0
      Picture         =   "Form1.frx":28BF61
      Stretch         =   -1  'True
      Top             =   0
      Width           =   7695
   End
   Begin VB.Image mapi 
      Height          =   3735
      Index           =   2
      Left            =   7680
      Picture         =   "Form1.frx":2F48D7
      Stretch         =   -1  'True
      Top             =   0
      Width           =   7215
   End
   Begin VB.Menu M_M 
      Caption         =   "메뉴"
      NegotiatePosition=   2  '가운데
      Begin VB.Menu M_exit 
         Caption         =   "종료"
         Index           =   1
      End
      Begin VB.Menu M_Save 
         Caption         =   "Save"
         Index           =   2
      End
      Begin VB.Menu M_key 
         Caption         =   "키셋팅"
         Index           =   3
      End
      Begin VB.Menu M_logeout 
         Caption         =   "로그아웃"
         Index           =   9
      End
   End
   Begin VB.Menu M_SoundVass 
      Caption         =   "배경음"
      Index           =   10
      Begin VB.Menu M_SoundPlay 
         Caption         =   "Play!"
         Index           =   12
      End
      Begin VB.Menu M_SoundStop 
         Caption         =   "Stop!"
         Index           =   11
      End
      Begin VB.Menu M_SoundChange 
         Caption         =   "곡 바꾸기"
         Index           =   13
      End
   End
   Begin VB.Menu M_inv 
      Caption         =   "인벤토리"
      Index           =   5
      NegotiatePosition=   2  '가운데
   End
   Begin VB.Menu M_Skill 
      Caption         =   "스킬"
      Index           =   6
      NegotiatePosition=   2  '가운데
   End
   Begin VB.Menu M_stat 
      Caption         =   "스텟"
      Index           =   7
      NegotiatePosition=   2  '가운데
   End
   Begin VB.Menu M_ea 
      Caption         =   "장비"
      Index           =   8
      NegotiatePosition=   2  '가운데
   End
   Begin VB.Menu M_qu 
      Caption         =   "Quest"
      Index           =   14
      NegotiatePosition=   2  '가운데
   End
End
Attribute VB_Name = "map"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim qu1, alt, at, up1a, dmmo, dmm, demo, dem, bb, qest, atp, cl, ma, te, aw, aq, q1, ch, chp, mhp, cmp, mmp, lev, exn, exm, sp, kp, js, jobch As Long
Dim jobar, jobmg, jobwa, jobac  As Integer: Dim mapcaption As Date: Dim md(20): Dim mz(20): Dim hp(20): Dim ar(4)
Dim maping, trv As Long: Dim kr: Dim ari(4, 2): Dim jobi: Dim que: Dim qus: Dim ky(255): Dim sk(10): Dim nt: Dim tih, tim, tis
Private Sub 궁수전직교관_Click()

jobwa = MsgBox("활과 화살로 적을 공격하는 궁수... 궁수가 되보지 않겠나?", vbYesNo, "궁수전직교관")
If jobwa = 6 Then
    job.Caption = "궁수"
    c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\헌터11.gif")
    jobar = MsgBox(job.Caption & "가 된 것을 진심으로 축하하네.", vbOKOnly, "궁수전직교관")
    jobar = MsgBox("내가 견습용 화살 1개를 주겠네 이 화살 1개는 무한적으로 사용할수있다네 (공격력 + 9)", vbOKOnly, "궁수전직교관")
      inv.arrow(1).ToolTipText = (Val(inv.arrow(1).ToolTipText) + 1)
    se = 중요사항.Caption
    중요사항.Caption = se & "궁수가 되었습니다." & "                        "
    jobi = 2
    c1.Height = 1095: c1.Width = 1080
    For i = 1 To 18
        m(i).Top = m(i).Top + 5000
        If i <= 13 Then
        mh(i).Visible = True
        End If
    Next i
    c마을판.Top = c마을판.Top + 5000: C표지판.Top = C표지판.Top + 5000: door1.Top = door1.Top + 5000: door2.Top = door2.Top + 5000
    궁수전직교관.Top = -5000
    마법사전직교관.Top = -5000
    전사전직교관.Top = -5000
    연금술사전직교관.Top = -5000
    맵표시.Caption = Replace(맵표시.Caption, "전직교관들의 마을", "")
    hpm.Caption = hpm.Caption + 150
    mpm.Caption = mpn.Caption + 50
    inv.arr.Tag = 1
    inv.arr.ToolTipText = 1
End If

End Sub
Private Sub 내리기_Click()
중요사항.Top = (중요사항.Top) - 160
중요사항.Height = (중요사항.Height) + 160
End Sub
Private Sub 내용창열기_Click()

If 내용창열기.Caption = "내용창" Then
중요사항알림.Visible = True
중요사항.Visible = True
늘리기줄이기.Visible = True
내용창열기.Caption = "닫기"
올리기.Visible = True: 많이올리기.Visible = True
내리기.Visible = True: 많이내리기.Visible = True: 지우기.Visible = True
ElseIf 내용창열기.Caption = "닫기" Then
중요사항알림.Visible = False
중요사항.Visible = False
늘리기줄이기.Visible = False
내용창열기.Caption = "내용창"
올리기.Visible = False: 많이올리기.Visible = False
내리기.Visible = False: 많이내리기.Visible = False: 지우기.Visible = False
End If

End Sub
Private Sub 내용타이머_Timer()

If 내용.Caption = "돈 PKSL " Then
ElseIf 내용.Caption = "LV UP PKSL " Then
lv.Caption = "9"
lev = 10
내용.Caption = "": 내용.Visible = False
ElseIf 내용.Caption = "아이템 PKSL " Then
ins갯수.Caption = 999
home갯수.Caption = 999
pu갯수.Caption = 999
pd갯수.Caption = 999
del갯수.Caption = 999
end갯수.Caption = 999
내용.Caption = "": 내용.Visible = False
ElseIf 내용.Caption = "운영자로그인 PKSL " Then
job.Caption = "운영자"
내용.Caption = "": 내용.Visible = False
ElseIf 내용.Caption = "레벨 DS" Then
    mhp = hpm.Caption + 30: chp = mhp: hpm.Caption = mhp
    mmp = mpm.Caption + 20: cmp = mmp: mpm.Caption = mmp: mpn.Caption = cmp
    exn = exn - exm: exm = ((Val(lv.Caption) + 1) ^ 3): expp.Caption = Val(exm)
    lev = lv.Caption + 1: lv.Caption = lev: hpn.Caption = chp: sp = sp + 5: kp = kp + 1: up.Visible = True: upa = 1
    stat.sp.Caption = ((stat.sp.Caption) + 5): skill.kp.Caption = ((skill.kp.Caption) + 3)
    ddeem = 중요사항.Caption: 중요사항.Caption = ddeem & "레벨업을 하셨습니다." & "                      "
내용.Caption = "": 내용.Visible = False
End If

내용.Visible = False: 내용.Caption = ""

End Sub
Private Sub 늘리기줄이기_Click()
If 늘리기줄이기.ToolTipText = "중요사항 표시창을 줄입니다." Then
중요사항.Height = (중요사항.Height - 1545)
늘리기줄이기.ToolTipText = "중요사항 표시창을 늘입니다."
늘리기줄이기.Caption = "+"
ElseIf 늘리기줄이기.ToolTipText = "중요사항 표시창을 늘입니다." Then
중요사항.Height = (중요사항.Height + 1545)
늘리기줄이기.ToolTipText = "중요사항 표시창을 줄입니다."
늘리기줄이기.Caption = "-"
End If
End Sub
Private Sub 닫기_Click()
dj = MsgBox("끝내기 전에 저장하시겠습니까?[저장하시면 이 " & kr & "에 있는 지금까지의 정보가 이정보로 대체됩니다.]", vbYesNo, "저장M_End01 Y/N")

If dj = 6 Then

    If login.ar.Caption = 1 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
    ElseIf login.ar.Caption = 2 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
    ElseIf login.ar.Caption = 3 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
    End If
    
    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (키셋.k(i).Tag)
      End If
    Next i

    Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, 맵표시.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
    Print #1, qu1: Print #1, que: Print #1, qus
    For i = 1 To 3
    Print #1, skill.sk(i).Caption
    Next i
    For i = 1 To 6
    Print #1, skill.sk1(i).Caption
    Next i
    Print #1, skill.kp.Caption
    Print #1, inv.money.Caption
    For i = 1 To 12: Print #1, inv.포션(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.검(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
    Close #1, #2, #3
    dj = MsgBox("저장되었습니다.", vbOKOnly, "DsSave")
Else
dj = MsgBox("'DragonStriker' 를 종료 합니다", vbCritical, "DSM_End")
End If

End
End Sub
Private Sub 대화내용조절_Timer()

If trv = 1 Then
내용타이머.Interval = 8000
ElseIf trv = 0 Then
내용.Visible = False: 내용.Caption = ""
내용타이머.Interval = 0
End If

End Sub

Private Sub 데미지표시2_Timer()

If 데미지2.Visible = True Then

If nt < 5 Then
  nt = nt + 1

    데미지2.Top = 데미지2.Top - 150
    
    If nt = 1 Then
    데미지2.ForeColor = &HFF&
    ElseIf nt = 2 Then
    데미지2.ForeColor = &H8080FF
    ElseIf nt = 3 Then
    데미지2.ForeColor = &H8080FF
    ElseIf nt = 4 Then
    데미지2.ForeColor = &HC0C0FF
    ElseIf nt = 5 Then
    데미지2.ForeColor = &HC0C0FF
    End If
Else
      데미지2.Visible = False
      nt = 0
End If


End If

End Sub

Private Sub 뎀지표시_Timer()

If dem <> 0 Then

  If demo < 5 Then

  demo = demo + 1

  데미지.Top = 데미지.Top - 150

    If demo = 1 Then
    데미지.ForeColor = &HFF&
    ElseIf demo = 2 Then
    데미지.ForeColor = &H8080FF
    ElseIf demo = 3 Then
    데미지.ForeColor = &H8080FF
    ElseIf demo = 4 Then
    데미지.ForeColor = &HC0C0FF
    ElseIf demo = 5 Then
    데미지.ForeColor = &HC0C0FF
    End If
  
  ElseIf demo = 5 Then
  demo = 0
  dem = 0
  End If

ElseIf dem = 0 Then
데미지.Visible = False
End If
End Sub
Private Sub 렉걸림_Timer()
chp = (hpn.Caption)
mhp = hpm.Caption
cmp = (mpn.Caption)
mmp = mpm.Caption

If job.Caption = "초보자" Then
jobit.Caption = 0
ElseIf job.Caption = "전사" Then
jobit.Caption = 1
ElseIf job.Caption = "궁수" Then
jobit.Caption = 2
    If inv.arrow(1).ToolTipText = 0 Then
    inv.arrow(1).ToolTipText = 1
    inv.arr.Tag = 1
    End If
ElseIf job.Caption = "마법사" Then
jobit.Caption = 3
End If

End Sub
Private Sub 마법사전직교관_Click()
jobar = MsgBox("난아직 쉬어야 한다네 너무힘들군 ", vbOKOnly, "마법사전직교관")
End Sub
Private Sub 많이내리기_Click()
중요사항.Top = (중요사항.Top) - 1600
중요사항.Height = (중요사항.Height) + 1600
End Sub
Private Sub 많이올리기_Click()
If 중요사항.Top <= -1000 Then
중요사항.Top = (중요사항.Top) + 1600
중요사항.Height = (중요사항.Height) - 1600
End If
End Sub
Private Sub 말하기_Click()
  말하기.Visible = True: 내용.Caption = Text1.Text: Text1.Text = "": 내용.Visible = True: Text1.Visible = False: 말하기.Visible = False: te = 0: trv = 1
End Sub
Private Sub 몬스터위치_Timer()

If maping = 1 Then

If 맵표시.Caption = "초급 나무인형 수련장1" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 1 To 5
m(i).Top = Val(m(i).ToolTipText)
mh(i).Top = Val(m(i).ToolTipText) - Val(mh(i).ToolTipText)
Next i

  map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\blackback.bmp"): door2.Visible = False: door1.Visible = True: c마을판.Visible = False: C표지판.Visible = True: npc전직관.Visible = True

ElseIf 맵표시.Caption = "초급 나무인형 수련장2" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 6 To 10
m(i).Top = Val(m(i).ToolTipText)
mh(i).Top = Val(m(i).ToolTipText) - Val(mh(i).ToolTipText)
Next i

  door2.Visible = False: door1.Visible = True:  c마을판.Visible = True: C표지판.Visible = False: npc전직관.Visible = flase

ElseIf 맵표시.Caption = "초급 나무인형 수련장3" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 11 To 13
m(i).Top = Val(m(i).ToolTipText)
mh(i).Top = Val(m(i).ToolTipText) - Val(mh(i).ToolTipText)
Next i

  door2.Visible = True: door1.Visible = False: c마을판.Visible = False: C표지판.Visible = False

ElseIf 맵표시.Caption = "마을의 외각1" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 14 To 17
m(i).Top = Val(m(i).ToolTipText)
Next i
  npc무기상인1.Visible = False: 무기상인1.Visible = False: npc방어구상인1.Visible = False: 방어구상인1.Visible = False: npc물약상인1.Visible = False: 물약상인1.Visible = False: npc전직관.Visible = flase
  c마을판.Visible = False: C표지판.Visible = False: npc분수.Visible = False: map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\ground.bmp"): door2.Visible = True: door1.Visible = True

ElseIf 맵표시.Caption = "큰 구덩이" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 14 To 18
m(i).Top = Val(m(i).ToolTipText)
Next i

   c마을판.Visible = False: C표지판.Visible = False:  map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\ground.bmp"): door2.Visible = True: door1.Visible = False

ElseIf 맵표시.Caption = "알고리즘이 하빈이에게 미치는 영향을 분석한 곳" Then
mapi(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky1.jpg"): mapi(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky2.jpg")
For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i

npc하빈이.Top = 2572

ElseIf 맵표시.Caption = "센티널 시티" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i

mapi(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky1.jpg"): mapi(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky2.jpg")
npc무기상인1.Visible = True: 무기상인1.Visible = True: npc방어구상인1.Visible = True: 방어구상인1.Visible = True: npc물약상인1.Visible = True: 물약상인1.Visible = True
door2.Visible = True: door1.Visible = True: map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\back마을.bmp"): npc분수.Visible = True

ElseIf 맵표시.Caption = "센티널 시티 뒷골목" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i

npc무기상인1.Visible = False: 무기상인1.Visible = False: npc방어구상인1.Visible = False: 방어구상인1.Visible = False: npc물약상인1.Visible = False: 물약상인1.Visible = False
door2.Visible = True: door1.Visible = False: map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\blackback.bmp"): npc분수.Visible = False

End If

End If

maping = 0
Name1.Left = c1.Left - 600

End Sub
Private Sub 몬스터hp_Timer()
For i = 1 To 13
mh(i).Caption = hp(i)
Next i
For i = 14 To 18
m(i).Tag = hp(i)
Next i
End Sub
Private Sub 스킬_Click()
skill.Visible = True
skill.전직1차(1).Top = -5000: skill.전직1차(2).Top = -5000
If map.job.Caption <> "초보자" Then
skill.전직1차(Val(map.jobit.Caption)).Top = 360
End If
End Sub
Private Sub 스텟_Click()
stat.Visible = True
End Sub
Private Sub 연금술사전직교관_Click()
jobac = MsgBox("나는 이마을에 온지 별로 안되서 조금쉬어야 하네", vbOKOnly, "연금술사전직교관")
End Sub
Private Sub 올리기_Click()
If 중요사항.Top <= 290 Then
중요사항.Top = (중요사항.Top) + 160
중요사항.Height = (중요사항.Height) - 160
End If
End Sub
Private Sub 이동_Timer()

If bb = 1 And c1.Left >= ((Val(stat.이속.Caption) + 10) / 2) Then
    c1.Left = c1.Left - ((Val(stat.이속.Caption) + 10) / 2)
    cl = 1
    Name1.Left = c1.Left - 600
ElseIf bb = 2 And c1.Left <= ((14550) - ((Val(stat.이속.Caption) + 10) / 2)) Then
    c1.Left = c1.Left + ((Val(stat.이속.Caption) + 10) / 2)
    cl = 2
    Name1.Left = c1.Left - 600
End If

End Sub
Private Sub 인벤토리_Click()
inv.Visible = True
End Sub
Private Sub 장비_Click()
re = MsgBox("아직 미완성 기능입니다.", vbCritical, "오류00FF242")
End Sub

Private Sub 전사전직교관_Click()
jobwa = MsgBox("검과 검술로 적을 공격하는 전사... 전사가 되보지 않겠나?", vbYesNo, "전사전직교관")
If jobwa = 6 Then
    job.Caption = "전사"
    c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트11.gif")
    jobar = MsgBox(job.Caption & "가 된 것을 진심으로 축하하네.", vbOKOnly, "전사전직교관")
    se = 중요사항.Caption
    중요사항.Caption = se & "전사가 되었습니다." & "                        "
    jobi = 1
    c1.Height = 1095: c1.Width = 1080
    For i = 1 To 18
        m(i).Top = m(i).Top + 5000
        If i <= 13 Then
        mh(i).Visible = True
        End If
    Next i
    c마을판.Top = c마을판.Top + 5000: C표지판.Top = C표지판.Top + 5000: door1.Top = door1.Top + 5000: door2.Top = door2.Top + 5000
    궁수전직교관.Top = -5000
    마법사전직교관.Top = -5000
    전사전직교관.Top = -5000
    연금술사전직교관.Top = -5000
    맵표시.Caption = Replace(맵표시.Caption, "전직교관들의 마을", "")
    hpm.Caption = hpm.Caption + 250
    mpm.Caption = mpn.Caption - 50
End If
End Sub

Private Sub 점프_Timer()

If alt = 1 Then

  For al = 1 To 15
  If js = 1 Then
    If c1.Left > 0 Then
    c1.Left = c1.Left - ((Val(stat.이속.Caption) + 10) / 2): 내용.Left = 내용.Left - ((Val(stat.이속.Caption) + 10) / 2): Name1.Left = Name1.Left - ((Val(stat.이속.Caption) + 10) / 2)
    End If
  ElseIf js = 2 Then
    If c1.Left < 14400 Then
    c1.Left = c1.Left + ((Val(stat.이속.Caption) + 10) / 2): 내용.Left = 내용.Left + ((Val(stat.이속.Caption) + 10) / 2): Name1.Left = Name1.Left + ((Val(stat.이속.Caption) + 10) / 2)
    End If
  End If
  c1.Top = c1.Top - ((Val(stat.이속.Caption) + 10) / 2) + 10: 내용.Top = 내용.Top - ((Val(stat.이속.Caption) + 10) / 2) + 10: Name1.Top = Name1.Top - ((Val(stat.이속.Caption) + 10) / 2) + 10
  Next al

  For al = 1 To 15
  If js = 1 Then
    If c1.Left > 0 Then
    c1.Left = c1.Left - ((Val(stat.이속.Caption) + 10) / 2): 내용.Left = 내용.Left - ((Val(stat.이속.Caption) + 10) / 2): Name1.Left = Name1.Left - ((Val(stat.이속.Caption) + 10) / 2)
    End If
  ElseIf js = 2 Then
    If c1.Left < 14400 Then
    c1.Left = c1.Left + ((Val(stat.이속.Caption) + 10) / 2): 내용.Left = 내용.Left + ((Val(stat.이속.Caption) + 10) / 2): Name1.Left = Name1.Left + ((Val(stat.이속.Caption) + 10) / 2)
    End If
  End If
  c1.Top = c1.Top + ((Val(stat.이속.Caption) + 10) / 2) - 10: 내용.Top = 내용.Top + ((Val(stat.이속.Caption) + 10) / 2) - 10: Name1.Top = Name1.Top + ((Val(stat.이속.Caption) + 10) / 2) - 10
  Next al
  
End If
alt = 0
End Sub
Private Sub 중요사항올리기_Timer()

If 중요사항.Caption <> dwssp Then
중요사항.Top = (중요사항.Top) - 160
중요사항.Height = (중요사항.Height) + 160
Else
End If
dwssp = 중요사항.Caption
End Sub
Private Sub 지우기_Click()
중요사항.Caption = ""
중요사항.Height = 1725
중요사항.Top = 450
End Sub

Private Sub 캐릭터가맞는데미지_Timer()

If demm <= 5 Then

demm = demm + 1

내데미지.Top = 내데미지.Top - 100

  If demm = 1 Then
    내데미지.ForeColor = &HFF0000
    ElseIf demm = 2 Then
    내데미지.ForeColor = &HFF8080
    ElseIf demm = 3 Then
    내데미지.ForeColor = &HFF8080
    ElseIf demm = 4 Then
    내데미지.ForeColor = &HFFC0C0
    ElseIf demm = 5 Then
    내데미지.ForeColor = &HFFC0C0
    End If
  
ElseIf demm = 6 Then

demm = 0
dmm = 0
내데미지.Visible = False

End If

End Sub

Private Sub 큌슬롯_Timer()

ins.Picture = 키셋.k(45).Picture
del.Picture = 키셋.k(46).Picture
pu.Picture = 키셋.k(33).Picture
pd.Picture = 키셋.k(34).Picture
hom.Picture = 키셋.k(36).Picture
en.Picture = 키셋.k(35).Picture
quest1.Caption = que & ":" & qus

End Sub
Private Sub 키셋팅_Click()
키셋.Visible = True
End Sub

Private Sub 화살_Timer()

If inv.arr.Tag = 1 Then

If ar(1) = 1 Then
    arrow(1).Left = arrow(1).Left - 150 - ((skill.sk1(5) * 3) + 60)
End If
If ar(2) = 1 Then
    arrow(2).Left = arrow(2).Left - 150 - ((skill.sk1(5) * 3) + 60)
End If
If ar(3) = 1 Then
    arrow(3).Left = arrow(3).Left - 150 - ((skill.sk1(5) * 3) + 60)
End If
If ar(4) = 1 Then
    arrow(4).Left = arrow(4).Left - 150 - ((skill.sk1(5) * 3) + 60)
End If
If ar(1) = 2 Then
    arrow(1).Left = arrow(1).Left + 150 + ((skill.sk1(5) * 3) + 60)
End If
If ar(2) = 2 Then
    arrow(2).Left = arrow(2).Left + 150 + ((skill.sk1(5) * 3) + 60)
End If
If ar(3) = 2 Then
    arrow(3).Left = arrow(3).Left + 150 + ((skill.sk1(5) * 3) + 60)
End If
If ar(4) = 2 Then
    arrow(4).Left = arrow(4).Left + 150 + ((skill.sk1(5) * 3) + 60)
End If

For i = 1 To 4
    If ari(i, 2) = 1 Then
      If arrow(i).Left <= (ari(i, 1) - 5500 - (skill.sk1(5) * 75 + 500)) Then
        ar(i) = 0
        arrow(i).Visible = False
      End If
    ElseIf ari(i, 2) = 2 Then
      If arrow(i).Left >= (ari(i, 1) + 5500 + (skill.sk1(5) * 75 + 500)) Then
        ar(i) = 0
        arrow(i).Visible = False
      End If
    End If
Next i
Else
End If

For p = 1 To (sk(3) + 1)
    If p = 2 Then
        If (Val(mpn.Caption) - ((Val(skill.sk1(6)) * 3) + 10)) >= 0 Then
        mpn.Caption = (Val(mpn.Caption) - ((Val(skill.sk1(6)) * 3) + 10))
        cmp = mpn.Caption
        Else
        중요사항.Caption = "MP가 부족합니다.                                   "
            For i = 1 To 4
                ar(i) = 0
                arrow(i).Visible = False
                GoTo SS
            Next i
        End If
    End If
  
    For i = 1 To 4
     
        If ar(i) <> 0 Then
        
          For j = 1 To 18
          
        txww = ((((Val(stat.dex.Caption)) * (Val(stat.str.Caption))) / 8) + (Val(map.lv.Caption))) - (((Val(stat.dex.Caption)) * ((Val(stat.str.Caption)) / 3) / 4) + map.lv.Caption)
        dxww = (((Val(stat.dex.Caption)) * ((Val(stat.str.Caption)) / 3) / 4) + map.lv.Caption)
        
        Randomize
          If (sk(3)) = 1 Then
          at = Int(((Int((Int(Rnd * txww) + dxww) + 0.5)) * (((Val(skill.sk1(6).Caption) * 4) + 40) / 100)) + 0.5)
          Else
          at = (Int((Int(Rnd * txww) + dxww) + 0.5))
          End If
                Randomize
                r = (Int(Rnd * 100) + 1)
                    If r <= ((Val(skill.sk(2).Caption) * 5) + 15 + (skill.sk1(4) * 2)) Then
                        at = Int((at * (((skill.sk(2).Caption * 20) + 100 + (skill.sk1(4) * 2)) / 100)) + 0.5)
                        up = " !"
                    Else
                        up = ""
                    End If
            If j < 6 And j > 0 And 맵표시.Caption = "초급 나무인형 수련장1" Then
              
              If (arrow(i).Left - 480) <= m(j).Left And (arrow(i).Left + 600) >= m(j).Left And Val(mh(j).Caption) > 0 Then
                  Randomize
                  dem = j
                  데미지.Top = m(j).Top - 300
                  데미지2.Top = m(j).Top - 150
                  at = (at - (Int(Rnd * 2) + 0))
                    If at <= 0 Then
                      If p = 1 Then
                      데미지.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      데미지2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        데미지.Caption = at & up
                        ElseIf p = 2 Then
                        데미지2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                데미지.Left = m(j).Left - 130
                데미지.Visible = True
                ElseIf p = 2 Then
                데미지2.Left = m(j).Left - 130
                데미지2.Visible = True
                데미지2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            ElseIf j < 11 And j > 5 And 맵표시.Caption = "초급 나무인형 수련장2" Then
              
              If (arrow(i).Left - 360) <= m(j).Left And (arrow(i).Left + 480) >= m(j).Left And Val(mh(j).Caption) > 0 Then
                Randomize
                deem = j
                데미지.Top = m(j).Top - 300
                at = (at - (Int(Rnd * 4) + 5))
                    If at <= 0 Then
                      If p = 1 Then
                      데미지.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      데미지2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        데미지.Caption = at & up
                        ElseIf p = 2 Then
                        데미지2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                데미지.Left = m(j).Left - 130
                데미지.Visible = True
                ElseIf p = 2 Then
                데미지2.Left = m(j).Left - 130
                데미지2.Visible = True
                데미지2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            ElseIf j < 14 And j > 10 And 맵표시.Caption = "초급 나무인형 수련장3" Then
             
              If (arrow(i).Left - 480) <= m(j).Left And (arrow(i).Left + 960) >= m(j).Left And Val(mh(j).Caption) > 0 Then
                Randomize
                dem = j
                데미지.Top = m(j).Top - 300
                at = (at - (Int(Rnd * 4) + 10))
                    If at <= 0 Then
                      If p = 1 Then
                      데미지.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      데미지2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        데미지.Caption = at & up
                        ElseIf p = 2 Then
                        데미지2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                데미지.Left = m(j).Left - 130
                데미지.Visible = True
                ElseIf p = 2 Then
                데미지2.Left = m(j).Left - 130
                데미지2.Visible = True
                데미지2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            ElseIf (j < 18 And j > 13 And 맵표시.Caption = "마을의 외각1") Or (j < 18 And j > 13 And 맵표시.Caption = "큰 구덩이") Then
             
              If (arrow(i).Left - 480) <= m(j).Left And (arrow(i).Left + 960) >= m(j).Left And Val(m(j).Tag) > 0 Then
                Randomize
                dem = j
                데미지.Top = m(j).Top - 300
                at = (at - (Int(Rnd * 4) + 10))
                    If at <= 0 Then
                      If p = 1 Then
                      데미지.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      데미지2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        데미지.Caption = at & up
                        ElseIf p = 2 Then
                        데미지2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                데미지.Left = m(j).Left - 130
                데미지.Visible = True
                ElseIf p = 2 Then
                데미지2.Left = m(j).Left - 130
                데미지2.Visible = True
                데미지2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            ElseIf j < 19 And j > 17 And 맵표시.Caption = "큰 구덩이" Then
             
              If (arrow(i).Left - 5200) <= m(j).Left And (arrow(i).Left + 1000) >= m(j).Left And Val(m(j).Tag) > 0 Then
                Randomize
                dem = j
                데미지.Top = m(j).Top - 300
                at = (at - (Int(Rnd * 4) + 25))
                    If at <= 0 Then
                      If p = 1 Then
                      데미지.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      데미지2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        데미지.Caption = at & up
                        ElseIf p = 2 Then
                        데미지2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                데미지.Left = m(j).Left - 130
                데미지.Visible = True
                ElseIf p = 2 Then
                데미지2.Left = m(j).Left - 130
                데미지2.Visible = True
                데미지2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            End If
          Next j
          
          For j = 14 To 18
            Exit For
          Next j
        
        End If
    
    Next i
tt:
Next p
SS:
End Sub
Private Sub ah_Timer()

If atp = 3 Then
    atp = 2
End If
If atp = 2 Then
    If job.Caption = "초보자" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-공격중2.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-공격중1.gif")
      End If
    ElseIf job.Caption = "전사" Then
      If cl = 1 Then
          c1.Width = 975
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트2-공격중.gif")
      ElseIf cl = 2 Then
          c1.Width = 975
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트1-공격중.gif")
      End If
    ElseIf job.Caption = "마법사" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\비숍2-공격중.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\비숍1-공격중.gif")
      End If
    ElseIf job.Caption = "궁수" Then
      If cl = 1 Then
        c1.Width = 1095
        c1.Height = 1110
        c1.Left = c1.Left - 120
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\헌터2-공격중1.gif")
        If arrow(1).Visible = False Then
            arrow(1).Visible = True
            ar(1) = 1: ari(1, 1) = c1.Left: ari(1, 2) = 1
            arrow(1).Top = 3000
            arrow(1).Left = c1.Left - 1000
                If sk(3) = 1 Then
                  arrow(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\무기\더블에로우12.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                End If
        ElseIf arrow(2).Visible = False Then
            arrow(2).Visible = True
            ar(2) = 1: ari(2, 1) = c1.Left: ari(2, 2) = 1
            arrow(2).Top = 3000
            arrow(2).Left = c1.Left - 1000
                If sk(3) = 1 Then
                  arrow(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\무기\더블에로우12.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                End If
        ElseIf arrow(3).Visible = False Then
            arrow(3).Visible = True
            ar(3) = 1: ari(3, 1) = c1.Left: ari(3, 2) = 1
            arrow(3).Top = 3000
            arrow(3).Left = c1.Left - 1000
                If sk(3) = 1 Then
                  arrow(3).Picture = LoadPicture("C:\Program Files\DragonStriker\root\무기\더블에로우12.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                End If
        ElseIf arrow(4).Visible = False Then
            arrow(4).Visible = True
            ar(4) = 1: ari(4, 1) = c1.Left: ari(4, 2) = 1
            arrow(4).Top = 3000
            arrow(4).Left = c1.Left - 1000
                If sk(3) = 1 Then
                  arrow(4).Picture = LoadPicture("C:\Program Files\DragonStriker\root\무기\더블에로우12.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                End If
        End If
      ElseIf cl = 2 Then
          c1.Width = 1095
        c1.Height = 1110
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\헌터1-공격중1.gif")
          If arrow(1).Visible = False Then
            arrow(1).Visible = True
            ar(1) = 2: ari(1, 1) = c1.Left: ari(1, 2) = 2
            arrow(1).Top = 3000
            arrow(1).Left = c1.Left + 1000
                If sk(3) = 1 Then
                  arrow(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\무기\더블에로우11.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                End If
        ElseIf arrow(2).Visible = False Then
            arrow(2).Visible = True
            ar(2) = 2: ari(2, 1) = c1.Left: ari(2, 2) = 2
            arrow(2).Top = 3000
            arrow(2).Left = c1.Left + 1000
                If sk(3) = 1 Then
                  arrow(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\무기\더블에로우11.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                End If
        ElseIf arrow(3).Visible = False Then
            arrow(3).Visible = True
            ar(3) = 2: ari(3, 1) = c1.Left: ari(3, 2) = 2
            arrow(3).Top = 3000
            arrow(3).Left = c1.Left + 1000
                If sk(3) = 1 Then
                  arrow(3).Picture = LoadPicture("C:\Program Files\DragonStriker\root\무기\더블에로우11.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                End If
        ElseIf arrow(4).Visible = False Then
            arrow(4).Visible = True
            ar(4) = 2: ari(4, 1) = c1.Left: ari(4, 2) = 2
            arrow(4).Top = 3000
            arrow(4).Left = c1.Left + 1000
                If sk(3) = 1 Then
                  arrow(4).Picture = LoadPicture("C:\Program Files\DragonStriker\root\무기\더블에로우11.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                End If
        End If
      End If
    ElseIf job.Caption = "연금술사" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-공격중2.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-공격중1.gif")
      End If
    End If
    atp = 1
    aq = 1
ElseIf atp = 1 Then
    If job.Caption = "초보자" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-휴식2.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-휴식1.gif")
      End If
    ElseIf job.Caption = "전사" Then
      If cl = 1 Then
          c1.Width = 720
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트21.gif")
      ElseIf cl = 2 Then
          c1.Width = 720
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트11.gif")
      End If
    ElseIf job.Caption = "마법사" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\비숍21.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\비숍11.gif")
      End If
    ElseIf job.Caption = "궁수" Then
      If cl = 1 Then
          c1.Width = 1095
          c1.Height = 1110
          c1.Left = c1.Left + 120
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\헌터21.gif")
      ElseIf cl = 2 Then
          c1.Width = 1095
          c1.Height = 1110
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\헌터11.gif")
      End If
    ElseIf job.Caption = "연금술사" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-휴식2.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-휴식1.gif")
      End If
    End If
    atp = 2
End If
End Sub
Private Sub as_Timer()

For i = 1 To 5

If hp(i) > 0 And m(i).Visible = True And 맵표시.Caption = "초급 나무인형 수련장1" Then
    If (m(i).Left - 80 <= c1.Left And m(i).Left + 360 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 5) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        내데미지.Caption = demon
        내데미지.Top = c1.Top - 380
        내데미지.Visible = True
        내데미지.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If
Next i

For i = 6 To 10

If hp(i) > 0 And m(i).Visible = True And 맵표시.Caption = "초급 나무인형 수련장2" Then
    If (m(i).Left - 50 <= c1.Left And m(i).Left + 600 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 13) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        내데미지.Caption = demon
        내데미지.Top = c1.Top - 380
        내데미지.Visible = True
        내데미지.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If
Next i

For i = 11 To 13

If hp(i) > 0 And m(i).Visible = True And 맵표시.Caption = "초급 나무인형 수련장3" Then
    If (m(i).Left - 100 <= c1.Left And m(i).Left + 1080 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 25) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        내데미지.Caption = demon
        내데미지.Top = c1.Top - 380
        내데미지.Visible = True
        내데미지.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If
Next i

For i = 14 To 17

If (hp(i) > 0 And m(i).Visible = True And 맵표시.Caption = "마을의 외각1") Or (hp(i) > 0 And m(i).Visible = True And 맵표시.Caption = "큰 구덩이") Then
    If (m(i).Left + 120 <= c1.Left And m(i).Left + 600 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 12) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        내데미지.Caption = demon
        내데미지.Top = c1.Top - 380
        내데미지.Visible = True
        내데미지.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If
Next i

If hp(18) > 0 And m(18).Visible = True And 맵표시.Caption = "큰 구덩이" Then
    If (m(i).Left - 120 <= c1.Left And m(i).Left + 1800 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 50) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        내데미지.Caption = demon
        내데미지.Top = c1.Top - 380
        내데미지.Visible = True
        내데미지.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If

End Sub
Private Sub C표지판_Click()
sl = MsgBox("마을로가는 표지판 입니다", vbOKOnly, "npc표지판")
End Sub
Private Sub exp퍼센트_Timer()

expexp.Caption = ((Int((((Val(expn) / Val(expp)) * 100) * 100) + 0.5)) / 100) & "%"
re = (Int(((Val(expn) / Val(expp)) * 100) + 0.5)) & "%"
expexp.ToolTipText = re

End Sub
Private Sub exp표시_Timer()

expn.Caption = exn
If exn <= 0 Then
    exp.Width = 1
Else
    exp.Width = Val(exn) / Val(exm) * 2000
End If

If exn <= 0 Then
exn = 0
End If

End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 37 Then
  If c1.Left > 0 Then
      bb = 1
      cl = 1
      js = 1
        If job.Caption = "초보자" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-걷기2.gif")
        ElseIf job.Caption = "전사" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트22.gif")
        ElseIf job.Caption = "궁수" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\헌터22.gif")
        ElseIf job.Caption = "마법사" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\비숍21.gif")
        ElseIf job.Caption = "연금술사" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\연금술사22.gif")
        End If
  End If
ElseIf KeyCode = 39 Then
  If c1.Left < 14500 Then
      bb = 2
      cl = 2
      js = 2
        If job.Caption = "초보자" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-걷기1.gif")
        ElseIf job.Caption = "전사" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트12.gif")
        ElseIf job.Caption = "궁수" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\헌터12.gif")
        ElseIf job.Caption = "마법사" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\비숍12.gif")
        ElseIf job.Caption = "연금술사" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\연금술사12.gif")
        End If
  End If
ElseIf KeyCode = 18 Then
If al = 0 Then
alt = 1
End If
ElseIf KeyCode = 38 Then
Name1.Left = c1.Left - 600
내용.Left = c1.Left - 240
  If c1.Left >= 5280 And c1.Left <= 5640 And 맵표시.Caption = "초급 나무인형 수련장1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i:
  맵표시.Caption = "초급 나무인형 수련장2": c1.Left = 0: npc전직관.Visible = True
  ElseIf c1.Left >= 600 And c1.Left <= 960 And 맵표시.Caption = "초급 나무인형 수련장2" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "초급 나무인형 수련장1": c1.Left = 5400: npc전직관.Visible = flase
  ElseIf c1.Left >= 13800 And c1.Left <= 14400 And 맵표시.Caption = "초급 나무인형 수련장2" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "초급 나무인형 수련장3": c1.Left = 0: npc전직관.Visible = flase
  ElseIf c1.Left >= 0 And c1.Left <= 750 And 맵표시.Caption = "초급 나무인형 수련장3" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "초급 나무인형 수련장2": c1.Left = 14400
  ElseIf c1.Left >= 13800 And c1.Left <= 14400 And 맵표시.Caption = "초급 나무인형 수련장1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "마을의 외각1": c1.Left = 0: npc전직관.Visible = True
  ElseIf c1.Left >= 0 And c1.Left <= 840 And 맵표시.Caption = "마을의 외각1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "초급 나무인형 수련장1": c1.Left = 14400: npc전직관.Visible = flase
  ElseIf c1.Left >= 2520 And c1.Left <= 2880 And 맵표시.Caption = "마을의 외각1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "큰 구덩이": c1.Left = 0: npc전직관.Visible = flase
  ElseIf c1.Left >= 0 And c1.Left <= 840 And 맵표시.Caption = "큰 구덩이" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "마을의 외각1": c1.Left = 2500
  ElseIf c1.Left >= 13560 And c1.Left <= 14400 And 맵표시.Caption = "마을의 외각1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "센티널 시티": c1.Left = 0: npc전직관.Visible = flase
  ElseIf c1.Left >= 0 And c1.Left <= 840 And 맵표시.Caption = "센티널 시티" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "마을의 외각1": c1.Left = 14400
  ElseIf c1.Left >= 6000 And c1.Left <= 7200 And 맵표시.Caption = "센티널 시티" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "센티널 시티 뒷골목": c1.Left = 250
  ElseIf c1.Left >= 0 And c1.Left <= 840 And 맵표시.Caption = "센티널 시티 뒷골목" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  맵표시.Caption = "센티널 시티": c1.Left = 6700
  End If
maping = 1
ElseIf (KeyCode = 17 And atp = 0) Or (KeyCode = 25 And atp = 0) Then
  atp = 2
ElseIf KeyCode = 13 Then
  If te = 0 Then
  Text1.Visible = True: 말하기.Visible = True: te = 1
  ElseIf te = 1 Then
  말하기.Caption = Text1.Text: 내용.Visible = True: Text1.Visible = False: 말하기.Visible = True: te = 0
  End If

Else
  If (KeyCode >= 33 And KeyCode <= 36) Or (KeyCode >= 45 And KeyCode <= 46) Or (KeyCode >= 97 And KeyCode <= 105) Or (KeyCode >= 65 And KeyCode <= 90) Then
   If 키셋.k(KeyCode).Tag = "인벤" Then
        If inv.Visible = True Then
          inv.Visible = False
        ElseIf inv.Visible = False Then
          inv.Visible = True
        End If
    ElseIf 키셋.k(KeyCode).Tag = "장비" Then
      dj = MsgBox("아직미완성입니다.", vbCritical, "미완성코드FG210!")
    ElseIf 키셋.k(KeyCode).Tag = "스킬" Then
      If skill.Visible = True Then
            skill.Visible = True
            skill.전직1차(1).Top = -5000: skill.전직1차(2).Top = -5000
            If map.job.Caption <> "초보자" Then
                skill.전직1차(Val(map.jobit.Caption)).Top = 360
            End If
        ElseIf skill.Visible = False Then
            skill.Visible = True
            skill.전직1차(1).Top = -5000: skill.전직1차(2).Top = -5000
            If map.job.Caption <> "초보자" Then
                skill.전직1차(Val(map.jobit.Caption)).Top = 360
            End If
        End If
    ElseIf 키셋.k(KeyCode).Tag = "메뉴" Then
      If 메뉴.Top = 840 Then
        메뉴.Top = -5000
      ElseIf 메뉴.Top = -5000 Then
        메뉴.Top = 840
      End If
    ElseIf 키셋.k(KeyCode).Tag = "스텟" Then
      If stat.Visible = True Then
        stat.Visible = False
      ElseIf stat.Visible = False Then
        stat.Visible = True
      End If
    ElseIf 키셋.k(KeyCode).Tag = "스트라이크" Then
      atp = 2: sk(1) = 1
    ElseIf 키셋.k(KeyCode).Tag = "검기" Then
      atp = 2: sk(2) = 1
    ElseIf 키셋.k(KeyCode).Tag = "더블 에로우" Then
      atp = 2: sk(3) = 1
    Else
      For i = 1 To 12
        If 키셋.k(KeyCode).Tag = 무기사기.포션(i).Tag Then
        
            If Val(inv.포션(i).ToolTipText) > 0 Then
            
            yu = Mid(inv.포션(i).Tag, 3, 1)
            se = Mid(inv.포션(i).Tag, 4)
                            
                If yu = "m" Then
                
                    If (Val(map.mpn.Caption) + Val(se)) > Val(map.mpm.Caption) Then
                    map.mpn.Caption = Val(map.mpn.Caption) + Val(se)
                    cmp = map.mpn.Caption
                    Else
                    map.mpn.Caption = Val(map.mpm.Caption) + Val(se)
                    cmp = map.mpn.Caption
                    End If
                
                ElseIf yu = "h" Then
                
                    If Val(map.hpn.Caption) + Val(se) > Val(map.hpm.Caption) Then
                    map.hpn.Caption = Val(map.hpn.Caption) + Val(se)
                    chp = map.hpn.Caption
                    Else
                    map.hpn.Caption = Val(map.hpn.Caption) + Val(se)
                    chp = map.hpn.Caption
                    End If
                
                End If
            
            inv.포션(i).ToolTipText = (Val(inv.포션(i).ToolTipText) - 1)
            End If
        End If
      Next i
    End If
    
    
  End If
End If
End Sub
Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)

atp = 0

If bb = 1 Or cl = 1 Then
  If job.Caption = "초보자" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-휴식2.gif")
  ElseIf job.Caption = "전사" Then
  c1.Width = 720
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트21.gif")
  ElseIf job.Caption = "마법사" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\비숍21.gif")
  ElseIf job.Caption = "궁수" Then
  c1.Width = 1095
  c1.Height = 1110
  c1.Left = c1.Left - 120
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\헌터21.gif")
  ElseIf job.Caption = "연금술사" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트21.gif")
  End If
ElseIf bb = 2 Or cl = 2 Then
  If job.Caption = "초보자" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-휴식1.gif")
  ElseIf job.Caption = "전사" Then
  c1.Width = 720
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트11.gif")
  ElseIf job.Caption = "마법사" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\비숍11.gif")
  ElseIf job.Caption = "궁수" Then
  c1.Width = 1095
  c1.Height = 1110
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\헌터11.gif")
  ElseIf job.Caption = "연금술사" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\나이트11.gif")
  End If
End If
bb = 0
js = 0


End Sub
Private Sub Form_Load()

tih = 0: tim = 0: tis = 0
upa = 0: bb = 0: atp = 0: cl = 1: ma = 1: te = 0: aw = 0: dem = 0: demo = 0: dmm = 0: demm = 0: alt = 0: al = 0
For i = 1 To 5: hp(i) = 20: Next i: For i = 6 To 10: hp(i) = 100: Next i
For i = 11 To 13: hp(i) = 350: Next i: For i = 14 To 17: hp(i) = 200: Next i
hp(18) = 1000: maping = 1: trv = 0
If job.Caption = "초보자" Then
txww = ((Val(lv.Caption) * 1) + (Val(stat.str.Caption) * 2)) - ((Val(lv.Caption) * 1) + (Val(stat.str.Caption) * 1))
Randomize
at = Int(Rnd * txww) + ((Val(lv.Caption) * 1) + (Val(stat.str.Caption) * 1))
End If
chp = 50: mhp = 50: cmp = 25: mmp = 25: exn = 0: exm = 1: lev = 1: sp = 0: kp = 0
For i = 1 To 18: md(i) = 0: Next i
For i = 14 To 17: m(i).Tag = 75: Next i
For i = 14 To 17: hp(i) = 75: Next i
For i = 18 To 18: hp(i) = 2500: Next i
For i = 18 To 18: m(i).Tag = 2500: Next i
maping = 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
Input #1, a1: Input #2, a2: Input #3, a3

If login.ar.Caption = 1 Then
map.Caption = "DragonStriker Beta 0.1.420748       " & a1 & "(님)이 로그인 하셨습니다.": Name1.Caption = a1: kr = a1
ElseIf login.ar.Caption = 2 Then
map.Caption = "DragonStriker Beta 0.1.420748       " & a2 & "(님)이 로그인 하셨습니다.": Name1.Caption = a2: kr = a2
ElseIf login.ar.Caption = 3 Then
map.Caption = "DragonStriker Beta 0.1.420748      " & a3 & "(님)이 로그인 하셨습니다.": Name1.Caption = a3: kr = a3
End If

Close #1, #2, #3

If login.ar.Caption = 1 Then
  Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Input As #1
ElseIf login.ar.Caption = 2 Then
  Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Input As #1
ElseIf login.ar.Caption = 3 Then
  Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Input As #1
End If
    Input #1, tih
    Input #1, tim
    Input #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Input #1, rtw: 키셋.k(i).Tag = rtw
      End If
    Next i
    
    
Input #1, rtw: lv.Caption = rtw: Input #1, rtw: job.Caption = rtw: Input #1, rtw: expn.Caption = rtw: Input #1, rtw: hpn.Caption = rtw: chp = rtw: Input #1, rtw: hpm.Caption = rtw: Input #1, rtw: mpn.Caption = rtw: cmp = rtw: Input #1, rtw: mpm.Caption = rtw: Input #1, rtw: 맵표시.Caption = rtw: Input #1, rtw: stat.str.Caption = rtw: Input #1, rtw: stat.dex.Caption = rtw: Input #1, rtw: stat.inter.Caption = rtw: Input #1, rtw: stat.luk.Caption = rtw: Input #1, rtw: stat.sp.Caption = rtw
Input #1, rtw: qu1 = rtw: Input #1, rtw: que = rtw: Input #1, rtw: qus = rtw

For i = 1 To 3
Input #1, rtw: skill.sk(i).Caption = rtw
Next i
For i = 1 To 6
Input #1, rtw: skill.sk1(i).Caption = rtw
Next i
Input #1, rtw: skill.kp.Caption = rtw: expp.Caption = (lv.Caption ^ 3): exm = Val(lv.Caption) ^ 3: exn = Val(expn.Caption)
Input #1, rtw: inv.money.Caption = rtw
 For i = 1 To 12: Input #1, rtw: inv.포션(i).ToolTipText = rtw: Next i: For i = 1 To 11: Input #1, rtw: inv.검(i).ToolTipText = rtw: Next i: For i = 1 To 4: Input #1, rtw: inv.arrow(i).ToolTipText = rtw: Next i
 Close #1, #2, #3

If 맵표시.Caption <> "알고리즘이 하빈이에게 미치는 영향을 분석한 곳" Then
npc하빈이.Top = -5000: 하빈이.Top = -5000
mapi(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky1.jpg")
mapi(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky2.jpg")
End If

If 맵표시.Caption = "초급 나무인형 수련장1" Then
npc전직관.Visible = True
End If

For i = 1 To 13
m(i).Visible = True
mh(i).Visible = True
Next i
For i = 14 To 18
m(i).Visible = True
mz(i) = 0
Next i
For i = 1 To 10
sk(i) = 0
Next i
End Sub
Private Sub hp버그방지_Timer()

If Val(hpn.Caption) > Val(hpm.Caption) Then
hpn.Caption = hpm.Caption
chp = (hpn.Caption)
mhp = hpm.Caption
End If

If Val(mpn.Caption) > Val(mpm.Caption) Then
mpn.Caption = mpm.Caption
cmp = (mpn.Caption)
mmp = mpm.Caption
End If

If Val(hpn.Caption) < 0 Then
hpn.Caption = 0: chp = 0
End If

End Sub
Private Sub hp젠_Timer()

If hpn.Caption + 5 + (Val(skill.sk(3).Caption) * 2) <= hpm.Caption Then
hpn.Caption = hpn.Caption + 5 + (Val(skill.sk(3).Caption) * 2)
chp = chp + 5 + (Val(skill.sk(3).Caption) * 2)
ElseIf hpn.Caption + 5 + (Val(skill.sk(3).Caption) * 2) > hpm.Caption Then
hpn.Caption = hpm.Caption
chp = hpm.Caption
End If
If mpn.Caption + 5 <= mpm.Caption Then
mpn.Caption = mpn.Caption + 5
cmp = cmp + 5
ElseIf mpn.Caption + 5 > mpm.Caption Then
mpn.Caption = mpm.Caption
cmp = mpm.Caption
End If

hp젠.Interval = 8000 - (Val(skill.sk(3).Caption) * 100)

End Sub
Private Sub hp표시_Timer()

hpn.Caption = chp
If (hpn.Caption > 0) Then
hpc.Width = (hpn.Caption / hpm.Caption) * 2000
End If

End Sub
Private Sub Label2_Click()
사용자정보.Visible = True
End Sub
Private Sub Label6_Click()
메뉴.Top = -5000
End Sub
Private Sub M_ea_Click(Index As Integer)
장비.Visible = True
End Sub
Private Sub M_exit_Click(Index As Integer)
dj = MsgBox("끝내기 전에 저장하시겠습니까?[저장하시면 이 " & kr & "에 있는 지금까지의 정보가 이정보로 대체됩니다.]", vbYesNo, "저장M_End01 Y/N")

If dj = 6 Then

    If login.ar.Caption = 1 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
    ElseIf login.ar.Caption = 2 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
    ElseIf login.ar.Caption = 3 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
    End If
    
    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (키셋.k(i).Tag)
      End If
    Next i

    Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, 맵표시.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
    Print #1, qu1: Print #1, que: Print #1, qus
    For i = 1 To 3
    Print #1, skill.sk(i).Caption
    Next i
    For i = 1 To 6
    Print #1, skill.sk1(i).Caption
    Next i
    Print #1, skill.kp.Caption
    Print #1, inv.money.Caption
    For i = 1 To 12: Print #1, inv.포션(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.검(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
    Close #1, #2, #3
    dj = MsgBox("저장되었습니다.", vbOKOnly, "DsSave")
Else
dj = MsgBox("'DragonStriker' 를 종료 합니다", vbCritical, "DSM_End")
End If

End
End Sub
Private Sub M_inv_Click(Index As Integer)
inv.Visible = True
End Sub
Private Sub M_key_Click(Index As Integer)
키셋.Visible = True
End Sub
Private Sub M_logeout_Click(Index As Integer)

dj = MsgBox("저장을 하시고 로그아웃 하시겠습니까?[저장하시면 이 " & kr & "에 있는 지금까지의 정보가 이정보로 대체됩니다.]", vbYesNo, "저장FF2Y/N")

If dj = 6 Then

    If login.ar.Caption = 1 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
    ElseIf login.ar.Caption = 2 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
    ElseIf login.ar.Caption = 3 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
    End If

    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (키셋.k(i).Tag)
      End If
    Next i

    Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, 맵표시.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
    Print #1, qu1: Print #1, que: Print #1, qus
    For i = 1 To 3
    Print #1, skill.sk(i).Caption
    Next i
    For i = 1 To 6
    Print #1, skill.sk1(i).Caption
    Next i
    Print #1, skill.kp.Caption
    Print #1, inv.money.Caption
    For i = 1 To 12: Print #1, inv.포션(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.검(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
    Close #1, #2, #3
    dj = MsgBox("저장되었습니다. 로그아웃 합니다.", vbOKOnly, "DsSave")
Else
dj = MsgBox("저장을 취소했습니다. 로그아웃 합니다.", vbCritical, "DSsave")
End If

Unload map
login.Visible = True
login.fl.Top = 1320
login.공지.Top = 5000
login.캐릭정보.Top = 5000
login.Command1.Caption = "확인"
login.Command2.Caption = "계정만들기"
login.Text1.Text = ""
login.Text2.Text = ""
wma1.Close
End Sub

Private Sub M_qu_Click(Index As Integer)
quest.Visible = True
End Sub
Private Sub M_Save_Click(Index As Integer)

dj = MsgBox("저장하시겠습니까?[저장하시면 이 " & kr & "에 있는 지금까지의 정보가 이정보로 대체됩니다.]", vbYesNo, "저장FF2Y/N")

If dj = 6 Then

    If login.ar.Caption = 1 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
    ElseIf login.ar.Caption = 2 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
    ElseIf login.ar.Caption = 3 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
    End If

    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (키셋.k(i).Tag)
      End If
    Next i

    Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, 맵표시.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
    Print #1, qu1: Print #1, que: Print #1, qus
    For i = 1 To 3
    Print #1, skill.sk(i).Caption
    Next i
    For i = 1 To 6
    Print #1, skill.sk1(i).Caption
    Next i
    Print #1, skill.kp.Caption
    Print #1, inv.money.Caption
    For i = 1 To 12: Print #1, inv.포션(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.검(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
    Close #1, #2, #3
    dj = MsgBox("저장되었습니다.", vbOKOnly, "DsSave")
Else
dj = MsgBox("저장을 취소했습니다.", vbCritical, "DSsave")
End If

End Sub
Private Sub M_Skill_Click(Index As Integer)
skill.Visible = True
End Sub
Private Sub M_SoundChange_Click(Index As Integer)
kp = MsgBox("현재 버전으로는 지원되지않는 기능입니다. 0.2.5 이상의 버전만 가능합니다.", vbCritical, "Error Code 1107")
End Sub
Private Sub M_SoundPlay_Click(Index As Integer)
wma1.URL = "C:\Program Files\DragonStriker\root\sound\02BattleOfRose.wma"
wma1.newMedia ("C:\Program Files\DragonStriker\root\sound\02BattleOfRose.wma")
End Sub
Private Sub M_SoundStop_Click(Index As Integer)
wma1.Close
End Sub
Private Sub M_stat_Click(Index As Integer)
stat.Visible = True
End Sub
Private Sub m이동_Timer()

For i = 14 To 18

Randomize
r = Int(Rnd * 3)

    If r = 0 Then
        m(i).Left = m(i).Left
    ElseIf r = 1 And m(i).Left > 0 Then
        Randomize
        m(i).Left = m(i).Left - ((Int(Rnd * 4) + 2) * 100)
        m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\몬스터01.gif")
    ElseIf r = 2 And m(i).Left < 14040 Then
        Randomize
        m(i).Left = m(i).Left + ((Int(Rnd * 4) + 2) * 100)
        m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\몬스터02.gif")
    End If

Next i

End Sub
Private Sub Menu_Click()
메뉴.Top = 840
End Sub
Private Sub mgen_Timer()

For i = 1 To 18

If md(i) = 1 Then
    r = 0
    If i >= 1 And i <= 5 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m11.gif")
            mh(i).Visible = True
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m12.gif")
            mh(i).Visible = True
        End If
        hp(i) = 20: md(i) = 0: mh(i).Visible = True: mh(i).Caption = 20: mz(i) = 0: m(i).Visible = True

    ElseIf i >= 6 And i <= 10 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m21.gif")
            mh(i).Visible = True
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m22.gif")
            mh(i).Visible = True
        End If
        hp(i) = 100: md(i) = 0: mh(i).Visible = True: mh(i).Caption = 100: mz(i) = 0: m(i).Visible = True
    ElseIf i >= 11 And i <= 13 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m31.gif")
            mh(i).Visible = True
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m32.gif")
            mh(i).Visible = True
        End If
        hp(i) = 350: md(i) = 0: mh(i).Visible = True: mh(i).Caption = 350: mz(i) = 0: m(i).Visible = True
    ElseIf i >= 14 And i <= 17 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\몬스터01.gif")
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\몬스터02.gif")
        End If
        hp(i) = 75: md(i) = 0: mz(i) = 0: m(i).Tag = 75: m(i).Visible = True
    ElseIf i = 18 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\몬스터01.gif")
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\몬스터02.gif")
        End If
        hp(i) = 2500: md(i) = 0: mz(i) = 0: m(i).Tag = 2500: m(i).Visible = True
    End If
m(i).Visible = True
End If
Next i
End Sub

Private Sub mon_Timer()

If aq = 1 Then

For i = 1 To 18

If (m(i).Left - 500 < c1.Left And m(i).Left + 1500 > c1.Left + 500) Then

  If job.Caption = "초보자" Then
  txww = (((Val(stat.str.Caption)) / 4) + (Val(map.lv.Caption) * 2)) - (((Val(stat.str.Caption)) / 5) + (Val(map.lv.Caption) * 1))
  dxww = (((Val(stat.str.Caption)) / 5) + (Val(map.lv.Caption) * 1))
  ElseIf job.Caption = "전사" Then
  txww = ((((Val(stat.str.Caption)) * (Val(stat.dex.Caption))) / 8) + (Val(map.lv.Caption))) - (((Val(stat.str.Caption)) * ((Val(stat.dex.Caption)) / 3) / 4) + map.lv.Caption)
  dxww = (((Val(stat.str.Caption)) * ((Val(stat.dex.Caption)) / 3) / 4) + map.lv.Caption)
  ElseIf job.Caption = "마법사" Then
  ElseIf job.Caption = "궁수" Then
  Exit For
  ElseIf job.Caption = "운영자" Then
  txww = 0
  End If
  at = 0
    Randomize
    at = at + Int((Int(Rnd * txww) + dxww) + 0.5) + (Val(stat.데미지플러스.Tag))
    
Randomize
r = (Int(Rnd * 100) + 1)
    If r <= ((Val(skill.sk(2).Caption) * 5) + 15 + (skill.sk1(4) * 2)) Then
        at = Int((at * (((skill.sk(2).Caption * 20) + 100 + (skill.sk1(4) * 4)) / 100)) + 0.5)
        up = " !"
        Else
        up = ""
    End If
   
    If i <= 5 And 맵표시.Caption = "초급 나무인형 수련장1" Then
        If Val(mh(i).Caption) > 0 Then
        Randomize
        dem = i
        데미지.Top = m(i).Top - 300
          at = (at - (Int(Rnd * 2) + 0))
          If at <= 0 Then
          데미지.Caption = "Miss": at = 0
          Else
          데미지.Caption = at & up
          hp(i) = hp(i) - at
          End If
          
        demo = 1
        데미지.Left = m(i).Left - 130
        데미지.Visible = True
        Exit For
        End If
    ElseIf i > 5 And i <= 10 And 맵표시.Caption = "초급 나무인형 수련장2" Then
        If Val(mh(i).Caption) > 0 Then
        Randomize
        dem = i
        데미지.Top = m(i).Top - 300
        at = (at - (Int(Rnd * 4) + 5))
          If at <= 0 Then
          데미지.Caption = "Miss": at = 0
          Else
          데미지.Caption = at & up
          hp(i) = hp(i) - at
          End If
          
        demo = 1
        데미지.Left = m(i).Left - 130
        데미지.Visible = True
        Exit For
        End If
    ElseIf i > 10 And i <= 13 And 맵표시.Caption = "초급 나무인형 수련장3" Then
     If Val(mh(i).Caption) > 0 Then
     Randomize
     dem = i
     데미지.Top = m(i).Top - 300
       at = (at - (Int(Rnd * 4) + 10))
       If at <= 0 Then
       데미지.Caption = "Miss": at = 0
       Else
       데미지.Caption = at & up
       hp(i) = hp(i) - at
       End If
       
     demo = 1
     데미지.Left = m(i).Left - 130
     데미지.Visible = True
        Exit For
    End If
    ElseIf (i >= 14 And i <= 17) Then
    
        If 맵표시.Caption = "마을의 외각1" Then
            If ((hp(i)) > 0 And Val(m(i).Tag) > 0 And md(i) = 0) Then
            Randomize
            dem = i
            데미지.Top = m(i).Top - 300
              at = (at - (Int(Rnd * 4) + 4))
              If at <= 0 Then
              데미지.Caption = "Miss": at = 0
              Else
              데미지.Caption = at & up
              hp(i) = hp(i) - at
              End If
              
            demo = 1
            데미지.Left = m(i).Left - 130
            데미지.Visible = True
            Exit For
          End If
          
        ElseIf 맵표시.Caption = "큰 구덩이" Then
            If ((hp(i)) > 0 And Val(m(i).Tag) > 0 And md(i) = 0) Then
            Randomize
            dem = i
            데미지.Top = m(i).Top - 300
              at = (at - (Int(Rnd * 4) + 4))
              If at <= 0 Then
              데미지.Caption = "Miss": at = 0
              Else
              데미지.Caption = at & up
              hp(i) = hp(i) - at
              End If
              
            demo = 1
            데미지.Left = m(i).Left - 130
            데미지.Visible = True
            Exit For
          End If
        End If
        
    ElseIf i >= 18 And i <= 18 And 맵표시.Caption = "큰 구덩이" And md(i) = 0 Then
        If Val(m(i).Tag) > 0 Then
        Randomize
        dem = i
        데미지.Top = m(i).Top - 420
          at = (at - (Int(Rnd * 8) + 16))
          If at <= 0 Then
          데미지.Caption = "Miss": at = 0
          Else
          데미지.Caption = at & up
          hp(i) = hp(i) - at
          End If
          
        demo = 1
        데미지.Left = m(i).Left - 130
        데미지.Visible = True
        Exit For
        End If
     End If
End If

aq = 0
Next i

End If




For i = 1 To 5

  If (hp(i) <= 0 And md(i) = 0 And mz(i) = 0) And 맵표시.Caption = "초급 나무인형 수련장1" Then
      mh(i).Visible = False
      exn = exn + 6
      mz(i) = 1
      md(i) = 1
      ddeem = 중요사항.Caption
      중요사항.Caption = ddeem & "경험치를 얻었습니다.(+6)" & "               "
         If que = 2 Then
         qus = qus + 1
         End If
      Randomize
r = (Int(Rnd * 100) + 1)
If r >= 40 Then
inv.money.Caption = Val(inv.money.Caption) + Int((r * 2) / 10)
ddeem = 중요사항.Caption
중요사항.Caption = ddeem & "Gold를 얻었습니다. (" & Int((r * 2) / 10) & ")" & "                    "
End If
  End If
  


Next i
For i = 6 To 10

  If (hp(i) <= 0 And md(i) = 0 And mz(i) = 0) And 맵표시.Caption = "초급 나무인형 수련장2" Then
      mh(i).Visible = False
      exn = exn + 18
      mz(i) = 1
      md(i) = 1
      ddeem = 중요사항.Caption
      중요사항.Caption = ddeem & "경험치를 얻었습니다.(+18)" & "              "
        If que = 4 Then
        qus = qus + 1
        End If
      Randomize
r = (Int(Rnd * 100) + 1)
If r >= 35 Then
inv.money.Caption = Val(inv.money.Caption) + Int((r * 2) / 8)
ddeem = 중요사항.Caption
중요사항.Caption = ddeem & "Gold를 얻었습니다. (" & Int((r * 2) / 8) & ")" & "                    "
End If
  End If


Next i
For i = 11 To 13

  If (hp(i) <= 0 And md(i) = 0 And mz(i) = 0) And 맵표시.Caption = "초급 나무인형 수련장3" Then
      mh(i).Visible = False
      exn = exn + 45
      mz(i) = 1
      md(i) = 1
      ddeem = 중요사항.Caption
      중요사항.Caption = ddeem & "경험치를 얻었습니다.(+45)" & "              "
        If que = 6 Then
        qus = qus + 1
        End If
      Randomize
r = (Int(Rnd * 100) + 1)
If r >= 31 Then
inv.money.Caption = Val(inv.money.Caption) + Int((r * 3) / 7)
ddeem = 중요사항.Caption
중요사항.Caption = ddeem & "Gold를 얻었습니다. (" & Int((r * 3) / 7) & ")" & "                    "
End If
  End If


Next i
For i = 14 To 17

  If ((hp(i) <= 0 And md(i) = 0 And mz(i) = 0)) Then
   If 맵표시.Caption = "큰 구덩이" Then
   
      exn = exn + 25
      mz(i) = 1
      md(i) = 1
      ddeem = 중요사항.Caption
      중요사항.Caption = ddeem & "경험치를 얻었습니다.(+25)" & "              "
        If que = 8 Then
        qus = qus + 1
        End If
      Randomize
      r = (Int(Rnd * 100) + 1)
        If r >= 37 Then
        inv.money.Caption = Val(inv.money.Caption) + Int((r * (3.8)) / 8)
        ddeem = 중요사항.Caption
        중요사항.Caption = ddeem & "Gold를 얻었습니다. (" & Int((r * (3.8)) / 8) & ")" & "                    "
        End If
        
   ElseIf 맵표시.Caption = "마을의 외각1" Then
   
      exn = exn + 25
      mz(i) = 1
      md(i) = 1
      ddeem = 중요사항.Caption
      중요사항.Caption = ddeem & "경험치를 얻었습니다.(+25)" & "              "
        If que = 8 Then
        qus = qus + 1
        End If
      Randomize
      r = (Int(Rnd * 100) + 1)
        If r >= 37 Then
        inv.money.Caption = Val(inv.money.Caption) + Int((r * (3.8)) / 8)
        ddeem = 중요사항.Caption
        중요사항.Caption = ddeem & "Gold를 얻었습니다. (" & Int((r * (3.8)) / 8) & ")" & "                    "
        End If
        
    End If
  End If


Next i
For i = 18 To 18

  If (hp(i) <= 0 And md(i) = 0 And mz(i) = 0) And 맵표시.Caption = "큰 구덩이" Then
      exn = exn + 450
      mz(i) = 1
      md(i) = 1
      ddeem = 중요사항.Caption
      중요사항.Caption = ddeem & "경험치를 얻었습니다.(+450)" & "              "
      Randomize
r = (Int(Rnd * 100) + 1)
If r >= 25 Then
inv.money.Caption = Val(inv.money.Caption) + Int((r * 20) / 2)
ddeem = 중요사항.Caption
중요사항.Caption = ddeem & "Gold를 얻었습니다. (" & Int((r * 20) / 2) & ")" & "                    "
End If
  End If


Next i
For i = 1 To 13

If hp(i) <= 0 Then
    m(i).Visible = False
    mh(i).Caption = ""
    mh(i).Caption = False
End If

Next i

For i = 14 To 18
  If hp(i) <= 0 Then
    m(i).Visible = False
  End If
Next i

If q1 = 1 Then

For i = 1 To 13
mh(i).Caption = hp(i)
Next i
For i = 14 To 18
hp(i) = m(i).Tag
Next i

End If


If chp / mhp * 2000 <= 0 Then
opeariton = MsgBox("운명하셨습니다. 확인을 누르시면 가까운 마을에서 부활합니다.", vbOKOnly, "사망메세지")
    ddeem = 중요사항.Caption
    중요사항.Caption = ddeem & "경험치를 잃으셨습니다.(-" & (lv.Caption * 3) & ")" & "            "
    exn = exn - (lv.Caption * 3)
hpn.Caption = 50
chp = 50
End If

내용.Left = c1.Left - 480

If (exn >= exm) Then
    mhp = hpm.Caption + 20: chp = mhp: hpm.Caption = mhp
    mmp = mpm.Caption + 15: cmp = mmp: mpm.Caption = mmp: mpn.Caption = cmp
    exn = exn - exm: exm = ((Val(lv.Caption) + 1) ^ 3): expp.Caption = Val(exm)
    lev = lv.Caption + 1: lv.Caption = lev: hpn.Caption = chp: sp = sp + 5: kp = kp + 1: up.Visible = True: upa = 1
    stat.sp.Caption = ((stat.sp.Caption) + 5): skill.kp.Caption = ((skill.kp.Caption) + 3)
    ddeem = 중요사항.Caption: 중요사항.Caption = ddeem & "레벨업을 하셨습니다." & "                      "
    

If map.job.Caption = "초보자" Then
txww = ((Val(stat.str.Caption) * 3) - (Val(lv.Caption) * 10)) - (((Val(stat.str.Caption) * 2) + 1) - (Val(lv.Caption) * 10))
ase = (((Val(stat.str.Caption) * (2.5)) + 1) - (Val(lv.Caption) * 10))
ElseIf map.job.Caption = "운영자" Then
ase = 999999
If ase <= 0 Then
ase = 1
End If
stat.물공.Caption = ase
End If

stat.lv.Caption = stat.lv.Caption + 1

If lev > 9 And job.Caption = "초보자" Then
    전직교관.Top = 2640
    jobch = MsgBox("오 벌써 래벨 10이 되다니...", vbOKOnly, "전직교관"): jobch = MsgBox("그러면 이제 내가 전직에 관한 설명을 해 주겠네. 듣고싶나 안듣고싶나?", vbYesNo, "전직교관")
    If jobch = 6 Then
      jobch = MsgBox("먼저 전사는 검으로 승부를 결정하는 직업이라네", vbOKOnly, "전직교관"): jobch = MsgBox("전사의 데미지는 STR과 DEX의 일부가 결정하지", vbOKOnly, "전직교관"): jobch = MsgBox("전사는 공격속도보다 데미지를 중시하는 직업이지", vbOKOnly, "전직교관"): jobch = MsgBox("그리고 전사는 앞의 한마리의 적에게 공격을 가하는 데 제격이지;", vbOKOnly, "전직교관"): jobch = MsgBox("궁수는 활과 화살으로 승부를 결정하는 직업이라네", vbOKOnly, "전직교관"): jobch = MsgBox("궁수의 데미지는 DEX와 STR의 일부분이 결정하지", vbOKOnly, "전직교관"): jobch = MsgBox("공격속도를 원한다면 궁수로 전직하는게 좋을껄; 일단설명을하고.", vbOKOnly, "전직교관")
      jobch = MsgBox("그리고 전방의 여러 적을 공격하는데는 궁수가 제격이네", vbOKOnly, "전직교관"): jobch = MsgBox("마법사는 말그대로 마법으로 승부를 결정하는 직업이야", vbOKOnly, "전직교관"): jobch = MsgBox("마법사의 공격은 INT 와 LUK이 결정하네", vbOKOnly, "전직교관"): jobch = MsgBox("화려하고 멋진 스킬과 전체공격을 원한다면 마법사로 전직해 보게나; 설명더있다", vbOKOnly, "전직교관"): jobch = MsgBox("그리고 마지막으로 연금술사가 있네", vbOKOnly, "전직교관"): jobch = MsgBox("연금술사는 잘 알려지지 않은 직업이네...", vbOKOnly, "전직교관"): jobch = MsgBox("하지만 독을 주 속성으로 공격하고 주먹으로 단거리 공격을 한다는것 까지는 추측이 되고 있네", vbOKOnly, "전직교관")
    End If
      jobch = MsgBox("자 그러면 이제 전직교관들의 마을로 이동시켜 주겠네", vbOKOnly, "전직교관"): 맵표시.Caption = "전직교관들의 마을" & 맵표시.Caption: 전직교관.Top = -5000
    For i = 1 To 18
        m(i).Top = m(i).Top - 5000
        If i <= 13 Then
        mh(i).Visible = False
        End If
    Next i
    c마을판.Top = c마을판.Top - 5000: C표지판.Top = C표지판.Top - 5000: door1.Top = door1.Top - 5000: door2.Top = door2.Top - 5000
    궁수전직교관.Top = 2160: 마법사전직교관.Top = 2160: 전사전직교관.Top = 2160: 연금술사전직교관.Top = 2160
End If
End If

End Sub
Private Sub mp표시_Timer()
mpn.Caption = cmp
mpc.Width = (mpn.Caption / mpm.Caption) * 2000
End Sub
Private Sub npc_Timer()

If 하빈이.ForeColor <> &HFFFF& Then
하빈이.ForeColor = &HFFFF&
ElseIf 하빈이.ForeColor = &HFFFF& Then
하빈이.ForeColor = &HC00000
End If

End Sub
Private Sub npc무기상인1_Click()
상인체크.Caption = "무기"
무기사기.Caption = map.상인체크.Caption & "상인과의 대화"
무기사기.물약.Top = -5000: 무기사기.무기.Top = 120: 무기사기.방어구.Top = -5000
무기사기.Visible = True: 무기사기.ind.Caption = 1
End Sub
Private Sub npc물약상인1_Click()
상인체크.Caption = "물약"
무기사기.Caption = map.상인체크.Caption & "상인과의 대화"
무기사기.물약.Top = 120: 무기사기.무기.Top = -5000: 무기사기.방어구.Top = -5000
무기사기.Visible = True: 무기사기.ind.Caption = 1
End Sub
Private Sub npc방어구상인1_Click()
상인체크.Caption = "방어구"
무기사기.Caption = map.상인체크.Caption & "상인과의 대화"
무기사기.물약.Top = -5000: 무기사기.무기.Top = -5000: 무기사기.방어구.Top = 120
무기사기.Visible = True: 무기사기.ind.Caption = 1
End Sub
Private Sub npc분수_Click()

op = MsgBox("나인 스피릿이 있던 석상입니다. 하지만 지금은 아무것도 없습니다.", vbQuestion, "npc대화")

End Sub
Private Sub npc전직관_Click()

If que = 0 Then

  tw = MsgBox("안녕 나는 전직교관이야. 일단 DragonStriker에 대해 설명해 줄께.", vbOKOnly, "전직교관")
  tw = MsgBox("DragonStriker 는 jiun0623 과 heonsheen 이 만든 vb rpg 게임이야. ", vbOKOnly, "전직교관"): tw = MsgBox("이 게임은 ←,→ 로 움직일수 있고 ↑ 로 맵을 이동할수 있어.", vbOKOnly, "전직교관"): tw = MsgBox("지금은 Beta 버전이라 모든것이 실행되지는 않아.", vbOKOnly, "전직교관"): tw = MsgBox("몬스터는 총 5종류가 있고 잡을떄마다 '랜덤' 만큼의 돈을 얻을수 있고 정해진 만큼의 경험치를 얻을수있어.", vbOKOnly, "전직교관"): tw = MsgBox("계속 옆으로 가다보면 센티널 시티가 나와 그곳에선 무기와 물약을 살수있지만 무기는 아직 착용이 안되, 물약은 사용가능해 인벤토리 창을 열어서 원하는 물약을 클릭을 한번 하면 물약이 사용되", vbOKOnly, "전직교관")
  tw = MsgBox("i를 눌러보면 인벤토리창을 열수있고, m을 누르면 메뉴가 뜨고 , s 를 누르면 스텟창이 열리고 , k를 누르면 스킬창이 열려", vbOKOnly, "전직교관"): tw = MsgBox("저장은 메뉴에서 Save 를 클릭하면 되. 불러오기는 로그인 할떄 자동으로 불러진단다. ", vbOKOnly, "전직교관"): tw = MsgBox("직업은 아직 2가지야 전사랑 궁수, 레벨 10이되면 내가 전직교관의 마을로 보내줄께. 일단 내 훈련을 해보지 않을래? 하고싶으면[다시클릭]", vbOKOnly, "전직교관")
  que = 1
  
ElseIf que = 1 Then

  tw = MsgBox("이 훈련을 하고싶으면 하고 안하고싶으면 안하는거야 ; 할꺼면 이제 훈련을 시작하자. 일단 옆에있는 수련인형 5마리만 잡아와 못움직이니까 별로 어렵진 않을꺼야, Tip[크리티컬펀치를 찍으면 쉽게 잡을수 있습니다]", vbOKOnly, "전직교관")
  que = 2
  
ElseIf que = 2 Then

  If qus >= 5 Then
  tw = MsgBox("오 다했구나 내가 상을주지 , 더 훈련하려면 다시클릭해", vbOKOnly, "전직교관")
  tw = MsgBox("경험치를 얻었습니다(+25) Gold를 얻었습니다(+250) 아이템을얻었습니다(오렌지주스 10개)", vbOKOnly, "전직교관")
  exn = exn + 25: inv.money.Caption = (Val(inv.money.Caption) + 250): inv.포션(1).ToolTipText = (Val(inv.포션(1).ToolTipText) + 10)
  que = 3: qus = 0
  Else
  tw = MsgBox("아직 " & 5 - qus & "마리나 남았어", vbCritical, "전직교관")
  End If
  
ElseIf que = 3 Then

  tw = MsgBox("이번엔 수련인형2를 7마리만 잡아와 못움직이니까 별로 어렵진 않을꺼야, Tip[표지판에 히든스트리트가 있습니다.]", vbOKOnly, "전직교관")
  que = 4
  
ElseIf que = 4 Then

  If qus >= 7 Then
  tw = MsgBox("오 다했구나 내가 상을주지 , 더 훈련하려면 다시클릭해", vbOKOnly, "전직교관")
  tw = MsgBox("경험치를 얻었습니다(+100) Gold를 얻었습니다(+500) 아이템을얻었습니다(포도주스 10개)", vbOKOnly, "전직교관")
  exn = exn + 100: inv.money.Caption = (Val(inv.money.Caption) + 500): inv.포션(2).ToolTipText = (Val(inv.포션(2).ToolTipText) + 10)
  que = 5: qus = 0
  Else
  tw = MsgBox("아직 " & 7 - qus & "마리나 남았어", vbCritical, "전직교관")
  End If
  
ElseIf que = 5 Then

  tw = MsgBox("이번엔 수련인형3를 5마리만 잡아와 방어력이 높아서 좀 힘들꺼야, Tip[이거 역시 움직이지않습니다. 노가다 뛰세요]", vbOKOnly, "전직교관")
  que = 6

ElseIf que = 6 Then

  If qus >= 5 Then
  tw = MsgBox("오 다했구나 내가 상을주지 , 더 훈련하려면 다시클릭해", vbOKOnly, "전직교관")
  tw = MsgBox("경험치를 얻었습니다(+250) Gold를 얻었습니다(+750) 아이템을얻었습니다(오렌지주스 20개)", vbOKOnly, "전직교관")
  exn = exn + 250: inv.money.Caption = (Val(inv.money.Caption) + 750): inv.포션(1).ToolTipText = (Val(inv.포션(1).ToolTipText) + 20)
  que = 7: qus = 0
  Else
  tw = MsgBox("아직 " & 5 - qus & "마리나 남았어", vbCritical, "전직교관")
  End If
  
ElseIf que = 7 Then

  tw = MsgBox("마지막으로 땅강아지 10마리만 잡아와, Tip[포션을 들고가는게 안전합니다. 인벤토리 창을 연채로 사냥하세요.]", vbOKOnly, "전직교관")
  que = 8

ElseIf que = 8 Then

  If qus >= 10 Then
  tw = MsgBox("오 다했구나 내가 상을주지 이제 너는 꽤 괜찬은 모험가 가 되었어", vbOKOnly, "전직교관")
  tw = MsgBox("경험치를 얻었습니다(+300) Gold를 얻었습니다(+1000) 아이템을얻었습니다(오렌지주스 40개)", vbOKOnly, "전직교관")
  exn = exn + 300: inv.money.Caption = (Val(inv.money.Caption) + 1000): inv.포션(1).ToolTipText = (Val(inv.포션(1).ToolTipText) + 40)
  que = 9: qus = 0
  Else
  tw = MsgBox("아직 " & 10 - qus & "마리나 남았어", vbCritical, "전직교관")
  End If

ElseIf que > 8 Then
  
  tw = MsgBox("더 볼일은 없을텐데 ...", vbCritical, "전직교관")

End If

End Sub

Private Sub npc하빈이_Click()
gkqls = MsgBox("안녕 나는 하빈이 라고 해 다음맵으로 가보지 않을래?", vbQuestion, "하빈이")
gkqls = MsgBox("지금부터는 몬스터들이 나올꺼야 공격은 Ctrl 이야", vbOKOnly, "하빈이")
exn = exn + 1
    ddeem = 중요사항.Caption
    중요사항.Caption = ddeem & "경험치를 얻었습니다.(+1)" & "                "
ma = 2
mapi(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky1.jpg")
mapi(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky2.jpg")
npc하빈이.Top = -5000: maping = 1
For i = 1 To 5: hp(i) = 20: mh(i).Visible = True: Next i: For i = 6 To 10: hp(i) = 100: Next i: For i = 11 To 13: hp(i) = 350: Next i
For i = 14 To 17: hp(i) = 200: Next i: For i = 18 To 18: hp(i) = 1000: Next i: q1 = 1: For i = 1 To 18: m(i).Visible = True: Next i

맵표시.Caption = "초급 나무인형 수련장1": door1.Visible = True: 하빈이.Visible = False: C표지판.Visible = True:
End Sub
Private Sub Save_Click()

dj = MsgBox("저장하시겠습니까?[저장하시면 이 " & kr & "에 있는 지금까지의 정보가 이정보로 대체됩니다.]", vbYesNo, "저장FF2Y/N")

If dj = 6 Then

If login.ar.Caption = 1 Then
Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
ElseIf login.ar.Caption = 2 Then
Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
ElseIf login.ar.Caption = 3 Then
Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
End If
    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (키셋.k(i).Tag)
      End If
    Next i

Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, 맵표시.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
Print #1, qu1: Print #1, que: Print #1, qus
For i = 1 To 3
Print #1, skill.sk(i).Caption
Next i
For i = 1 To 6
Print #1, skill.sk1(i).Caption
Next i
Print #1, skill.kp.Caption
Print #1, inv.money.Caption
For i = 1 To 12: Print #1, inv.포션(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.검(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
Close #1, #2, #3
dj = MsgBox("저장되었습니다.", vbOKOnly, "DsSave")
Else
dj = MsgBox("저장을 취소했습니다.", vbCritical, "DSsave")
End If

End Sub
Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then
  말하기.Visible = True: 내용.Caption = Text1.Text: Text1.Text = "": 내용.Visible = True: Text1.Visible = False: 말하기.Visible = False: te = 0: trv = 1
End If
End Sub

Private Sub Ti_Timer()
sb.Panels(2).Text = "실제시간 : " & Time
End Sub
Private Sub Ti2_Timer()

tis = tis + 1

If tis = 60 Then
tim = tim + 1: tis = 0
End If

If tim = 60 Then
tih = tih + 1: tim = 0
End If

sb.Panels(3).Text = "게임상 시간 : " & tih & " : " & tim & " : " & tis

If Ti2.Tag = 0 Then
sb.Panels(1).Text = "Dragonstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 1 Then
sb.Panels(1).Text = "dRagonstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 2 Then
sb.Panels(1).Text = "drAgonstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 3 Then
sb.Panels(1).Text = "draGonstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 4 Then
sb.Panels(1).Text = "dragOnstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 5 Then
sb.Panels(1).Text = "dragoNstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 6 Then
sb.Panels(1).Text = "dragonStriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 7 Then
sb.Panels(1).Text = "dragonsTriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 8 Then
sb.Panels(1).Text = "dragonstRiker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 9 Then
sb.Panels(1).Text = "dragonstIker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 10 Then
sb.Panels(1).Text = "dragonstriKer": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 11 Then
sb.Panels(1).Text = "dragonstrikEr": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 12 Then
sb.Panels(1).Text = "dragonstrikeR": Ti2.Tag = 0
End If
End Sub
Private Sub upefect_Timer()
up.Left = c1.Left - 480
If upa = 1 Then
tr = Timer
Do: Loop Until Timer - tr >= 1000
upa = 0
Else
up.Visible = False
End If
upa = 0
End Sub
