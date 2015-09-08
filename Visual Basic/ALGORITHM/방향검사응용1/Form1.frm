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
Input #1, t, n
Dim a(100, 100), x(100), y(100)
For i = 0 To n + 1
  For j = 0 To n + 1
  a(i, j) = -1
  Next j
Next i
For i = 1 To n
  For j = 1 To n
  Input #1, a(i, j)
  Next j
Next i
dx = Array(0, 0, -1, 1)
dy = Array(1, -1, 0, 0)

For k = 1 To t
cnt = 1
  For i = 1 To n
    For j = 1 To n
      If a(i, j) = 1 Then
        x(cnt) = i: y(cnt) = j
        cnt = cnt + 1
      End If
    Next j
  Next i
  
  For i = 1 To (cnt - 1)
  tt = 0
    For s = 0 To 3
      If a(x(i) + dx(s), y(i) + dy(s)) = 0 And tt = 0 Then
      a(x(i) + dx(s), y(i) + dy(s)) = 1: tt = 1
      End If
    Next s
  Next i
Next k

For i = 1 To n
  For j = 1 To n
  Print #2, a(i, j);
  Next j
Print #2,
Next i

End
End Sub
