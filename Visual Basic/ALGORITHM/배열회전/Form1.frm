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
Dim a(100, 100)

For i = 0 To n + 1
  For j = 0 To n + 1
    If (i = 0) Or (i = (n + 1)) Or (j = 0) Or (j = (n + 1)) Then
    a(i, j) = -1
    End If
  Next j
Next i

cnt = 1

For i = 1 To n
  For j = 1 To n
  
  a(i, j) = cnt
  cnt = cnt + 1
  Print #2, a(i, j);
  
  Next j
Print #2,
Next i

Print #2,
cnt = 1

For i = n To 1 Step -1
  For j = 1 To n
    a(j, i) = cnt
    cnt = cnt + 1
  Next j
Next i

For i = 1 To n
  For j = 1 To n
    Print #2, a(i, j);
  Next j
Print #2,
Next i

Print #2,
cnt = 1

For i = n To 1 Step -1
  For j = n To 1 Step -1
    a(i, j) = cnt
    cnt = cnt + 1
  Next j
Next i

For i = 1 To n
  For j = 1 To n
    Print #2, a(i, j);
  Next j
Print #2,
Next i

Print #2,
cnt = 1

For i = 1 To n
  For j = n To 1 Step -1
    a(j, i) = cnt
    cnt = cnt + 1
  Next j
Next i

For i = 1 To n
  For j = 1 To n
    Print #2, a(i, j);
  Next j
Print #2,
Next i

Print #2,
cnt = 1

End
End Sub
