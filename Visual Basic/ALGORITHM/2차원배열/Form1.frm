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
Input #1, a, b
Dim n(100, 100)

For i = 1 To b
  For j = 1 To a
    Input #1, n(i, j)
  Next j
Next i

Input #1, k
Input #1, t

If k = "U" Then

For e = 1 To t
 For i = 1 To a
 t = n(1, i)
  For j = 1 To b
  n(j, i) = n(j + 1, i)
  Next j
 n(b, i) = t
 Next i
Next e

ElseIf k = "D" Then

For e = 1 To t
 For i = 1 To a
 t = n(b, i)
  For j = b To 1 Step -1
  n(j, i) = n(j - 1, i)
  Next j
 n(1, i) = t
 Next i
Next e

ElseIf k = "L" Then

For e = 1 To t
 For i = 1 To a
 t = n(i, 1)
  For j = 1 To b
  n(i, j) = n(i, j + 1)
  Next j
 n(i, a) = t
 Next i
Next e

ElseIf k = "R" Then

For e = 1 To t
 For i = 1 To a
 t = n(i, a)
  For j = b To 1 Step -1
  n(i, j) = n(i, j - 1)
  Next j
 n(i, 1) = t
 Next i
Next e

End If

For i = 1 To b
  For j = 1 To a
  Print #2, n(i, j);
  Next j
Print #2, " "
Next i


End
End Sub
