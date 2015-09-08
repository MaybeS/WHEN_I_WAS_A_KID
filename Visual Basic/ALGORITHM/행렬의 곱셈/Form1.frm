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
Input #1, na1, na2
Input #1, nb1, nb2

Dim a(100, 100)
Dim b(100, 100)
Dim c(100, 100)

For i = 1 To na1
  For j = 1 To na2
  Input #1, a(i, j)
  Next j
Next i

For i = 1 To nb1
  For j = 1 To nb2
  Input #1, b(i, j)
  Next j
Next i

For i = 1 To na1
  For j = 1 To nb2
  cnt = 0
    For k = 1 To na2
      cnt = cnt + (a(i, k) * b(k, j))
    Next k
  c(i, j) = cnt
  Next j
Next i

For i = 1 To na1
  For j = 1 To nb2
  Print #2, c(i, j);
  Next j
Print #2,
Next i



End
End Sub
