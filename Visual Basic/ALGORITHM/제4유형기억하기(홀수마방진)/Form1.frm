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
Dim a(9), n(7, 7)

For i = 1 To 9
  Input #1, a(i)
Next i

For i = 1 To 3
  For j = i To 3
  If a(i) > a(j) Then
  t = a(i): a(i) = a(j): a(j) = t
  End If
  Next j
Next i

n(1, 2) = a(1)
n(3, 3) = a(2)
n(2, 1) = a(3)
n(3, 1) = a(4)
n(2, 2) = a(5)
n(1, 3) = a(6)
n(2, 3) = a(7)
n(1, 1) = a(8)
n(3, 2) = a(9)

For i = 1 To 3
  For j = 1 To 3
    Print #2, n(i, j);
  Next j
  Print #2, ""
Next i

End
End Sub
