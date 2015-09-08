VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.ocx"
Begin VB.Form fMain 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  '단일 고정
   Caption         =   "StarSeeker.α"
   ClientHeight    =   9000
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   12000
   FillColor       =   &H00808080&
   Icon            =   "fMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   600
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   800
   StartUpPosition =   2  '화면 가운데
   Tag             =   "StarSeeker.α  FPS:"
   Begin VB.PictureBox container 
      Appearance      =   0  '평면
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   3735
      Left            =   1320
      ScaleHeight     =   3705
      ScaleWidth      =   6105
      TabIndex        =   0
      Top             =   720
      Visible         =   0   'False
      Width           =   6135
      Begin VB.PictureBox PanelBox 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   2
         Left            =   2760
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   19
         Top             =   2880
         Width           =   1095
      End
      Begin VB.PictureBox ObjectBox 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   1
         Left            =   2400
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   18
         Top             =   240
         Width           =   1095
      End
      Begin VB.PictureBox PanelBox 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   1
         Left            =   2640
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   17
         Top             =   2760
         Width           =   1095
      End
      Begin VB.PictureBox PanelBox 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   0
         Left            =   2520
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   16
         Top             =   2640
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   12
         Left            =   4680
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   15
         Top             =   960
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   11
         Left            =   4560
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   14
         Top             =   840
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   10
         Left            =   4440
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   13
         Top             =   720
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   9
         Left            =   4320
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   12
         Top             =   600
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   8
         Left            =   4200
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   11
         Top             =   480
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   7
         Left            =   4080
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   10
         Top             =   360
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   6
         Left            =   3960
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   9
         Top             =   240
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   5
         Left            =   3840
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   8
         Top             =   120
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   4
         Left            =   600
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   7
         Top             =   600
         Width           =   1095
      End
      Begin VB.PictureBox ObjectBox 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   0
         Left            =   2280
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   6
         Top             =   120
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   3
         Left            =   480
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   5
         Top             =   480
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   2
         Left            =   360
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   4
         Top             =   360
         Width           =   1095
      End
      Begin VB.PictureBox MayBltBox 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Left            =   120
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   3
         Top             =   2880
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   1
         Left            =   240
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   2
         Top             =   240
         Width           =   1095
      End
      Begin VB.PictureBox LogoPic 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   735
         Index           =   0
         Left            =   120
         ScaleHeight     =   675
         ScaleWidth      =   1035
         TabIndex        =   1
         Top             =   120
         Width           =   1095
      End
   End
   Begin MSComctlLib.ImageList OList 
      Left            =   240
      Top             =   360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   50
      ImageHeight     =   50
      MaskColor       =   16777215
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":10860
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":15642
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList BList 
      Left            =   240
      Top             =   840
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   700
      ImageHeight     =   120
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   13
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":1911F
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":C177A
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":D1A74
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":E56AE
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":10108D
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":10374E
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":1088DC
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":10D81C
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":112AE2
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":117AE2
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":11CB08
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":121884
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":122282
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList PList 
      Left            =   240
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   63
      ImageHeight     =   63
      MaskColor       =   16777215
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":122B1D
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":123860
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":123C22
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "fMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
        If PageX = 4 Then
            PageX = 5
        End If
End Sub
Private Sub Form_Load()
    Me.Show
    basM.StartCheck
    basM.StartSetting
    basM.MainLoop
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
        For i = 0 To 3
            If Menu(i, 0) < x And x < Menu(i, 0) + 222 And Menu(i, 1) < y And y < Menu(i, 1) + 56 Then
                    Select Case i
                            Case 0
                                    PageX = 6
                            Case 1
                                    PageX = 7
                            Case 2
                                    Form_Unload (0)
                            Case 3
                                    PageX = 5
                            Case 4
                    End Select
            Else
            End If
        Next i
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
        For i = 0 To 2
            If Menu(i, 0) < x And x < Menu(i, 0) + 222 And Menu(i, 1) < y And y < Menu(i, 1) + 56 Then
                    Menu(i, 2) = 10
            Else
                    Menu(i, 2) = 0
            End If
        Next i
            If Menu(3, 0) < x And x < Menu(3, 0) + 65 And Menu(3, 1) < y And y < Menu(3, 1) + 53 Then
                    Menu(3, 2) = -10
            Else
                    Menu(3, 2) = 0
            End If
End Sub
Private Sub Form_Unload(Cancel As Integer)
    basM.SaveSettingSeeker
    End
End Sub
