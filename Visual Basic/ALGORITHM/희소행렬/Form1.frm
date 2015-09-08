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
Input #1, x, y
Dim a(100, 100), b(100, 100), dx(1000), dy(1000)
Print #2, x & " " & y & " ";
For i = 1 To x
  For j = 1 To y
  Input #1, a(i, j)
  Next j
Next i

For i = 1 To x
  For j = 1 To y
  Input #1, b(i, j)
  Next j
Next i
cnt = 1
For i = 1 To x
  For j = 1 To y
  
  If b(i, j) <> a(i, j) Then
  dx(cnt) = i: dy(cnt) = j: cnt = cnt + 1
  End If
  
  Next j
Next i

Print #2, (cnt - 1)

For i = 1 To (cnt - 1)

Print #2, dx(i) & " " & dy(i) & " " & (b(dx(i), dy(i)) - a(dx(i), dy(i)))

Next i

End
End Sub
