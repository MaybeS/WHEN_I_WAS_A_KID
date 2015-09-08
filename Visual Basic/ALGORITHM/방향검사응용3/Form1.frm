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
Dim a(100, 100), c(8), t(8, 8)
Input #1, tx, ty

For i = 0 To (n + 1)
  For j = 0 To (n + 1)
  a(i, j) = -1
  Next j
Next i

For i = 1 To n
  For j = 1 To n
  Input #1, a(i, j)
  Next j
Next i

dx = Array(0, 1, 0, -1)
dy = Array(1, 0, -1, 0)


For k = 1 To (n * n)
cnt = 1: er = 1
Print #2, tx, ty
  
  For i = 0 To 3
  
  c(cnt) = a(tx + dx(i), ty + dy(i))
  t(cnt, 1) = (tx + dx(i))
  t(cnt, 2) = (ty + dy(i))
  cnt = cnt + 1
  
    If a(tx + dx(i), ty + dy(i)) = -1 Then
    er = er + 1
    End If
  If er = 5 Then
  End
  End If
  
  Next i
  
  Min = 9999999
  
  For i = 1 To 4
  
    If c(i) < Min And c(i) > 0 Then
    Min = c(i): tu = i
    End If
    
  Next i
  
  a(tx, ty) = -1
  tx = t(tu, 1)
  ty = t(tu, 2)
  
Next k

End
End Sub
