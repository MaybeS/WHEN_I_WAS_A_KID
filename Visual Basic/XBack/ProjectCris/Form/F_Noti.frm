VERSION 5.00
Begin VB.Form F_Noti 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFC0C0&
   BorderStyle     =   0  '¾øÀ½
   Caption         =   "Form1"
   ClientHeight    =   1500
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3900
   BeginProperty Font 
      Name            =   "¸¼Àº °íµñ"
      Size            =   12
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   100
   ScaleMode       =   3  'ÇÈ¼¿
   ScaleWidth      =   260
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows ±âº»°ª
   Begin ProjectCris.MayButton Button_Exit 
      Height          =   375
      Left            =   3450
      TabIndex        =   0
      Top             =   75
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   661
      Caption         =   "X"
      Border          =   0
      BackColor       =   8421631
      BorderAngle     =   0
      Alpha           =   0
      Angle           =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "¸¼Àº °íµñ"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "F_Noti"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Button_Exit_Click()
    CrisState.NotiVisible = False
    CrisState.NotiShow = False
    CrisState.NotiFrameCnt = 15
End Sub

