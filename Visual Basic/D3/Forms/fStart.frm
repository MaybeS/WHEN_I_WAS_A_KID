VERSION 5.00
Begin VB.Form fStart 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  '´ÜÀÏ °íÁ¤
   ClientHeight    =   1500
   ClientLeft      =   12
   ClientTop       =   12
   ClientWidth     =   3348
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1500
   ScaleWidth      =   3348
   StartUpPosition =   2  'È­¸é °¡¿îµ¥
   Begin VB.Label lab 
      BackStyle       =   0  'Åõ¸í
      Caption         =   "D3_Editor"
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   19.8
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   612
      Index           =   2
      Left            =   1320
      TabIndex        =   3
      Top             =   480
      Width           =   1812
   End
   Begin VB.Label lab 
      BackStyle       =   0  'Åõ¸í
      Caption         =   "MaybeStudio"
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   19.8
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   612
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   2532
   End
   Begin VB.Label LS 
      Alignment       =   2  '°¡¿îµ¥ ¸ÂÃã
      BackStyle       =   0  'Åõ¸í
      Caption         =   "»ç¿ëÀÚ"
      BeginProperty Font 
         Name            =   "³ª´®¼Õ±Û¾¾ º×"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   360
      TabIndex        =   0
      Top             =   1080
      Width           =   2172
   End
   Begin VB.Label lab 
      BackStyle       =   0  'Åõ¸í
      Caption         =   "MaybeStudio"
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   19.8
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   612
      Index           =   1
      Left            =   156
      TabIndex        =   2
      Top             =   36
      Width           =   2532
   End
   Begin VB.Label lab 
      BackStyle       =   0  'Åõ¸í
      Caption         =   "D3_Editor"
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   19.8
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   612
      Index           =   3
      Left            =   1356
      TabIndex        =   4
      Top             =   516
      Width           =   1896
   End
   Begin VB.Menu Plist 
      Caption         =   "Plist"
      Visible         =   0   'False
      Begin VB.Menu Plist_Del 
         Caption         =   "Á¦°Å"
      End
      Begin VB.Menu Plist_Con 
         Caption         =   "ÆíÁý"
      End
   End
End
Attribute VB_Name = "fStart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function GetPixel Lib "gdi32.dll" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function ReleaseCapture Lib "user32.dll" () As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32.dll" (ByVal hWnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Declare Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Const WS_EX_LAYERED As Long = &H80000
Private Const GWL_EXSTYLE As Long = -20
Private Const LWA_COLORKEY As Long = &H1
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FormTrans
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Private Sub Form_Load()
On Error GoTo CCT
Dim CNT As Integer
    SetWindowLong hWnd, GWL_EXSTYLE, GetWindowLong(hWnd, GWL_EXSTYLE) Or WS_EX_LAYERED
    SetLayeredWindowAttributes hWnd, vbWhite, 0, LWA_COLORKEY
    D_User = GetSetting(App.ProductName, "App", "User", "")
        If D_User = "" Then
            GoTo CCT
        End If
    D_Key = GetSetting(App.ProductName, "App", "Key")
    LS.Caption = D_User
fStart.Show
  Do
      GTCValue = GetTickCount + 1
      Do
         DoEvents
      Loop Until GTCValue < GetTickCount
      CNT = CNT + 1
          If CNT = 60 Then
              GoTo CDC
          End If
          
  Loop
CDC:
    fMain.Show
    Unload fStart
    GoTo CCC
CCT:
    fStart.Visible = False
    Call mMain.ViewPop(3)
    'Call oprogram.oprogram("*", "3Dimension information", "MaybeStudio", "3Dini", "Open", App.Path & "\" & App.EXEName & ".exe ""%1""", "", 0)
CCC:
End Sub
