VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3180
   ClientLeft      =   60
   ClientTop       =   360
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3180
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
Dim a(100, 100), tu: yu = 0: tu = 1
di = Array(0, 1, -1)
dj = Array(1, -1, 0)

For i = 0 To n + 1
  a(i, 0) = -1: a(i, n + 1) = -1
  a(0, i) = -1: a(n + 1, i) = -1
Next i

If n Mod 2 = 0 Then
pk = n * Int(n / 2) + (n / 2)
ElseIf n Mod 2 = 1 Then
pk = n * Int((n / 2) + 0.5)
End If

i = 1: j = 1: d = 0
For k = 1 To pk
  a(i, j) = k
  If a(i + di(d), j + dj(d)) <> 0 Then d = (d + 1) Mod 3
  i = i + di(d)
  j = j + dj(d)
Next k

For i = 1 To n
  For j = 1 To n
  Print #2, a(i, j);
  Next j
Print #2, " "
Next i

End
End Sub
