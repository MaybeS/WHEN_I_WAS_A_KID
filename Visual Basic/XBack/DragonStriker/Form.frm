VERSION 5.00
Begin VB.Form login 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  '크기 고정 대화 상자
   Caption         =   "Login Page MayTryArk ::: FlyToSky:::"
   ClientHeight    =   4065
   ClientLeft      =   135
   ClientTop       =   690
   ClientWidth     =   7095
   Icon            =   "Form.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "Form.frx":11C2
   MousePointer    =   99  '사용자 정의
   ScaleHeight     =   4065
   ScaleWidth      =   7095
   ShowInTaskbar   =   0   'False
   Begin VB.Frame sdfaaa 
      Height          =   4050
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7080
      Begin VB.Timer 반짝 
         Interval        =   500
         Left            =   4200
         Top             =   3600
      End
      Begin VB.CommandButton 닫기 
         BackColor       =   &H000000FF&
         Caption         =   "x"
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
         Left            =   4440
         MaskColor       =   &H000000FF&
         Style           =   1  '그래픽
         TabIndex        =   35
         Top             =   120
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.CommandButton 올리기 
         Caption         =   "▲"
         Height          =   255
         Left            =   8400
         TabIndex        =   34
         Top             =   3600
         Width           =   255
      End
      Begin VB.CommandButton 내리기 
         Caption         =   "▼"
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
         TabIndex        =   33
         Top             =   3600
         Width           =   255
      End
      Begin VB.Frame 캐릭정보 
         Caption         =   "캐릭터 정보"
         Height          =   1695
         Left            =   120
         TabIndex        =   25
         Top             =   5160
         Width           =   4455
         Begin VB.CommandButton Command8 
            Caption         =   "Game Start"
            Height          =   375
            Left            =   120
            TabIndex        =   27
            Top             =   1320
            Width           =   2055
         End
         Begin VB.CommandButton Command6 
            Caption         =   "공지 보기"
            Height          =   375
            Left            =   2160
            TabIndex        =   26
            Top             =   1320
            Width           =   1695
         End
         Begin VB.Label Label8 
            Caption         =   "아이디 :"
            BeginProperty Font 
               Name            =   "굴림"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   840
            Width           =   975
         End
         Begin VB.Label Label9 
            Caption         =   "레벨 :"
            BeginProperty Font 
               Name            =   "굴림"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   28
            Top             =   360
            Width           =   735
         End
      End
      Begin VB.Frame 공지 
         Caption         =   "공지"
         Height          =   1695
         Left            =   120
         TabIndex        =   20
         Top             =   5160
         Width           =   4455
         Begin VB.CommandButton Command7 
            Caption         =   "Game Start"
            Height          =   375
            Left            =   120
            TabIndex        =   22
            Top             =   1320
            Width           =   2055
         End
         Begin VB.CommandButton Command9 
            Caption         =   "캐릭터 정보 보기"
            Height          =   375
            Left            =   2160
            TabIndex        =   21
            Top             =   1320
            Width           =   1695
         End
         Begin VB.Label Label10 
            BorderStyle     =   1  '단일 고정
            Caption         =   "패치된내용 : 없음"
            BeginProperty Font 
               Name            =   "돋움체"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            TabIndex        =   24
            Top             =   960
            Width           =   4215
         End
         Begin VB.Label Label11 
            BorderStyle     =   1  '단일 고정
            Caption         =   "::: Beta 테스터 모집:::       댓글바람"
            BeginProperty Font 
               Name            =   "돋움체"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   615
            Left            =   120
            TabIndex        =   23
            Top             =   240
            Width           =   4215
         End
      End
      Begin VB.CommandButton Command5 
         BackColor       =   &H000000FF&
         Caption         =   "종료"
         Height          =   375
         Left            =   5640
         MaskColor       =   &H000000FF&
         Style           =   1  '그래픽
         TabIndex        =   19
         Top             =   3600
         Width           =   1335
      End
      Begin VB.CommandButton Command3 
         Caption         =   "아이디삭제"
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
         TabIndex        =   17
         Top             =   3360
         Width           =   1095
      End
      Begin VB.CommandButton Command2 
         Caption         =   "계정만들기"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   14
         Top             =   3120
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "확인"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1440
         Picture         =   "Form.frx":14CC
         TabIndex        =   13
         Top             =   3120
         Width           =   975
      End
      Begin VB.Frame fl 
         Caption         =   "로그인"
         Height          =   1695
         Left            =   120
         TabIndex        =   8
         Top             =   1320
         Width           =   4455
         Begin VB.TextBox Text2 
            BeginProperty Font 
               Name            =   "나눔고딕 Bold"
               Size            =   18
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            IMEMode         =   3  '사용 못함
            Left            =   1080
            MouseIcon       =   "Form.frx":17D6
            PasswordChar    =   "*"
            TabIndex        =   12
            Top             =   960
            Width           =   3255
         End
         Begin VB.TextBox Text1 
            DragIcon        =   "Form.frx":21E0
            BeginProperty Font 
               Name            =   "나눔고딕 Bold"
               Size            =   18
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1080
            MouseIcon       =   "Form.frx":2BEA
            TabIndex        =   11
            Top             =   240
            Width           =   3255
         End
         Begin VB.Label Label2 
            Caption         =   "PW"
            BeginProperty Font 
               Name            =   "나눔고딕 Bold"
               Size            =   20.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   120
            TabIndex        =   10
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label1 
            Caption         =   "ID"
            BeginProperty Font 
               Name            =   "나눔고딕 Bold"
               Size            =   20.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   120
            TabIndex        =   9
            Top             =   240
            Width           =   375
         End
      End
      Begin VB.Timer Timer1 
         Interval        =   1000
         Left            =   -240
         Top             =   3840
      End
      Begin VB.Label ep 
         BorderStyle     =   1  '단일 고정
         Caption         =   $"Form.frx":35F4
         Height          =   3495
         Left            =   4680
         TabIndex        =   32
         Top             =   120
         Visible         =   0   'False
         Width           =   4215
      End
      Begin VB.Label episode 
         Alignment       =   2  '가운데 맞춤
         BorderStyle     =   1  '단일 고정
         Caption         =   "Episode"
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
         Left            =   4680
         TabIndex        =   31
         ToolTipText     =   "IEpisodeI"
         Top             =   3600
         Width           =   855
      End
      Begin VB.Label Label5 
         BorderStyle     =   1  '단일 고정
         Caption         =   "Update"
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
         Left            =   3720
         TabIndex        =   30
         Top             =   3360
         Width           =   615
      End
      Begin VB.Label ar 
         Caption         =   "  "
         Height          =   255
         Left            =   4920
         TabIndex        =   18
         Top             =   5000
         Width           =   495
      End
      Begin VB.Label Label4 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   11.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4200
         TabIndex        =   16
         Top             =   3000
         Width           =   375
      End
      Begin VB.Label Label3 
         Caption         =   "검색된아이디 수:"
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   11.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2520
         TabIndex        =   15
         Top             =   3000
         Width           =   1695
      End
      Begin VB.Label lblCompanyProduct 
         AutoSize        =   -1  'True
         Caption         =   "MayTryArk"
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   18
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   465
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   1905
      End
      Begin VB.Label lblProductName 
         AutoSize        =   -1  'True
         Caption         =   "DragonStriker™"
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   24
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   630
         Left            =   360
         TabIndex        =   6
         Top             =   720
         Width           =   3720
      End
      Begin VB.Label lblPlatform 
         Alignment       =   1  '오른쪽 맞춤
         AutoSize        =   -1  'True
         Caption         =   "::DragonStriker::"
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
         Left            =   4650
         TabIndex        =   5
         Top             =   2280
         Width           =   2340
      End
      Begin VB.Label lblVersion 
         Alignment       =   1  '오른쪽 맞춤
         AutoSize        =   -1  'True
         Caption         =   "Beta Ver[0.1.42]"
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
         Left            =   4875
         TabIndex        =   4
         Top             =   2640
         Width           =   2055
      End
      Begin VB.Label lblWarning 
         Caption         =   "Copyrightⓒ2009 [DragonStriker] All rights Reserved"
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   3720
         Width           =   4575
      End
      Begin VB.Label lblCompany 
         Caption         =   "회사 : Algokorea"
         Height          =   255
         Left            =   5520
         TabIndex        =   2
         Top             =   3360
         Width           =   1455
      End
      Begin VB.Label lblCopyright 
         Caption         =   "저작권 : jiun0623   저작권 : heonsheen"
         Height          =   375
         Left            =   5280
         TabIndex        =   1
         Top             =   3000
         Width           =   1695
      End
      Begin VB.Image imgLogo 
         BorderStyle     =   1  '단일 고정
         Height          =   2025
         Left            =   4680
         Picture         =   "Form.frx":3B26
         Stretch         =   -1  'True
         Top             =   240
         Width           =   2295
      End
   End
   Begin VB.Menu MakeID 
      Caption         =   "아이디생성"
      Index           =   1
   End
   Begin VB.Menu DelID 
      Caption         =   "아이디삭제"
      Index           =   2
   End
   Begin VB.Menu Updatedate 
      Caption         =   "Update"
      Index           =   3
   End
   Begin VB.Menu EpisodeTxt 
      Caption         =   "Episode"
      Index           =   4
   End
End
Attribute VB_Name = "login"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ed
Private Sub 내리기_Click()

If ep.Top >= -1320 Then
ep.Top = (ep.Top) - 160
ep.Height = (ep.Height) + 160
End If

End Sub

Private Sub 닫기_Click()

ep.Visible = False
sdfaaa.Width = 7080
login.Width = 7260
닫기.Visible = False

End Sub

Private Sub 반짝_Timer()
If episode.ToolTipText = "IEpisodeI" Then
episode.ForeColor = &HFFFF&
episode.ToolTipText = "lEpisodel"
ElseIf episode.ToolTipText = "lEpisodel" Then
episode.ForeColor = &H0&
episode.ToolTipText = "IEpisodeI"
End If
End Sub

Private Sub 올리기_Click()

If ep.Top < 120 Then

ep.Top = (ep.Top) + 160
ep.Height = (ep.Height) - 160

End If

End Sub

Private Sub Command1_Click()

If Command1.Caption = "확인" Then


Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3

Input #1, a1, a2
Input #2, b1, b2
Input #3, c1, c2

If Text1.Text = a1 And Text2.Text = a2 Then
ed = a1
ar.Caption = 1
fl.Top = 5000
공지.Top = 1320
캐릭정보.Top = 5000
Command1.Caption = "로그아웃"
Command2.Caption = "계정삭제"
ElseIf Text1.Text = b1 And Text2.Text = b2 Then
ed = b1
ar.Caption = 2
fl.Top = 5000
공지.Top = 1320
캐릭정보.Top = 5000
Command1.Caption = "로그아웃"
Command2.Caption = "계정삭제"
ElseIf Text1.Text = c1 And Text2.Text = c2 Then
ed = c1
ar.Caption = 3
fl.Top = 5000
공지.Top = 1320
캐릭정보.Top = 5000
Command1.Caption = "로그아웃"
Command2.Caption = "계정삭제"
Else

djee = MsgBox("아이디나 비밀번호가 맞지않습니다.", vbCritical, "오류02FESED55")

End If

Close #1, #2, #3

ElseIf Command1.Caption = "로그아웃" Then

fl.Top = 1320
공지.Top = 5000
캐릭정보.Top = 5000
Command1.Caption = "확인"
Command2.Caption = "계정만들기"

End If

End Sub

Private Sub Command2_Click()

If Command2.Caption = "계정만들기" Then

If Label4.Caption <> "3" Then

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Input #1, a
If a = "1" Then
Close #1
Open "C:\Program Files\DragonStriker\ip1.dll" For Output As #1
id = InputBox("아이디를 적으시오", "계정생성1단계")
If Len(id) >= 4 Then
pw = InputBox("비밀번호를 적으시오", "계정생성2단계")
If Len(pw) >= 4 Then
na = InputBox("이름를 적으시오", "계정생성3단계")
If Len(na) >= 2 Then
Print #1, id
Print #1, pw
Print #1, na
Label4.Caption = Label4.Caption + "1"
exe = MsgBox("완료되었습니다.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #1, "1"
Print #1, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #1, "1"
Print #1, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #1, "1"
Print #1, "1"
End If
Close #1, #2, #3

Else
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Input #2, a
If a = "1" Then
Close #2
Open "C:\Program Files\DragonStriker\ip2.dll" For Output As #2
id = InputBox("아이디를 적으시오", "계정생성1단계")
If Len(id) >= 4 Then
pw = InputBox("비밀번호를 적으시오", "계정생성2단계")
If Len(pw) >= 4 Then
na = InputBox("이름를 적으시오", "계정생성3단계")
If Len(na) >= 2 Then
Print #2, id
Print #2, pw
Print #2, na
Label4.Caption = Label4.Caption + 1
exe = MsgBox("완료되었습니다.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
Input #3, a
If a = "1" Then
Close #3
Open "C:\Program Files\DragonStriker\ip3.dll" For Output As #3
id = InputBox("아이디를 적으시오", "계정생성1단계")
If Len(id) >= 4 Then
pw = InputBox("비밀번호를 적으시오", "계정생성2단계")
If Len(pw) >= 4 Then
na = InputBox("이름를 적으시오", "계정생성3단계")
If Len(na) >= 2 Then
Print #3, id
Print #3, pw
Print #3, na
Label4.Caption = Label4.Caption + 1
exe = MsgBox("완료되었습니다.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
Close #1, #2, #3

End If
End If
Close #1, #2, #3
End If

Close #1, #2, #3
ElseIf Command2.Caption = "계정삭제" Then

ElseIf Label4.Caption = 3 Then

elo = MsgBox("아이디의갯수는 3개를 넘을수 없습니다", vbCritical, "아이디 3/3 오류 0022FF09")

End If

ElseIf Command2.Caption = "계정삭제" Then

If ar.Caption = 1 Then
rt = ed
ElseIf ar.Caption = 2 Then
rt = ed
ElseIf ar.Caption = 3 Then
rt = ed
End If

guswo = MsgBox("현재 이계정(" & ed & ")을(를) 삭제하시겠습니까?", vbYesNo, "계정삭제_ N/Y")

If guswo = 6 Then

If ar.Caption = 1 Then
Open "C:\Program Files\DragonStriker\ip1.dll" For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave1.dll" For Output As #1
Print #1, 1: Print #1, "초보자": Print #1, 0: Print #1, 50: Print #1, 50: Print #1, 25: Print #1, 25: Print #1, "알고리즘이 하빈이에게 미치는 영향을 분석한 곳": Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 5: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0: Print #1, 0

Close #1, #2, #3

Label4.Caption = Label4.Caption - 1
ElseIf ar.Caption = 2 Then
Open "C:\Program Files\DragonStriker\ip2.dll" For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave2.dll" For Output As #2
Print #2, 1: Print #2, "초보자": Print #2, 0: Print #2, 50: Print #2, 50: Print #2, 25: Print #2, 25: Print #2, "알고리즘이 하빈이에게 미치는 영향을 분석한 곳": Print #2, 5: Print #2, 5: Print #2, 5: Print #2, 5: Print #2, 0: Print #2, 0: Print #2, 0: Print #2, 0: Print #2, 0: Print #2, 0

Close #1, #2, #3

Label4.Caption = Label4.Caption - 1
ElseIf ar.Caption = 3 Then
Open "C:\Program Files\DragonStriker\ip3.dll" For Output As #1
Print #1, 1
Print #1, 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\root\Save\DsSave3.dll" For Output As #3
Print #3, 1: Print #3, "초보자": Print #3, 0: Print #3, 50: Print #3, 50: Print #3, 25: Print #3, 25: Print #3, "알고리즘이 하빈이에게 미치는 영향을 분석한 곳": Print #3, 5: Print #3, 5: Print #3, 5: Print #3, 5: Print #3, 0: Print #3, 0: Print #3, 0: Print #3, 0: Print #3, 0: Print #3, 0

Close #1, #2, #3
Label4.Caption = Label4.Caption - 1
End If
guswo = MsgBox("계정(" & ed & ")을(를) 삭제완료했습니다.", vbOKOnly, "계정삭제Y")
ElseIf guswo = 7 Then
guswo = MsgBox("계정(" & ed & ")을(를) 삭제취소했습니다.", vbOKOnly, "계정삭제N")
End If

End If

End Sub

Private Sub Command3_Click()
삭제.Visible = True
End Sub
Private Sub Command5_Click()
End
End Sub
Private Sub Command6_Click()
공지.Top = 1320
캐릭정보.Top = 5000
fl.Top = 5000
End Sub
Private Sub Command8_Click()
login.Visible = False
map.Visible = True
End Sub
Private Sub Command7_Click()
login.Visible = False
map.Visible = True

End Sub
Private Sub Command9_Click()
캐릭정보.Top = 1320
공지.Top = 5000
fl.Top = 5000
End Sub
Private Sub DelID_Click(Index As Integer)
삭제.Visible = True
End Sub
Private Sub episode_Click()

If ep.Visible = False Then

ep.Visible = True
sdfaaa.Width = 9000
login.Width = 9195
닫기.Visible = True
반짝.Interval = 0
episode.ForeColor = &H0&
ElseIf ep.Visible = True Then

ep.Visible = False
sdfaaa.Width = 7080
login.Width = 7260
닫기.Visible = False
반짝.Interval = 0
episode.ForeColor = &H0&
End If

End Sub
Private Sub EpisodeTxt_Click(Index As Integer)
If ep.Visible = False Then

ep.Visible = True
sdfaaa.Width = 9000
login.Width = 9195
닫기.Visible = True
반짝.Interval = 0
episode.ForeColor = &H0&
ElseIf ep.Visible = True Then

ep.Visible = False
sdfaaa.Width = 7080
login.Width = 7260
닫기.Visible = False
반짝.Interval = 0
episode.ForeColor = &H0&
End If
End Sub
Private Sub Form_Load()
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


Label4.Caption = crt

Close #1, #2, #3
End Sub

Private Sub Label5_Click()
diew = MsgBox("아직 정상적으로 실행되지 않습니다.", vbCritical, "오류FE231")
주소설정.Visible = True
End Sub
Private Sub lblCopyright_Click()
wi = MsgBox("[저작권 : jiun0623&heonsheen] [제작자 : heonsheen&jiun0623] [제작기간 : 08.12.05~09.5.05) ", vbOKCancel, "About Maker")
End Sub
Private Sub MakeID_Click(Index As Integer)

If Label4.Caption <> "3" Then

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Input #1, a
If a = "1" Then
Close #1
Open "C:\Program Files\DragonStriker\ip1.dll" For Output As #1
id = InputBox("아이디를 적으시오", "계정생성1단계")
If Len(id) >= 4 Then
pw = InputBox("비밀번호를 적으시오", "계정생성2단계")
If Len(pw) >= 4 Then
na = InputBox("이름를 적으시오", "계정생성3단계")
If Len(na) >= 2 Then
Print #1, id
Print #1, pw
Print #1, na
Label4.Caption = Label4.Caption + "1"
exe = MsgBox("완료되었습니다.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #1, "1"
Print #1, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #1, "1"
Print #1, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #1, "1"
Print #1, "1"
End If
Close #1, #2, #3

Else
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Input #2, a
If a = "1" Then
Close #2
Open "C:\Program Files\DragonStriker\ip2.dll" For Output As #2
id = InputBox("아이디를 적으시오", "계정생성1단계")
If Len(id) >= 4 Then
pw = InputBox("비밀번호를 적으시오", "계정생성2단계")
If Len(pw) >= 4 Then
na = InputBox("이름를 적으시오", "계정생성3단계")
If Len(na) >= 2 Then
Print #2, id
Print #2, pw
Print #2, na
Label4.Caption = Label4.Caption + 1
exe = MsgBox("완료되었습니다.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #2, "1"
Print #2, "1"
End If
Else
Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
Input #3, a
If a = "1" Then
Close #3
Open "C:\Program Files\DragonStriker\ip3.dll" For Output As #3
id = InputBox("아이디를 적으시오", "계정생성1단계")
If Len(id) >= 4 Then
pw = InputBox("비밀번호를 적으시오", "계정생성2단계")
If Len(pw) >= 4 Then
na = InputBox("이름를 적으시오", "계정생성3단계")
If Len(na) >= 2 Then
Print #3, id
Print #3, pw
Print #3, na
Label4.Caption = Label4.Caption + 1
exe = MsgBox("완료되었습니다.", vbOKOnly, "Story Of Dragon.dll_Line6")
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
exe = MsgBox("제대로입력하십시오", vbCritical, "오류코드00213FF")
Print #3, "1"
Print #3, "1"
End If
Else
Close #1, #2, #3

End If
End If
Close #1, #2, #3
End If

Close #1, #2, #3

End If

End Sub
Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 13 Then

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3

Input #1, a1, a2
Input #2, b1, b2
Input #3, c1, c2

If Text1.Text = a1 And Text2.Text = a2 Then
ed = a1
ar.Caption = 1
fl.Top = 5000
공지.Top = 1320
캐릭정보.Top = 5000
Command1.Caption = "로그아웃"
Command2.Caption = "계정삭제"
ElseIf Text1.Text = b1 And Text2.Text = b2 Then
ed = b1
ar.Caption = 2
fl.Top = 5000
공지.Top = 1320
캐릭정보.Top = 5000
Command1.Caption = "로그아웃"
Command2.Caption = "계정삭제"
ElseIf Text1.Text = c1 And Text2.Text = c2 Then
ed = c1
ar.Caption = 3
fl.Top = 5000
공지.Top = 1320
캐릭정보.Top = 5000
Command1.Caption = "로그아웃"
Command2.Caption = "계정삭제"
Else

djee = MsgBox("아이디나 비밀번호가 맞지않습니다.", vbCritical, "오류02FESED55")

End If

Close #1, #2, #3

End

End If

End Sub
Private Sub Text2_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 13 Then

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3

Input #1, a1, a2
Input #2, b1, b2
Input #3, c1, c2

If Text1.Text = a1 And Text2.Text = a2 Then
ed = a1
ar.Caption = 1
fl.Top = 5000
공지.Top = 1320
캐릭정보.Top = 5000
Command1.Caption = "로그아웃"
Command2.Caption = "계정삭제"
ElseIf Text1.Text = b1 And Text2.Text = b2 Then
ed = b1
ar.Caption = 2
fl.Top = 5000
공지.Top = 1320
캐릭정보.Top = 5000
Command1.Caption = "로그아웃"
Command2.Caption = "계정삭제"
ElseIf Text1.Text = c1 And Text2.Text = c2 Then
ed = c1
ar.Caption = 3
fl.Top = 5000
공지.Top = 1320
캐릭정보.Top = 5000
Command1.Caption = "로그아웃"
Command2.Caption = "계정삭제"
Else

djee = MsgBox("아이디나 비밀번호가 맞지않습니다.", vbCritical, "오류02FESED55")

End If

Close #1, #2, #3

End If

End Sub
Private Sub Updatedate_Click(Index As Integer)
diew = MsgBox("아직 정상적으로 실행되지 않습니다.", vbCritical, "오류FE231")
주소설정.Visible = True
End Sub
