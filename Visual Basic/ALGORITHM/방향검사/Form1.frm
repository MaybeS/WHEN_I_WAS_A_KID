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
Input #1, n, cn
Dim a(500, 500), c(500), x(500), y(500)
dy1 = Array(1, 0, -1, 0, 0)
dx1 = Array(0, 1, 0, -1, 0)
dy2 = Array(1, 1, 1, 0, -1, -1, -1, 0, 0)
dx2 = Array(-1, 0, 1, 1, 1, 0, -1, -1, 0)
dy3 = Array(1, 2, 2, 1, -1, -2, -2, -1, 0)
dx3 = Array(-2, -1, 1, 2, 2, 1, -1, -2, 0)
dy4 = Array(2, 3, 3, 2, -2, -3, -3, -2, 0)
dx4 = Array(-3, -2, 2, 3, 3, 2, -2, -3, 0)

For i = 1 To n
  For j = 1 To n
  a(i, j) = 0
  Next j
Next i

For i = 1 To cn
  Input #1, c(i), x(i), y(i)
Next i

For k = 1 To cn

If c(k) = 1 Then
  
  For t = 0 To 4
  a(x(k) + dy1(t), y(k) + dx1(t)) = 1
  Next t

ElseIf c(k) = 2 Then

  For t = 0 To 8
  a(x(k) + dy2(t), y(k) + dx2(t)) = 1
  Next t
  
ElseIf c(k) = 3 Then

  For t = 0 To 8
  a(x(k) + dy3(t), y(k) + dx3(t)) = 1
  Next t

ElseIf c(k) = 4 Then

  For t = 0 To 8
  a(x(k) + dy4(t), y(k) + dx4(t)) = 1
  Next t

End If

Next k

For i = 1 To n
  For j = 1 To n
  Print #2, a(i, j);
  Next j
Print #2,
Next i

End
End Sub
