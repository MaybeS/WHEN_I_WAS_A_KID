VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form fMain 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  '단일 고정
   Caption         =   "StarSeeker.α"
   ClientHeight    =   9000
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   12000
   FillColor       =   &H00FFFFFF&
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
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":0000
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
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":4DE2
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":8EFED
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":90C4B
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":9B63A
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fMain.frx":B7019
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
    basM.LoadSetting
    basM.StartSetting
    basM.MainLoop
End Sub
Private Sub Form_Unload(Cancel As Integer)
    basM.SaveSettingSeeker
    End
End Sub
