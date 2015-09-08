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
Open "output.txt" For Output As 2
Input #1, n

Dim a(100, 100)
Dim b(100, 100)
Dim c(100)

For i = 1 To n
  For j = 1 To n
  Input #1, a(i, j)
  Next j
Next i
For i = 1 To n
  For j = 1 To n
  Input #1, b(i, j)
  Next j
Next i

Input #1, k

For i = 1 To k
Input #1, c(i)
Next i

For w = 1 To k
  For i = 1 To n
    For j = 1 To n
    If c(w) = a(i, j) Then
    a(i, j) = "."
    End If
    If c(w) = b(i, j) Then
    b(i, j) = "."
    End If
    
      cnta = 0
      cntb = 0
      
      For e = 1 To n
        For r = 1 To n
        If a(e, r) = "." Then
        cnta = cnta + 1
        End If
        If b(e, r) = "." Then
        cntb = cntb + 1
        End If
        Next r
      If cnta = n Then
      Print #2, 1
      GoTo tt
      End If
      If cntb = n Then
      Print #2, 2
      GoTo tt
      End If
      cnta = 0
      cntb = 0
      Next e
      
      For e = 1 To n
        For r = 1 To n
        If a(r, e) = "." Then
        cnta = cnta + 1
        End If
        If b(r, e) = "." Then
        cntb = cntb + 1
        End If
        Next r
      If cnta = n Then
      Print #2, 1
      GoTo tt
      End If
      If cntb = n Then
      Print #2, 2
      GoTo tt
      End If
      cnta = 0
      cntb = 0
      Next e
      
      For e = 1 To n
        If a(e, e) = "." Then
        cnta = cnta + 1
        End If
        If b(e, e) = "." Then
        cntb = cntb + 1
        End If
      Next e
      If cnta = n Then
      Print #2, 1
      GoTo tt
      End If
      If cntb = n Then
      Print #2, 2
      GoTo tt
      End If
      
      cnta = 0
      cntb = 0
      
      For e = n To 1 Step -1
        If a(e, e) = "." Then
        cnta = cnta + 1
        End If
        If b(e, e) = "." Then
        cntb = cntb + 1
        End If
      Next e
      If cnta = n Then
      Print #2, 1
      GoTo tt
      End If
      If cntb = n Then
      Print #2, 2
      GoTo tt
      End If
      
    Next j
  Next i
Next w


tt:
For i = 1 To n
  For j = 1 To n
  Debug.Print a(i, j);
  Next j
Debug.Print " "
Next i
For i = 1 To n
  For j = 1 To n
  Debug.Print b(i, j);
  Next j
Debug.Print " "
Next i

End
End Sub
