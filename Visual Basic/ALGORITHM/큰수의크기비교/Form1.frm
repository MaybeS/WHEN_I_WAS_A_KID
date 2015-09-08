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

If Len(a) > Len(b) Then
Print #2, a: GoTo SS
ElseIf Len(b) > Len(a) Then
Print #2, b: GoTo SS
Else
  For i = 1 To Len(a) + 1
  se = Val(Mid(a, i, 1))
  pr = Val(Mid(b, i, 1))
  
    If Val(Mid(a, i, 1)) > Val(Mid(b, i, 1)) Then
    Print #2, a: GoTo SS
    ElseIf Val(Mid(a, i, 1)) < Val(Mid(b, i, 1)) Then
    Print #2, b: GoTo SS
    End If
  Next i
End If
SS:

End
End Sub
