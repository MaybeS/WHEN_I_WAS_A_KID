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
Dim a(101), t(101), u(101)

For i = 1 To n
Input #1, u(i)
Next i

Input #1, k
oper = k

For i = 1 To k
Input #1, t(i)
Next i

For i = 1 To n
yu = 0

  For j = 1 To Len(u(i))
  tr = Mid(u(i), j, 1)
  yu = yu + Asc(tr)
  Next j
  
  For k = 0 To 101
    If a((yu Mod 101) + k) = 0 Then
    a((yu Mod 101) + k) = u(i)
    Exit For
    End If
  Next k
  
Next i

For i = 1 To oper
yu = 0: kt = 0: wwi = 0
  For j = 1 To Len(t(i))
  tr = Mid(t(i), j, 1)
  yu = yu + Asc(tr)
  Next j
  
  For j = (yu Mod 101) To 102
  wwi = wwi + 1
  kt = kt + 1
    If j = ((yu Mod 101)) And kt > 2 Then
    Print #2, "Not Found"
    Exit For
    ElseIf j = 101 Then
    j = 1
    End If
    
    If a(j) = t(i) Then
    Print #2, wwi
    Exit For
    End If
    
  Next j
  
Next i


End
End Sub
