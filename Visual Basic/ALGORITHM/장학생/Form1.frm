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
Input #1, n
Dim a1(101), a2(101), a3(101), a4(101), a5(101), b(101), c(101)

For i = 1 To n
cnt = 0
Input #1, a1(i), a2(i), a3(i), a4(i), a5(i)
cnt = a1(i) + a2(i) + a3(i) + a4(i) + a5(i)
b(i) = Int((cnt / 5) + 0.5)
c(i) = i
Next i

For i = 1 To n - 1
  For j = i + 1 To n
    If b(i) < b(j) Then
    tu = b(i): b(i) = b(j): b(j) = tu
    tu = c(i): c(i) = c(j): c(j) = tu
    tu = a1(i): a1(i) = a1(j): a1(j) = tu
    tu = a2(i): a2(i) = a2(j): a2(j) = tu
    tu = a3(i): a3(i) = a3(j): a3(j) = tu
    tu = a4(i): a4(i) = a4(j): a4(j) = tu
    tu = a5(i): a5(i) = a5(j): a5(j) = tu
    End If
  Next j
Next i
tr = Int((n * (20 / 100)) + 0.5)

For i = 1 To tr
  If a1(i) > 50 And a2(i) > 50 And a3(i) > 50 And a4(i) > 50 And a5(i) > 50 Then
  Print #2, c(i)
  Else
  End If
Next i

End
End Sub
