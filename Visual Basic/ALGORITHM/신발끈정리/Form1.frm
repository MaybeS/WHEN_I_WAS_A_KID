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
Dim a(100), b(100)
For i = 1 To n
Input #1, a(i), b(i)
Next i
a(i) = a(1): b(i) = b(1)

tr = 0: ge = 0

For i = 1 To n
tr = tr + (a(i) * b(i + 1))
Next i

For i = 1 To n
ge = ge + (b(i) * a(i + 1))
Next i

gt = tr - ge

If (tr - ge) < 0 Then
gt = -(tr - ge)
End If

Print #2, Int(gt / 2)

End
End Sub
