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
Input #1, n

Dim a(100, 100)
dx = Array(1, 0)
dy = Array(-1, 1)

x = ((n + 1) / 2): y = 1: cnt = 1: op = 0

For i = 0 To (n + 1)
  For j = 0 To (n + 1)
  a(i, j) = -1
  Next j
Next i
For i = 1 To n
  For j = 1 To n
  a(i, j) = 0
  Next j
Next i

For i = 1 To n
  For j = 1 To n
  
    If a(x, y) = 0 Then
    a(x, y) = cnt: cnt = cnt + 1
      If a(x + dx(op), y + dy(op)) = 0 Then
        x = x + dx(op): y = y + dy(op)
      ElseIf a(x + dx(op), y + dy(op)) = -1 Then
        If (y + dy(op) = 0) And (x + dx(op) = (n + 1)) Then
          y = y + 1
        ElseIf y + dy(op) = 0 Then
          y = n: x = x + dx(op)
        ElseIf x + dx(op) = (n + 1) Then
          y = y + dy(op): x = 1
        End If
      Else
        y = (y + 1)
      End If
    End If
  Next j
Next i
For i = 1 To n
  For j = 1 To n
  Print #2, a(j, i);
  Next j
Print #2,
Next i

End
End Sub
