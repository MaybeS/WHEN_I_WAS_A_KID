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
Input #1, oper
Dim a(1000), b(1000), c(1000)
Dim a1, b1, c1, tr
a1 = 1: b1 = 1: c1 = 1
For i = 1 To oper
Input #1, n
sf = sf + n
  For j = 1 To n
  Line Input #1, t
  t = t & " "
  cnt = 0
  sd = 1
    For k = 1 To Len(t)
    tr = Mid(t, k, 1)
      If tr = " " Then
      cnt = cnt + 1
        If cnt = 1 Then
        a(a1) = Mid(t, sd, (k - sd))
        a1 = a1 + 1
        ElseIf cnt = 2 Then
        b(b1) = Mid(t, sd, (k - sd))
        b1 = b1 + 1
        ElseIf cnt = 3 Then
        c(c1) = Mid(t, sd, (k - sd))
        c1 = c1 + 1
        End If
      sd = k
      End If
    Next k
  Next j
Next i
For i = 1 To sf - 1
  For j = i + 1 To sf
  If Val(b(i)) < Val(b(j)) Then
  abc = a(i): a(i) = a(j): a(j) = abc
  bac = b(i): b(i) = b(j): b(j) = bac
  cab = c(i): c(i) = c(j): c(j) = cab
  End If
  Next j
Next i
For i = 1 To sf
  Print #2, a(i), b(i), c(i)

Next i

End
End Sub
