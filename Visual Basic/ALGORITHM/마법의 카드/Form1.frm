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
Dim a(1000), k(1000)
se = n
For i = 0 To n
a(i + 1) = (2 ^ i)
k(i) = 0
Next i

For i = n To 0 Step -1

  If (n - a(i)) > 0 Then
    n = (n - a(i)): k(i) = 1
  ElseIf (n - a(i)) = 0 Then
    k(i) = 1: n = 0
  Exit For
  End If

Next i
cnt = 0
For i = 1 To se

  If k(i) = 1 Then
  cnt = i + cnt
  End If

Next i
Print #2, cnt
End
End Sub
