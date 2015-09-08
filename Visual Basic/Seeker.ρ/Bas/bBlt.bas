Attribute VB_Name = "bBlt"
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Const SRCCOPY As Long = &HCC0020
Public Sub MainBlt()
Dim i As Integer
fMain.Cls

If FlashLogo Then
    TextPrint 305, 150, "0으로 가는길", vbBlack, 24
    TextPrint 180, 500, "시작하려면 아무키나 누르세요.", vbBlack, 24
        If KeyPressCheck Then FlashLogo = False
Else

    TextPrint Mi.X, Mi.Y, Mi.Pxy, vbBlack, 30
    
    For i = 0 To 12
        TextPrint 150, 30 * i, EFX(i), vbBlack, 20
    Next i
    
End If

End Sub
Public Sub TextPrint(ByVal X As Long, ByVal Y As Long, ByVal TextIn As String, ByVal Color As Long, ByVal FontSize As Integer)
Dim Fs As Integer

        If FontSize Then Fs = fMain.FontSize: fMain.FontSize = FontSize:
        
        fMain.ForeColor = Color
        TextOut fMain.hdc, X, Y, TextIn, LenB(StrConv(TextIn, vbFromUnicode))
            
        If FontSize Then fMain.FontSize = Fs

'해당 폼에 텍스트를 출력합니다.
End Sub
