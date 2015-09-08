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
tr = 0
Dim a(1000)
kkk = Array("I", "V", "X", "L", "C", "D", "M")
kkn = Array(1, 5, 10, 50, 100, 500, 1000)
For i = 1 To n

Input #1, a(i)

Next i

For i = 1 To n

a(i) = a(i) & "I"
  For j = 1 To Len(a(i))
  
  dj = Mid(a(i), j, 1)
  dx = Mid(a(i), (j + 1), 1)
  
  For s = 0 To (6)
    If dj = kkk(s) Then
    dj = kkn(s)
    End If
  Next s
  For s = 0 To (6)
    If dx = kkk(s) Then
    dx = kkn(s)
    End If
  Next s
  
  If dj < dx Then
  dj = (0 - dj)
  End If
  tr = tr + dj
  Next j

Next i
Print #2, (tr + n)
End
End Sub
