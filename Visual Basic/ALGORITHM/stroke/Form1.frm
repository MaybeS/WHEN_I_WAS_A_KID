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
Input #1, nn
Dim a(100, 100), n(100), b(100, 100), p(100)
For i = 1 To nn
  Line Input #1, n(i)
Next i
Input #1, pp
For i = 1 To pp
  Line Input #1, p(i)
Next i

cnt = 1: tr = 1
For i = 1 To nn
n(i) = n(i) & " "
    For j = 1 To (nn * 2)
    se = Mid(n(i), j, 1)
      If se = " " Then
      a(i, cnt) = Mid(n(i), tr, 1)
      cnt = cnt + 1: tr = j + 1
      End If
  Next j
cnt = 1: tr = 1
Next i

cnt = 1: tr = 1
For i = 1 To pp
p(i) = p(i) & " "
    For j = 1 To (pp * 2)
    se = Mid(p(i), j, 1)
      If se = " " Then
      b(i, cnt) = Mid(p(i), tr, 1)
      cnt = cnt + 1: tr = j + 1
      End If
  Next j
cnt = 1: tr = 1
Next i

cnt = 1: tr = 1: yu = nn
For i = 1 To (nn * Int((nn / pp) + 0.5))
  For k = 1 To Int((nn / pp) + 0.5)
    For t = 1 To Int((nn / pp) + 0.5)
      For j = yu To (nn * Int((nn / pp) + 0.5)) - 1
        a(i, j) = b(Int((i / (Int((nn / pp) + 0.5))) + 0.5), tr)
      Next j
    Next t
  yu = yu + 1
  tr = 1
  Next k
yu = nn
tr = 1
Next i

For i = 1 To nn
  For j = 1 To (nn * Int((nn / pp) + 0.5)) - 1
  Print #2, a(i, j) & " ";
  Next j
Print #2, " "
Next i
End
End Sub
