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
Dim a(1000)
For i = 1 To 100
  For j = 1 To 10000
    If j = 1737 Then
    u = 7
    End If
  cnt = 1
  tr = i * j
  
    For k = 1 To Len(i)
    a(cnt) = Val(Mid(i, k, 1))
        If a(cnt) = 0 Then
        GoTo uu
        End If
    cnt = cnt + 1
    Next k
    
    For k = 1 To Len(j)
    a(cnt) = Val(Mid(j, k, 1))
        If a(cnt) = 0 Then
        GoTo uu
        End If
    cnt = cnt + 1
    Next k
    
    For k = 1 To Len(tr)
    a(cnt) = Val(Mid(tr, k, 1))
        If a(cnt) = 0 Then
        GoTo uu
        End If
    cnt = cnt + 1
    Next k
    
  tue = 0
  If cnt <> 10 Then
  Else
        For k = 1 To 9
          For t = 1 To 9
            If a(k) = a(t) And (k <> t) Then
            GoTo uu
            Else
            tue = tue + 1
            End If
          Next t
        Next k
        If tue = 81 Then
          Print #2, i & "X" & j & "=" & tr
        End If
  End If
  
uu:
  Next j
Next i

End
End Sub
