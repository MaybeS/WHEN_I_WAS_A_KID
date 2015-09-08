VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form inv 
   BorderStyle     =   4  '고정 도구 창
   Caption         =   "인벤토리 [Ver 3.63402]"
   ClientHeight    =   5595
   ClientLeft      =   9825
   ClientTop       =   6240
   ClientWidth     =   5340
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "나눔고딕 Bold"
      Size            =   9
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "inv.frx":0000
   MousePointer    =   99  '사용자 정의
   ScaleHeight     =   5595
   ScaleWidth      =   5340
   ShowInTaskbar   =   0   'False
   Begin VB.Timer tag계산 
      Interval        =   1
      Left            =   0
      Top             =   4680
   End
   Begin VB.Frame 인벤토리t 
      Caption         =   "인벤토리------------------------------------------------------------------"
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
      TabIndex        =   6
      Top             =   0
      Width           =   4815
   End
   Begin VB.Frame moneyttt 
      Height          =   735
      Left            =   0
      TabIndex        =   2
      Top             =   4800
      Width           =   5295
      Begin VB.Label money 
         Alignment       =   1  '오른쪽 맞춤
         BorderStyle     =   1  '단일 고정
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
         Height          =   375
         Left            =   840
         TabIndex        =   5
         Top             =   240
         Width           =   3855
      End
      Begin VB.Label Moneyt 
         Caption         =   "Money :"
         ForeColor       =   &H000080FF&
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   735
      End
      Begin VB.Label moneytt 
         Alignment       =   2  '가운데 맞춤
         Caption         =   "ⓜ"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   14.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000080FF&
         Height          =   375
         Left            =   4800
         TabIndex        =   3
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.CommandButton 닫기 
      BackColor       =   &H000000FF&
      Caption         =   "x"
      Height          =   285
      Left            =   5040
      MaskColor       =   &H000000FF&
      Style           =   1  '그래픽
      TabIndex        =   0
      Top             =   0
      Width           =   300
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   4455
      Left            =   0
      TabIndex        =   1
      Top             =   360
      Width           =   5295
      _ExtentX        =   9340
      _ExtentY        =   7858
      _Version        =   393216
      Tabs            =   4
      TabsPerRow      =   4
      TabHeight       =   520
      TabCaption(0)   =   "장비"
      TabPicture(0)   =   "inv.frx":030A
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "SSTab2"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "fw1121"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "소비"
      TabPicture(1)   =   "inv.frx":0326
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "t포션t"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "화살ttt"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).ControlCount=   2
      TabCaption(2)   =   "기타"
      TabPicture(2)   =   "inv.frx":0342
      Tab(2).ControlEnabled=   0   'False
      Tab(2).ControlCount=   0
      TabCaption(3)   =   "스킬북"
      TabPicture(3)   =   "inv.frx":035E
      Tab(3).ControlEnabled=   0   'False
      Tab(3).ControlCount=   0
      Begin VB.Frame fw1121 
         Caption         =   "찾용중인 장비"
         Height          =   3975
         Left            =   3360
         TabIndex        =   13
         Top             =   360
         Width           =   1815
         Begin VB.Label 공속 
            Alignment       =   1  '오른쪽 맞춤
            Caption         =   "0"
            Height          =   255
            Left            =   1080
            TabIndex        =   19
            Top             =   3000
            Width           =   495
         End
         Begin VB.Label 공속ttt 
            Caption         =   "공격속도:"
            Height          =   255
            Left            =   120
            TabIndex        =   18
            Top             =   3000
            Width           =   855
         End
         Begin VB.Label 검명 
            Alignment       =   1  '오른쪽 맞춤
            Caption         =   "            "
            Height          =   255
            Left            =   480
            TabIndex        =   17
            Top             =   2040
            Width           =   1215
         End
         Begin VB.Label 검명ttt 
            Caption         =   "검명:"
            Height          =   255
            Left            =   120
            TabIndex        =   16
            Top             =   2040
            Width           =   495
         End
         Begin VB.Label 무기공격력 
            Alignment       =   1  '오른쪽 맞춤
            Caption         =   "0"
            Height          =   255
            Left            =   720
            TabIndex        =   15
            Top             =   2520
            Width           =   855
         End
         Begin VB.Label 공격력tttt 
            Caption         =   "공격력:"
            Height          =   255
            Left            =   120
            TabIndex        =   14
            Top             =   2520
            Width           =   615
         End
         Begin VB.Image 착용무기 
            BorderStyle     =   1  '단일 고정
            Height          =   1575
            Left            =   120
            Picture         =   "inv.frx":037A
            Stretch         =   -1  'True
            Top             =   360
            Width           =   1575
         End
      End
      Begin TabDlg.SSTab SSTab2 
         Height          =   3855
         Left            =   120
         TabIndex        =   9
         Top             =   480
         Width           =   3135
         _ExtentX        =   5530
         _ExtentY        =   6800
         _Version        =   393216
         Tabs            =   4
         TabsPerRow      =   4
         TabHeight       =   520
         TabCaption(0)   =   "검"
         TabPicture(0)   =   "inv.frx":68CF0
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "검(11)"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).Control(1)=   "검(10)"
         Tab(0).Control(1).Enabled=   0   'False
         Tab(0).Control(2)=   "검(8)"
         Tab(0).Control(2).Enabled=   0   'False
         Tab(0).Control(3)=   "검(7)"
         Tab(0).Control(3).Enabled=   0   'False
         Tab(0).Control(4)=   "검(9)"
         Tab(0).Control(4).Enabled=   0   'False
         Tab(0).Control(5)=   "검(6)"
         Tab(0).Control(5).Enabled=   0   'False
         Tab(0).Control(6)=   "검(4)"
         Tab(0).Control(6).Enabled=   0   'False
         Tab(0).Control(7)=   "검(3)"
         Tab(0).Control(7).Enabled=   0   'False
         Tab(0).Control(8)=   "검(5)"
         Tab(0).Control(8).Enabled=   0   'False
         Tab(0).Control(9)=   "검(2)"
         Tab(0).Control(9).Enabled=   0   'False
         Tab(0).Control(10)=   "검(1)"
         Tab(0).Control(10).Enabled=   0   'False
         Tab(0).ControlCount=   11
         TabCaption(1)   =   "스태프"
         TabPicture(1)   =   "inv.frx":68D0C
         Tab(1).ControlEnabled=   0   'False
         Tab(1).ControlCount=   0
         TabCaption(2)   =   "활"
         TabPicture(2)   =   "inv.frx":68D28
         Tab(2).ControlEnabled=   0   'False
         Tab(2).ControlCount=   0
         TabCaption(3)   =   "준비중"
         TabPicture(3)   =   "inv.frx":68D44
         Tab(3).ControlEnabled=   0   'False
         Tab(3).ControlCount=   0
         Begin VB.Image 검 
            Height          =   330
            Index           =   1
            Left            =   360
            Picture         =   "inv.frx":68D60
            Tag             =   "목검"
            ToolTipText     =   "0"
            Top             =   600
            Width           =   345
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   2
            Left            =   1560
            Picture         =   "inv.frx":693D2
            Tag             =   "청동검"
            ToolTipText     =   "0"
            Top             =   600
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   5
            Left            =   1560
            Picture         =   "inv.frx":69AD4
            Tag             =   "황검"
            ToolTipText     =   "0"
            Top             =   1440
            Width           =   345
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   3
            Left            =   2640
            Picture         =   "inv.frx":6A1D6
            Tag             =   "강철검"
            ToolTipText     =   "0"
            Top             =   600
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   4
            Left            =   360
            Picture         =   "inv.frx":6A8D8
            Tag             =   "초강철검"
            ToolTipText     =   "0"
            Top             =   1440
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   6
            Left            =   2640
            Picture         =   "inv.frx":6AFDA
            Tag             =   "바이킹소드"
            ToolTipText     =   "0"
            Top             =   1440
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   9
            Left            =   2640
            Picture         =   "inv.frx":6B6DC
            Tag             =   "저주받은검"
            ToolTipText     =   "0"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   7
            Left            =   360
            Picture         =   "inv.frx":6BDDE
            Tag             =   "익스프로소드"
            ToolTipText     =   "0"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   8
            Left            =   1560
            Picture         =   "inv.frx":6C4E0
            Tag             =   "엘리멘탈소드"
            ToolTipText     =   "0"
            Top             =   2280
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   360
            Index           =   10
            Left            =   360
            Picture         =   "inv.frx":6CBE2
            Tag             =   "투 헨더"
            ToolTipText     =   "0"
            Top             =   3120
            Width           =   360
         End
         Begin VB.Image 검 
            Height          =   375
            Index           =   11
            Left            =   1560
            Picture         =   "inv.frx":6D2E4
            Tag             =   "파괴의검"
            ToolTipText     =   "0"
            Top             =   3120
            Width           =   360
         End
      End
      Begin VB.Frame 화살ttt 
         Caption         =   "화살"
         Height          =   3735
         Left            =   -71640
         TabIndex        =   8
         Top             =   480
         Width           =   1815
         Begin VB.Frame 사용중인화살ttt 
            Caption         =   "사용중인화살"
            Height          =   975
            Left            =   120
            TabIndex        =   10
            Top             =   240
            Width           =   1575
            Begin VB.Label 화살공 
               Caption         =   "9"
               Height          =   255
               Left            =   840
               TabIndex        =   12
               Top             =   600
               Width           =   615
            End
            Begin VB.Label 공격력ttt 
               Caption         =   "공격력 : "
               Height          =   255
               Left            =   120
               TabIndex        =   11
               Top             =   600
               Width           =   615
            End
            Begin VB.Image arr 
               Height          =   255
               Left            =   120
               ToolTipText     =   "1"
               Top             =   240
               Width           =   1215
            End
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   8
            Left            =   1800
            Picture         =   "inv.frx":6DA2E
            ToolTipText     =   "1"
            Top             =   3240
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   7
            Left            =   1800
            Picture         =   "inv.frx":6DAC5
            ToolTipText     =   "1"
            Top             =   2640
            Width           =   1065
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   6
            Left            =   1800
            Picture         =   "inv.frx":6DB6B
            ToolTipText     =   "1"
            Top             =   2040
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   5
            Left            =   1800
            Picture         =   "inv.frx":6DC01
            ToolTipText     =   "100"
            Top             =   1440
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   4
            Left            =   120
            Picture         =   "inv.frx":6DC6C
            ToolTipText     =   "0"
            Top             =   3240
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   3
            Left            =   120
            Picture         =   "inv.frx":6DD02
            ToolTipText     =   "0"
            Top             =   2640
            Width           =   1065
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   2
            Left            =   120
            Picture         =   "inv.frx":6DDA8
            ToolTipText     =   "0"
            Top             =   2040
            Width           =   945
         End
         Begin VB.Image arrow 
            Height          =   240
            Index           =   1
            Left            =   120
            Picture         =   "inv.frx":6DE3E
            ToolTipText     =   "0"
            Top             =   1440
            Width           =   945
         End
      End
      Begin VB.Frame t포션t 
         Caption         =   "포션"
         Height          =   3735
         Left            =   -74880
         TabIndex        =   7
         Top             =   480
         Width           =   3135
         Begin VB.Timer Timer1 
            Interval        =   1
            Left            =   1920
            Top             =   3120
         End
         Begin VB.Image 포션 
            Height          =   450
            Index           =   11
            Left            =   1680
            Picture         =   "inv.frx":6DEAA
            Tag             =   "77m1000"
            ToolTipText     =   "0"
            Top             =   2040
            Width           =   390
         End
         Begin VB.Image 포션 
            Height          =   405
            Index           =   8
            Left            =   2400
            Picture         =   "inv.frx":6E0C9
            Tag             =   "74h350"
            ToolTipText     =   "0"
            Top             =   1200
            Width           =   405
         End
         Begin VB.Image 포션 
            Height          =   465
            Index           =   9
            Left            =   240
            Picture         =   "inv.frx":6E1F6
            Tag             =   "75m100"
            ToolTipText     =   "0"
            Top             =   2040
            Width           =   465
         End
         Begin VB.Image 포션 
            Height          =   435
            Index           =   4
            Left            =   2400
            Picture         =   "inv.frx":6E36E
            Tag             =   "68h1500"
            ToolTipText     =   "0"
            Top             =   360
            Width           =   465
         End
         Begin VB.Image 포션 
            Height          =   480
            Index           =   5
            Left            =   240
            Picture         =   "inv.frx":6E73A
            Tag             =   "70h400"
            ToolTipText     =   "0"
            Top             =   1200
            Width           =   480
         End
         Begin VB.Image 포션 
            Height          =   465
            Index           =   2
            Left            =   840
            Picture         =   "inv.frx":6E975
            Tag             =   "66m50"
            ToolTipText     =   "0"
            Top             =   360
            Width           =   225
         End
         Begin VB.Image 포션 
            Height          =   465
            Index           =   1
            Left            =   240
            Picture         =   "inv.frx":6EE44
            Tag             =   "65h50"
            ToolTipText     =   "0"
            Top             =   360
            Width           =   225
         End
         Begin VB.Image 포션 
            Height          =   420
            Index           =   3
            Left            =   1560
            Picture         =   "inv.frx":6F301
            Tag             =   "67h150"
            ToolTipText     =   "0"
            Top             =   360
            Width           =   420
         End
         Begin VB.Image 포션 
            Height          =   360
            Index           =   10
            Left            =   960
            Picture         =   "inv.frx":6F4A4
            Tag             =   "76m500"
            ToolTipText     =   "0"
            Top             =   2160
            Width           =   375
         End
         Begin VB.Image 포션 
            Height          =   345
            Index           =   7
            Left            =   1560
            Picture         =   "inv.frx":6F68C
            Tag             =   "72h750"
            ToolTipText     =   "0"
            Top             =   1320
            Width           =   465
         End
         Begin VB.Image 포션 
            Height          =   495
            Index           =   12
            Left            =   2400
            Picture         =   "inv.frx":6F9E4
            Tag             =   "78m300"
            ToolTipText     =   "0"
            Top             =   2040
            Width           =   495
         End
         Begin VB.Image 포션 
            Height          =   315
            Index           =   6
            Left            =   960
            Picture         =   "inv.frx":6FBF5
            Tag             =   "71h500"
            ToolTipText     =   "0"
            Top             =   1320
            Width           =   375
         End
      End
   End
End
Attribute VB_Name = "inv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim i
Private Sub 검_Click(Index As Integer)
착용무기.Picture = 검(Index).Picture
검명.Caption = 검(Index).Tag
무기공격력.Caption = Mid(무기사기.검(Index).ToolTipText, 4)
  If Index = 1 Then
  공속.Caption = "느림"
  ElseIf Index = 2 Then
  공속.Caption = "느림"
  ElseIf Index = 3 Then
  공속.Caption = "보통"
  ElseIf Index = 4 Then
  공속.Caption = "느림"
  ElseIf Index = 5 Then
  공속.Caption = "보통"
  ElseIf Index = 6 Then
  공속.Caption = "빠름"
  ElseIf Index = 7 Then
  공속.Caption = "보통"
  ElseIf Index = 8 Then
  공속.Caption = "보통"
  ElseIf Index = 9 Then
  공속.Caption = "보통"
  ElseIf Index = 10 Then
  공속.Caption = "빠름"
  ElseIf Index = 11 Then
  공속.Caption = "느림"
  End If
End Sub

Private Sub 닫기_Click()
inv.Visible = False
End Sub
Private Sub 포션_Click(Index As Integer)

tr = Index

If Val(포션(tr).ToolTipText) > 0 Then

yu = Mid(포션(tr).Tag, 3, 1)
se = Mid(포션(tr).Tag, 4)

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


포션(tr).ToolTipText = (Val(포션(tr).ToolTipText) - 1)

End If

End Sub

Private Sub arrow_Click(Index As Integer)
  i = Index
If arrow(i).ToolTipText > 0 Then
 arr.Tag = 1
  arr.ToolTipText = Index
  arr.Picture = arrow(i).Picture
  화살공.Caption = (i * 10) - Int((i * 10) / 10) - Int((i * 10) / 20) - Int((i * 10) / 30) - Int((i * 10) / 40)
Else
djwp = MsgBox("선택하신 화살의 갯수가 0 미만 입니다.", vbCritical, "화살오류00FFTS")
End If

End Sub
Private Sub Form_Load()
  i = 1
If arrow(i).ToolTipText >= 0 Then
  arr.Tag = 1
  arr.ToolTipText = 1
  arr.Picture = arrow(i).Picture
  화살공.Caption = (i * 10) - Int((i * 10) / 10) - Int((i * 10) / 20) - Int((i * 10) / 30) - Int((i * 10) / 40)
Else
djwp = MsgBox("선택하신 화살의 갯수가 0 미만 입니다.", vbCritical, "화살오류00FFTS")
End If

End Sub

Private Sub Timer1_Timer()
cnt = 0
For i = 1 To 4
cnt = cnt + arrow(i).ToolTipText
Next i
If cnt = 0 Then
arr.Tag = 0
End If
End Sub
