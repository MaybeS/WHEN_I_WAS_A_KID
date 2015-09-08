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
Input #1, k

For i = 1 To k
Input #1, s
yu = 0
  For j = 1 To Len(n)
  tr = Mid(n, j, Len(s))
  
  If tr = s Then
  yu = 1
  Exit For
  End If
  
  Next j
If yu = 1 Then
Print #2, "True"
Else
Print #2, "False"
End If
Next i

End
End Sub
