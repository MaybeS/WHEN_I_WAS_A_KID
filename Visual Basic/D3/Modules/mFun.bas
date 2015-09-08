Attribute VB_Name = "mFun"
Option Explicit
Declare Function PlgBlt Lib "gdi32.dll" (ByVal hdcDest As Long, ByRef lpPoint As POINTAPI, ByVal hdcSrc As Long, ByVal nXSrc As Long, ByVal nYSrc As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hbmMask As Long, ByVal xMask As Long, ByVal yMask As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086

Public Type POINTAPI
    X As Long
    Y As Long
End Type

Public SetaX(1000) As Long, SetaY(1000) As Long, SetaZ(1000) As Long
Public Listmap(1000) As Integer, PointXYZ(1000, 3, 2) As Long

Public ActIndex As Integer, SetaPlus As Long, BarXW As Long, RotateR As Boolean, RotateRN As Boolean
Public Frames As Integer, TTL As String, RotateCNT As Integer
Private Const PI = 3.141592653
Public Function TurnX(ByVal index As Integer)
    
End Function
Public Function TurnY(ByVal index As Integer)

End Function
Public Function TurnZ(ByVal index As Integer)

End Function
Public Function DRAWPLG(ByVal index As Integer)
On Error Resume Next
Dim pt(0 To 3) As POINTAPI
With fMain.picBox(index)
            pt(0).X = 500 + (-(.ScaleWidth) * Cos(XSeta(SetaY(index) + 180)) * Cos(XSeta(SetaZ(index) + 135)))
            pt(0).Y = 500 + ((.ScaleHeight) * Sin(XSeta(SetaX(index))) * Sin(XSeta(SetaZ(index) + 135)))
            pt(1).X = 500 + ((.ScaleWidth) * Cos(XSeta(SetaY(index))) * Cos(XSeta(SetaZ(index) + 45)))
            pt(1).Y = 500 + ((.ScaleHeight) * Sin(XSeta(SetaX(index))) * Sin(XSeta(SetaZ(index) + 45)))
            pt(2).X = 500 + (-(.ScaleWidth) * Cos(XSeta(SetaY(index) + 180)) * Cos(XSeta(SetaZ(index) + 225)))
            pt(2).Y = 500 + (-(.ScaleHeight) * Sin(XSeta(SetaX(index) + 180)) * Sin(XSeta(SetaZ(index) + 225)))
                PlgBlt fMain.BG.hdc, pt(0), .hdc, 0, 0, .ScaleWidth, .ScaleHeight, 0, 0, 0
                Frames = Frames + 1
                DrawGrid
End With
End Function
Public Sub DrawGrid()
On Error Resume Next
If fPop.ChGrid.Value = 1 Then
Dim i As Integer
    For i = 0 To ((FWidth + GridStep) / 2) Step GridStep
        fMain.BG.Line (i + (FWidth / 2), 0)-(i + (FWidth / 2), FHeight), GridRGB
        fMain.BG.Line (-i + (FWidth / 2), 0)-(-i + (FWidth / 2), FHeight), GridRGB
    Next i
    For i = 0 To ((FHeight + GridStep) / 2) Step GridStep
        fMain.BG.Line (0, i + (FHeight / 2))-(FWidth, i + (FHeight / 2)), GridRGB
        fMain.BG.Line (0, -i + (FHeight / 2))-(FWidth, -i + (FHeight / 2)), GridRGB
    Next i
    'For i = 0 To ((FWidth + GridStep) / 2) Step GridStep
        fMain.BG.Line (0, 0)-(FWidth, FHeight), GridRGB
        fMain.BG.Line (0, FHeight)-(FWidth, 0), GridRGB
    'next i
End If
        
End Sub
Public Function XSeta(ByVal Seta As Integer)
    XSeta = PI * ((Seta) / 180)
End Function
