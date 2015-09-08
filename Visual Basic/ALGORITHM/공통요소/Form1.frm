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
Open "output.txt " For Output As #2
Dim a(1000), b(1000), c(1000), ty(100)
cnt = 0

Input #1, na
For i = 1 To na
Input #1, a(i)
Next i

Input #1, nb
For i = 1 To nb
Input #1, b(i)
Next i

Input #1, nc
For i = 1 To nc
Input #1, c(i)
Next i

For i = 1 To na
  For j = 1 To nb
    For k = 1 To nc
    
      If (a(i) = b(j)) And (b(j) = c(k)) And (c(k) = a(i)) Then
      cnt = cnt + 1
      End If
    
    Next k
  Next j
Next i

Print #2, cnt
cnt = 0

For i = 1 To (na - 1)
  For j = i To na
    If a(i) > a(j) Then
    t = a(i): a(i) = a(j): a(j) = t
    End If
  Next j
Next i
For i = 1 To (nb - 1)
  For j = i To nb
    If b(i) > b(j) Then
    t = b(i): b(i) = b(j): b(j) = t
    End If
  Next j
Next i
For i = 1 To (nc - 1)
  For j = i To nc
    If c(i) > c(j) Then
    t = c(i): c(i) = c(j): c(j) = t
    End If
  Next j
Next i

For i = 1 To na
  For j = 1 To nb
    If a(i) = b(j) Then
    
    cnt = cnt + 1
    ty(cnt) = a(i)
    End If
  Next j
Next i

For i = 1 To nb
  For j = 1 To nc
    If b(i) = c(j) Then
    
    cnt = cnt + 1
    ty(cnt) = b(i)
    End If
  Next j
Next i

For i = 1 To nc
  For j = 1 To na
    If c(i) = a(j) Then
    
    cnt = cnt + 1
    ty(cnt) = c(i)
    End If
  Next j
Next i
tr = 0
For i = 1 To (cnt - 1)
  For j = i To cnt
    If (ty(i) = ty(j)) And (i <> j) Then
    tr = tr + 1
    End If
  Next j
Next i

Print #2, ((na + nb + nc) - tr)

End
End Sub
