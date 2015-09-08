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
dx = Array(-1, 0, 1, 0, -1, -1, 1, 1)
dy = Array(0, -1, 0, 1, -1, 1, 1, -1)
cnt = 1

For i = 1 To n
  For j = 1 To n
  
  Input #1, a(i, j)
  
  Next j
Next i

Input #1, k

For i = 1 To k

Input #1, x, y
  
  For j = 0 To 7
  
    a(x, y) = cnt
    If a(x + dx(j), y + dy(j)) <> 0 Then
    a(x + dx(j), y + dy(j)) = cnt
    End If
  
  Next j
tu = 0

  For k = 1 To n
    For j = 1 To n
        If a(k, j) = cnt Then
        ElseIf a(k, j) = 0 Then
        Else
        tu = tu + 1
        End If
    Next j
  Next k

    If tu = 0 Then
        Print #2, cnt
        GoTo aa
    End If

cnt = (((cnt + 1) Mod 2) + 1)

Next i
sa = 0: sb = 0
For i = 1 To n
  For j = 1 To n
    If a(i, j) = 1 Then
      sa = sa + 1
    ElseIf a(i, j) = 2 Then
      sb = sb + 1
    End If
  Next j
Next i

If sa > sb Then
Print #2, 1
ElseIf sb > sa Then
Print #2, 2
Else
Print #2, 0
End If

aa:

End
End Sub
