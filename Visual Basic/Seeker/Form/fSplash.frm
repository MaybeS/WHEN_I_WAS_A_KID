VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form fSplash 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  '없음
   ClientHeight    =   3576
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9012
   Icon            =   "fSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "fSplash.frx":324A
   ScaleHeight     =   3576
   ScaleWidth      =   9012
   StartUpPosition =   2  '화면 가운데
   Begin VB.PictureBox Pic 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      BorderStyle     =   0  '없음
      Height          =   3435
      Index           =   0
      Left            =   10080
      ScaleHeight     =   3432
      ScaleWidth      =   9000
      TabIndex        =   2
      Top             =   480
      Width           =   9000
   End
   Begin VB.PictureBox Pic 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  '없음
      Height          =   3435
      Index           =   1
      Left            =   9480
      ScaleHeight     =   3432
      ScaleWidth      =   9000
      TabIndex        =   1
      Top             =   120
      Width           =   9000
   End
   Begin MSComctlLib.ImageList LogoList 
      Left            =   8040
      Top             =   2760
      _ExtentX        =   995
      _ExtentY        =   995
      BackColor       =   -2147483643
      ImageWidth      =   1800
      ImageHeight     =   1145
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fSplash.frx":339C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "fSplash.frx":407FE
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox BG 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  '없음
      ForeColor       =   &H80000008&
      Height          =   3440
      Left            =   0
      ScaleHeight     =   287
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   750
      TabIndex        =   0
      Top             =   0
      Width           =   9000
   End
End
Attribute VB_Name = "fSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function GetPixel Lib "gdi32.dll" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function ReleaseCapture Lib "user32.dll" () As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32.dll" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Declare Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Const WS_EX_LAYERED As Long = &H80000
Private Const GWL_EXSTYLE As Long = -20
Private Const LWA_COLORKEY As Long = &H1
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FormTrans
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Sub Form_Load()
    SetWindowLong hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) Or WS_EX_LAYERED
    SetLayeredWindowAttributes hwnd, vbWhite, 0, LWA_COLORKEY
    
    Pic(0).Picture = LogoList.ListImages(1).Picture
    Pic(1).Picture = LogoList.ListImages(2).Picture
    
Dim ExNum As Integer, ExAdd As Integer
ExNum = 0
ExAdd = 1
        fSplash.Show
    Do
            GTCValue = GetTickCount + 1
        Do
            DoEvents
        Loop Until GTCValue < GetTickCount
    
    
        BG.Cls
        BitBlt BG.hDC, 0, 0, 600, 229, Pic(1).hDC, 0, 0, SRCPAINT
        BitBlt BG.hDC, 0, 0, 600, 229, Pic(0).hDC, (Int(ExNum / 5) Mod 3) * 600, Int(Int(ExNum / 5) / 3) * 229, SRCAND
        ExNum = ExNum + ExAdd
            If ExNum = 70 Or ExNum = 0 Then
                ExAdd = -1 * ExAdd
            End If
            If ExAdd = -1 And ExNum = 1 Then
                fmain.Show
                Unload Me
                Exit Sub
            End If
    
    Loop

End Sub

