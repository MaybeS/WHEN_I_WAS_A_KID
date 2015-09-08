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
Input #1, o, p

Dim e(100)
Input #1, n
For i = 1 To n
Line Input #1, e(i)
Next i

For i = 1 To n
e(i) = e(i) & " "
Next i

tr = 1: cnt = 1
Dim a(100, 100), tu: yu = 0: tu = 1

For i = 1 To n
  For j = 1 To (n * 2)
    
    dx = Mid(e(i), j, 1)
    If dx = " " Then
    a(i, cnt) = Mid(e(i), tr, 1)
    tr = j + 1: cnt = cnt + 1
    End If
    
  Next j
cnt = 1: tr = 1
Next i

i = o: j = p
For k = 1 To (n ^ 2)
Print #2, i, j: a(i, j) = 0

  If a(i + 1, j) = 1 Then
  i = i + 1: j = j
  ElseIf a(i, j + 1) = 1 Then
  i = i: j = j + 1
  ElseIf a(i - 1, j) = 1 Then
  i = i - 1: j = j
  ElseIf a(i, j - 1) = 1 Then
  i = i: j = j - 1
  Else
  Exit For
  End If
    
Next k

End
End Sub
