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
Dim ch(100)


For i = 0 To n - 1
Input #1, k
Input #1, s
ch(k) = s
Next i

Input #1, e

For i = 1 To e
Input #1, k
Input #1, s
ch(k) = s + ch(k)
Next i

For i = 100 To 0 Step -1

If ch(i) <> 0 Then
Print #2, i & " " & ch(i) & " ";
End If

Next i

End
End Sub
