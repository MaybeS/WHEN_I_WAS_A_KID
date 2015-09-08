VERSION 5.00
Begin VB.UserControl MayButton 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   1800
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4035
   MaskColor       =   &H00000000&
   ScaleHeight     =   120
   ScaleMode       =   3  '�ȼ�
   ScaleWidth      =   269
   Begin VB.Label LabelX 
      Alignment       =   2  '��� ����
      AutoSize        =   -1  'True
      BackStyle       =   0  '����
      BeginProperty Font 
         Name            =   "���� ���"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   90
   End
End
Attribute VB_Name = "MayButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'##########################################################################################################################################
'#     Maybe Studio Present     ############################ >
'############## ver. 2013-02-14 ############################    Border        : ���� �β��� �����մϴ�.
'##############  Alpha Version  ############################    BorderAngle   : �𼭸� �κ��� �󸶳� ������ �����մϴ�.
'#  May UI                                    ##############    AlphaColor    : �׶��̼��� F���� �����մϴ�.
'#      ��May TextBox Control                 ##############    BakeColor     : �׶��̼��� R���� �����մϴ�.
'#     <��May Button Control>                 ##############    HeightRate    : �׶��̼��� ������ ���̰��� �����մϴ�.
'#      ��May Scroll Control                  ##############
'#      ��May Check Control                   ##############
'#      ��May List Control                    #############################################################################################
'#      ��May Image Control                   ##############
'#      ��May Progress Control                ##############    �ش� ��Ʈ���� ������ �뵵�� ���� ����� �����˴ϴ�.
'#                                            ##############    �ش� ��Ʈ���� ����ϸ鼭 �߻��ϴ� �����ش��� �����ڴ� å������ �ʽ��ϴ�.
'##########################################################################################################################################
Private Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
Private Declare Function CreateRoundRectRgn Lib "gdi32.dll" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function Rectangle Lib "gdi32.dll" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
'�� ��Ʈ���� ����� �����ϴ� API
Private Declare Function TranslateColor Lib "olepro32.dll" Alias "OleTranslateColor" (ByVal clr As OLE_COLOR, ByVal palet As Long, Col As Long) As Long
Private Declare Function GetDIBits Lib "gdi32" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Private Declare Function SetDIBits Lib "gdi32" (ByVal hdc As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Private Type BITMAPINFOHEADER
        biSize As Long
        biWidth As Long
        biHeight As Long
        biPlanes As Integer
        biBitCount As Integer
        biCompression As Long
        biSizeImage As Long
        biXPelsPerMeter As Long
        biYPelsPerMeter As Long
        biClrUsed As Long
        biClrImportant As Long
End Type
Private Type RGBQUAD
        rgbBlue As Byte
        rgbGreen As Byte
        rgbRed As Byte
        rgbReserved As Byte
End Type
Private Type BITMAPINFO
        bmiHeader As BITMAPINFOHEADER
        bmiColors() As RGBQUAD
End Type
Private Const DIB_RGB_COLORS = 0
'�� �׷��� ���� API
Public Event Click()
Public Event DblClick()
Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(KeyAscii As Integer)
Public Event KeyUp(KeyCode As Integer, Shift As Integer)
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseLeave()
Public Event MouseEnter()
'�� �̺�Ʈ�� �����մϴ�.
Private Type POINTAPI
    X As Long
    Y As Long
End Type
Dim BInfo As BITMAPINFO, PInfo As BITMAPINFO
Dim BgScr() As RGBQUAD, PScr() As RGBQUAD
Private Border_ As Integer, BackColor_ As Long, Alpha_ As Integer, BorderAngle_ As Integer, Angle_ As Integer, i As Integer, j As Integer
Private Width As Long, Height As Long, NTR As Integer, NCR As Integer, CurX As POINTAPI
Private Sub LabelX_Click()
    RaiseEvent Click
End Sub
Private Sub LabelX_DblClick()
    RaiseEvent DblClick
End Sub
Private Sub LabelX_KeyDown(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyDown(KeyCode, Shift)
End Sub
Private Sub LabelX_KeyPress(KeyAscii As Integer)
    RaiseEvent KeyPress(KeyAscii)
End Sub
Private Sub LabelX_KeyUp(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyUp(KeyCode, Shift)
End Sub
Private Sub LabelX_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseDown(Button, Shift, X, Y)
    NTR = -20
    NCR = -10
    UserControl_Resize
End Sub
Private Sub LabelX_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseMove(Button, Shift, X, Y)
End Sub
Private Sub LabelX_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseUp(Button, Shift, X, Y)
    NTR = 0
    NCR = 0
    UserControl_Resize
End Sub
Private Sub UserControl_Click()
    RaiseEvent Click
End Sub
Private Sub UserControl_DblClick()
    RaiseEvent DblClick
End Sub
Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyDown(KeyCode, Shift)
End Sub
Private Sub UserControl_KeyPress(KeyAscii As Integer)
    RaiseEvent KeyPress(KeyAscii)
End Sub
Private Sub UserControl_KeyUp(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyUp(KeyCode, Shift)
End Sub
Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseDown(Button, Shift, X, Y)
    NTR = -20
    NCR = -10
    UserControl_Resize
End Sub
Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseMove(Button, Shift, X, Y)
End Sub
Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseUp(Button, Shift, X, Y)
    NTR = 0
    NCR = 0
    UserControl_Resize
End Sub
'�� ���� ���� ���� ��Ʈ���� �̺�Ʈ �߻��� ���õ˴ϴ�.
Private Sub UserControl_InitProperties()
    MakeRgn
End Sub
Private Sub UserControl_Show()
    MakeRgn
End Sub
Private Sub UserControl_Resize()
With BInfo.bmiHeader
    .biSize = 40
    .biWidth = UserControl.ScaleWidth
    .biHeight = UserControl.ScaleHeight
    .biPlanes = 1
    .biBitCount = 32
    .biCompression = 0
    .biClrUsed = 0
    .biClrImportant = 0
    .biSizeImage = .biWidth * .biHeight
End With
ReDim BgScr(0 To BInfo.bmiHeader.biWidth - 1, 0 To BInfo.bmiHeader.biHeight - 1) As RGBQUAD

    Width = UserControl.ScaleWidth
    Height = UserControl.ScaleHeight
    LabelX.Left = (Width - LabelX.Width) / 2
    LabelX.Top = (Height - LabelX.Height) / 2 - 1
    MakeRgn
End Sub
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    LabelX.Caption = PropBag.ReadProperty("Caption", "MayButton")
    Border_ = PropBag.ReadProperty("Border", 1)
    BackColor_ = PropBag.ReadProperty("BackColor", &HFFFFFF)
    BorderAngle_ = PropBag.ReadProperty("BorderAngle", 15)
    Alpha_ = PropBag.ReadProperty("Alpha", 50)
    Angle_ = PropBag.ReadProperty("Angle", 3)
    Set LabelX.Font = PropBag.ReadProperty("Font", Ambient.Font)
    
    MakeRgn
End Sub
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "Caption", LabelX.Caption, "MayButton"
    PropBag.WriteProperty "Border", Border_, 1
    PropBag.WriteProperty "BackColor", BackColor_, &HFFFFFF
    PropBag.WriteProperty "BorderAngle", BorderAngle_, 15
    PropBag.WriteProperty "Alpha", Alpha_, 50
    PropBag.WriteProperty "Angle", Angle_, 3
    PropBag.WriteProperty "Font", LabelX.Font, Ambient.Font
    MakeRgn
End Sub
'�� ��Ʈ����  �Ӽ��� ���õ˴ϴ�.
Public Property Get Font() As StdFont
    Set Font = LabelX.Font
End Property
Public Property Set Font(Value As StdFont)
    Set LabelX.Font = Value
    LabelX.Refresh
    PropertyChanged "Font"
End Property
Public Property Get Border() As Integer
    Border = Border_
    UserControl.Refresh
    UserControl_Resize
End Property
Public Property Let Border(Value As Integer)
    Border_ = Value
    UserControl.Refresh
    UserControl_Resize
    PropertyChanged "Border"
End Property
Public Property Get BorderAngle() As Integer
    BorderAngle = BorderAngle_
    UserControl.Refresh
    UserControl_Resize
End Property
Public Property Let BorderAngle(Value As Integer)
    BorderAngle_ = Value
    UserControl.Refresh
    UserControl_Resize
    PropertyChanged "BorderAngle"
End Property
Public Property Get Caption() As String
    Caption = LabelX.Caption
    UserControl_Resize
End Property
Public Property Let Caption(Value As String)
    LabelX.Caption = Value
    UserControl_Resize
End Property
Public Property Get Alpha() As Integer
    Alpha = Alpha_
    UserControl.Refresh
    UserControl_Resize
End Property
Public Property Let Alpha(Value As Integer)
    Alpha_ = Value
    UserControl.Refresh
    UserControl_Resize
    PropertyChanged "Alpha"
End Property
Public Property Get Angle() As Integer
    Angle = Angle_
    UserControl.Refresh
    UserControl_Resize
End Property
Public Property Let Angle(Value As Integer)
    Angle_ = Value
    UserControl.Refresh
    UserControl_Resize
    PropertyChanged "Angle"
End Property
Public Property Get Backcolor() As OLE_COLOR
    Backcolor = BackColor_
    UserControl.Refresh
    UserControl_Resize
End Property
Public Property Let Backcolor(Value As OLE_COLOR)
    BackColor_ = Value
    UserControl.Refresh
    UserControl_Resize
    PropertyChanged "BackColor"
End Property
'�� �Ӽ����� ��ȯ�ϰ� �Է¹޽��ϴ�.
Public Sub MakeRgn()
On Error Resume Next
UserControl.Cls
Dim CircleX As Long, i As Long, j As Long, t As Double
Dim R_ As Long, G_ As Long, B_ As Long
    
    CircleX = CreateRoundRectRgn(1, 1, (UserControl.Width / Screen.TwipsPerPixelX) - 1, (UserControl.Height / Screen.TwipsPerPixelY) - 1, BorderAngle_, BorderAngle_)
            SetWindowRgn UserControl.hWnd, CircleX, True
        DeleteObject CircleX

GetDIBits UserControl.hdc, UserControl.Image.Handle, 0, BInfo.bmiHeader.biHeight, BgScr(0, 0), BInfo, 0
GetRGB R_, G_, B_, BackColor_

For i = Border_ + 0 To Width - Border_ - 2
    For j = Border_ + 0 To Height - Border_ - 2
        
        
        If (1 / 3) * Height + (Height / (3 * Width)) * i > j Then
            BgScr(i, j).rgbRed = RealValue(255, 0, R_ + NTR)
            BgScr(i, j).rgbGreen = RealValue(255, 0, G_ + NTR)
            BgScr(i, j).rgbBlue = RealValue(255, 0, B_ + NTR)
        Else
            t = ((j - (Height / (3 * Width)) * i) / Height) ^ (2)
            BgScr(i, j).rgbRed = RealValue(255, 0, R_ + NCR + t * 100)
            BgScr(i, j).rgbGreen = RealValue(255, 0, G_ + NCR + t * 100)
            BgScr(i, j).rgbBlue = RealValue(255, 0, B_ + NCR + t * 100)
        End If
            
    Next j
Next i

SetDIBits UserControl.hdc, UserControl.Image.Handle, 0, BInfo.bmiHeader.biHeight, BgScr(0, 0), BInfo, 0

    For i = 0 To Border_
        Rectangle hdc, i, i, (UserControl.Width / Screen.TwipsPerPixelX) - i - 1, (UserControl.Height / Screen.TwipsPerPixelY) - i - 1
    Next i
    
End Sub
'�� �׷����� ó���մϴ�. GetDIBIts API�� ���Ǿ����ϴ�. ����ȭ���Ǿ������� �ʽ��ϴ�.
'�� �׷���ó���� ���� �Լ��� 1/3~2/3 ���������� ��ǥ���� ���� �׶��̼�������˴ϴ�.
Public Sub GetRGB(R As Long, G As Long, B As Long, Color As Long)
Dim N_Long As Long
    TranslateColor Color, 0, N_Long
    R = (N_Long And &HFF&)
    G = (N_Long And &HFF00&) \ &H100&
    B = (N_Long And &HFF0000) \ &H10000
End Sub
Private Function RealValue(ByVal Max As Long, Min As Long, Value As Long)

    If Value > Max Then
        
        RealValue = Max
        
    ElseIf Value < Min Then
    
        RealValue = Min
    
    Else
    
        RealValue = Value
    
    End If
    
'�ش��Լ��� Max �� Min �����ǰ��� ��ȯ�մϴ�. ���� �ʰ��ÿ� Max�� Min���� �������ϴ�.
End Function
