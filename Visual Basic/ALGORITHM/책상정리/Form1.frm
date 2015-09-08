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
Input #1, n, t, cnt

Dim k(1000)

For i = 1 To 1000
k(i) = "."
Next i

For i = 1 To n
k(i) = i
Next i

For i = 1 To cnt

Input #1, a, b

  If a = 0 Then
  
    For j = b To n
      y = k(j): k(j) = k(j + 1)
    Next j
  
  Else
  
    For j = a To n
      k(j + 1) = k(j)
    Next j
  k(a) = b
  End If

Next i
Print #2, k(t)
End
End Sub
