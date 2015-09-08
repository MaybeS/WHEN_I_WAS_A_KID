VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows ±âº»°ª
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function Polygon Lib "gdi32" (ByVal Hdc As Long, lpPoint As POINTAPI, ByVal nCount As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal Hdc As Long, ByVal hObject As Long) As Long
Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long

Private Type POINTAPI
    X As Long
    y As Long
End Type
Private Type ColorRGB
    R As Integer
    G As Integer
    B As Integer
End Type
Private Sub Form_Load()
    Dim DrawColorRGB As ColorRGB
    Dim DrawColorLong As Long
    Dim DrawColorLongEdge As Long
    Dim tmp(3) As POINTAPI, BrushSelect As Long, Xrgb As ColorRGB
    
    tmp(0).X = 10
    tmp(0).y = 10
    
    tmp(1).X = 60
    tmp(1).y = 10
    
    tmp(2).X = 10
    tmp(2).y = 60

PenSelect = SelectObject(Hdc, CreatePen(0, 1, RGB(120, 200, 255)))
BrushSelect = SelectObject(Hdc, CreateSolidBrush(RGB(120, 200, 255)))
Polygon Form1.Hdc, tmp(0), 3


End Sub
