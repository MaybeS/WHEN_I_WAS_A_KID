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
Input #1, n, k
Dim a(100, 100)

For i = 1 To n
  For j = 1 To n
  a(i, j) = 0
  Next j
Next i

If k = 1 Then
  
  For i = 1 To n
    For j = 1 To i
      cnt = cnt + 1
      a(j, i + 1 - j) = cnt
    Next j
  Next i

ElseIf k = 2 Then

  For i = 1 To n
      For j = 1 To i
        cnt = cnt + 1
        a(n - j + 1, i - j + 1) = cnt
        Next j
    Next i
    
ElseIf k = 3 Then
  
  For i = 1 To n
    For j = 1 To i
      cnt = cnt + 1
      a(i - j + 1, n - j + 1) = cnt
    Next j
  Next i
  
ElseIf k = 4 Then
  
  For i = 1 To n
    For j = 1 To i
      cnt = cnt + 1
      a(n - j + 1, n + j - i) = cnt
    Next j
  Next i
  
End If

For i = 1 To n
  For j = 1 To n
  Print #2, a(i, j) & " ";
  Next j
  Print #2, " "
Next i

End
End Sub
