VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3180
   ClientLeft      =   60
   ClientTop       =   360
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3180
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
cnt = 0: tru = 0
Dim a(1000, 1000)

For k = 1 To Int((n / 4) + 0.5)

  For i = 1 To n

    y = (i Mod 2): If y = 0 Then y = 2
    y = y + cnt
    tru = tru + 1
    a(i, y) = tru
    
      If y = (2 + cnt) Then
        y = (1 + cnt)
      ElseIf y = (1 + cnt) Then
        y = (2 + cnt)
      End If
      
    a(i, y) = (((n * n) + 1) - tru)
  Next i
  
  cnt = cnt + 2
  
  For i = n To 1 Step -1
    y = (i Mod 2):
    
      If y = 1 Then
        y = 2
      ElseIf y = 0 Then
        y = 1
      End If
    
    y = y + cnt
    tru = tru + 1
    a(i, y) = tru
    
      If y = (2 + cnt) Then
        y = (1 + cnt)
      ElseIf y = (1 + cnt) Then
         y = (2 + cnt)
      End If
      
    a(i, y) = (((n * n) + 1) - tru)
  Next i

cnt = cnt + 2

Next k

For i = 1 To n
  For j = 1 To n
    Print #2, a(i, j);
  Next j
Print #2, " "
Next i

End
End Sub
