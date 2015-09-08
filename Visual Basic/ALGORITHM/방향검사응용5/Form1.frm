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
cnt = 0
For i = 1 To n
  For j = 1 To n
  Input #1, a(i, j)
    If a(i, j) = 2 Then
    tx = i: ty = i
    End If
  Next j
Next i

dx = Array(2, 3, 3, 2, -2, -3, -3, -2)
dy = Array(3, 2, -2, -3, -3, -2, 2, 3)

For i = 0 To 7
  For j = 0 To 7
    If (tx + dx(i) + dx(j)) > 0 And (ty + dy(i) + dy(j)) > 0 Then
      If a(tx + dx(i) + dx(j), ty + dy(i) + dy(j)) = 1 Then
      cnt = cnt + 1
      a(tx + dx(i) + dx(j), ty + dy(i) + dy(j)) = 0
      ElseIf a(tx + dx(j), ty + dy(j)) = 1 Then
      cnt = cnt + 1
      a(tx + dx(j), ty + dy(j)) = 0
      End If
    End If
  Next j
Next i

Print #2, cnt

End
End Sub
