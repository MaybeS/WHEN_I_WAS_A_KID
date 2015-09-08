VERSION 5.00
Begin VB.Form Noti 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  '없음
   ClientHeight    =   7125
   ClientLeft      =   300
   ClientTop       =   -1365
   ClientWidth     =   10770
   ControlBox      =   0   'False
   ForeColor       =   &H00FFC0FF&
   Icon            =   "Noti.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   475
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   718
   ShowInTaskbar   =   0   'False
   Begin VB.Timer TimerX 
      Interval        =   5
      Left            =   0
      Top             =   0
   End
   Begin VB.PictureBox Contanier 
      Appearance      =   0  '평면
      BackColor       =   &H80000005&
      ForeColor       =   &H00FFFFFF&
      Height          =   6255
      Left            =   240
      ScaleHeight     =   415
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   639
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   9615
      Begin VB.FileListBox InputF 
         Height          =   450
         Hidden          =   -1  'True
         Left            =   4680
         TabIndex        =   22
         Top             =   2880
         Width           =   375
      End
      Begin VB.PictureBox BG2 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BorderStyle     =   0  '없음
         Height          =   8100
         Left            =   6360
         Picture         =   "Noti.frx":850E
         ScaleHeight     =   8100
         ScaleWidth      =   24000
         TabIndex        =   20
         Top             =   3960
         Width           =   24000
      End
      Begin VB.PictureBox iConP 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   330
         Left            =   240
         Picture         =   "Noti.frx":1B60D
         ScaleHeight     =   300
         ScaleWidth      =   1200
         TabIndex        =   19
         Top             =   360
         Width           =   1230
      End
      Begin VB.PictureBox iConL 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   1950
         Left            =   5640
         Picture         =   "Noti.frx":1BAF9
         ScaleHeight     =   1920
         ScaleWidth      =   3840
         TabIndex        =   18
         Top             =   120
         Width           =   3870
      End
      Begin VB.PictureBox Note_Left 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   7530
         Left            =   240
         Picture         =   "Noti.frx":1D3EE
         ScaleHeight     =   7500
         ScaleWidth      =   450
         TabIndex        =   17
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox Note_Center 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   7530
         Left            =   720
         Picture         =   "Noti.frx":24A3E
         ScaleHeight     =   7500
         ScaleWidth      =   450
         TabIndex        =   16
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox Note_Right 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   7530
         Left            =   1200
         Picture         =   "Noti.frx":2AA49
         ScaleHeight     =   7500
         ScaleWidth      =   450
         TabIndex        =   15
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox Note_White 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   7530
         Left            =   1680
         Picture         =   "Noti.frx":3162E
         ScaleHeight     =   7500
         ScaleWidth      =   450
         TabIndex        =   14
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox NoteRay 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   6405
         Left            =   3000
         Picture         =   "Noti.frx":319AD
         ScaleHeight     =   425
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   165
         TabIndex        =   13
         Top             =   5400
         Width           =   2505
      End
      Begin VB.PictureBox NoteBack 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   6405
         Left            =   3600
         Picture         =   "Noti.frx":36587
         ScaleHeight     =   6375
         ScaleWidth      =   2475
         TabIndex        =   12
         Top             =   5400
         Width           =   2505
      End
      Begin VB.PictureBox iConN 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   480
         Left            =   2160
         Picture         =   "Noti.frx":39166
         ScaleHeight     =   450
         ScaleWidth      =   1800
         TabIndex        =   11
         Top             =   720
         Width           =   1830
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   165
         Index           =   0
         Left            =   2880
         Picture         =   "Noti.frx":39591
         ScaleHeight     =   135
         ScaleWidth      =   300
         TabIndex        =   10
         Top             =   1800
         Width           =   330
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   165
         Index           =   1
         Left            =   3240
         Picture         =   "Noti.frx":3DB4F
         ScaleHeight     =   135
         ScaleWidth      =   30
         TabIndex        =   9
         Top             =   1920
         Width           =   60
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   165
         Index           =   2
         Left            =   2760
         Picture         =   "Noti.frx":41FEC
         ScaleHeight     =   135
         ScaleWidth      =   360
         TabIndex        =   8
         Top             =   2040
         Width           =   390
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   45
         Index           =   3
         Left            =   3240
         Picture         =   "Noti.frx":465D7
         ScaleHeight     =   15
         ScaleWidth      =   360
         TabIndex        =   7
         Top             =   2160
         Width           =   390
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   4
         Left            =   2760
         Picture         =   "Noti.frx":4AAC4
         ScaleHeight     =   180
         ScaleWidth      =   360
         TabIndex        =   6
         Top             =   2280
         Width           =   390
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   5
         Left            =   3240
         Picture         =   "Noti.frx":4F15F
         ScaleHeight     =   165
         ScaleWidth      =   360
         TabIndex        =   5
         Top             =   2400
         Width           =   390
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   6
         Left            =   3000
         Picture         =   "Noti.frx":5378C
         ScaleHeight     =   165
         ScaleWidth      =   30
         TabIndex        =   4
         Top             =   2520
         Width           =   60
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   7
         Left            =   3240
         Picture         =   "Noti.frx":57C35
         ScaleHeight     =   165
         ScaleWidth      =   300
         TabIndex        =   3
         Top             =   2640
         Width           =   330
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   45
         Index           =   8
         Left            =   2760
         Picture         =   "Noti.frx":5C21C
         ScaleHeight     =   15
         ScaleWidth      =   300
         TabIndex        =   2
         Top             =   2760
         Width           =   330
      End
      Begin VB.PictureBox BubI 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   180
         Index           =   9
         Left            =   3000
         Picture         =   "Noti.frx":606DF
         ScaleHeight     =   150
         ScaleWidth      =   300
         TabIndex        =   1
         Top             =   2880
         Width           =   330
      End
      Begin VB.Label Vtext 
         AutoSize        =   -1  'True
         BackStyle       =   0  '투명
         BorderStyle     =   1  '단일 고정
         BeginProperty Font 
            Name            =   "나눔고딕"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1560
         TabIndex        =   21
         Tag             =   "이는 텍스트의 크기를 구하기위한 임의의 컨트롤입니다."
         Top             =   360
         Visible         =   0   'False
         Width           =   120
      End
   End
End
Attribute VB_Name = "Noti"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Form_Load()
If App.PrevInstance Then MsgBox "이미 Cris가 실행되고 있습니다.", vbCritical + vbOKOnly, "Cris": End
    StartSet
    NotifiBlt
End Sub
Public Sub EXIT_()
Dim Res As Integer
                TimerX.Interval = 0
                Res = MsgBox("정말로 종료하시겠습니까?", vbYesNo + vbQuestion, "Cris")
                TimerX.Interval = 5
                If Res = 6 Then End
End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
        If KeyCode = 27 Then
            EXIT_
        End If
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If X > ScreenHeight - 27 Then
        Fset.Visible = True
        Fset.SetForm
        Fset.SetFocus
        Fset.ZOrder 0
    ElseIf X < 33 Then
            
    ElseIf X < 60 Then
        fTalk.Visible = True
        fTalk.SetFocus
        fTalk.ZOrder 0
    Else
        If Not Notifi.Visible Then M_State = True
        If Notifi.Visible Then N_State = True
    End If
End Sub
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
        M_State = False
End Sub
Private Sub TimerX_Timer()
        ShowEffect
        
        If Noti.Height > 1 Then RandomColor
        If Noti.Height > 1 Then MainBlt
        If Notifi.Visible Then RayBlt

            If TboxKeyUp Then
            If GetTickCount > TboxKeyUp + 3000 Then
                Select Case T_State
                    Case 0
                    Case 1
                    Case 2
                    Case 3
                        MemoX(IndexMatch).Title = Notifi.TTitle.Text
                        MemoX(IndexMatch).Text = Notifi.Tbox.Text
                        MemoX(IndexMatch).Date = Format(Now, "YYYY/MM/DD-HH/NN")
                        Fbas.SaveMemo
                End Select
                    RayBlt
                    TboxKeyUp = 0
            End If
            End If

        If Fset.Visible Then Fset.SetForm
        If fTalk.Visible Then
            Messageblt
                If Not HookX Then
                    Hook fTalk.hwnd
                    HookX = True
                End If
                    If ChatLY > 830 Then
                        If ChatY < 380 Then ChatY = ChatY + (380 - ChatY) / 10 + 1
                    End If
                    If ChatLY - 460 < ChatY Then ChatY = ChatY - ((ChatY - ChatLY + 460) / 10) - 1
            If ChatYYDelay = 15 Then
                If ChatYY > 0 Then ChatYY = ChatYY - 1 - (ChatYY / 10)
                If ChatYY < 0 Then ChatYY = ChatYY + 1 - (ChatYY / 10)
                    ChatYYDelay = 0
            Else
                    ChatYYDelay = ChatYYDelay + 1
            End If
        Else
                If HookX Then
                    UnHook
                    HookX = False
                End If
        End If
                
End Sub
