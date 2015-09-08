VERSION 5.00
Begin VB.UserControl iOption 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00E0E0E0&
   ClientHeight    =   930
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2640
   ClipBehavior    =   0  '없음
   DefaultCancel   =   -1  'True
   FillStyle       =   0  '단색
   ScaleHeight     =   62
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   176
   Begin VB.Timer TimerX 
      Interval        =   15
      Left            =   2160
      Top             =   240
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   405
      Index           =   3
      Left            =   1560
      Picture         =   "iOption.ctx":0000
      ScaleHeight     =   375
      ScaleWidth      =   1125
      TabIndex        =   3
      Top             =   600
      Visible         =   0   'False
      Width           =   1155
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   405
      Index           =   2
      Left            =   1200
      Picture         =   "iOption.ctx":02A7
      ScaleHeight     =   375
      ScaleWidth      =   1125
      TabIndex        =   2
      Top             =   720
      Visible         =   0   'False
      Width           =   1155
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   405
      Index           =   1
      Left            =   1200
      Picture         =   "iOption.ctx":073E
      ScaleHeight     =   375
      ScaleWidth      =   1125
      TabIndex        =   1
      Top             =   600
      Visible         =   0   'False
      Width           =   1155
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   405
      Index           =   0
      Left            =   120
      Picture         =   "iOption.ctx":0BD2
      ScaleHeight     =   375
      ScaleWidth      =   1875
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   1905
   End
End
Attribute VB_Name = "iOption"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
' iOption Control (아이옵션컨트롤) by Maybe Studio (jiun0623@naver.com, MayTryArk@gmail.com)
' 컨트롤 내 timer의 interval을 조절해서 사용되는 리소스양을 조절하십시오
' Version (Alpha 2)
' Develope In Project C
' Like iOS Option Control , iOption Control
' 재배포가능 - 주석표시는 지우지마세요. 해당 컨트롤은 비영리적 목적에 한해서 무료로 배포됩니다.
Private Declare Function CreateRoundRectRgn Lib "gdi32.dll" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function SetWindowRgn Lib "user32.dll" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private m_lpBordrPoints()   As POINTAPI
'컨트롤을 둥그스름하게 깍아주는 API
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long
'사용시간을 반환해주는 API
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Const SRCCOPY As Long = &HCC0020
'BitBlt API
Private Declare Function GetCursorPos Lib "user32.dll" (ByRef lpPoint As POINTAPI) As Long
    Private Type POINTAPI
        X As Long
        Y As Long
    End Type
'커서위치를 반환해주는 API
Public Enum Values
    [True] = True
    [False] = False
End Enum

Public Event Click()            '클릭시 이벤트
Public Event ValueChange()  '값이 변환됬을시 이벤트
Private i_Value As Values       '값 반환
Dim Ls As Long, Ld As Integer, ValueX As Boolean, MouseMatch As Boolean
Dim TimeCat As Long, CurB As POINTAPI, Cur As POINTAPI
Private Sub TimerX_Timer()
'TimerX 의 Interval 은 1~20사이로 조절하세요. 20 이상시 끈길 수 있습니다.
'Ld와 Ls는 현재 포인트 위치입니다.
    If Not MouseMatch Then
                Ld = 1
                If Not ValueX Then Ld = -1
            Ls = Ls + (((50 - Ls) / 5) + 2) * Ld
                DrawOption
                    If Ls < 0 Then Ls = 0: DrawOption: TimerX.Interval = 0
                    If Ls > 50 Then Ls = 50: DrawOption: TimerX.Interval = 0
                    DrawOption
            
    End If
End Sub
Private Sub UserControl_Click()
If ValueX = False Then
    ValueX = True
Else
    ValueX = False
End If
        TimerX_Timer
        RaiseEvent Click
        RaiseEvent ValueChange
End Sub
Private Sub UserControl_Initialize()
Dim hRgn As Long
        hRgn = CreateRoundRectRgn(0, 0, 75, 25, 25, 75)
        SetWindowRgn hwnd, hRgn, True
        DeleteObject hRgn
        Ls = 0
        ValueX = False
        TimerX.Interval = 15
End Sub
Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'마우스 눌렸을시 서브
        TimerX.Interval = 15
        MouseMatch = True
        GetCursorPos CurB
        TimeCat = GetTickCount
                '가속측정을위해 마우스클릭시 값과 마우스땔시 값을 저장해 비교합니다.
        DrawOption
End Sub
Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'마우스로 움직였을시 서브
        TimerX.Interval = 15
GetCursorPos Cur
        If MouseMatch And X > (50 - Ls) And X < (74 - Ls) Then
                Ls = (-X) + 62
                        If Ls > 50 Then Ls = 50
                        If Ls < 0 Then Ls = 0
                DrawOption
        End If
End Sub
Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseMatch = False
    '일정 가속이상을 가질때만 옵션이 바뀌도록 했습니다.
        If Tx_Value((Cur.X - CurB.X) / ((GetTickCount - TimeCat) / 10)) > 5 Then
            If (Cur.X - CurB.X) / ((GetTickCount - TimeCat) / 10) > 0 Then
                ValueX = True
            Else
                ValueX = False
            End If
                RaiseEvent ValueChange
        End If
End Sub
Private Function Tx_Value(ByVal index As Long)
'절댓값을 반환합니다.
If index < 0 Then index = -index
Tx_Value = index
End Function
Private Sub DrawOption()
'이미지를 그립니다.
'pic(0)에 틀을 덧그린후 pic(0)을 컨트롤에 연산합니다.
        UserControl.Width = 1125
        UserControl.Height = 375
        UserControl.Cls
        UserControl.Pic(0).Cls
                        BitBlt UserControl.Pic(0).hDC, Ls, 0, 75, 25, UserControl.Pic(2).hDC, 0, 0, SRCPAINT
                        BitBlt UserControl.Pic(0).hDC, Ls, 0, 75, 25, UserControl.Pic(3).hDC, 0, 0, SRCAND
                        BitBlt UserControl.hDC, 0, 0, 75, 25, UserControl.Pic(1).hDC, 0, 0, SRCPAINT
                        BitBlt UserControl.hDC, 0, 0, 75, 25, UserControl.Pic(0).hDC, Ls, 0, SRCAND
End Sub
Private Sub UserControl_Resize()
    DrawOption
End Sub
Private Sub UserControl_Show()
    DrawOption
End Sub
Public Property Get Value() As Values
        TimerX.Interval = 15
        Value = ValueX
End Property
Public Property Let Value(ByVal Value As Values)
        TimerX.Interval = 15
        If ValueX <> Value Then UserControl_Click
End Property

