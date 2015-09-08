VERSION 5.00
Begin VB.UserControl MayImage 
   AutoRedraw      =   -1  'True
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   240
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   320
   Begin VB.PictureBox pctG 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  '없음
      Height          =   750
      Left            =   1800
      ScaleHeight     =   750
      ScaleWidth      =   750
      TabIndex        =   0
      Top             =   2520
      Visible         =   0   'False
      Width           =   750
   End
End
Attribute VB_Name = "MayImage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'##########################################################################################################################################
'#     Maybe Studio Present     ############################ >
'############## ver. 2012-12-27 ############################    Border      : 선의 두께를 설정합니다.
'##############  Alpha Version  ############################    BorderAngle : 모서리 부분을 얼마나 깍을지 설정합니다.
'#  May UI                                    ##############    PassWord    : 텍스트를 * 로 표시할지 설정합니다.
'#      ├May TextBox Control                 ##############    AutoSize    : 텍스트의 길이에따라 컨트롤의 길이를 변환할지 설정합니다.
'#      ├May Button Control                  ##############    ├MaxSize   : 텍스트의 길이가 커져도 컨트롤의 길이를 제한합니다.
'#      ├May Scroll Control                  ##############    └MinSize   : 텍스트의 길이가 작아져도 컨트롤의 길이를 제한합니다.
'#      ├May Check Control                   ##############
'#      ├May List Control                    #############################################################################################
'#     <└May Image Control >                 ##############    해당 컨트롤은 비상업적 용도에 대해 무료로 배포됩니다.
'#                                            ##############    해당 컨트롤을 사용하면서 발생하는 피해해대해 개발자는 책임지지 않습니다.
'##########################################################################################################################################
Private Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
Private Declare Function CreateRoundRectRgn Lib "gdi32.dll" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function Rectangle Lib "gdi32.dll" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function StretchBlt Lib "gdi32.dll" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
'└ 컨트롤의 모양을 설정하는 API
Public Event Click()
Public Event DblClick()
Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(KeyAscii As Integer)
Public Event KeyUp(KeyCode As Integer, Shift As Integer)
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
'└ 이벤트를 설정합니다.

Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function Polygon Lib "gdi32" (ByVal hdc As Long, lpPoint As POINTAPI, ByVal nCount As Long) As Long

Private Type POINTAPI
    X As Long
    Y As Long
End Type

Private Declare Function CreatePolygonRgn Lib "gdi32" (lpPoint As POINTAPI, ByVal nCount As Long, ByVal nPolyFillMode As Long) As Long
Private Border_ As Integer, BorderAngle_ As Integer, Picture_ As StdPicture, BackColor_ As OLE_COLOR, Arrow_ As Integer
'd'

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
End Sub
Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseMove(Button, Shift, X, Y)
End Sub
Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseUp(Button, Shift, X, Y)
End Sub
'└ 위의 서브 들은 컨트롤의 이벤트 발생에 관련됩니다.
Private Sub UserControl_InitProperties()
    MakeRgn
    
Set Me.Picture = Nothing
End Sub
Private Sub UserControl_Show()
    MakeRgn
End Sub
Private Sub UserControl_Resize()
    MakeRgn
End Sub
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Border_ = PropBag.ReadProperty("Border", 1)
    BorderAngle_ = PropBag.ReadProperty("BorderAngle", 15)
    Arrow_ = PropBag.ReadProperty("Arrow", 0)
        Set pctG.Picture = PropBag.ReadProperty("Picture", Nothing)
    BackColor_ = PropBag.ReadProperty("BackColor", &H0)
    UserControl.BackColor = BackColor_
    pctG.BackColor = BackColor_
    MakeRgn
End Sub
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "Border", Border_, 1
    PropBag.WriteProperty "BorderAngle", BorderAngle_, 15
    PropBag.WriteProperty "Picture", pctG.Picture, Nothing
    PropBag.WriteProperty "Arrow", Arrow_, 0
    PropBag.WriteProperty "BackColor", BackColor_, &H0
    UserControl.BackColor = BackColor_
    pctG.BackColor = BackColor_
    MakeRgn
End Sub
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
Public Property Get BackColor() As OLE_COLOR
    BackColor = BackColor_
    MakeRgn
End Property
Public Property Let BackColor(value As OLE_COLOR)
    BackColor_ = value
    UserControl.BackColor = BackColor_
    pctG.BackColor = BackColor_
    MakeRgn
End Property
Public Property Get Arrow() As Integer
    Arrow = Arrow_
    MakeRgn
End Property
Public Property Let Arrow(value As Integer)
    Arrow_ = value
    MakeRgn
End Property
Public Property Get Picture() As Picture

Set Picture = pctG.Picture

    MakeRgn
End Property
Public Property Set Picture(NewPic As Picture)
Set pctG.Picture = NewPic

If Not (NewPic Is Nothing) Then
    pctG.Width = pctG.Width
    pctG.Height = pctG.Height
    
End If

    MakeRgn
End Property
'└ 컨트롤의  속성에 관련됩니다.
Public Sub MakeRgn()
pctG.Cls
UserControl.Cls
Dim i As Integer, PixelXY As Long, R_ As Long, G_ As Long, B_ As Long
Dim CircleX As Long, PolygonX As Long, Rx(2) As POINTAPI, CombineX As Long
Dim PenSelect As Long, BrushSelect As Long
Dim SHeight As Long, SWidth As Long, SxTop As Long, SxLeft As Long
CombineX = CreateRoundRectRgn(0, 0, (UserControl.Width / Screen.TwipsPerPixelX), (UserControl.Height / Screen.TwipsPerPixelY), BorderAngle_, BorderAngle_)
      
        Select Case Arrow_
            Case 0
                SHeight = UserControl.ScaleHeight
                SWidth = UserControl.ScaleWidth
                SxTop = 0
                SxLeft = 0
                
            Case 1
                
                SHeight = UserControl.ScaleHeight
                SWidth = (UserControl.ScaleWidth) - (3 ^ (1 / 2) * (UserControl.ScaleHeight / 2)) / 2
                SxTop = 0
                SxLeft = 0
                
    
                Rx(0).X = UserControl.ScaleWidth - (3 ^ (1 / 2) * (UserControl.ScaleHeight / 2)) / 2
                Rx(0).Y = UserControl.ScaleHeight / 4
                Rx(1).X = UserControl.ScaleWidth
                Rx(1).Y = UserControl.ScaleHeight / 2
                Rx(2).X = UserControl.ScaleWidth - (3 ^ (1 / 2) * (UserControl.ScaleHeight / 2)) / 2
                Rx(2).Y = UserControl.ScaleHeight * (3 / 4)
                    PolygonX = CreatePolygonRgn(Rx(0), 3, 1)
            Case 2
                
            Case 3
            
                SHeight = UserControl.ScaleHeight
                SWidth = (UserControl.ScaleWidth) - (3 ^ (1 / 2) * (UserControl.ScaleHeight / 2)) / 2
                SxTop = 0
                SxLeft = (3 ^ (1 / 2) * (UserControl.ScaleHeight / 2)) / 2
                
    
                Rx(0).X = (3 ^ (1 / 2) * (UserControl.ScaleHeight / 2)) / 2 - 2
                Rx(0).Y = UserControl.ScaleHeight / 4
                Rx(1).X = 0
                Rx(1).Y = UserControl.ScaleHeight / 2
                Rx(2).X = (3 ^ (1 / 2) * (UserControl.ScaleHeight / 2)) / 2 - 2
                Rx(2).Y = UserControl.ScaleHeight * (3 / 4)
                    PolygonX = CreatePolygonRgn(Rx(0), 3, 1)
            Case 4
                
        End Select
            
                CircleX = CreateRoundRectRgn(SxLeft, SxTop, SWidth + SxLeft, SHeight + SxTop, BorderAngle_, BorderAngle_)
    
    If Arrow_ <> 0 Then
            CombineRgn CombineX, CircleX, PolygonX, 2
    End If
            SetWindowRgn UserControl.hWnd, CombineX, True
        
    DeleteObject CircleX
    DeleteObject CombineX
    DeleteObject PolygonX
        

    StretchBlt hdc, SxLeft, SxTop, SWidth, SHeight, pctG.hdc, 0, 0, pctG.Width, pctG.Height, &HCC0020
    
    For i = 0 To Border_
        Rectangle hdc, SxLeft + i, SxTop + i, SWidth - -SxLeft - i - 1, SHeight - SxTop - i - 1
    Next i
    
    If Arrow_ <> 0 Then
    
        PenSelect = SelectObject(hdc, CreatePen(0, Border_, vbBlack))
        BrushSelect = SelectObject(hdc, CreateSolidBrush(BackColor_))
        
        Polygon hdc, Rx(0), 3
        
        DeleteObject PenSelect
        DeleteObject BrushSelect
        
    End If
End Sub

