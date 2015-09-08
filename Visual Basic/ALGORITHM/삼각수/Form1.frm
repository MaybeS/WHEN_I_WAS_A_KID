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

Input #1, k
tr = k

Dim c(10000)
Dim n(10000)
n(0) = 0

For i = 1 To k
n(i) = i + n(i - 1)
Next i

For i = k To 1 Step -1

If n(i) = k Then
Exit For
Else
  If (k - (n(i) * 2)) = 0 Then
  Min = 2
  GoTo TT
  End If
End If

Next i

For j = 0 To k
cnt = 0: tr = k
    For i = (k - j) To 1 Step -1

        If (tr - n(i)) >= 0 Then
        tr = tr - n(i)
        cnt = cnt + 1
            If (tr) = 0 Then
            Exit For
            End If
            
        End If
        If tr > n(i) Then
        i = i + 1
        End If
        
        If i = 1 And tr > 0 Then
        i = (k - j)
        End If
    
    Next i
If cnt > 0 Then
c(j) = cnt
Else
c(j) = c(j - 1)
End If

Next j
Min = 9999999
For i = 0 To k

  If c(i) < Min Then
  Min = c(i)
  End If

Next i

TT:

Print #2, Min

End
End Sub
