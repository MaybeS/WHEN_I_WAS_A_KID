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
Dim a(100, 100)
Input #1, s
    If s = 2 Then
      Input #1, r
    End If
Input #1, n

dx = Array(1, 0, -1, 0)
dy = Array(0, 1, 0, -1)

For i = 1 To n
  For j = 1 To n
    Input #1, a(i, j)
        If a(i, j) = 4 Then
        x = i: y = j
        End If
        If a(i, j) = 5 Then
        ex = i: ey = j
        End If
  Next j
Next i

cnt = 0: kr = 0

For i = 1 To n
  For j = 1 To n
    For k = 0 To 3
      If a(x + dx(k), y + dy(k)) <> 0 Then
        
        If a(x + dx(k), y + dy(k)) = 2 Then
        cnt = cnt + 1
        End If
        
        If a(x + dx(k), y + dy(k)) = 3 Then
        kr = ((kr + 1) Mod 2)
          If kr = 0 Then
            If s = 1 Then
              mo = mo + (cnt * 1000)
              Print #2, (y + dy(k)), (x + dx(k)), (cnt * 1000)
            ElseIf s = 2 Then
              mo = mo + (cnt * 100 * r)
              Print #2, (y + dy(k)), (x + dx(k)), (cnt * 100 * r)
            End If
          cnt = 0
          ElseIf kr = 1 Then
          Print #2, (y + dy(k)), (x + dx(k))
          End If
        End If
      a(x, y) = "0"
      x = x + dx(k): y = y + dy(k)
      Exit For
      End If
    Next k
  Next j
Next i
Print #2, mo
End
End Sub
