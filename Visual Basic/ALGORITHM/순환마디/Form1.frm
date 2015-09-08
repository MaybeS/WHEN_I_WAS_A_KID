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
Input #1, a, b
Dim n(3000), k(3000)
tr = a

For i = 1 To 3000

n(i) = ((tr \ b))
k(i) = ((tr Mod b) * 10)
tr = ((tr Mod b) * 10)

  For j = 1 To (i - 1)
    If k(j) = k(i) Then
      Min = j
      Max = i
      GoTo ss
    End If
  Next j

Next i
ss:
For i = 1 To (Min)
        If (i = 1) And (n(i) = 0) Then
        n(i) = n(i) & "."
        End If
    Print #2, Trim(n(i));
Next i

If ((Min + 1) = Max) And (Min = 1) And (n(i) = 0) Then
Else
        Print #2, "(";
    For i = (Min + 1) To Max
            Print #2, Trim(n(i));
    Next i
        Print #2, ")";
End If
    Print #2,
    Print #2, Trim(Max - Min)
End
End Sub
