Attribute VB_Name = "B_bas"
Option Explicit

Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchBlt Lib "gdi32.dll" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long

Private Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal lpString As String, ByVal nCount As Long) As Long

Private Declare Function GetDIBits Lib "gdi32" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Private Declare Function SetDIBits Lib "gdi32" (ByVal hdc As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Private Declare Function SetPixelV Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long
Private Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long) As Long
Public Declare Function TranslateColor Lib "olepro32.dll" Alias "OleTranslateColor" (ByVal clr As OLE_COLOR, ByVal palet As Long, Col As Long) As Long
    'API drawing
    
Public Declare Function Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Public Declare Function RoundRect Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Public Declare Function Ellipse Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Public Declare Function Polygon Lib "gdi32" (ByVal hdc As Long, lpPoint As POINTAPI, ByVal nCount As Long) As Long
    'API drawing

Public Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Public Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Public Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Public Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
    'API redrawing

Public Declare Function LineTo Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long) As Long
Public Declare Function MoveToEx Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, lpPoint As POINTAPI) As Long

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
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Const SRCCOPY As Long = &HCC0020
Public Sub DrawLoad()
Dim R_ As Long, G_ As Long, B_ As Long, i As Integer, j As Integer, t As Double
Dim BInfo As BITMAPINFO
Dim BgScrx() As RGBQUAD

With BInfo.bmiHeader
    .biSize = 40
    .biWidth = F_Main.ScaleWidth
    .biHeight = F_Main.ScaleHeight
    .biPlanes = 1
    .biBitCount = 32
    .biCompression = 0
    .biClrUsed = 0
    .biClrImportant = 0
    .biSizeImage = .biWidth * .biHeight
End With

ReDim BgScrx(0 To BInfo.bmiHeader.biWidth - 1, 0 To BInfo.bmiHeader.biHeight - 1) As RGBQUAD

GetDIBits F_Main.hdc, F_Main.Image.Handle, 0, BInfo.bmiHeader.biHeight, BgScrx(0, 0), BInfo, 0
GetRGB R_, G_, B_, RGB(0, 121, 255)

For i = 0 To F_Main.ScaleWidth - 1
    For j = 0 To F_Main.ScaleHeight - 1
        
        
        If (1 / 3) * F_Main.ScaleHeight + (F_Main.ScaleHeight / (3 * F_Main.ScaleWidth)) * i > j Then
        
            BgScrx(i, j).rgbRed = RealValue(255, 0, R_)
            BgScrx(i, j).rgbGreen = RealValue(255, 0, G_)
            BgScrx(i, j).rgbBlue = RealValue(255, 0, B_)
            
        Else
        
            t = ((j - (F_Main.ScaleHeight / (3 * F_Main.ScaleWidth)) * i) / F_Main.ScaleHeight) ^ (11 / 4)
            BgScrx(i, j).rgbRed = RealValue(255, 0, R_ + t * 110)
            BgScrx(i, j).rgbGreen = RealValue(255, 0, G_ + t * 110)
            BgScrx(i, j).rgbBlue = RealValue(255, 0, B_ + t * 110)
            
        End If
            
    Next j
Next i

SetDIBits F_Main.hdc, F_Main.Image.Handle, 0, BInfo.bmiHeader.biHeight, BgScrx(0, 0), BInfo, 0

End Sub
Public Sub TextPrint(ByRef Fm, ByVal X As Long, ByVal Y As Long, ByVal TextIn As String, ByVal Color As Long, ByVal FontSize As Integer)
Dim Fs As Integer

        If FontSize Then Fs = Fm.FontSize: Fm.FontSize = FontSize:
        Fm.ForeColor = Color
        TextOut Fm.hdc, X, Y, TextIn, LenB(StrConv(TextIn, vbFromUnicode))
        If FontSize Then Fm.FontSize = Fs

'해당 폼에 텍스트를 출력합니다.
End Sub
Public Sub LucidBlt(ByRef hdc As Long, ByVal Height As Long, ByVal Width As Long)
Dim PointX As POINTAPI, hdcX As Long
Dim hPen As Long, hBrush As Long, hOldPen As Long, hOldBrush As Long

hPen = CreatePen(0, 1, vbBlack)
hBrush = CreateSolidBrush(RGB(0, 121, 255))
hOldPen = SelectObject(hdc, hPen)
hOldBrush = SelectObject(hdc, hBrush)
        
    MoveToEx hdc, 15, 0, PointX
    LineTo hdc, 0, 15
    MoveToEx hdc, 0, 15, PointX
    LineTo hdc, 0, Height - 1
    MoveToEx hdc, 0, Height - 1, PointX
    LineTo hdc, 29, Height - 1
    MoveToEx hdc, 29, Height - 1, PointX
    LineTo hdc, 29, 0
    MoveToEx hdc, 29, 0, PointX
    LineTo hdc, 15, 0
    '30< 앞부분
    
    MoveToEx hdc, 20, 0, PointX
    LineTo hdc, 20, Height
    MoveToEx hdc, 21, 0, PointX
    LineTo hdc, 21, Height
    MoveToEx hdc, 22, 0, PointX
    LineTo hdc, 22, Height
    '앞부분의 두줄 포인트
    
    Rectangle hdc, 30, 0, Width, Height
    '뒷부분 사각형
        
SelectObject hdc, hOldPen
SelectObject hdc, hOldBrush
DeleteObject hPen
DeleteObject hBrush

End Sub
Public Sub AyouSubBlt(ByVal TriangleY As Integer, ByVal Width As Integer, ByVal Height As Integer)
Dim i As Integer, PointX(6) As POINTAPI
Dim hPen As Long, hBrush As Long, hOldPen As Long, hOldBrush As Long

hPen = CreatePen(0, 2, RGB(100, 100, 100))
hBrush = CreateSolidBrush(vbWhite)
hOldPen = SelectObject(F_Sub.hdc, hPen)
hOldBrush = SelectObject(F_Sub.hdc, hBrush)
        
    PointX(0).X = 40
    PointX(0).Y = 0
    PointX(1).X = 40
    PointX(1).Y = TriangleY
    PointX(2).X = 14
    PointX(2).Y = TriangleY + 26
    PointX(3).X = 40
    PointX(3).Y = TriangleY + 52
    PointX(4).X = 40
    PointX(4).Y = Height
    PointX(5).X = 43
    PointX(5).Y = Height
    PointX(6).X = 43
    PointX(6).Y = 0
    
        Polygon F_Sub.hdc, PointX(0), 7
        Ellipse F_Sub.hdc, 27, TriangleY + 21, 38, TriangleY + 32
            '원과 SAO RGN에 대한 획
        
    PointX(0).X = 51
    PointX(0).Y = 6
    PointX(1).X = 45
    PointX(1).Y = 12
    PointX(2).X = 45
    PointX(2).Y = 44
    PointX(3).X = 51
    PointX(3).Y = 50
        
        Polygon F_Sub.hdc, PointX(0), 4
            '획
        
    MoveToEx F_Sub.hdc, 50, 39, PointX(0)
    LineTo F_Sub.hdc, 45, 44
        '선
    
SelectObject F_Sub.hdc, hOldPen
SelectObject F_Sub.hdc, hOldBrush
DeleteObject hPen
DeleteObject hBrush

    AyouSubBoxBlt
    AyouSubTopBlt

End Sub
Public Sub AyouSubBoxBlt()
On Error Resume Next
Dim PointX As POINTAPI, i As Integer, PenSelect As Long
Dim hPen As Long, hOldPen As Long
Dim N_Long As Long

F_Sub.SubBox(NHex).Cls

With F_Sub.SubBox(NHex)

Select Case NHex

    Case 0
    Case 1
        
        MoveToEx .hdc, 10, 47, PointX
        LineTo .hdc, .Width - 10, 47
        
        RoundRect .hdc, 5, 57, .Width - 5, 80, 10, 10
        
        RoundRect .hdc, AyouSet.Remind.N_Integer * (.Width / 7) + 3, 59, AyouSet.Remind.N_Integer * (.Width / 7) + 25, 78, 5, 5
        
        For i = 0 To 6
            
            If Weekday(DateValue(Year(Now) & "-" & Month(Now) & "-" & (Day(Now) + i - 3))) = 1 Then
                    '일요일이면 빨간색
                N_Long = RGB(255, 0, 50)
                
            ElseIf Weekday(DateValue(Year(Now) & "-" & Month(Now) & "-" & (Day(Now) + i - 3))) = 7 Then
                    '토요일은 파란색
                N_Long = RGB(0, 150, 255)
                
            Else
                    '그외는 검은색
                N_Long = vbBlack
                
            End If
            
            TextPrint F_Sub.SubBox(1), i * (.Width / 7) + (.Width / 25), 60, Day(Now) - 3 + i, N_Long, 10
            
        Next i
        
    Case 2
        
        For i = 0 To 6
            
            BitBlt .hdc, 10, 70 + 35 * i, 32, 32, F_Sub.IcoMask(15 + i).hdc, 0, 0, SRCPAINT
            BitBlt .hdc, 10, 70 + 35 * i, 32, 32, F_Sub.Ico(15 + i).hdc, 0, 0, SRCAND
            
        Next i
        
        DrawOptionPoint
    
        MoveToEx .hdc, 47, 35, PointX
        LineTo .hdc, 47, .Height - 5
        MoveToEx .hdc, 48, 35, PointX
        LineTo .hdc, 48, .Height - 5
        
        SubGradationAlt F_Sub.SubBox(2), 0, 0, AyouSet.SubForm(NHex).Height
            
        AyouSubTopBlt

    Case 3
        
        For i = 0 To 5
        
            BitBlt .hdc, 20 + 50 * i, F_Sub.Text_Memo.Top - 35, 32, 32, F_Sub.IcoMask(i).hdc, 0, 0, SRCPAINT
            BitBlt .hdc, 20 + 50 * i, F_Sub.Text_Memo.Top - 35, 32, 32, F_Sub.Ico(i).hdc, 0, 0, SRCAND
        
        Next i
            
            BitBlt .hdc, F_Sub.Text_Memo.Left - 40, F_Sub.Text_Memo.Top, 32, 32, F_Sub.IcoMask(22).hdc, 0, 0, SRCPAINT
            BitBlt .hdc, F_Sub.Text_Memo.Left - 40, F_Sub.Text_Memo.Top, 32, 32, F_Sub.Ico(22).hdc, 0, 0, SRCAND
        
        hPen = CreatePen(0, 1, RGB(0, 0, 0))
        hOldPen = SelectObject(F_Sub.SubBox(3).hdc, hPen)
        
            MoveToEx .hdc, 0, F_Sub.Text_Memo.Top + 5, PointX
            LineTo .hdc, F_Sub.Text_Memo.Left - 50, F_Sub.Text_Memo.Top + 5
            MoveToEx .hdc, 0, F_Sub.Text_Memo.Top + 10, PointX
            LineTo .hdc, F_Sub.Text_Memo.Left - 50, F_Sub.Text_Memo.Top + 10
            MoveToEx .hdc, 0, F_Sub.Text_Memo.Top + 15, PointX
            LineTo .hdc, F_Sub.Text_Memo.Left - 50, F_Sub.Text_Memo.Top + 15
        
        SelectObject .hdc, hOldPen
        DeleteObject hPen
        
        hPen = CreatePen(0, 1, RGB(50, 50, 50))
        hOldPen = SelectObject(F_Sub.SubBox(3).hdc, hPen)
            
            MoveToEx .hdc, 0, F_Sub.Text_Memo.Top + 6, PointX
            LineTo .hdc, F_Sub.Text_Memo.Left - 49, F_Sub.Text_Memo.Top + 6
            MoveToEx .hdc, 0, F_Sub.Text_Memo.Top + 11, PointX
            LineTo .hdc, F_Sub.Text_Memo.Left - 49, F_Sub.Text_Memo.Top + 11
            MoveToEx .hdc, 0, F_Sub.Text_Memo.Top + 16, PointX
            LineTo .hdc, F_Sub.Text_Memo.Left - 49, F_Sub.Text_Memo.Top + 16
        
        SelectObject .hdc, hOldPen
        DeleteObject hPen
        
        If SubBoxBoolean(3) Then _
            SubGradationAlt F_Sub.SubBox(3), F_Sub.Text_Memo.Left - 10, F_Sub.List_Memo.Top, F_Sub.List_Memo.Height + F_Sub.List_Memo.Top: _
        
    Case 4
        
    Case 5
        
    Case 6
        
End Select

End With

End Sub
Public Sub AyouSubTopBlt()
On Error Resume Next
F_Sub.TopBar.Cls

    TextPrint F_Sub.TopBar, 33, 2, GetLanInf(AyouState.Rgn_Ico(NHex)), RGB(0, 121, 255), 14
    
    If NHex = 2 Then
    
        TextPrint F_Sub.TopBar, 100, 3, "- " & GetLanInf(AyouState.Set_Ico(NSet)), RGB(0, 121, 255), 12
        
        BitBlt F_Sub.TopBar.hdc, 0, 0, 32, 32, F_Sub.IcoMask(15 + NSet).hdc, 0, 0, SRCPAINT
        BitBlt F_Sub.TopBar.hdc, 0, 0, 32, 32, F_Sub.Ico(15 + NSet).hdc, 0, 0, SRCAND
        
    Else
    
        BitBlt F_Sub.TopBar.hdc, 0, 0, 32, 32, F_Sub.IcoMask(NHex + 8).hdc, 0, 0, SRCPAINT
        BitBlt F_Sub.TopBar.hdc, 0, 0, 32, 32, F_Sub.Ico(NHex + 8).hdc, 0, 0, SRCAND
        
    End If

End Sub
Public Sub AyouBackBlt(ByVal X As Integer, ByVal Y As Integer, ByVal ImageIndex As Integer)
Dim i As Integer
F_Ayou.Cls

For i = 6 To 0 Step -1

    BitBlt F_Ayou.hdc, AyouState.Rgn_Nex(i).X + X, AyouState.Rgn_Nex(i).Y + Y, (3 ^ (1 / 2)) * AyouState.UI_Size, 2 * AyouState.UI_Size, F_Ayou.HexUIMask.hdc, 0, 0, SRCPAINT
    BitBlt F_Ayou.hdc, AyouState.Rgn_Nex(i).X + X, AyouState.Rgn_Nex(i).Y + Y, (3 ^ (1 / 2)) * AyouState.UI_Size, 2 * AyouState.UI_Size, F_Ayou.HexUIImg(i).hdc, 0, 0, SRCAND

    TextPrint F_Ayou, AyouState.Rgn_Nex(i).X + 2 + (AyouState.UI_Size * 3 ^ (1 / 2) - GetStringLen(AyouState.Rgn_Name(i), 15)) / 2 _
                , AyouState.Rgn_Nex(i).Y + (AyouState.UI_Size / 2) + 7, AyouState.Rgn_Name(i), vbBlack, 15
Next i

'이미지를 BitBlt API로 그려냅니다. 해당 폼에 그려진 이미지는 0번이 나중에칠해집니다.
End Sub
Public Sub SubGradationAlt(ByRef FormX, ByVal X As Integer, Y As Integer, H As Long)
Dim BInfo As BITMAPINFO, BgScr() As RGBQUAD
Dim i As Integer, j As Integer

With BInfo.bmiHeader
    .biSize = 40
    .biWidth = 6 + X
    .biHeight = H + Y
    .biPlanes = 1
    .biBitCount = 32
    .biCompression = 0
    .biClrUsed = 0
    .biClrImportant = 0
    .biSizeImage = .biWidth * .biHeight
End With

ReDim BgScr(0 To BInfo.bmiHeader.biWidth - 1, 0 To BInfo.bmiHeader.biHeight - 1) As RGBQUAD

GetDIBits FormX.hdc, FormX.Image.Handle, 0, BInfo.bmiHeader.biHeight, BgScr(0, 0), BInfo, 0

For j = Y + 1 To H - 2

    For i = 0 To 5
    
        BgScr(i + X, j).rgbRed = RealValue(255, 0, BgScr(i + X, j).rgbRed - 2 * (26 - 5 * i))
        BgScr(i + X, j).rgbGreen = RealValue(255, 0, BgScr(i + X, j).rgbGreen - 2 * (26 - 5 * i))
        BgScr(i + X, j).rgbBlue = RealValue(255, 0, BgScr(i + X, j).rgbBlue - 2 * (26 - 5 * i))

    Next i

Next j

SetDIBits FormX.hdc, FormX.Image.Handle, 0, BInfo.bmiHeader.biHeight, BgScr(0, 0), BInfo, 0
'`창에 입체효과 부여

End Sub
Public Sub SubGradationBlt(ByRef FormX, ByVal X As Integer, Y As Integer, H As Long)
Dim BInfo As BITMAPINFO, BgScr() As RGBQUAD
Dim i As Integer, j As Integer

With BInfo.bmiHeader
    .biSize = 40
    .biWidth = 12 + X
    .biHeight = H + Y
    .biPlanes = 1
    .biBitCount = 32
    .biCompression = 0
    .biClrUsed = 0
    .biClrImportant = 0
    .biSizeImage = .biWidth * .biHeight
End With

ReDim BgScr(0 To BInfo.bmiHeader.biWidth - 1, 0 To BInfo.bmiHeader.biHeight - 1) As RGBQUAD

GetDIBits FormX.hdc, FormX.Image.Handle, 0, BInfo.bmiHeader.biHeight, BgScr(0, 0), BInfo, 0

For j = Y + 1 To H - 2

    For i = X To X + 10
    
        BgScr(i, j).rgbRed = RealValue(255, 0, (BgScr(i, j).rgbRed * ((i - X) * 25.5) / 255) + 220 * (255 - (i - X) * 25.5) / 255)
        BgScr(i, j).rgbGreen = RealValue(255, 0, (BgScr(i, j).rgbGreen * ((i - X) * 25.5) / 255) + 220 * (255 - (i - X) * 25.5) / 255)
        BgScr(i, j).rgbBlue = RealValue(255, 0, (BgScr(i, j).rgbBlue * ((i - X) * 25.5) / 255) + 220 * (255 - (i - X) * 25.5) / 255)

    Next i

Next j

SetDIBits FormX.hdc, FormX.Image.Handle, 0, BInfo.bmiHeader.biHeight, BgScr(0, 0), BInfo, 0
'`창에 입체효과 부여

End Sub
Public Sub DrawOptionPoint()
Dim pointY(2) As POINTAPI
Dim hBrush As Long, hOldBrush As Long

    pointY(0).X = 46
    pointY(0).Y = 37 + AyouSet.Setting.IndexValue
    pointY(1).X = 38
    pointY(1).Y = 45 + AyouSet.Setting.IndexValue
    pointY(2).X = 46
    pointY(2).Y = 53 + AyouSet.Setting.IndexValue
        
        hBrush = CreateSolidBrush(RGB(0, 0, 0))
        hOldBrush = SelectObject(F_Sub.SubBox(2).hdc, hBrush)
        
        Polygon F_Sub.SubBox(2).hdc, pointY(0), 3
            
        SelectObject F_Sub.SubBox(2).hdc, hOldBrush
        DeleteObject hBrush
End Sub
Public Sub DrawUI_Click(ByVal index As Integer)
Dim X As Integer, Y As Integer
    
    X = CurX.X - (((3 ^ (1 / 2)) * AyouState.UI_Size) / 2) - AyouState.UI_Size * (2)
    Y = CurX.Y - AyouState.UI_Size - AyouState.UI_Size * (3 ^ (1 / 2))
    
End Sub
Public Sub DrawUI_Over(ByVal index As Integer)
Dim X As Integer, Y As Integer

    X = CurX.X - (((3 ^ (1 / 2)) * AyouState.UI_Size) / 2) - AyouState.UI_Size * (2)
    Y = CurX.Y - AyouState.UI_Size - AyouState.UI_Size * (3 ^ (1 / 2))

End Sub
Public Sub DrawUIImg()
Dim BInfo As BITMAPINFO, PInfo As BITMAPINFO, BgScr() As RGBQUAD
Dim R_ As Long, G_ As Long, B_ As Long, DrawOn As Boolean, i As Long, j As Long, k As Long, PointX(6) As POINTAPI
Dim hPen As Long, hBrush As Long
Dim hOldPen As Long, hOldBrush As Long

PointX(0).X = ((3 ^ (1 / 2) * AyouState.UI_Size) / 2)
PointX(0).Y = 0
PointX(1).X = 0
PointX(1).Y = (AyouState.UI_Size / 2)
PointX(2).X = 0
PointX(2).Y = ((3 * AyouState.UI_Size) / 2)
PointX(3).X = ((3 ^ (1 / 2) * AyouState.UI_Size) / 2)
PointX(3).Y = ((4 * AyouState.UI_Size) / 2)
PointX(4).X = ((3 ^ (1 / 2)) * AyouState.UI_Size)
PointX(4).Y = ((3 * AyouState.UI_Size) / 2)
PointX(5).X = ((3 ^ (1 / 2)) * AyouState.UI_Size)
PointX(5).Y = (AyouState.UI_Size / 2)

For k = 0 To 6

    F_Ayou.HexUIImg(k).Cls
    F_Ayou.HexUIImg(k).Height = 2 * AyouState.UI_Size + 1
    F_Ayou.HexUIImg(k).Width = (3 ^ (1 / 2)) * AyouState.UI_Size + 1

        hPen = CreatePen(0, 1, AyouState.BackColor(k))
        hBrush = CreateSolidBrush(AyouState.BackColor(k))
        hOldPen = SelectObject(F_Ayou.HexUIImg(k).hdc, hPen)
        hOldBrush = SelectObject(F_Ayou.HexUIImg(k).hdc, hBrush)
        
            Polygon F_Ayou.HexUIImg(k).hdc, PointX(0), 6
            
        SelectObject F_Ayou.HexUIImg(k).hdc, hOldPen
        SelectObject F_Ayou.HexUIImg(k).hdc, hOldBrush
        DeleteObject hPen
        DeleteObject hBrush

Next k
'`Hexagon에 씌울 이미지의 틀을 드로잉합니다.

    F_Ayou.HexUIMask.Cls
    F_Ayou.HexUIMask.Height = 2 * AyouState.UI_Size + 1
    F_Ayou.HexUIMask.Width = (3 ^ (1 / 2)) * AyouState.UI_Size + 1
    
        hPen = CreatePen(0, 1, vbWhite)
        hBrush = CreateSolidBrush(vbWhite)
        hOldPen = SelectObject(F_Ayou.HexUIMask.hdc, hPen)
        hOldBrush = SelectObject(F_Ayou.HexUIMask.hdc, hBrush)
    
        Polygon F_Ayou.HexUIMask.hdc, PointX(0), 6
    
        SelectObject F_Ayou.HexUIImg(k).hdc, hOldPen
        SelectObject F_Ayou.HexUIImg(k).hdc, hOldBrush
        DeleteObject hPen
        DeleteObject hBrush
'`Hexagon에 씌울 이미지마스크의 틀을 드로잉합니다.

End Sub
Public Sub MessageBlt()
Dim Xcnt As Integer, i_ As Integer, i As Integer
Xcnt = 0
'메세지박스를 보이는 구간에만 그리도록하고
'휠설정에따른 효과를 부여합니다.
F_Sub.SubBox(0).Cls
    
For i_ = 0 To 250

    With MessageX(i_)
    
    If ChatY - .Y > -400 And ChatY - .Y < 0 Then MessageBoxBlt .X, .Y - ChatY, .Width, .Height, .Who
    
    End With
    
        If LenB(MessageX(i_).Text) = 0 Then Exit Sub
            
        For i = Xcnt To 500
        
            If MessageXtext(i).index > i_ Then Exit For
            
                With MessageXtext(i)
                
                If ChatY - .Y > -400 And ChatY - .Y < 0 Then
                
                    If MessageXtext(i).index = i_ Then TextPrint F_Sub.SubBox(0), .X, .Y - ChatY, .Text, vbBlack, 10
                    
                End If
                
                End With
        Next i
    
    BitBlt F_Sub.SubBox(0).hdc, 0, ChatLY - ChatY - 70, 260, 100, F_Ayou.Pic_Logo.hdc, 0, 0, SRCAND

Next i_

End Sub
Public Sub MessageBoxBlt(ByVal X As Long, ByVal Y As Long, ByVal Width As Integer, ByVal Height As Integer, ByVal Who As Boolean)
Dim Whois As Byte, i As Integer, j As Integer
Dim PointX(2) As POINTAPI
Dim hPen As Long, hBrush As Long
Dim hOldPen As Long, hOldBrush As Long

Whois = BooleanValue(Who)


 If Who Then
 
    PointX(0).X = X + Width - 21
    PointX(0).Y = Y + Height - 36
    PointX(1).X = X + Width - 13
    PointX(1).Y = Y + Height - 28
    PointX(2).X = X + Width - 21
    PointX(2).Y = Y + Height - 20
    
Else

    PointX(0).X = X + 1
    PointX(0).Y = Y + Height - 36
    PointX(1).X = X - 7
    PointX(1).Y = Y + Height - 28
    PointX(2).X = X + 1
    PointX(2).Y = Y + Height - 20
    
End If

hPen = CreatePen(0, 1, vbBlack)
hBrush = CreateSolidBrush(vbWhite)
hOldPen = SelectObject(F_Sub.SubBox(0).hdc, hPen)
hOldBrush = SelectObject(F_Sub.SubBox(0).hdc, hBrush)

    Polygon F_Sub.SubBox(0).hdc, PointX(0), 3
    RoundRect F_Sub.SubBox(0).hdc, X + 1, Y + 3, X + Width - 20, Y + Height - 15, 5, 5

SelectObject F_Sub.SubBox(0).hdc, hOldPen
SelectObject F_Sub.SubBox(0).hdc, hOldBrush
DeleteObject hPen
DeleteObject hBrush

End Sub
