VERSION 5.00
Begin VB.Form F_Sub 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  '없음
   ClientHeight    =   13890
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   19245
   ControlBox      =   0   'False
   FillStyle       =   0  '단색
   BeginProperty Font 
      Name            =   "맑은 고딕"
      Size            =   12
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   926
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   1283
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows 기본값
   Begin VB.PictureBox Container 
      Height          =   4215
      Left            =   8640
      ScaleHeight     =   277
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   333
      TabIndex        =   44
      Top             =   240
      Visible         =   0   'False
      Width           =   5055
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   22
         Left            =   4320
         Picture         =   "F_Sub.frx":0000
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   91
         Top             =   2760
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   22
         Left            =   4320
         Picture         =   "F_Sub.frx":045F
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   90
         Top             =   3360
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   21
         Left            =   3720
         Picture         =   "F_Sub.frx":0705
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   89
         Top             =   3360
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   20
         Left            =   3120
         Picture         =   "F_Sub.frx":09B7
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   88
         Top             =   3360
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   19
         Left            =   2520
         Picture         =   "F_Sub.frx":0B5A
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   87
         Top             =   3360
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   18
         Left            =   1920
         Picture         =   "F_Sub.frx":0E01
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   86
         Top             =   3360
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   17
         Left            =   1320
         Picture         =   "F_Sub.frx":10A4
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   85
         Top             =   3360
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   16
         Left            =   720
         Picture         =   "F_Sub.frx":1342
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   84
         Top             =   3360
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   15
         Left            =   120
         Picture         =   "F_Sub.frx":163A
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   83
         Top             =   3360
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   21
         Left            =   3720
         Picture         =   "F_Sub.frx":1ABA
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   82
         Top             =   2760
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   20
         Left            =   3120
         Picture         =   "F_Sub.frx":1F05
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   81
         Top             =   2760
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   19
         Left            =   2520
         Picture         =   "F_Sub.frx":21A8
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   80
         Top             =   2760
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   18
         Left            =   1920
         Picture         =   "F_Sub.frx":2616
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   79
         Tag             =   "UnLock"
         Top             =   2760
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   17
         Left            =   1320
         Picture         =   "F_Sub.frx":2A82
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   78
         Top             =   2760
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   16
         Left            =   720
         Picture         =   "F_Sub.frx":2EC0
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   77
         Top             =   2760
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   15
         Left            =   120
         Picture         =   "F_Sub.frx":33DD
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   76
         Top             =   2760
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   8
         Left            =   120
         Picture         =   "F_Sub.frx":3877
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   75
         Top             =   2040
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   9
         Left            =   720
         Picture         =   "F_Sub.frx":3B3A
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   74
         Top             =   2040
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   10
         Left            =   1320
         Picture         =   "F_Sub.frx":3CDD
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   73
         Top             =   2040
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   11
         Left            =   1920
         Picture         =   "F_Sub.frx":3FAC
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   72
         Top             =   2040
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   12
         Left            =   2520
         Picture         =   "F_Sub.frx":4285
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   71
         Top             =   2040
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   13
         Left            =   3120
         Picture         =   "F_Sub.frx":4519
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   70
         Top             =   2040
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   14
         Left            =   3720
         Picture         =   "F_Sub.frx":478A
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   69
         Top             =   2040
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   10
         Left            =   1320
         Picture         =   "F_Sub.frx":4A20
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   68
         Top             =   1440
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   11
         Left            =   1920
         Picture         =   "F_Sub.frx":4EA2
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   67
         Top             =   1440
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   12
         Left            =   2520
         Picture         =   "F_Sub.frx":5365
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   66
         Top             =   1440
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   14
         Left            =   3720
         Picture         =   "F_Sub.frx":57C4
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   65
         Tag             =   "UnLock"
         Top             =   1440
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   13
         Left            =   3120
         Picture         =   "F_Sub.frx":5AAE
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   64
         Top             =   1440
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   9
         Left            =   720
         Picture         =   "F_Sub.frx":5D27
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   63
         Top             =   1440
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   8
         Left            =   120
         Picture         =   "F_Sub.frx":6008
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   62
         Top             =   1440
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   7
         Left            =   4320
         Picture         =   "F_Sub.frx":64A8
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   61
         Top             =   120
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   7
         Left            =   4320
         Picture         =   "F_Sub.frx":674B
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   60
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   6
         Left            =   3720
         Picture         =   "F_Sub.frx":68EE
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   58
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   5
         Left            =   3120
         Picture         =   "F_Sub.frx":6A8D
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   57
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   4
         Left            =   2520
         Picture         =   "F_Sub.frx":6C2C
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   56
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   3
         Left            =   1920
         Picture         =   "F_Sub.frx":6E09
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   55
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   2
         Left            =   1320
         Picture         =   "F_Sub.frx":7080
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   54
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   1
         Left            =   720
         Picture         =   "F_Sub.frx":7236
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   53
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox IcoMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   0
         Left            =   120
         Picture         =   "F_Sub.frx":73E9
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   52
         Top             =   720
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   0
         Left            =   120
         Picture         =   "F_Sub.frx":759D
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   51
         Top             =   120
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   4
         Left            =   2520
         Picture         =   "F_Sub.frx":7A04
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   50
         Top             =   120
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   6
         Left            =   3720
         Picture         =   "F_Sub.frx":7EA9
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   49
         Top             =   120
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   5
         Left            =   3120
         Picture         =   "F_Sub.frx":815B
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   48
         Tag             =   "UnLock"
         Top             =   120
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   3
         Left            =   1920
         Picture         =   "F_Sub.frx":840D
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   47
         Top             =   120
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   2
         Left            =   1320
         Picture         =   "F_Sub.frx":869E
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   46
         Top             =   120
         Width           =   480
      End
      Begin VB.PictureBox Ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   480
         Index           =   1
         Left            =   720
         Picture         =   "F_Sub.frx":896D
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   45
         Top             =   120
         Width           =   480
      End
   End
   Begin VB.PictureBox TopBar 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   480
      Left            =   0
      ScaleHeight     =   30
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   263
      TabIndex        =   10
      Top             =   120
      Width           =   3975
      Begin ProjectCris.MayButton Button_Close 
         Height          =   375
         Left            =   3555
         TabIndex        =   11
         Top             =   45
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   661
         Caption         =   "X"
         Border          =   2
         BackColor       =   8421631
         BorderAngle     =   0
         Alpha           =   0
         Angle           =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "맑은 고딕"
            Size            =   12
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.PictureBox SubBox 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H80000008&
      Height          =   10695
      Index           =   2
      Left            =   0
      ScaleHeight     =   711
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   743
      TabIndex        =   5
      Top             =   2760
      Width           =   11175
      Begin VB.PictureBox SetBox 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H00C0FFFF&
         ForeColor       =   &H80000008&
         Height          =   6255
         Index           =   0
         Left            =   120
         ScaleHeight     =   415
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   287
         TabIndex        =   12
         Tag             =   "기본"
         Top             =   240
         Width           =   4335
         Begin ProjectCris.MayText Text_Pass 
            Height          =   390
            Left            =   1320
            TabIndex        =   36
            Top             =   1440
            Width           =   1935
            _ExtentX        =   3413
            _ExtentY        =   688
            PassWord        =   -1  'True
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "나눔고딕"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            MinSize         =   0
            MaxSize         =   0
            BorderAngle     =   5
         End
         Begin ProjectCris.iOption Option_Pass 
            Height          =   375
            Left            =   3360
            TabIndex        =   35
            Top             =   1470
            Width           =   915
            _ExtentX        =   1614
            _ExtentY        =   661
            iValue          =   0   'False
         End
         Begin VB.ComboBox Set_Lan 
            Height          =   435
            ItemData        =   "F_Sub.frx":8C2F
            Left            =   2760
            List            =   "F_Sub.frx":8C31
            Style           =   2  '드롭다운 목록
            TabIndex        =   26
            Top             =   240
            Width           =   1455
         End
         Begin ProjectCris.MayText Text_Name 
            Height          =   390
            Left            =   1320
            TabIndex        =   39
            Top             =   1080
            Visible         =   0   'False
            Width           =   1455
            _ExtentX        =   2566
            _ExtentY        =   688
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "맑은 고딕"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            MinSize         =   90
            MaxSize         =   90
            BorderAngle     =   5
         End
         Begin ProjectCris.iOption Option_Start 
            Height          =   375
            Left            =   3360
            TabIndex        =   41
            Top             =   2280
            Width           =   915
            _ExtentX        =   1614
            _ExtentY        =   661
            iValue          =   0   'False
         End
         Begin ProjectCris.iOption Option_Login 
            Height          =   375
            Left            =   3360
            TabIndex        =   43
            Top             =   2760
            Width           =   915
            _ExtentX        =   1614
            _ExtentY        =   661
            iValue          =   0   'False
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "자동 로그인"
            Height          =   315
            Index           =   5
            Left            =   240
            TabIndex        =   42
            Tag             =   "AutoLogin"
            Top             =   2760
            Width           =   1290
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "자동 시작"
            Height          =   315
            Index           =   4
            Left            =   240
            TabIndex        =   40
            Tag             =   "AutoStart"
            Top             =   2280
            Width           =   1050
         End
         Begin VB.Shape Shape_null 
            BackColor       =   &H00808080&
            BackStyle       =   1  '투명하지 않음
            BorderColor     =   &H00808080&
            Height          =   855
            Index           =   4
            Left            =   45
            Top             =   2280
            Width           =   135
         End
         Begin VB.Shape Shape_null 
            BackColor       =   &H00808080&
            BackStyle       =   1  '투명하지 않음
            BorderColor     =   &H00808080&
            Height          =   855
            Index           =   3
            Left            =   45
            Top             =   960
            Width           =   135
         End
         Begin VB.Shape Shape_null 
            BackColor       =   &H00808080&
            BackStyle       =   1  '투명하지 않음
            BorderColor     =   &H00808080&
            Height          =   375
            Index           =   2
            Left            =   45
            Top             =   240
            Width           =   135
         End
         Begin VB.Label Label_CrisVersion 
            Alignment       =   1  '오른쪽 맞춤
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "F0100X01F01000100"
            Height          =   315
            Index           =   4
            Left            =   1920
            TabIndex        =   38
            Top             =   4920
            Width           =   2280
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "크리스 버전"
            Height          =   315
            Index           =   3
            Left            =   120
            TabIndex        =   37
            Tag             =   "Cris+Version"
            Top             =   4920
            Width           =   1290
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "비밀번호"
            Height          =   315
            Index           =   2
            Left            =   240
            TabIndex        =   34
            Tag             =   "Password"
            Top             =   1440
            Width           =   960
         End
         Begin VB.Shape Shape_null 
            BackColor       =   &H009999FF&
            BackStyle       =   1  '투명하지 않음
            BorderColor     =   &H009999FF&
            Height          =   375
            Index           =   1
            Left            =   120
            Top             =   5800
            Width           =   135
         End
         Begin VB.Label Label_Version 
            Alignment       =   1  '오른쪽 맞춤
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "0.0.0 F000"
            BeginProperty Font 
               Name            =   "맑은 고딕"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   375
            Left            =   2985
            TabIndex        =   33
            Top             =   5760
            Width           =   1260
         End
         Begin VB.Label Nx_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "maytryark@gmail.com"
            BeginProperty Font 
               Name            =   "맑은 고딕"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   3
            Left            =   2280
            TabIndex        =   32
            Top             =   5520
            Width           =   1965
         End
         Begin VB.Line L_Line 
            Index           =   0
            X1              =   8
            X2              =   280
            Y1              =   384
            Y2              =   384
         End
         Begin VB.Label Nx_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "Project Cris"
            BeginProperty Font 
               Name            =   "맑은 고딕"
               Size            =   14.25
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   375
            Index           =   2
            Left            =   360
            TabIndex        =   31
            Top             =   5760
            Width           =   1530
         End
         Begin VB.Label Nx_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "Maybe Studio"
            ForeColor       =   &H00000000&
            Height          =   315
            Index           =   1
            Left            =   360
            TabIndex        =   30
            Top             =   5430
            Width           =   1560
         End
         Begin VB.Shape Shape_null 
            BackColor       =   &H00FF9900&
            BackStyle       =   1  '투명하지 않음
            BorderColor     =   &H00FF9900&
            Height          =   375
            Index           =   0
            Left            =   120
            Top             =   5360
            Width           =   135
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "으로 로그인 됨"
            BeginProperty Font 
               Name            =   "맑은 고딕"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   6
            Left            =   2880
            TabIndex        =   28
            Tag             =   "Text.6"
            Top             =   1080
            Width           =   1320
         End
         Begin VB.Label Label_UserName 
            Alignment       =   1  '오른쪽 맞춤
            BackStyle       =   0  '투명
            Caption         =   "사용자이름"
            BeginProperty Font 
               Name            =   "맑은 고딕"
               Size            =   12
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Left            =   960
            TabIndex        =   27
            Top             =   960
            Width           =   1800
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "언어"
            Height          =   315
            Index           =   0
            Left            =   240
            TabIndex        =   25
            Tag             =   "Language"
            Top             =   240
            Width           =   480
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "사용자"
            Height          =   315
            Index           =   1
            Left            =   240
            TabIndex        =   19
            Tag             =   "User"
            Top             =   960
            Width           =   720
         End
      End
      Begin VB.PictureBox SetBox 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFC0FF&
         ForeColor       =   &H80000008&
         Height          =   6255
         Index           =   6
         Left            =   13440
         ScaleHeight     =   415
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   287
         TabIndex        =   18
         Top             =   6600
         Width           =   4335
      End
      Begin VB.PictureBox SetBox 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   6255
         Index           =   5
         Left            =   9000
         ScaleHeight     =   415
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   287
         TabIndex        =   17
         Top             =   6600
         Width           =   4335
      End
      Begin VB.PictureBox SetBox 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFC0&
         ForeColor       =   &H80000008&
         Height          =   6255
         Index           =   4
         Left            =   4560
         ScaleHeight     =   415
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   287
         TabIndex        =   16
         Top             =   6600
         Width           =   4335
      End
      Begin VB.PictureBox SetBox 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H00C0C0FF&
         ForeColor       =   &H80000008&
         Height          =   6255
         Index           =   3
         Left            =   120
         ScaleHeight     =   415
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   287
         TabIndex        =   15
         Top             =   6600
         Width           =   4335
      End
      Begin VB.PictureBox SetBox 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H00C0FFC0&
         ForeColor       =   &H80000008&
         Height          =   6255
         Index           =   2
         Left            =   9000
         ScaleHeight     =   415
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   287
         TabIndex        =   14
         Top             =   240
         Width           =   4335
      End
      Begin VB.PictureBox SetBox 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H00C0E0FF&
         ForeColor       =   &H80000008&
         Height          =   6255
         Index           =   1
         Left            =   4560
         ScaleHeight     =   415
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   287
         TabIndex        =   13
         Tag             =   "그래픽"
         Top             =   240
         Width           =   4335
         Begin VB.HScrollBar HScroll1 
            Height          =   375
            LargeChange     =   3
            Left            =   1320
            Max             =   15
            Min             =   3
            TabIndex        =   93
            Top             =   3240
            Value           =   7
            Width           =   2895
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "메뉴"
            Height          =   315
            Index           =   13
            Left            =   120
            TabIndex        =   24
            Tag             =   "Menu"
            Top             =   2520
            Width           =   480
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "효과 속도"
            Height          =   315
            Index           =   14
            Left            =   120
            TabIndex        =   23
            Tag             =   "Effect+Speed"
            Top             =   3240
            Width           =   1050
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "UI 전환 방식"
            Height          =   315
            Index           =   12
            Left            =   120
            TabIndex        =   22
            Tag             =   """UI+Effect"
            Top             =   1680
            Width           =   1365
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "UI 모양"
            Height          =   315
            Index           =   11
            Left            =   120
            TabIndex        =   21
            Tag             =   """UI+Shape"
            Top             =   840
            Width           =   795
         End
         Begin VB.Label N_Label 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   "UI 크기"
            Height          =   315
            Index           =   10
            Left            =   120
            TabIndex        =   20
            Tag             =   """UI+Size"
            Top             =   240
            Width           =   795
         End
      End
   End
   Begin VB.PictureBox SubBox 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      BackColor       =   &H00C0E0FF&
      ForeColor       =   &H80000008&
      Height          =   5895
      Index           =   0
      Left            =   0
      ScaleHeight     =   391
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   253
      TabIndex        =   0
      Top             =   720
      Width           =   3825
      Begin VB.PictureBox Chat_Box 
         Appearance      =   0  '평면
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  '없음
         ForeColor       =   &H80000008&
         Height          =   525
         Left            =   0
         ScaleHeight     =   525
         ScaleWidth      =   3945
         TabIndex        =   1
         Top             =   5355
         Width           =   3945
         Begin VB.TextBox UserText 
            Appearance      =   0  '평면
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   405
            Left            =   480
            TabIndex        =   2
            Top             =   60
            Width           =   3240
         End
         Begin VB.Label AddL 
            Alignment       =   2  '가운데 맞춤
            Appearance      =   0  '평면
            BackColor       =   &H80000005&
            BackStyle       =   0  '투명
            BorderStyle     =   1  '단일 고정
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "나눔고딕 ExtraBold"
               Size            =   15.75
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   405
            Left            =   75
            TabIndex        =   3
            Top             =   60
            Width           =   375
         End
      End
   End
   Begin VB.PictureBox SubBox 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   5895
      Index           =   6
      Left            =   10080
      ScaleHeight     =   391
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   263
      TabIndex        =   9
      Top             =   7800
      Width           =   3975
   End
   Begin VB.PictureBox SubBox 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   5895
      Index           =   5
      Left            =   6000
      ScaleHeight     =   391
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   263
      TabIndex        =   8
      Top             =   7800
      Width           =   3975
   End
   Begin VB.PictureBox SubBox 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   5895
      Index           =   4
      Left            =   1920
      ScaleHeight     =   391
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   263
      TabIndex        =   7
      Top             =   7800
      Width           =   3975
   End
   Begin VB.PictureBox SubBox 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFC0C0&
      FillColor       =   &H00FFFFFF&
      ForeColor       =   &H80000008&
      Height          =   7335
      Index           =   3
      Left            =   13920
      ScaleHeight     =   487
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   327
      TabIndex        =   6
      Top             =   240
      Width           =   4935
      Begin VB.TextBox Text_Title 
         Height          =   435
         Left            =   480
         TabIndex        =   92
         Text            =   "빈 메모"
         Top             =   1650
         Width           =   2055
      End
      Begin VB.ListBox List_Memo 
         Height          =   5100
         Left            =   240
         TabIndex        =   59
         Top             =   2160
         Width           =   2250
      End
      Begin VB.TextBox Text_Memo 
         Height          =   6585
         Left            =   90
         MultiLine       =   -1  'True
         ScrollBars      =   2  '수직
         TabIndex        =   29
         Top             =   675
         Width           =   4755
      End
      Begin VB.Shape Shape_null 
         BackColor       =   &H00C0FFC0&
         BackStyle       =   1  '투명하지 않음
         BorderColor     =   &H00C0FFC0&
         Height          =   435
         Index           =   5
         Left            =   240
         Top             =   1650
         Width           =   135
      End
   End
   Begin VB.PictureBox SubBox 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H80000008&
      Height          =   5895
      Index           =   1
      Left            =   4440
      ScaleHeight     =   391
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   263
      TabIndex        =   4
      Top             =   240
      Width           =   3975
   End
End
Attribute VB_Name = "F_Sub"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Button_Close_Click()

If CrisState.SubShow Then

    Cris_HexRgn
    CrisState.Show = False
    CrisState.FrameCnt = 15
    CrisState.SubShow = False
    CrisState.SubFrameCnt = 15
    
End If

End Sub
Private Sub Form_Load()

    For i = 0 To 6
        SubBox_Resize (i)
    Next i
    
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)

    If x < 50 Then
    
        Cris_HexRgn
        CrisState.Show = True
        CrisState.FrameCnt = 15
        CrisState.SubShow = False
        CrisState.SubFrameCnt = 15
        
    End If
    
End Sub

Private Sub HScroll1_Change()
    CrisState.UI_Speed = HScroll1.value
End Sub

Private Sub Label_UserName_DblClick()
    
If Not Text_Name.Visible Then
    
    Text_Name.Top = Label_UserName.Top
    Text_Name.Text = Label_UserName.Caption
    Text_Name.Visible = True

End If

End Sub
Private Sub Label_Version_Click()
    'mastering
End Sub
Private Sub List_Memo_Click()
    
    Text_Title.Text = List_Memo.List(List_Memo.ListIndex)

End Sub
Private Sub Option_Pass_ValueChange()
    Text_Pass.Enabled = Option_Pass.iValue
End Sub
Private Sub Set_Lan_Click()

If F_Sub.Visible And Set_Lan.ListIndex <> NowLan Then
    
    SetWindowPos F_Sub.hWnd, -1, 0, 0, 0, 0, 1
    
    NowLan = Set_Lan.ListIndex
    MsgBox "재설정을 위해 크리스를 다시시작합니다.", vbInformation + vbOKOnly, "Cris"
    SetCris
    
End If

End Sub
Private Sub SubBox_GotFocus(Index As Integer)

Select Case Index
    Case 0
        If Not HookX Then
        
            Hook F_Sub.SubBox(0).hWnd
            HookX = True
            
        End If
    Case 1
    
    Case 2
    
    Case 3
        
    Case 4
    
    Case 5
    
    Case 6

End Select

End Sub
Private Sub SubBox_LostFocus(Index As Integer)

Select Case Index
    Case 0

        If HookX Then
        
            UnHook
            HookX = False
            
        End If
        
    Case 1
    
    Case 2
    
    Case 3
    
    Case 4
    
    Case 5
    
    Case 6

End Select

End Sub
Private Sub SubBox_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, Y As Single)
Dim i As Integer, j As Integer
    
Select Case Index
    Case 0
    
    Case 1
    
    Case 2
    
        If x > 10 And x < 42 Then
        
            For i = 0 To 6
            
                If Y > 70 + 35 * i And Y < 100 + 35 * i Then
                    
                    MSet = NSet
                    NSet = i
                    CrisSet.Setting.Move = True
                    
                        For j = 0 To 6
                        
                            F_Sub.SetBox(j).Top = -F_Sub.ScaleHeight
                        
                        Next j
                    
                        F_Sub.SetBox(MSet).Top = 35
                        
                    If NSet > MSet Then
                    
                        F_Sub.SetBox(NSet).Top = F_Sub.SetBox(0).Height
                        CrisSet.Setting.N_Long = -F_Sub.SetBox(0).Height - 55
                        
                    ElseIf NSet < MSet Then
                    
                        F_Sub.SetBox(NSet).Top = -F_Sub.SetBox(0).Height
                        CrisSet.Setting.N_Long = F_Sub.SetBox(0).Height + 65
                    
                    Else
                        
                        
                        
                    End If
                    
                    Exit Sub
                    
                End If
            
            Next i
        
        End If
        
    
    Case 3
    
        If CurA.Y > (F_Sub.Top / Screen.TwipsPerPixelY) + F_Sub.Text_Memo.Top - 60 And CurA.Y < (F_Sub.Top / Screen.TwipsPerPixelY) + F_Sub.Text_Memo.Top Then
        
            For i = 0 To 5
                
                If CurA.x - (F_Sub.Left / Screen.TwipsPerPixelX) - F_Sub.SubBox(3).Left > 17 + 50 * i And CurA.x - (F_Sub.Left / Screen.TwipsPerPixelX) - F_Sub.SubBox(3).Left < 23 + 50 * i + 32 Then
                    
                    Select Case i
                        Case 0
                            
                        Case 1
                            
                        Case 2
                            
                        Case 3
                            
                        Case 4
                            
                        Case 5
                        
                            If Ico(5).Tag = "Lock" Then
                            
                                Ico(5).Picture = Ico(6).Picture
                                IcoMask(5).Picture = IcoMask(6).Picture
                                Ico(5).Tag = "UnLock"
                                
                            Else
                            
                                Ico(5).Picture = Ico(7).Picture
                                IcoMask(5).Picture = IcoMask(7).Picture
                                Ico(5).Tag = "Lock"
                                
                            End If
                            
                            CrisSubBoxBlt
                                
                    End Select
                
                    Exit For
                                        
                End If
            
            Next i
        
        End If
        
    Case 4
    
    Case 5
    
    Case 6

End Select

End Sub
Private Sub SubBox_Resize(Index As Integer)
On Error Resume Next

    F_Sub.Chat_Box.Top = F_Sub.SubBox(0).Height - F_Sub.Chat_Box.Height
    F_Sub.Chat_Box.Width = F_Sub.SubBox(0).Width - F_Sub.Chat_Box.Left
            
    Select Case Index
        Case 0
        
        
        Case 1
        
            
        
        Case 2
        
            
            
        Case 3
        
            
            
        Case 4
        
            
            
        Case 5
            
            
            
        Case 6
    
            
            
    End Select
    
End Sub
Private Sub Text_Name_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 13 Then
    
        Label_UserName.Caption = Text_Name.Text
        Text_Name.Visible = False
    
    End If

End Sub
Private Sub TopBar_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
GetCursorPos CurC
    CrisSubTopBlt

End Sub
Private Sub TopBar_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)

    If Button = 1 Then
        ReleaseCapture
        SendMessage hWnd, &HA1, 2, ByVal 0&
            GetCursorPos CurB
                CurX.x = CurX.x - (CurC.x - CurB.x)
                CurX.Y = CurX.Y - (CurC.Y - CurB.Y)
    End If
        '해당폼을 드래그로 움직일 수 있게합니다.
End Sub
Private Sub UserText_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And LenB(Trim(UserText.Text)) > 0 Then
        MessageTalk ChatLY, UserText.Text, True
        CrisAI_Input UserText.Text
        UserText.Text = ""
    End If
End Sub
