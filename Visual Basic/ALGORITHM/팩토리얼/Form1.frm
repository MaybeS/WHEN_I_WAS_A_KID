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
Dim a(100000)
t = 1: a(1) = 1: Top = 0: se = 0: cnt = 1

For i = 1 To n

tr = (cnt): cnt = 1: Top = 0

  For s = 1 To tr
  t = Val(a(s)): se = 0
  t = (t * i) + Top
  
    If t > 9 Then
    
      Top = t \ 10
      a(cnt) = (t - (Top * 10)): cnt = cnt + 1
      
    ElseIf t <> 0 Then
    
      a(cnt) = t
      cnt = cnt + 1
    
    ElseIf t = 0 Then
     
      a(cnt) = 0
      cnt = cnt + 1
      
    End If
  
  Next s
  For j = 1 To tr
    If a(j) = 0 Then
      j = j + 1: GoTo yy
    End If
  Debug.Print a(j);
yy:
  Next j
Debug.Print
Next i

End
End Sub
