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

Dim a(1000, 1000), b(1000, 4)

Input #1, n
Input #1, s
Input #1, t

Max = -999999999

For i = 1 To t
Input #1, b(i, 1), b(i, 3), b(i, 2), b(i, 4)
a(b(i, 1), b(i, 3)) = i
a(b(i, 2), b(i, 4)) = i

  If Max < b(i, 3) Then
    Max = b(i, 3)
  ElseIf Max < b(i, 4) Then
    Max = b(i, 3)
  End If
Next i

For i = 1 To n
  For j = 1 To Max
    If a(i, j) > 0 Then
    Else
    a(i, j) = 0
    End If
  Next j
Next i

x = s: y = 1

For i = 1 To (Max * n)
  If a(x, y) > 0 Then
  
    For k = 1 To n
      For t = 1 To Max
        If (k <> x) And a(x, y) = a(k, t) Then
         a(x, y) = -1: x = k: y = (t): a(k, t) = -1
        GoTo ss
        End If
      Next t
    Next k
ss:
  Else
  y = y + 1
  End If
  
  If y = (Max + 1) Then
  Exit For
  End If
Next i

Print #2, x

End
End Sub
