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
Input #1, h, w

Dim a(1000, 1000)
For i = 1 To h
  For j = 1 To w
    a(i, j) = "@"
  Next j
Next i

For i = 1 To Int((h / 2) + 0.9)

  For j = 1 To (i - 1)
  a(i, j) = "-"
  Next j
  
  For j = i To w + i - 1
  a(i, j) = "@"
  Next j
  
  For j = (i + w) To (h - i)
  a(i, j) = "-"
  Next j
  
  For j = (h - i + 1) To ((h + w) - i)
  a(i, j) = "@"
  Next j
  
  For j = (h + w) - i + 1 To (h + w - 1)
  a(i, j) = "-"
  Next j
  
  For j = 1 To (h + w - 1)
  Print #2, a(i, j);
  Next j
  
Print #2, ""

Next i

For i = Int((h / 2) + 0.9) + 1 To h
  
  For j = 1 To (w - 1)
  a(i, j) = "-"
  Next j
  
  For j = (i + w) To (h - i)
  a(i, j) = "-"
  Next j
  
  For j = (h + w - 1) - (i) To (h + w - 1)
  a(i, j) = "-"
  Next j
  
  For j = i To w + i - 1
  a(i, j) = "@"
  Next j
  
  For j = (h - i + 1) To ((h + w) - i)
  a(i, j) = "@"
  Next j
  
  For j = 1 To (h + w - 1)
  Print #2, a(i, j);
  Next j
  
Print #2, ""

Next i


End
End Sub
