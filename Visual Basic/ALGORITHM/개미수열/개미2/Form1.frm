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
Dim a(100000), b(100000)
t = 1

For i = 1 To (n - 1)
pu = t: t = "": cnt = 0: o = 1
  For j = 1 To (Len(pu) + 1)
  
  dj = Val(Mid(pu, j, 1))
  dx = Val(Mid(pu, j + 1, 1))
  cnt = cnt + 1
    If dj <> dx Then
    a(o) = dj
    b(o) = cnt
    t = t & dj & cnt
    cnt = 0: o = o + 1
    End If
  Next j
Next i

For i = 1 To (o)
w = w + a(i) + b(i)
Next i

Print #2, w

End
End Sub
