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
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   1800
      Top             =   720
   End
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
Dim a(110000), b(110000)

a(1) = 1: t = 1: Top = 1: cnt = 1

For i = 1 To (n - 1)

      tr = Top

  Top = 1: cnt = 1
  
  For j = 1 To tr
  
    If a(j) <> a(j + 1) Then
    b(Top) = a(j): Top = Top + 1
    b(Top) = cnt: Top = Top + 1
    cnt = 1
    Else
    cnt = cnt + 1
    End If
    
  Next j

  For j = 1 To (Top)
    If b(j) = Empty Then
    Exit For
    Else
    a(j) = b(j)
    End If
  Next j
  
Next i
op = 0

For i = 1 To (Top)
  If a(i) = Empty Then
  Exit For
  Else
  op = op + a(i)
  End If
Next i

Print #2, op

End
End Sub
