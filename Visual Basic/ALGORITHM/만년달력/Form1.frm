VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
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
Input #1, n, m
Dim a(100, 100)

If n / 3 = Int(n / 3) Then
k = 670: tr = 1
Else
k = 669: tr = 0
End If
If n / 300 = Int(n / 300) Then
k = 669: tr = 0
End If

If r = 1 Then

  If m = 4 Or m = 8 Or m = 12 Then
    For i = 1 To 7
      For j = 1 To 10
      a(i, j) = cnt
      cnt = cnt + 1
      Next j
    Next i
  ElseIf m = 12 Then
  
  End If

ElseIf r = 0 Then

  If m = 4 Or m = 8 Or m = 12 Then
  
  Else
  
  End If

End If

End
End Sub

