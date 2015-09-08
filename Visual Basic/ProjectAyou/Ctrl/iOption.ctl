VERSION 5.00
Begin VB.UserControl iOption 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00E0E0E0&
   ClientHeight    =   3645
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8295
   ClipBehavior    =   0  '����
   DefaultCancel   =   -1  'True
   FillStyle       =   0  '�ܻ�
   ScaleHeight     =   243
   ScaleMode       =   3  '�ȼ�
   ScaleWidth      =   553
   Begin VB.PictureBox Pic 
      Appearance      =   0  '���
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H80000008&
      Height          =   600
      Index           =   3
      Left            =   3840
      ScaleHeight     =   570
      ScaleWidth      =   2250
      TabIndex        =   3
      Top             =   600
      Visible         =   0   'False
      Width           =   2280
   End
   Begin VB.Timer TimerX 
      Interval        =   20
      Left            =   2160
      Top             =   240
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  '���
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   600
      Index           =   2
      Left            =   2520
      Picture         =   "iOption.ctx":0000
      ScaleHeight     =   570
      ScaleWidth      =   2250
      TabIndex        =   2
      Top             =   2520
      Visible         =   0   'False
      Width           =   2280
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  '���
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   600
      Index           =   1
      Left            =   2520
      Picture         =   "iOption.ctx":0353
      ScaleHeight     =   570
      ScaleWidth      =   2250
      TabIndex        =   1
      Top             =   1800
      Visible         =   0   'False
      Width           =   2280
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  '���
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   405
      Index           =   0
      Left            =   2760
      Picture         =   "iOption.ctx":06A6
      ScaleHeight     =   375
      ScaleWidth      =   1470
      TabIndex        =   0
      Top             =   1320
      Visible         =   0   'False
      Width           =   1500
   End
End
Attribute VB_Name = "iOption"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
' iOption Control (���̿ɼ���Ʈ��) by Maybe Studio (jiun0623@naver.com, MayTryArk@gmail.com)
' ��Ʈ�� �� timer�� interval�� �����ؼ� ���Ǵ� ���ҽ����� �����Ͻʽÿ�
' Version (Alpha 2)
' Develope In Project C
' Like iOS Option Control , iOption Control
' ��������� - �ּ�ǥ�ô� ������������. �ش� ��Ʈ���� �񿵸��� ������ ���ؼ� ����� �����˴ϴ�.
Private Declare Function CreateRoundRectRgn Lib "gdi32.dll" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function SetWindowRgn Lib "user32.dll" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private m_lpBordrPoints()   As POINTAPI
'��Ʈ���� �ձ׽����ϰ� ����ִ� API
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long
'���ð��� ��ȯ���ִ� API
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Const SRCCOPY As Long = &HCC0020
'BitBlt API
Private Declare Function GetCursorPos Lib "user32.dll" (ByRef lpPoint As POINTAPI) As Long
    Private Type POINTAPI
        x As Long
        Y As Long
    End Type
'Ŀ����ġ�� ��ȯ���ִ� API
Private Declare Function Rectangle Lib "gdi32.dll" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long

Public Event Click()            'Ŭ���� �̺�Ʈ
Public Event ValueChange()  '���� ��ȯ������ �̺�Ʈ
Dim Ls As Long, Ld As Long, ValueX As Boolean, MouseMatch As Boolean, Enabled_ As Boolean, Border_ As Integer
Dim TimeCat As Long, CurB As POINTAPI, Cur As POINTAPI

Private Sub TimerX_Timer()
'TimerX �� Interval �� 1~20���̷� �����ϼ���. 20 �̻�� ���� �� �ֽ��ϴ�.
'Ld�� Ls�� ���� ����Ʈ ��ġ�Դϴ�.
    If Not MouseMatch Then
                Ld = 1
                If Not ValueX Then Ld = -1
            Ls = Ls + (((58 - Ls) / 5) + 1) * Ld
                DrawOption
                    If Ls < 0 Then Ls = 0: DrawOption: TimerX.Interval = 0
                    If Ls > 38 Then Ls = 38: DrawOption: TimerX.Interval = 0
                    DrawOption
            
    End If
End Sub
Private Sub UserControl_Click()

If Enabled_ Then
If ValueX = False Then
    ValueX = True
Else
    ValueX = False
End If
        TimerX_Timer

        RaiseEvent ValueChange
        RaiseEvent Click
End If

End Sub
Private Sub UserControl_Initialize()
Dim hRgn As Long
        hRgn = CreateRoundRectRgn(0, 0, 61, 25, 6, 6)
        SetWindowRgn hWnd, hRgn, True
        DeleteObject hRgn
        Ls = 0
        TimerX.Interval = 15
End Sub
Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
'���콺 �������� ����
        TimerX.Interval = 15
        MouseMatch = True
        GetCursorPos CurB
        TimeCat = GetTickCount
                '�������������� ���콺Ŭ���� ���� ���콺���� ���� ������ ���մϴ�.
        DrawOption
End Sub
Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
'���콺�� ���������� ����
        TimerX.Interval = 15
GetCursorPos Cur
        If MouseMatch And x > (50 - Ls) And x < (74 - Ls) Then
                Ls = (-x) + 62
                        If Ls > 55 Then Ls = 50
                        If Ls < 0 Then Ls = 0
                DrawOption
        End If
End Sub
Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
On Error Resume Next
MouseMatch = False
    '���� �����̻��� �������� �ɼ��� �ٲ�� �߽��ϴ�.
        If Abs((Cur.x - CurB.x) / ((GetTickCount - TimeCat) / 10)) > 5 Then
        If Enabled_ Then
            If (Cur.x - CurB.x) / ((GetTickCount - TimeCat) / 10) > 0 Then
                ValueX = True
            Else
                ValueX = False
            End If
                RaiseEvent ValueChange
        End If
        End If
End Sub
Private Sub DrawOption()
Dim i As Integer
'�̹����� �׸��ϴ�.
'pic(0)�� Ʋ�� ���׸��� pic(0)�� ��Ʈ�ѿ� �����մϴ�.
        UserControl.Width = 915
        UserControl.Height = 375
        UserControl.Cls
        UserControl.Pic(0).Cls
        UserControl.Pic(1).Cls
        
    For i = 0 To Border_
        Rectangle UserControl.Pic(1).hdc, i, i, (UserControl.ScaleWidth) - i - 1, (UserControl.ScaleHeight) - i - 1
    Next i
    
                        BitBlt UserControl.Pic(0).hdc, Ls, 0, 98, 25, UserControl.Pic(2).hdc, 0, 0, SRCPAINT
                        BitBlt UserControl.Pic(0).hdc, Ls, 0, 98, 25, UserControl.Pic(3).hdc, 0, 0, SRCAND
                        If Enabled Then
                        BitBlt UserControl.hdc, 0, 0, 98, 25, UserControl.Pic(1).hdc, 0, 0, SRCPAINT
                        End If
                        BitBlt UserControl.hdc, 0, 0, 98, 25, UserControl.Pic(0).hdc, Ls, 0, SRCAND
                   
    
End Sub
Private Sub UserControl_Resize()
    DrawOption
End Sub
Private Sub UserControl_Show()
    DrawOption
End Sub
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    ValueX = PropBag.ReadProperty("iValue", True)
    Enabled_ = PropBag.ReadProperty("Enabled", True)
    Border_ = PropBag.ReadProperty("Border", 1)
End Sub
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "iValue", ValueX, True
    PropBag.WriteProperty "Enabled", Enabled_, True
    PropBag.WriteProperty "Border", Border_, 1
End Sub
Public Property Get iValue() As Boolean
        iValue = ValueX
        TimerX.Interval = 15
End Property
Public Property Let iValue(value As Boolean)
        ValueX = value
        RaiseEvent ValueChange
        TimerX.Interval = 15
End Property
Public Property Get Enabled() As Boolean
        Enabled = Enabled_
End Property
Public Property Let Enabled(value As Boolean)
        Enabled_ = value
            If Enabled Then
                UserControl.Enabled = True
                Pic(0).Enabled = True
            Else
                UserControl.Enabled = False
                Pic(0).Enabled = False
            End If
End Property
Public Property Get Border() As Integer
    Border = Border_
    DrawOption
End Property
Public Property Let Border(value As Integer)
    Border_ = value
    DrawOption
End Property
