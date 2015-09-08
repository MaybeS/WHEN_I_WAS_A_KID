Attribute VB_Name = "B_bas"
Option Explicit

Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchBlt Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long

Private Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long, ByVal lpString As String, ByVal nCount As Long) As Long

Private Declare Function GetDIBits Lib "gdi32" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Private Declare Function SetDIBits Lib "gdi32" (ByVal hdc As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Private Declare Function SetPixelV Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long, ByVal crColor As Long) As Long
Private Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long) As Long
Public Declare Function TranslateColor Lib "olepro32.dll" Alias "OleTranslateColor" (ByVal clr As OLE_COLOR, ByVal palet As Long, Col As Long) As Long

Public Declare Function Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Public Declare Function RoundRect Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Public Declare Function Ellipse Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Public Declare Function Polygon Lib "gdi32" (ByVal hdc As Long, lpPoint As POINTAPI, ByVal nCount As Long) As Long

Public Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Public Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Public Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long

Public Declare Function LineTo Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long) As Long
Public Declare Function MoveToEx Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long, lpPoint As POINTAPI) As Long

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
Public Sub TextPrint(ByRef Fm, ByVal x As Long, ByVal Y As Long, ByVal TextIn As String, ByVal Color As Long, ByVal FontSize As Integer)
Dim Fs As Integer
        If FontSize Then Fs = Fm.FontSize: Fm.FontSize = FontSize:
        Fm.ForeColor = Color
        TextOut Fm.hdc, x, Y, TextIn, LenB(StrConv(TextIn, vbFromUnicode))
        If FontSize Then Fm.FontSize = Fs

'해당 폼에 텍스트를 출력합니다.
End Sub
Public Sub LucidBlt(ByRef hdc As Long, ByVal Height As Long, ByVal Width As Long)
Dim PointX As POINTAPI

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
    
    MoveToEx hdc, 30, 0, PointX
    LineTo hdc, 30, Height - 1
    MoveToEx hdc, 30, Height - 1, PointX
    LineTo hdc, Width - 1, Height - 1
    MoveToEx hdc, Width - 1, 0, PointX
    LineTo hdc, 30, 0
    '뒷부분 사각형
    
End Sub
Public Sub CrisSubBlt(ByVal TriangleY As Integer, ByVal Width As Integer, ByVal Height As Integer)
Dim i As Integer, PointX As POINTAPI
F_Sub.DrawWidth = 2

    MoveToEx F_Sub.hdc, 40, 0, PointX
    LineTo F_Sub.hdc, 40, TriangleY + 1
    MoveToEx F_Sub.hdc, 40, TriangleY + 1, PointX
    LineTo F_Sub.hdc, 15, TriangleY + 26
    MoveToEx F_Sub.hdc, 15, TriangleY + 26, PointX
    LineTo F_Sub.hdc, 40, TriangleY + 52 - 1
    MoveToEx F_Sub.hdc, 40, TriangleY + 52 - 1, PointX
    LineTo F_Sub.hdc, 40, Height
    MoveToEx F_Sub.hdc, 40, Height, PointX
    LineTo F_Sub.hdc, 43, Height
    MoveToEx F_Sub.hdc, 43, Height, PointX
    LineTo F_Sub.hdc, 43, 0
    MoveToEx F_Sub.hdc, 43, 0, PointX
    LineTo F_Sub.hdc, 40, 0
    '삼각형과 직선
    
    F_Sub.Circle (32, TriangleY + 26), 5, vbBlack
    '원
    
    MoveToEx F_Sub.hdc, 50, 0, PointX
    LineTo F_Sub.hdc, 50, Height
    MoveToEx F_Sub.hdc, 50, Height, PointX
    LineTo F_Sub.hdc, Width, Height
    MoveToEx F_Sub.hdc, Width, Height, PointX
    LineTo F_Sub.hdc, Width, 0
    MoveToEx F_Sub.hdc, Width, 0, PointX
    LineTo F_Sub.hdc, 50, 0
    '사각형
        
    CrisSubBoxBlt

    CrisSubTopBlt

End Sub
Public Sub CrisSubBoxBlt()
On Error Resume Next
Dim PointX As POINTAPI, i As Integer

F_Sub.SubBox(NHex).Cls

Select Case NHex

    Case 0
    Case 1
        
    Case 2
        
        For i = 0 To 6
            
            BitBlt F_Sub.SubBox(2).hdc, 10, 70 + 35 * i, 32, 32, F_Sub.IcoMask(15 + i).hdc, 0, 0, SRCPAINT
            BitBlt F_Sub.SubBox(2).hdc, 10, 70 + 35 * i, 32, 32, F_Sub.Ico(15 + i).hdc, 0, 0, SRCAND
            
        Next i
        
        DrawOptionPoint
        
        MoveToEx F_Sub.SubBox(2).hdc, 47, 35, PointX
        LineTo F_Sub.SubBox(2).hdc, 47, F_Sub.SubBox(2).Height - 5
        MoveToEx F_Sub.SubBox(2).hdc, 48, 35, PointX
        LineTo F_Sub.SubBox(2).hdc, 48, F_Sub.SubBox(2).Height - 5
        
        SubGradationBlt F_Sub.SubBox(NHex), 0, 0, CrisSet.SubForm(NHex).Height
            
        CrisSubTopBlt

    Case 3
        
        For i = 0 To 5
        
            BitBlt F_Sub.SubBox(3).hdc, 20 + 50 * i, F_Sub.Text_Memo.Top - 35, 32, 32, F_Sub.IcoMask(i).hdc, 0, 0, SRCPAINT
            BitBlt F_Sub.SubBox(3).hdc, 20 + 50 * i, F_Sub.Text_Memo.Top - 35, 32, 32, F_Sub.Ico(i).hdc, 0, 0, SRCAND
        
        Next i
            
            BitBlt F_Sub.SubBox(3).hdc, F_Sub.Text_Memo.Left - 40, F_Sub.Text_Memo.Top, 32, 32, F_Sub.IcoMask(22).hdc, 0, 0, SRCPAINT
            BitBlt F_Sub.SubBox(3).hdc, F_Sub.Text_Memo.Left - 40, F_Sub.Text_Memo.Top, 32, 32, F_Sub.Ico(22).hdc, 0, 0, SRCAND
        
    Case 4
        
    Case 5
        
    Case 6
        
End Select

End Sub
Public Sub CrisSubTopBlt()
On Error Resume Next
F_Sub.TopBar.Cls

    TextPrint F_Sub.TopBar, 33, 2, GetLanInf(CrisState.Rgn_Ico(NHex)), RGB(0, 121, 255), 14
    
    If NHex = 2 Then
    
        TextPrint F_Sub.TopBar, 100, 3, "- " & GetLanInf(CrisState.Set_Ico(NSet)), RGB(0, 121, 255), 12
        
        BitBlt F_Sub.TopBar.hdc, 0, 0, 32, 32, F_Sub.IcoMask(15 + NSet).hdc, 0, 0, SRCPAINT
        BitBlt F_Sub.TopBar.hdc, 0, 0, 32, 32, F_Sub.Ico(15 + NSet).hdc, 0, 0, SRCAND
        
    Else
    
        BitBlt F_Sub.TopBar.hdc, 0, 0, 32, 32, F_Sub.IcoMask(NHex + 8).hdc, 0, 0, SRCPAINT
        BitBlt F_Sub.TopBar.hdc, 0, 0, 32, 32, F_Sub.Ico(NHex + 8).hdc, 0, 0, SRCAND
        
    End If

End Sub
Public Sub CrisBackBlt(ByVal x As Integer, ByVal Y As Integer, ByVal ImageIndex As Integer)
Dim i As Integer
F_Cris.Cls

For i = 6 To 0 Step -1

    BitBlt F_Cris.hdc, CrisState.Rgn_Nex(i).x + x, CrisState.Rgn_Nex(i).Y + Y, (3 ^ (1 / 2)) * CrisState.UI_Size, 2 * CrisState.UI_Size, F_Cris.HexUIMask.hdc, 0, 0, SRCPAINT
    BitBlt F_Cris.hdc, CrisState.Rgn_Nex(i).x + x, CrisState.Rgn_Nex(i).Y + Y, (3 ^ (1 / 2)) * CrisState.UI_Size, 2 * CrisState.UI_Size, F_Cris.HexUIImg(i).hdc, 0, 0, SRCAND

    TextPrint F_Cris, CrisState.Rgn_Nex(i).x + 2 + (CrisState.UI_Size * 3 ^ (1 / 2) - GetStringLen(CrisState.Rgn_Name(i), 15)) / 2 _
                , CrisState.Rgn_Nex(i).Y + (CrisState.UI_Size / 2) + 7, CrisState.Rgn_Name(i), vbBlack, 15
Next i

'이미지를 BitBlt API로 그려냅니다. 해당 폼에 그려진 이미지는 0번이 나중에칠해집니다.
End Sub
Public Sub SubGradationBlt(ByRef FormX, ByVal x As Integer, Y As Integer, H As Long)
Dim BInfo As BITMAPINFO, BgScr() As RGBQUAD
Dim i As Integer, j As Integer

With BInfo.bmiHeader
    .biSize = 40
    .biWidth = 150
    .biHeight = H
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

    For i = x To x + 10
    
            BgScr(i, j).rgbRed = RealValue(255, 0, (BgScr(i, j).rgbRed * ((i - x) * 25.5) / 255) + 195 * (255 - (i - x) * 25.5) / 255)
            BgScr(i, j).rgbGreen = RealValue(255, 0, (BgScr(i, j).rgbGreen * ((i - x) * 25.5) / 255) + 195 * (255 - (i - x) * 25.5) / 255)
            BgScr(i, j).rgbBlue = RealValue(255, 0, (BgScr(i, j).rgbBlue * ((i - x) * 25.5) / 255) + 195 * (255 - (i - x) * 25.5) / 255)

    Next i

Next j

SetDIBits FormX.hdc, FormX.Image.Handle, 0, BInfo.bmiHeader.biHeight, BgScr(0, 0), BInfo, 0
'`창에 입체효과 부여

End Sub
Public Sub DrawOptionPoint()
Dim pointY(2) As POINTAPI, BrushSelect As Long

    pointY(0).x = 46
    pointY(0).Y = 37 + CrisSet.Setting.IndexValue
    pointY(1).x = 38
    pointY(1).Y = 45 + CrisSet.Setting.IndexValue
    pointY(2).x = 46
    pointY(2).Y = 53 + CrisSet.Setting.IndexValue
        
        BrushSelect = SelectObject(F_Sub.SubBox(2).hdc, CreateSolidBrush(RGB(0, 0, 0)))
        Polygon F_Sub.SubBox(2).hdc, pointY(0), 3
        DeleteObject BrushSelect
        
End Sub
Public Sub DrawUI_Click(ByVal Index As Integer)
Dim x As Integer, Y As Integer
    
    
    x = CurX.x - (((3 ^ (1 / 2)) * CrisState.UI_Size) / 2) - CrisState.UI_Size * (2)
    Y = CurX.Y - CrisState.UI_Size - CrisState.UI_Size * (3 ^ (1 / 2))
    
End Sub
Public Sub DrawUI_Over(ByVal Index As Integer)
Dim x As Integer, Y As Integer

    x = CurX.x - (((3 ^ (1 / 2)) * CrisState.UI_Size) / 2) - CrisState.UI_Size * (2)
    Y = CurX.Y - CrisState.UI_Size - CrisState.UI_Size * (3 ^ (1 / 2))

End Sub
Public Sub DrawUIImg()
Dim BInfo As BITMAPINFO, PInfo As BITMAPINFO, BgScr() As RGBQUAD
Dim R_ As Long, G_ As Long, B_ As Long, DrawOn As Boolean, i As Long, j As Long, k As Long
Dim PenSelect As Long, BrushSelect As Long, PointX(6) As POINTAPI

PointX(0).x = ((3 ^ (1 / 2) * CrisState.UI_Size) / 2)
PointX(0).Y = 0
PointX(1).x = 0
PointX(1).Y = (CrisState.UI_Size / 2)
PointX(2).x = 0
PointX(2).Y = ((3 * CrisState.UI_Size) / 2)
PointX(3).x = ((3 ^ (1 / 2) * CrisState.UI_Size) / 2)
PointX(3).Y = ((4 * CrisState.UI_Size) / 2)
PointX(4).x = ((3 ^ (1 / 2)) * CrisState.UI_Size)
PointX(4).Y = ((3 * CrisState.UI_Size) / 2)
PointX(5).x = ((3 ^ (1 / 2)) * CrisState.UI_Size)
PointX(5).Y = (CrisState.UI_Size / 2)

For k = 0 To 6

    F_Cris.HexUIImg(k).Cls
    F_Cris.HexUIImg(k).Height = 2 * CrisState.UI_Size + 1
    F_Cris.HexUIImg(k).Width = (3 ^ (1 / 2)) * CrisState.UI_Size + 1
    
    PenSelect = SelectObject(F_Cris.HexUIImg(k).hdc, CreatePen(0, 1, CrisState.BackColor(k)))
    BrushSelect = SelectObject(F_Cris.HexUIImg(k).hdc, CreateSolidBrush(CrisState.BackColor(k)))
    Polygon F_Cris.HexUIImg(k).hdc, PointX(0), 6
    
    DeleteObject PenSelect
    DeleteObject BrushSelect
    
Next k
'`Hexagon에 씌울 이미지의 틀을 드로잉합니다.

    F_Cris.HexUIMask.Cls
    F_Cris.HexUIMask.Height = 2 * CrisState.UI_Size + 1
    F_Cris.HexUIMask.Width = (3 ^ (1 / 2)) * CrisState.UI_Size + 1
    
    PenSelect = SelectObject(F_Cris.HexUIMask.hdc, CreatePen(0, 1, vbWhite))
    BrushSelect = SelectObject(F_Cris.HexUIMask.hdc, CreateSolidBrush(vbWhite))
    Polygon F_Cris.HexUIMask.hdc, PointX(0), 6
    
    DeleteObject PenSelect
    DeleteObject BrushSelect
'`Hexagon에 씌울 이미지마스크의 틀을 드로잉합니다.

End Sub
Public Sub Messageblt()
Dim Xcnt As Integer, i_ As Integer, i As Integer
Xcnt = 0
'메세지박스를 보이는 구간에만 그리도록하고
'휠설정에따른 효과를 부여합니다.

F_Sub.SubBox(0).Cls
    
For i_ = 0 To 250

    With MessageX(i_)
    
    If ChatY - .Y > -350 And ChatY - .Y < 0 Then MessageBoxBlt .x, .Y - ChatY, .Width, .Height, .Who
    
    End With
    
        If LenB(MessageX(i_).Text) = 0 Then Exit Sub
            
        For i = Xcnt To 500
        
            If MessageXtext(i).Index > i_ Then Exit For
            
                With MessageXtext(i)
                
                If ChatY - .Y > -350 And ChatY - .Y < 0 Then
                
                    If MessageXtext(i).Index = i_ Then TextPrint F_Sub.SubBox(0), .x, .Y - ChatY, .Text, vbBlack, 10
                    
                End If
                
                End With
        Next i
    
    BitBlt F_Sub.SubBox(0).hdc, 0, ChatLY - ChatY - 120, 260, 100, F_Cris.Pic_Logo.hdc, 0, 0, SRCAND

Next i_

End Sub
Public Sub MessageBoxBlt(ByVal x As Long, ByVal Y As Long, ByVal Width As Integer, ByVal Height As Integer, ByVal Who As Boolean)
Dim Whois As Byte, i As Integer, j As Integer
Dim PointX(2) As POINTAPI
Dim SelectPen As Long, SelectBrush As Long

Whois = BooleanValue(Who)
    
 If Who Then
    PointX(0).x = x + Width - 21
    PointX(0).Y = Y + Height - 36
    PointX(1).x = x + Width - 13
    PointX(1).Y = Y + Height - 28
    PointX(2).x = x + Width - 21
    PointX(2).Y = Y + Height - 20
Else
    PointX(0).x = x + 1
    PointX(0).Y = Y + Height - 36
    PointX(1).x = x - 7
    PointX(1).Y = Y + Height - 28
    PointX(2).x = x + 1
    PointX(2).Y = Y + Height - 20
End If
    
SelectPen = SelectObject(F_Sub.SubBox(0).hdc, CreatePen(0, 1, vbBlack))
SelectBrush = SelectObject(F_Sub.SubBox(0).hdc, CreateSolidBrush(vbWhite))

    Polygon F_Sub.SubBox(0).hdc, PointX(0), 3
    RoundRect F_Sub.SubBox(0).hdc, x + 1, Y + 3, x + Width - 20, Y + Height - 15, 5, 5

DeleteObject SelectPen
DeleteObject SelectBrush

End Sub
