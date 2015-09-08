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
Dim a(5000), c(5000)
Input #1, n

For i = 1 To 5000
a(i) = i
Next i

For i = 2 To 50
  For j = 2 To 100
  a(i * j) = "."
  Next j
Next i

cnt = 1

For i = 1 To 5000
  If a(i) <> "." Then
  c(cnt) = a(i)
  cnt = cnt + 1
  End If
Next i

For i = 2 To cnt
  For j = 2 To cnt
    If c(i) + c(j) = n Then
      Print #2, c(i)
      Print #2, c(j)
      GoTo aa
    End If
  Next j
Next i
aa:
End
End Sub
