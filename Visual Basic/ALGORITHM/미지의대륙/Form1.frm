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
Open "c:\jiju\input.txt" For Input As #1
Open "c:\jiju\output.txt" For Output As #2
Input #1, x, y

Dim a(100, 100), n(100)

dx = Array(-1, 0, 1, 0)
dy = Array(0, -1, 0, 1)

For i = 1 To x
Line Input #1, n(i)
  For j = 1 To y
    a(i, j) = Mid(n(i), j, 1)
  Next j
Next i

For i = 1 To x
  For j = 1 To y
  tr = a(i, j)
    For k = 0 To 3
    
      If (tr = "G") Then
        If (a(x + dx(k), y + dy(k)) = "G") Then
        g1 = g1 + 1
        ElseIf (a(x + dx(k), y + dy(k)) = "W") Then
        w1 = w1 + 1
        ElseIf (a(x + dx(k), y + dy(k)) = "P") Then
        w2 = w2 + 1
        End If
      End If
      
    Next k
  
  If g1 = 4 Then
    a(x, y) = "M"
  End If
  If w1 = 3 Then
    a(x, y) = "P"
  End If
  If w1 = 2 And w2 = 1 Then
    a(x, y) = "P"
  End If
  If w1 = 1 And w2 = 2 Then
    a(x, y) = "P"
  End If
  If w1 = 0 And g1 = 0 Then
    a(x, y) = "C"
  End If
  
g1 = 0: w1 = 0: w2 = 0
  Next j
Next i


End
End Sub
