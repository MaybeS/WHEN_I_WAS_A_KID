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
Open "C:\jiju\input.txt" For Input As #1
Open "C:\jiju\output.txt" For Output As #2
Input #1, n
Dim s(100), e(100)
Min = 999999999: Max = -999999999
For i = 1 To n
Input #1, s(i), e(i)
  
  If Min > s(i) Then
  Min = s(i)
  End If
  If Max < e(i) Then
  Max = e(i)
  End If

Next i

For i = 1 To n

  For k = s(i) To e(i)
  
    For j = 1 To n
    Next j
  
  Next k

Next i

End
End Sub
