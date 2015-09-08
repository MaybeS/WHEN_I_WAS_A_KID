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
Input #1, x, y
Dim a(100, 100)
dx = Array(0, 1, 0, -1)
dy = Array(1, 0, -1, 0)

Do

Input #1, t, d

 If d > 0 Then
 
  For i = 1 To d
  
    If (x + dx(t - 1) > 0) Then
        x = x + dx(t - 1)
    End If
    If (y + dy(t - 1)) > 0 Then
        y = y + dy(t - 1)
    End If
  
  Next i
  
 ElseIf d < 0 Then
 
  For i = d To 1 Step 1
  
    If (x + dx(t - 1) > 0) Then
        x = x + dx(t - 1)
    End If
    If (y + dy(t - 1)) > 0 Then
        y = y + dy(t - 1)
    End If
  
  Next i
  
End If

If x > n Then
x = n
End If
If y > n Then
y = n
End If

Loop Until (t = 0) And (d = 0)
Print #2, x, y

End
End Sub
