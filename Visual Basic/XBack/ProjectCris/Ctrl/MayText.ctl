VERSION 5.00
Begin VB.UserControl MayText 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   900
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2730
   MaskColor       =   &H00FFFFFF&
   ScaleHeight     =   60
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   182
   Begin VB.TextBox TextX 
      BorderStyle     =   0  '없음
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   75
      Width           =   1815
   End
   Begin VB.Label LabelX 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2160
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   75
   End
End
Attribute VB_Name = "MayText"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'##########################################################################################################################################
'#     Maybe Studio Present     ############################ >
'############## ver. 2012-12-27 ############################    Border      : 선의 두께를 설정합니다.
'##############  Alpha Version  ############################    BorderAngle : 모서리 부분을 얼마나 깍을지 설정합니다.
'#  May UI                                    ##############    PassWord    : 텍스트를 * 로 표시할지 설정합니다.
'#     <├May TextBox Control >               ##############    AutoSize    : 텍스트의 길이에따라 컨트롤의 길이를 변환할지 설정합니다.
'#      ├May Button Control                  ##############    ├MaxSize   : 텍스트의 길이가 커져도 컨트롤의 길이를 제한합니다.
'#      ├May Scroll Control                  ##############    └MinSize   : 텍스트의 길이가 작아져도 컨트롤의 길이를 제한합니다.
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
Private Sub Check_()
    TextX.Left = Border_ + 3
    TextX.Top = Border_ + 1
    TextX.Height = UserControl.Height / Screen.TwipsPerPixelY - 15 - Border_
    TextX.Width = LabelX.Width + 25
        If TextX.Width > MaxSize_ Then TextX.Width = MaxSize_
        
    If AutoSize_ Then
        If (TextX.Width * Screen.TwipsPerPixelX) + 200 >= MaxSize_ Then
            UserControl.Width = MaxSize_
        ElseIf (TextX.Width * Screen.TwipsPerPixelX) + 200 >= MinSize_ Then
            UserControl.Width = (TextX.Width * Screen.TwipsPerPixelX) + 200
        Else
            UserControl.Width = MinSize_
        End If
    End If
End Sub
'└ 텍스트 처리관련 서브
Private Sub TextX_Change()
    LabelX.Caption = TextX.Text
    Check_
    RaiseEvent Change
End Sub
Private Sub TextX_KeyDown(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyDown(KeyCode, Shift)
End Sub
Private Sub TextX_KeyPress(KeyAscii As Integer)
    RaiseEvent KeyPress(KeyAscii)
End Sub
Private Sub TextX_KeyUp(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyUp(KeyCode, Shift)
End Sub
Private Sub UserControl_Initialize()
    If PassWord Then TextX.PasswordChar = "*"
    If Not PassWord Then TextX.PasswordChar = ""
End Sub
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    PassWord = PropBag.ReadProperty("PassWord", False)
    TextX.Text = PropBag.ReadProperty("Text", "")
    Border_ = PropBag.ReadProperty("Border", 1)
    BorderAngle_ = PropBag.ReadProperty("BorderAngle", 15)
    AutoSize = PropBag.ReadProperty("AutoSize", False)
    MinSize = PropBag.ReadProperty("MinSize", 500)
    MaxSize = PropBag.ReadProperty("MaxSize", 1000)
    Set Font = PropBag.ReadProperty("Font", Ambient.Font)
End Sub
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "Text", TextX.Text, ""
    PropBag.WriteProperty "PassWord", PassWord, False
    PropBag.WriteProperty "Border", Border, 1
    PropBag.WriteProperty "Font", Font, Ambient.Font
    PropBag.WriteProperty "AutoSize", AutoSize_, False
    PropBag.WriteProperty "MinSize", MinSize_, 500
    PropBag.WriteProperty "MaxSize", MaxSize_, 1000
    PropBag.WriteProperty "BorderAngle", BorderAngle_, 15
End Sub
Private Sub UserControl_Resize()
    TextX.Left = Border_
    MakeRgn
    Check_
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
    Text = TextX.Text
    UserControl_Resize
End Property
Public Property Let Text(value As String)
    TextX.Text = value
    LabelX.Caption = TextX.Text
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
Public Property Get PassWord() As Boolean
    If TextX.PasswordChar = "" Then
        PassWord = False
    Else
        PassWord = True
    End If
        TextX.Refresh
End Property
Public Property Let PassWord(value As Boolean)
    If value Then
        TextX.PasswordChar = "*"
    Else
        TextX.PasswordChar = ""
    End If
        TextX.Refresh
End Property
Public Property Get AutoSize() As Boolean
    AutoSize = AutoSize_
    UserControl_Resize
End Property
Public Property Let AutoSize(value As Boolean)
    AutoSize_ = value
    UserControl_Resize
End Property
Public Property Get MinSize() As Integer
    MinSize = MinSize_
    UserControl_Resize
End Property
Public Property Let MinSize(value As Integer)
    MinSize_ = value
    UserControl_Resize
End Property
Public Property Get MaxSize() As Integer
    MaxSize = MaxSize_
    UserControl_Resize
End Property
Public Property Let MaxSize(value As Integer)
    MaxSize_ = value
    UserControl_Resize
End Property
Public Property Get Enabled() As Boolean
    Enabled = TextX.Enabled
    MakeRgn
End Property
Public Property Let Enabled(value As Boolean)
    TextX.Enabled = value
        If value Then
            TextX.BackColor = RGB(255, 255, 255)
            UserControl.BackColor = RGB(255, 255, 255)
        Else
            TextX.BackColor = RGB(175, 175, 175)
            UserControl.BackColor = RGB(175, 175, 175)
        End If
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
'└ 속성값을 반환하고 설정합니다.
