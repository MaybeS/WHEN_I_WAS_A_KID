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
Input #1, t, n
a1 = 1: a4 = t: Dim a(10000)
For i = 1 To t
Input #1, a(i)
Next i

For i = 1 To t - 1
  For j = i + 1 To t
    If a(i) > a(j) Then
    tu = a(i): a(i) = a(j): a(j) = tu
    End If
  Next j
Next i


Do
tt = Int((a4 - a1) / 3)
a2 = a1 + tt
a3 = a2 + tt
Print #2, a1, a4

If n = a(a2) Or n = a(a3) Then
Exit Do
Else
      If n < a(a2) Then
       a1 = a1: a4 = (a2 - 1)
  ElseIf n > a(a3) Then
       a1 = (a3 + 1): a4 = a4
  Else
      a1 = (a2 + 1): a4 = (a3 - 1)
  End If

End If

Loop Until a1 > a4


End
End Sub
