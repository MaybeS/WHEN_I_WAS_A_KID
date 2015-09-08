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
Dim a(1000), b(1000)
Min = 9999999: Max = -99999999

For i = 1 To n
Input #1, a(i), b(i)
 
 If a(i) < Min Then
   Min = a(i)
 End If
 
 If b(i) > Max Then
   Max = b(i)
 End If
 
Next i

For i = 1 To (n - 1)
  For j = i + 1 To n
    If a(i) > a(j) Then
    t = a(i): a(i) = a(j): a(j) = t
    g = b(i): b(i) = b(j): b(j) = g
    End If
  Next j
Next i

For i = 1 To n
Print #2, a(i), b(i)
Next i

cnt = 0

For i = 1 To n

  For j = a(i) To b(i)
  
  Next j

Next i

End
End Sub
