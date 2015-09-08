VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows ±âº»°ª
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Open "input.txt" For Input As #1
Open "output.txt" For Output As #2
Input #1, cn, f, h
Dim a(100, 100)

For i = 0 To (h + 1)
  For j = 0 To (cn * 2)
  a(i, j) = -1
  Next j
Next i

For i = 1 To h
  For j = 1 To ((cn * 2) - 1)
    Input #1, a(i, j)
  Next j
Next i

a(h, ((f * 2) - 1)) = 2

For k = 1 To ((cn * 2) - 1)
tx = 1: ty = k
  If a(1, k) = 0 Then
  ElseIf a(1, k) = 1 Then
  
    For s = 1 To (h * 2)
        
        If a(tx, (ty + 1)) = 1 Then
        a(tx, ty) = ".": ty = (ty + 1)
        ElseIf a(tx, (ty - 1)) = 1 Then
        a(tx, ty) = ".": ty = (ty - 1)
        ElseIf a((tx + 1), ty) = 1 Then
        a(tx, ty) = ".": tx = (tx + 1)
        
        ElseIf a((tx + 1), ty) = 2 Then
        Print #2, Int((k + 1) / 2): End
        ElseIf a(tx, (ty + 1)) = 2 Then
        Print #2, Int((k + 1) / 2): End
        ElseIf a(tx, (ty - 1)) = 2 Then
        Print #2, Int((k + 1) / 2): End
        
        ElseIf a((tx + 1), ty) <> 1 Or a(tx, (ty + 1)) <> 1 Or a(tx, (ty - 1)) <> 1 Then
        Exit For
        
        End If

    Next s
    
  End If

For i = 1 To h
  For j = 1 To ((cn * 2) - 1)
  If a(i, j) = "." Then
  a(i, j) = 1
  End If
  Next j
Next i

Next k

TT:
End
End Sub
