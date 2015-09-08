Attribute VB_Name = "bBas"
Option Explicit
Private Declare Function SetPixelV Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal crcolor As Long) As Long
Private Declare Function SetPixel Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal crcolor As Long) As Long
Private Declare Function GetPixel Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function TranslateColor Lib "olepro32.dll" Alias "OleTranslateColor" (ByVal clr As OLE_COLOR, ByVal palet As Long, Col As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Const SRCCOPY As Long = &HCC0020
Public Sub TextPrint(ByRef Fm, ByVal X As Long, ByVal Y As Long, ByVal TextIn As String, ByVal Color As Long, ByVal FontSize As Integer)
Dim FS As Integer
            If FontSize Then FS = Fm.FontSize: Fm.FontSize = FontSize:
            If Color = -1 Then
                Fm.ForeColor = RGB(RedCntF, GreenCntF, BlueCntF)
            Else
                Fm.ForeColor = Color
            End If
            TextOut Fm.hDC, X, Y, TextIn, LenB(StrConv(TextIn, vbFromUnicode))
            If FontSize Then Fm.FontSize = FS
End Sub
Public Sub MainBlt()
If Noti.Height > 3 Then Noti.Cls
If Notifi.Visible = True Then Notifi.ButtonSpace.Cls

    If Notifi.Visible Then
        BitBlt Noti.hDC, 0, 0, ScreenHeight, 375, Notifi.hDC, -3, PixV(-Notifi.Top), SRCAND
        BitBlt Noti.hDC, 0, 0, 3, 25, Noti.BG2.hDC, ((1600 - ScreenHeight) / 2) - 3, PixV(-Notifi.Top), SRCAND
        TextPrint Noti, 75, (Noti.Height / 15) - 23, (RemindXT), vbWhite, 0
        BitBlt Notifi.ButtonSpace.hDC, 0, 0, 64, 424, Notifi.hDC, Notifi.ButtonSpace.Left, Notifi.ButtonSpace.Top, SRCAND
        If Notifi.Top = 0 Then GradationMenu
    Else
        BitBlt Noti.hDC, 0, 0, ScreenHeight, 375, Noti.BG2.hDC, ((1600 - ScreenHeight) / 2) - 3, PixV(7725), SRCAND
        TextPrint Noti, 75, (Noti.Height / 15) - 23, (RemindXT), vbWhite, 0
    End If
    
    BitBlt Noti.hDC, ScreenHeight - 27, (Noti.Height / 15) - 24, 20, 20, Noti.iConP.hDC, 0, 0, SRCAND
    BitBlt Noti.hDC, ScreenHeight - 27, (Noti.Height / 15) - 24, 20, 20, Noti.iConP.hDC, 40, 0, SRCPAINT
    
    BitBlt Noti.hDC, 36, (Noti.Height / 15) - 23, 20, 20, Noti.iConP.hDC, 0, 0, SRCAND
    BitBlt Noti.hDC, 36, (Noti.Height / 15) - 23, 20, 20, Noti.iConP.hDC, 20, 0, SRCPAINT
    
    TextPrint Noti, 2, (Noti.Height / 15) - 23, "Cris", RGB(RedCntF, GreenCntF, BlueCntF), 0
    TextPrint Noti, ScreenHeight - GetStringLen(TimerCal, 0) - 30, (Noti.Height / 15) - 23, TimerCal, vbWhite, 0

End Sub
Public Sub RayBlt()
With Notifi
.RaySpace.Cls

    BitBlt .RaySpace.hDC, 0, 0, 20, 20, Noti.BG2.hDC, ((1600 - ScreenHeight) / 2) + 100, 85, SRCAND
    BitBlt .RaySpace.hDC, 0, 405, 20, 20, Noti.BG2.hDC, ((1600 - ScreenHeight) / 2) + 100, 490, SRCAND
    
    BitBlt .RaySpace.hDC, 0, 0, 165, 425, Noti.NoteBack.hDC, 0, 0, SRCPAINT
    BitBlt .RaySpace.hDC, 0, 0, 165, 425, Noti.NoteRay.hDC, 0, 0, SRCAND
    
Select Case T_State
    Case 0
        For i = 0 To 3
            TextPrint .RaySpace, 5, 50 + 100 * i, HomeString(i), vbWhite, 16
        Next i
            .SBox.Visible = False

    Case 1
            SearchBlt
            .SBox.Visible = True

    Case 2
            .SBox.Visible = False

    Case 3
                For j = 0 To MemoXCnt
                    TextPrint .RaySpace, 13, 50 + j * 30, Left$((MemoX(j).Title), StringCut((MemoX(j).Title), 150, 14)), vbWhite, 14
                Next j
            SearchBlt
            .SBox.Visible = True
End Select
End With
End Sub
Public Sub SearchBlt()
    BitBlt Notifi.RaySpace.hDC, 10, 15, 20, 20, Noti.iConP.hDC, 60, 0, SRCPAINT
    BitBlt Notifi.RaySpace.hDC, 10, 15, 20, 20, Noti.iConP.hDC, 0, 0, SRCAND
End Sub
Public Sub NoteBlt()
With Notifi
    BitBlt .hDC, 265, 30, 30, 500, Noti.Note_White.hDC, 0, 0, SRCPAINT
    BitBlt .hDC, 265, 30, 30, 500, Noti.Note_Left.hDC, 0, 0, SRCAND

For i = 0 To ((ScreenHeight - 250) \ 30) - 3
    BitBlt .hDC, 295 + 30 * i, 30, 30, 500, Noti.Note_White.hDC, 0, 0, SRCPAINT
    BitBlt .hDC, 295 + 30 * i, 30, 30, 500, Noti.Note_Center.hDC, 0, 0, SRCAND
Next i
    
    BitBlt .hDC, ScreenHeight - 45, 30, 30, 500, Noti.Note_White.hDC, 0, 0, SRCPAINT
    BitBlt .hDC, ScreenHeight - 45, 30, 30, 500, Noti.Note_Right.hDC, 0, 0, SRCAND
    
    BitBlt .hDC, 265, 30, 30, 30, Noti.iConL.hDC, 0, 0, SRCPAINT
    BitBlt .hDC, 265, 30, 30, 30, Noti.iConN.hDC, 0, 0, SRCAND
    
    BitBlt .hDC, ScreenHeight - 45, 30, 30, 30, Noti.iConL.hDC, 0, 0, SRCPAINT
    BitBlt .hDC, ScreenHeight - 45, 30, 30, 30, Noti.iConN.hDC, 30, 0, SRCAND
    

    BitBlt .hDC, ScreenHeight - 80, 30, 30, 30, Noti.iConL.hDC, 0, 0, SRCPAINT
    BitBlt .hDC, ScreenHeight - 80, 30, 30, 30, Noti.iConN.hDC, 90, 0, SRCAND

    'BitBlt .hDC, ScreenHeight - 80, 30, 30, 30, Noti.iConL.hDC, 0, 0, SRCPAINT
    'BitBlt .hDC, ScreenHeight - 80, 30, 30, 30, Noti.iConN.hDC, 60, 0, SRCAND
End With
End Sub
Public Sub Messageblt()
fTalk.Cls
Dim Xcnt As Integer, i_ As Integer
Xcnt = 0

    TextPrint fTalk.TopBar, 3, 1, "Cris", RGB(RedCntF, GreenCntF, BlueCntF), 14
    
For i_ = 0 To 250
        If LenB(MessageX(i_).Text) = 0 Then Exit Sub
            
        For i = Xcnt To 500
            If MessageXtext(i).Index > i_ Then Exit For
                With MessageXtext(i)
                    If MessageXtext(i).Index = i_ Then TextPrint fTalk, .X, .Y - ChatY, .Text, vbBlack, 10
                End With
        Next i
    With MessageX(i_)
        MessageBoxBlt .X, .Y - ChatY, .Width, .Height, .Who
    End With
Next i_

End Sub
Public Sub MessageBoxBlt(ByVal X As Long, ByVal Y As Long, ByVal Width As Integer, ByVal Height As Integer, ByVal Who As Boolean)
Dim M_Width, M_Height, Whois As Byte
Const TopL = 0, TopM = 1, TopR = 2, RightM = 3, Tail = 4, BottomR = 5, BottomM = 6, BottomL = 7, LeftM = 8
M_Width = Array(10, 1, 12, 12, 12, 12, 1, 10, 10)
M_Height = Array(9, 9, 9, 1, 12, 11, 11, 11, 1)
Whois = 0
If Who Then
    BitBlt fTalk.hDC, X + Width - M_Width(RightM) - M_Width(RightM) - 5 + M_Width(RightM), Y + Height - M_Height(BottomR) - M_Height(Tail) - 6, M_Width(Tail), M_Height(Tail), Noti.BubI(Tail).hDC, M_Width(Tail), 0, SRCAND
    Whois = 1
Else
    BitBlt fTalk.hDC, X - M_Width(Tail) + 1, Y + Height - M_Height(BottomR) - M_Height(Tail) - 6, M_Width(Tail), M_Height(Tail), Noti.BubI(Tail).hDC, 0, 0, SRCAND
End If
For i = M_Width(TopL) To Width - M_Width(TopL) - M_Width(RightM) - 5 Step 10
    For j = M_Height(TopR) To Height - M_Height(BottomR) - M_Height(Tail) Step 10
        BitBlt fTalk.hDC, X + i, Y + j, 10, 10, Noti.BubI(9).hDC, Whois * 10, 0, SRCAND
    Next j
Next i
        BitBlt fTalk.hDC, X, Y, M_Width(TopL), M_Height(TopL), Noti.BubI(TopL).hDC, Whois * M_Width(TopL), 0, SRCAND
For i = M_Width(TopL) To Width - M_Width(TopL) - M_Width(RightM) - 5
    BitBlt fTalk.hDC, X + i, Y, M_Width(TopM), M_Height(TopM), Noti.BubI(TopM).hDC, Whois * M_Width(TopM), 0, SRCAND
Next i
        BitBlt fTalk.hDC, X + Width - 4 - M_Width(TopL) - M_Width(RightM), Y, M_Width(TopR), M_Height(TopR), Noti.BubI(TopR).hDC, Whois * M_Width(TopR), 0, SRCAND
For i = M_Height(TopR) To Height - M_Height(BottomR) - M_Height(Tail)
    BitBlt fTalk.hDC, X + Width - M_Width(RightM) - M_Width(RightM) - 2, Y + i, M_Width(RightM), M_Height(RightM), Noti.BubI(RightM).hDC, Whois * M_Width(RightM), 0, SRCAND
Next i
        BitBlt fTalk.hDC, X + Width - M_Width(RightM) - M_Width(RightM) - 2 - Whois, Y + Height - M_Height(BottomR) - M_Height(Tail), M_Width(BottomR), M_Height(BottomR), Noti.BubI(BottomR).hDC, Whois * M_Width(BottomR), 0, SRCAND
For i = Width - M_Width(TopL) - M_Width(TopR) To M_Width(TopL) Step -1
    BitBlt fTalk.hDC, X + i, Y + Height - M_Height(BottomR) - M_Height(Tail), M_Width(BottomM), M_Height(BottomM), Noti.BubI(BottomM).hDC, Whois * M_Width(BottomM), 0, SRCAND
Next i
        BitBlt fTalk.hDC, X, Y + Height - M_Height(BottomR) - M_Height(Tail), M_Width(BottomL), M_Height(BottomL), Noti.BubI(BottomL).hDC, Whois * M_Width(BottomL), 0, SRCAND
For i = Height - M_Height(BottomR) - M_Height(Tail) To M_Height(TopR) Step -1
    BitBlt fTalk.hDC, X, Y + i, M_Width(LeftM), M_Height(LeftM), Noti.BubI(LeftM).hDC, Whois * M_Width(LeftM), 0, SRCAND
Next i
End Sub
Public Sub NotifiBlt()
With Notifi
    .Cls
        BitBlt .hDC, 0, 0, ScreenHeight, 540, Noti.BG2.hDC, (1600 - ScreenHeight) / 2, 0, SRCAND
        
    For i = 0 To 3
        BitBlt .hDC, iConLP(i).X, iConLP(i).Y, 64, 64, Noti.iConL.hDC, 0, 0, SRCAND
        BitBlt .hDC, iConLP(i).X, iConLP(i).Y, 64, 64, Noti.iConL.hDC, 64 * i, 64, SRCPAINT
    Next i

RayBlt

Select Case T_State
    Case 0
            .Tbox.Visible = False
            .TTitle.Visible = False

    Case 1
            .Tbox.Visible = False
            .TTitle.Visible = False

    Case 2
            .Tbox.Visible = False
            .TTitle.Visible = False

    Case 3
            NoteBlt
            .TTitle.Visible = True
            .Tbox.Visible = True
End Select

    TextPrint Notifi, 145, 40, HomeTitle(T_State), vbWhite, 20
    GradationText 145, 40, GetStringLen(HomeTitle(T_State), 20), GetStringHeight(HomeTitle(T_State), 20), vbWhite
    GradationLine 90, 40, 450, 1, 2
    
    
End With
End Sub
'~Gradation Function - By Maybe
Private Sub GradationText(ByVal X As Integer, ByVal Y As Integer, ByVal Width As Integer, ByVal Height As Integer, ByVal Color As Long)
Dim r_ As Long, g_ As Long, b_ As Long
    For i = 0 To Width * 1.5
        For j = 0 To Height * 1.5
            If GetPixel(Notifi.hDC, i + X, j + Y) + 100 > Color And Color > GetPixel(Notifi.hDC, i + X, j + Y) - 100 Then
                GetRGB r_, g_, b_, GetPixel(Notifi.hDC, i + X, j + Y)
                SetPixelV Notifi.hDC, i + X, j + Y, RGB(r_ - 2 * (i), g_ - 2 * (i), b_ - 2 * (i))
            End If
        Next j
    Next i
End Sub
Private Sub GradationLine(ByVal X1 As Integer, ByVal Y1 As Integer, ByVal Height As Integer, ByVal Width As Integer, ByVal Dx As Double)
Dim r_ As Long, g_ As Long, b_ As Long
    For j = 0 To (Width - 1)
        For i = 0 To Height
            GetRGB r_, g_, b_, GetPixel(Notifi.hDC, X1 + j - Int(Width / 2), Y1 + i)
            N_Integer = i / Dx
            If i >= (Height / 2) Then N_Integer = (Height - i) / Dx
            SetPixelV Notifi.hDC, X1 + j - Int(Width / 2), Y1 + i, RGB(r_ + N_Integer, g_ + N_Integer, b_ + N_Integer)
        Next i
    Next j
End Sub
Private Sub GradationMenu()
Dim r_ As Long, g_ As Long, b_ As Long
    For j = 0 To (128 - 1)
        For i = 0 To 32
            GetRGB r_, g_, b_, GetPixel(Notifi.hDC, j - Int(64 / 2) + 15, CurS.Y + i - Notifi.ButtonSpace.Top + 44)
            N_Integer = 3 * i
            If i >= (32 / 2) Then N_Integer = 3 * (32 - i)
            SetPixel Notifi.ButtonSpace.hDC, j - Int(64 / 2), CurS.Y + i - Notifi.ButtonSpace.Top - 16, RGB(r_ + N_Integer, g_ + N_Integer, b_ + N_Integer)
        Next i
    Next j
End Sub
'~ Gradation Function - By Maybe
Public Sub GetRGB(r As Long, g As Long, b As Long, Color As Long)
    TranslateColor Color, 0, N_Long
    r = (N_Long And &HFF&)
    g = (N_Long And &HFF00&) \ &H100&
    b = (N_Long And &HFF0000) \ &H10000
End Sub
