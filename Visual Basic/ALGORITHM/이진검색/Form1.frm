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
Input #1, n, k
s = 0: e = n - 1
Dim a(10000)

For i = 0 To n - 1
Input #1, a(i)
Next i
  
For i = 1 To n

  tr = Int((s + e) / 2)
  If a(tr) = k Then
  Print #2, i
  Exit For
  ElseIf a(tr) > k Then
  e = tr - 1
  ElseIf a(tr) < k Then
  s = tr + 1
  End If
  
Next i

If a(tr) <> k Then
Print #2, 0
End If

End
End Sub
