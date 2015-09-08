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
Dim s(1000): Dim k(1000)
For i = 1 To n
Input #1, s(i)
Input #1, k(i)
Next i

Input #1, er
Max = 0: cnt = 1

For i = 1 To n - 1
  
  For j = i + 1 To n
    
    If s(i) < s(j) Then
    
    t = s(i): s(i) = s(j): s(j) = t
    g = k(i): k(i) = k(j): k(j) = g
    
    End If
    
  Next j

Next i

For i = 1 To er
Debug.Print s(i)
tr = tr + k(i)

Next i

Print #2, Int(tr)

End
End Sub
