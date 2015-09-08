VERSION 5.00
Begin VB.UserControl iScroll 
   BackColor       =   &H00FFFFFF&
   BackStyle       =   0  '≈ı∏Ì
   ClientHeight    =   2565
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3345
   FillColor       =   &H00FFFFFF&
   ForeColor       =   &H00FFFFFF&
   MaskColor       =   &H00FFFFFF&
   ScaleHeight     =   2565
   ScaleWidth      =   3345
End
Attribute VB_Name = "iScroll"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Declare Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32.dll" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Declare Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long)
