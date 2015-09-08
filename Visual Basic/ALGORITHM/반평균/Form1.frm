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
Dim a(100), b(100), c(100)
For i = 1 To n
Line Input #1, k(i)
Next i

For i = 1 To n
  For j = 1 To (Len(k(i)) + 1)
    For o = 1 To 9
      a() = Mid(k(i), 1, 1)
  
  
  
  Next j
Next i

End
End Sub
