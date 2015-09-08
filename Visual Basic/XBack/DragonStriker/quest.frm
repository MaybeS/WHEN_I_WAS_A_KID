VERSION 5.00
Begin VB.Form quest 
   BorderStyle     =   4  '고정 도구 창
   Caption         =   "Quest"
   ClientHeight    =   5235
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5250
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5235
   ScaleWidth      =   5250
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows 기본값
   Begin VB.Frame tfa 
      Caption         =   "세부정보"
      BeginProperty Font 
         Name            =   "나눔고딕 Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3375
      Left            =   120
      TabIndex        =   3
      Top             =   1800
      Width           =   5055
      Begin VB.Timer questtimer 
         Interval        =   1
         Left            =   4560
         Top             =   600
      End
      Begin VB.Timer listtimer 
         Interval        =   1
         Left            =   4560
         Top             =   240
      End
      Begin VB.Label qt 
         BorderStyle     =   1  '단일 고정
         Height          =   735
         Left            =   120
         TabIndex        =   6
         Top             =   2520
         Width           =   4815
      End
      Begin VB.Label las 
         BorderStyle     =   1  '단일 고정
         Height          =   2175
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   4815
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1695
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   5055
      Begin VB.ListBox questlist 
         Height          =   1320
         ItemData        =   "quest.frx":0000
         Left            =   120
         List            =   "quest.frx":001C
         TabIndex        =   1
         Top             =   240
         Width           =   2775
      End
      Begin VB.Label lat 
         BorderStyle     =   1  '단일 고정
         Caption         =   "기본정보"
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
         TabIndex        =   4
         Top             =   240
         Width           =   1935
      End
      Begin VB.Label la 
         BorderStyle     =   1  '단일 고정
         BeginProperty Font 
            Name            =   "나눔고딕 Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   3000
         TabIndex        =   2
         Top             =   600
         Width           =   1935
      End
   End
End
Attribute VB_Name = "quest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim qi, que, qus, sst
Private Sub Form_Load()
sst = que
End Sub
Private Sub listtimer_Timer()

gw = map.quest1.Caption
For i = 1 To Len(gw)
  If Mid(gw, i, 1) = ":" Then
  que = Mid(gw, 1, i - 1)
  qus = Mid(gw, i + 1)
  End If
Next i

End Sub

Private Sub questlist_Click()
qi = questlist.ListIndex

If qi = 0 Then
  If que = 0 Then
    la.Caption = "레벨제한 : 1             조건 : Lv1이상            연계 쾌스트 :있음"
    las.Caption = "전직교관을 찾아가 보자"
    qt.Caption = "[Tip] 전직교관은 초급나무수련장1 에있다."
  ElseIf que = 2 Then
    la.Caption = "레벨제한 : 1             조건 : Lv1이상            연계 쾌스트 :있음"
    las.Caption = "수련인형1을 5 마리잡기                " & (5 - qus) & "마리 남음"
    qt.Caption = "[Tip]크리티컬 펀치를 찍으면 쉽다"
  ElseIf que = 2 And qus >= 5 Then
    la.Caption = "레벨제한 : 1             조건 : Lv1이상            연계 쾌스트 :있음"
    las.Caption = "전직교관의 수련 1을 끝냈다 전직교관을 찾아가 보자"
    qt.Caption = "[Tip] 전직교관은 초급나무수련장1 에있다."
  ElseIf que = 4 Then
    la.Caption = "레벨제한 : 1             조건 : Lv1이상            연계 쾌스트 :있음"
    las.Caption = "수련인형2을 7 마리잡기                " & (7 - qus) & "마리 남음"
    qt.Caption = "[Tip]수련인형2도 움직이지 않으므로 노가다를 띄면 쉽다,"
  ElseIf que = 4 And qus >= 7 Then
    la.Caption = "레벨제한 : 1             조건 : Lv1이상            연계 쾌스트 :있음"
    las.Caption = "전직교관의 수련 2을 끝냈다 전직교관을 찾아가 보자"
    qt.Caption = "[Tip] 전직교관은 초급나무수련장1 에있다."
  ElseIf que = 6 Then
    la.Caption = "레벨제한 : 1             조건 : Lv1이상            연계 쾌스트 :있음"
    las.Caption = "수련인형3을 5 마리잡기                " & (5 - qus) & "마리 남음"
    qt.Caption = "[Tip] 전직교관은 초급나무수련장1 에있다."
  ElseIf que = 6 And qus >= 5 Then
    la.Caption = "레벨제한 : 1             조건 : Lv1이상            연계 쾌스트 :있음"
    las.Caption = "전직교관의 수련 3을 끝냈다 전직교관을 찾아가 보자"
    qt.Caption = "[Tip] 전직교관은 초급나무수련장1 에있다."
  ElseIf que = 8 Then
    la.Caption = "레벨제한 : 1             조건 : Lv1이상            연계 쾌스트 :있음"
    las.Caption = "땅강아지를 10마리 잡기                " & (10 - qus) & "마리 남음"
    qt.Caption = "[Tip] 전직교관은 초급나무수련장1 에있다."
  ElseIf que = 8 And qus >= 10 Then
    la.Caption = "레벨제한 : 1             조건 : Lv1이상            연계 쾌스트 :있음"
    las.Caption = "전직교관의 수련 4을 끝냈다 전직교관을 찾아가 보자"
    qt.Caption = "[Tip] 전직교관은 초급나무수련장1 에있다."
  ElseIf que > 8 Then
    la.Caption = "레벨제한 : 30            조건 : Lv30이상           연계 쾌스트 :있음"
    las.Caption = "전직교관을 찾아가 보자 아주 힘든 수련이 기다리고있다."
    qt.Caption = "[Tip] 전직교관은 초급나무수련장1 에있다."
  End If
ElseIf qi = 1 Then
    la.Caption = "레벨제한 : 10            조건 : Lv10이상           연계 쾌스트 :없음"
    las.Caption = "10이 되면 알아서 전직교관이 와준다. 10만 되자 [Lv" & (10 - Val(map.lv.Caption)) & "남음]"
    qt.Caption = "[Tip] 전직교관의 수련을 하면 더욱 빨리 레벨업을 하실수 있습니다."
ElseIf qi = 2 Then
    la.Caption = "준비중"
    las.Caption = "준비중"
    qt.Caption = "준비중"
ElseIf qi = 3 Then
    la.Caption = "준비중"
    las.Caption = "준비중"
    qt.Caption = "준비중"
ElseIf qi = 4 Then
    la.Caption = "준비중"
    las.Caption = "준비중"
    qt.Caption = "준비중"
ElseIf qi = 5 Then
    la.Caption = "준비중"
    las.Caption = "준비중"
    qt.Caption = "준비중"
ElseIf qi = 6 Then
    la.Caption = "준비중"
    las.Caption = "준비중"
    qt.Caption = "준비중"
ElseIf qi = 7 Then
    la.Caption = "준비중"
    las.Caption = "준비중"
    qt.Caption = "준비중"
End If

End Sub
Private Sub questtimer_Timer()

If sst <> que Then

If que = 2 Then
questlist.List(0) = "전직교관의 수련1"
ElseIf que = 2 And qus >= 5 Then
questlist.List(0) = "전직교관의 수련1의 끝"
ElseIf que = 4 Then
questlist.List(0) = "전직교관의 수련2"
ElseIf que = 4 And qus >= 7 Then
questlist.List(0) = "전직교관의 수련2의 끝"
ElseIf que = 6 Then
questlist.List(0) = "전직교관의 수련3"
ElseIf que = 6 And qus >= 5 Then
questlist.List(0) = "전직교관의 수련3의 끝"
ElseIf que = 8 Then
questlist.List(0) = "전직교관의 수련4"
ElseIf que = 8 And qus >= 10 Then
questlist.List(0) = "전직교관의 수련4의 끝"
ElseIf que > 8 Then
End If

sst = que

End If

End Sub
