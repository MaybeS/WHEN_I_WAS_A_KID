VERSION 5.00
Begin VB.UserControl MayProgress 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Label TextX 
      AutoSize        =   -1  'True
      BackStyle       =   0  '투명
      Height          =   180
      Left            =   840
      TabIndex        =   0
      Top             =   960
      Width           =   60
   End
End
Attribute VB_Name = "MayProgress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'##########################################################################################################################################
'#     Maybe Studio Present     ############################ >공통부분
'############## ver. 2013-02-11 ############################    Border      : 선의 두께를 설정합니다.
'##############  Alpha Version  ############################    BorderAngle : 모서리 부분을 얼마나 깍을지 설정합니다.
'#  May UI                                    ##############
'#      ├May TextBox Control                 ##############
'#      ├May Button Control                  ##############
'#      ├May Scroll Control                  ##############
'#      ├May Check Control                   ##############
'#      ├May List Control                    #############################################################################################
'#      ├May Image Control                   ##############
'#      └May Progress Control                ##############    해당 컨트롤은 비상업적 용도에 대해 무료로 배포됩니다.
'#                                            ##############    해당 컨트롤을 사용하면서 발생하는 피해해대해 개발자는 책임지지 않습니다.
'##########################################################################################################################################
Private Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
Private Declare Function CreateRoundRectRgn Lib "gdi32.dll" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function Rectangle Lib "gdi32.dll" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long

Public Event Change()
Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(KeyAscii As Integer)
Public Event KeyUp(KeyCode As Integer, Shift As Integer)
Private Border_ As Integer, AutoSize_ As Boolean, MinSize_ As Integer, MaxSize_ As Integer, BorderAngle_ As Integer
Private UnitValue_ As Integer, Value_ As Integer, StartValue_ As Integer, MaxValue_ As Integer
Public Sub MakeRgn()
On Error Resume Next
UserControl.Cls
Dim CircleX As Long
    CircleX = CreateRoundRectRgn(0, 0, (UserControl.Width / Screen.TwipsPerPixelX), (UserControl.Height / Screen.TwipsPerPixelY), BorderAngle_, BorderAngle_)
            SetWindowRgn UserControl.hWnd, CircleX, True
        DeleteObject CircleX

    For i = 0 To Border_
        Rectangle hdc, i, i, (UserControl.Width / Screen.TwipsPerPixelX) - i - 1, (UserControl.Height / Screen.TwipsPerPixelY) - i - 1
    Next i
End Sub
'└ 그래픽 관련 서브
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Border_ = PropBag.ReadProperty("Border", 1)
    BorderAngle_ = PropBag.ReadProperty("BorderAngle", 15)
    UnitValue_ = PropBag.ReadProperty("UnitValue", 10)
    Value_ = PropBag.ReadProperty("Value", 10)
End Sub
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "Border", Border, 1
    PropBag.WriteProperty "Font", Font, Ambient.Font
    PropBag.WriteProperty "BorderAngle", BorderAngle_, 15
    PropBag.WriteProperty "UnitValue", UnitValue_, 10
    PropBag.WriteProperty "Value", Value_, 10
End Sub
Private Sub UserControl_Resize()
    MakeRgn
End Sub
'└ 속성값을 받고 컨트롤에 관련된 서브
Public Property Get Font() As StdFont
    Set Font = TextX.Font
End Property
Public Property Set Font(value As StdFont)
    Set TextX.Font = value
    Set LabelX.Font = value
    TextX.Refresh
    LabelX.Refresh
    PropertyChanged "Font"
End Property
Public Property Get Text() As String
    Text = TextX.Caption
    UserControl_Resize
End Property
Public Property Let Text(value As String)
    'TextX.Text = value
    'LabelX.Caption = TextX.Text
    PropertyChanged "Text"
    UserControl_Resize
End Property
Public Property Get Border() As Integer
    Border = Border_
    MakeRgn
End Property
Public Property Let Border(value As Integer)
    Border_ = value
    MakeRgn
End Property
Public Property Get BorderAngle() As Integer
    BorderAngle = BorderAngle_
    MakeRgn
End Property
Public Property Let BorderAngle(value As Integer)
    BorderAngle_ = value
    MakeRgn
End Property
Public Property Get value() As Integer
    value = BorderAngle_
    MakeRgn
End Property
Public Property Let value(ValueX As Integer)
    Value_ = ValueX
    MakeRgn
End Property
Public Property Get UnitValue() As Integer
    UnitValue = UnitValue_
    MakeRgn
End Property
Public Property Let UnitValue(value As Integer)
    UnitValue_ = value
    MakeRgn
End Property
Public Property Get StartValue() As Integer
    StartValue = StartValue_
    MakeRgn
End Property
Public Property Let StartValue(value As Integer)
    StartValue_ = value
    MakeRgn
End Property
Public Property Get MaxValue() As Integer
    MaxValue = MaxValue_
    MakeRgn
End Property
Public Property Let MaxValue(value As Integer)
    MaxValue_ = value
    MakeRgn
End Property
'└ 속성값을 반환하고 설정합니다.

