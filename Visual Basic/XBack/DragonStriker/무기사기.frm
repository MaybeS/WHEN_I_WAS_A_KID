VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form 무기사기 
   BorderStyle     =   4  '고정 도구 창
   Caption         =   "상인과 대화"
   ClientHeight    =   3390
   ClientLeft      =   2760
   ClientTop       =   3675
   ClientWidth     =   6000
   ControlBox      =   0   'False
   Icon            =   "무기사기.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "무기사기.frx":030A
   ScaleHeight     =   3390
   ScaleWidth      =   6000
   ShowInTaskbar   =   0   'False
   Begin VB.Timer 물건정보 
      Interval        =   1
      Left            =   4440
      Top             =   3360
   End
   Begin VB.Frame 기타t 
      Height          =   1455
      Left            =   4440
      TabIndex        =   7
      Top             =   1800
      Width           =   1455
      Begin VB.Frame 프레임2 
         Height          =   495
         Left            =   120
         TabIndex        =   28
         Top             =   840
         Width           =   1215
         Begin VB.Frame 프레임1 
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   120
            Width           =   975
         End
      End
      Begin VB.Label money 
         Alignment       =   1  '오른쪽 맞춤
         BorderStyle     =   1  '단일 고정
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
         Left            =   120
         TabIndex        =   9
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label montext 
         Caption         =   "현재있는돈 :"
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
         TabIndex        =   8
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame 물약 
      Caption         =   "물약"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   120
      TabIndex        =   6
      Top             =   120
      Width           =   4215
      Begin VB.Frame s물건정보t 
         Caption         =   "물건정보"
         Height          =   2775
         Left            =   2880
         TabIndex        =   13
         Top             =   240
         Width           =   1215
         Begin VB.Label 효과st 
            Alignment       =   2  '가운데 맞춤
            BorderStyle     =   1  '단일 고정
            Caption         =   "효과"
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
            Left            =   120
            TabIndex        =   19
            Top             =   2040
            Width           =   975
         End
         Begin VB.Label 수량st 
            Alignment       =   2  '가운데 맞춤
            BorderStyle     =   1  '단일 고정
            Caption         =   "수량(1)"
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
            Left            =   120
            TabIndex        =   18
            Top             =   2400
            Width           =   975
         End
         Begin VB.Label psmoney 
            Alignment       =   1  '오른쪽 맞춤
            BorderStyle     =   1  '단일 고정
            Caption         =   "가격"
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
            Left            =   120
            TabIndex        =   17
            Top             =   1680
            Width           =   975
         End
         Begin VB.Label 가격t 
            Caption         =   "가격:"
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
            Left            =   120
            TabIndex        =   16
            Top             =   1440
            Width           =   975
         End
         Begin VB.Label ps명 
            Alignment       =   1  '오른쪽 맞춤
            BorderStyle     =   1  '단일 고정
            Caption         =   "상품명"
            BeginProperty Font 
               Name            =   "나눔고딕 Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Left            =   120
            TabIndex        =   15
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label 상품명t 
            Caption         =   "상품명:"
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
            TabIndex        =   14
            Top             =   960
            Width           =   975
         End
         Begin VB.Image 정보이미지s 
            Height          =   465
            Left            =   120
            Top             =   240
            Width           =   225
         End
      End
      Begin VB.Frame s기타류t 
         Caption         =   "기타류"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         TabIndex        =   12
         Top             =   2160
         Width           =   2655
         Begin VB.Image 포션 
            Height          =   495
            Index           =   12
            Left            =   720
            Picture         =   "무기사기.frx":0614
            Tag             =   "당고"
            ToolTipText     =   "Mp:300"
            Top             =   240
            Width           =   495
         End
         Begin VB.Image 포션 
            Height          =   450
            Index           =   11
            Left            =   1800
            Picture         =   "무기사기.frx":0825
            Tag             =   "팥빙수"
            ToolTipText     =   "Mp:1000"
            Top             =   240
            Width           =   390
         End
         Begin VB.Image 포션 
            Height          =   465
            Index           =   10
            Left            =   120
            Picture         =   "무기사기.frx":0A44
            Tag             =   "쭈쭈바"
            ToolTipText     =   "Mp:100"
            Top             =   240
            Width           =   465
         End
         Begin VB.Image 포션 
            Height          =   360
            Index           =   9
            Left            =   1320
            Picture         =   "무기사기.frx":0BBC
            Tag             =   "수박"
            ToolTipText     =   "Mp:500"
            Top             =   360
            Width           =   375
         End
      End
      Begin VB.Frame s간식거리t 
         Caption         =   "간식거리"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         TabIndex        =   11
         Top             =   1200
         Width           =   2655
         Begin VB.Image 포션 
            Height          =   405
            Index           =   8
            Left            =   1920
            Picture         =   "무기사기.frx":0DA4
            Tag             =   "천하장사"
            ToolTipText     =   "Hp:350"
            Top             =   240
            Width           =   405
         End
         Begin VB.Image 포션 
            Height          =   480
            Index           =   5
            Left            =   120
            Picture         =   "무기사기.frx":0ED1
            Tag             =   "군옥수수"
            ToolTipText     =   "Hp:400"
            Top             =   240
            Width           =   480
         End
         Begin VB.Image 포션 
            Height          =   345
            Index           =   6
            Left            =   720
            Picture         =   "무기사기.frx":110C
            Tag             =   "만두"
            ToolTipText     =   "Hp:500"
            Top             =   360
            Width           =   465
         End
         Begin VB.Image 포션 
            Height          =   315
            Index           =   7
            Left            =   1320
            Picture         =   "무기사기.frx":1464
            Tag             =   "고소한치즈"
            ToolTipText     =   "Hp:750"
            Top             =   360
            Width           =   375
         End
      End
      Begin VB.Frame s마실거t 
         Caption         =   "마실거"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   2655
         Begin VB.Image 포션 
            Height          =   420
            Index           =   3
            Left            =   840
            Picture         =   "무기사기.frx":162F
            Tag             =   "하얀우유"
            ToolTipText     =   "Hp:150"
            Top             =   240
            Width           =   420
         End
         Begin VB.Image 포션 
            Height          =   465
            Index           =   1
            Left            =   120
            Picture         =   "무기사기.frx":17D2
            Tag             =   "오렌지쥬스"
            ToolTipText     =   "Hp:50"
            Top             =   240
            Width           =   225
         End
         Begin VB.Image 포션 
            Height          =   465
            Index           =   2
            Left            =   480
            Picture         =   "무기사기.frx":1C8F
            Tag             =   "포도쥬스"
            ToolTipText     =   "Mp:50"
            Top             =   240
            Width           =   225
         End
         Begin VB.Image 포션 
            Height          =   435
            Index           =   4
            Left            =   1440
            Picture         =   "무기사기.frx":215E
            Tag             =   "인삼농축액"
            ToolTipText     =   "Hp:1500"
            Top             =   240
            Width           =   465
         End
      End
   End
   Begin VB.Frame 방어구 
      Caption         =   "방어구"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   120
      TabIndex        =   5
      Top             =   6600
      Width           =   4215
   End
   Begin VB.Frame 옵션t 
      Height          =   1695
      Left            =   4440
      TabIndex        =   1
      Top             =   120
      Width           =   1455
      Begin VB.CommandButton 팔기 
         Caption         =   "팔기"
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
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton 사기 
         Caption         =   "사기"
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
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton exit 
         Caption         =   "나가기"
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
         TabIndex        =   2
         Top             =   1200
         Width           =   1215
      End
   End
   Begin VB.Frame 무기 
      Caption         =   "무기"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   120
      TabIndex        =   0
      Top             =   3360
      Width           =   4215
      Begin VB.Frame a물건정보t 
         Caption         =   "물건정보"
         Height          =   2775
         Left            =   2880
         TabIndex        =   21
         Top             =   240
         Width           =   1215
         Begin VB.Image 정보이미지a 
            Height          =   465
            Left            =   120
            Top             =   240
            Width           =   225
         End
         Begin VB.Label Label6 
            Caption         =   "상품명:"
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
            TabIndex        =   27
            Top             =   960
            Width           =   975
         End
         Begin VB.Label at명 
            Alignment       =   1  '오른쪽 맞춤
            BorderStyle     =   1  '단일 고정
            Caption         =   "상품명"
            BeginProperty Font 
               Name            =   "나눔고딕 Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Left            =   120
            TabIndex        =   26
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label4 
            Caption         =   "가격:"
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
            Left            =   120
            TabIndex        =   25
            Top             =   1440
            Width           =   975
         End
         Begin VB.Label atmoney 
            Alignment       =   1  '오른쪽 맞춤
            BorderStyle     =   1  '단일 고정
            Caption         =   "가격"
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
            Left            =   120
            TabIndex        =   24
            Top             =   1680
            Width           =   975
         End
         Begin VB.Label 렙제 
            Alignment       =   2  '가운데 맞춤
            BorderStyle     =   1  '단일 고정
            Caption         =   "렙제"
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
            Left            =   120
            TabIndex        =   23
            Top             =   2400
            Width           =   975
         End
         Begin VB.Label 효과at 
            Alignment       =   2  '가운데 맞춤
            BorderStyle     =   1  '단일 고정
            Caption         =   "효과"
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
            Left            =   120
            TabIndex        =   22
            Top             =   2040
            Width           =   975
         End
      End
      Begin TabDlg.SSTab SSTab1 
         Height          =   2775
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   2565
         _ExtentX        =   4524
         _ExtentY        =   4895
         _Version        =   393216
         Tabs            =   4
         TabsPerRow      =   4
         TabHeight       =   520
         TabCaption(0)   =   "검"
         TabPicture(0)   =   "무기사기.frx":252A
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "검(1)"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).Control(1)=   "검(2)"
         Tab(0).Control(1).Enabled=   0   'False
         Tab(0).Control(2)=   "검(5)"
         Tab(0).Control(2).Enabled=   0   'False
         Tab(0).Control(3)=   "검(3)"
         Tab(0).Control(3).Enabled=   0   'False
         Tab(0).Control(4)=   "검(4)"
         Tab(0).Control(4).Enabled=   0   'False
         Tab(0).Control(5)=   "검(6)"
         Tab(0).Control(5).Enabled=   0   'False
         Tab(0).Control(6)=   "검(9)"
         Tab(0).Control(6).Enabled=   0   'False
         Tab(0).Control(7)=   "검(7)"
         Tab(0).Control(7).Enabled=   0   'False
         Tab(0).Control(8)=   "검(8)"
         Tab(0).Control(8).Enabled=   0   'False
         Tab(0).Control(9)=   "검(10)"
         Tab(0).Control(9).Enabled=   0   'False
         Tab(0).Control(10)=   "검(11)"
         Tab(0).Control(10).Enabled=   0   'False
         Tab(0).ControlCount=   11
         TabCaption(1)   =   "스태프"
         TabPicture(1)   =   "무기사기.frx":2546
         Tab(1).ControlEnabled=   0   'False
         Tab(1).ControlCount=   0
         TabCaption(2)   =   "활"
         TabPicture(2)   =   "무기사기.frx":2562
         Tab(2).ControlEnabled=   0   'False
         Tab(2).ControlCount=   0
         TabCaption(3)   =   "미완성"
         TabPicture(3)   =   "무기사기.frx":257E
         Tab(3).ControlEnabled=   0   'False
         Tab(3).ControlCount=   0
         Begin VB.Image 검 
            Height          =   375
            Index           =   11
            Left            =   1080
            Picture         =   "무기사기.frx":259A
            Tag             =   "파괴의검"
            ToolTipText     =   "A+:90"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   10
            Left            =   120
            Picture         =   "무기사기.frx":2CE4
            Tag             =   "투 헨더"
            ToolTipText     =   "A+:75"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   8
            Left            =   1080
            Picture         =   "무기사기.frx":33E6
            Tag             =   "엘리멘탈소드"
            ToolTipText     =   "A+:45"
            Top             =   1680
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   7
            Left            =   120
            Picture         =   "무기사기.frx":3AE8
            Tag             =   "익스프로소드"
            ToolTipText     =   "A+:45"
            Top             =   1680
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   9
            Left            =   2040
            Picture         =   "무기사기.frx":41EA
            Tag             =   "저주받은검"
            ToolTipText     =   "A+:60"
            Top             =   1680
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   6
            Left            =   2040
            Picture         =   "무기사기.frx":48EC
            Tag             =   "바이킹소드"
            ToolTipText     =   "A+:36"
            Top             =   1080
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   4
            Left            =   120
            Picture         =   "무기사기.frx":4FEE
            Tag             =   "초강철검"
            ToolTipText     =   "A+:25"
            Top             =   1080
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   3
            Left            =   2040
            Picture         =   "무기사기.frx":56F0
            Tag             =   "강철검"
            ToolTipText     =   "A+:17"
            Top             =   480
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   5
            Left            =   1080
            Picture         =   "무기사기.frx":5DF2
            Tag             =   "황검"
            ToolTipText     =   "A+:29"
            Top             =   1080
            Width           =   345
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   2
            Left            =   1080
            Picture         =   "무기사기.frx":64F4
            Tag             =   "청동검"
            ToolTipText     =   "A+:10"
            Top             =   480
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   330
            Index           =   1
            Left            =   120
            Picture         =   "무기사기.frx":6BF6
            Tag             =   "목검"
            ToolTipText     =   "A+:5"
            Top             =   480
            Width           =   345
         End
      End
   End
   Begin VB.Label ind 
      Caption         =   "1"
      Height          =   255
      Left            =   4560
      TabIndex        =   30
      Top             =   4200
      Width           =   1335
   End
End
Attribute VB_Name = "무기사기"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ps, psc, tu, dj, inve

Private Sub 검_Click(Index As Integer)
ind.Caption = Index
i = Index
End Sub
Private Sub 물건정보_Timer()

inve = Val(ind.Caption)

If map.상인체크.Caption = "물약" Then

정보이미지s.Picture = 포션(inve).Picture
ps명.Caption = 포션(inve).Tag
kr = Mid(포션(inve).ToolTipText, 4)
tr = Mid(포션(inve).ToolTipText, 1, 2)
효과st.Caption = 포션(inve).ToolTipText
If tr = "Hp" Then
tu = kr + (kr / 10)
ps명.ForeColor = &HFF&
ElseIf tr = "Mp" Then
tu = kr * 2
ps명.ForeColor = &HFF0000
End If

ElseIf map.상인체크.Caption = "무기" Then

정보이미지a.Picture = 검(inve).Picture
at명.Caption = 검(inve).Tag
kr = Mid(검(inve).ToolTipText, 4)
tr = Mid(검(inve).ToolTipText, 1, 2)
효과at.Caption = 검(inve).ToolTipText
렙제.Caption = ("Lv " & (Val(ind.Caption) * 5))
  If Val(ind.Caption) = 8 Then
  렙제.Caption = ("Lv 35")
  End If
tu = kr * 200 + (Int(kr / 10)) * 50 + (Int(kr / 20)) * 50 + (Int((kr / 45) + 0.5)) * 50

ElseIf map.상인체크.Caption = "방어구" Then

End If

psmoney.Caption = tu * dj
atmoney.Caption = tu
Money.Caption = inv.Money.Caption

End Sub
Private Sub 사기_Click()

If inve = 0 Then
oper = MsgBox("물건을선택해 주세요", vbCritical, "물건사기")
Else

If map.상인체크.Caption = "물약" Then
tp = psmoney.Caption: sw = 1
ElseIf map.상인체크.Caption = "무기" Then
tp = atmoney.Caption: sw = 2
ElseIf map.상인체크.Caption = "방어구" Then

End If

If Val(inv.Money.Caption) >= tp Then
inv.Money.Caption = Val(inv.Money.Caption) - tp
  If sw = 1 Then
  inv.포션(inve).ToolTipText = Val(inv.포션(inve).ToolTipText) + dj
  ElseIf sw = 2 Then
  inv.검(inve).ToolTipText = Val(inv.검(inve).ToolTipText) + 1
  End If
Else
dpk = MsgBox("골드가 부족합니다. 골드를 확인해주세요", vbCritical, "골드부족")
End If

End If

End Sub
Private Sub 수량st_Click()
dj = InputBox("수량을 입력하세요.(1~1000)", "물약상인과의 대화")
If 0 < dj And dj < 1001 Then
psc = Int(dj)
수량st.Caption = "수량(" & dj & ")"
Else
dj = 1
dpk = MsgBox("1~1000의 수량을 입력하세요", vbCritical, "물약상인과의 대화")
dj = 1
End If
End Sub
Private Sub 전설_Click()
If map.상인체크.Caption = "무기" Then

End If
End Sub

Private Sub 포션_Click(Index As Integer)
ind.Caption = Index
i = Index
End Sub
Private Sub exit_Click()
무기사기.Visible = False
inve = 0
End Sub
Private Sub Form_Load()
dj = 1: tu = 0
End Sub

