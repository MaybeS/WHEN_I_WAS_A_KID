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
Input #1, yy, mm, dd

mmm = Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
su = Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")

For i = 1 To (yy - 1)

If Int(i / 4) = (i / 4) Then
cnt = cnt + 1
  If Int(i / 100) = (i / 100) Then
  cnt = cnt - 1
    If Int(i / 400) = (i / 400) Then
    cnt = cnt + 1
    End If
  End If
End If

Next i

tr = (((yy - 1) * 365) + cnt - 1)

uu = 0
If Int(yy / 4) = (yy / 4) Then
uu = 1
  If Int(yy / 100) = (yy / 100) Then
  uu = 0
    If Int(yy / 400) = (yy / 400) Then
    uu = 1
    End If
  End If
End If

For i = 1 To mm
tr = tr + mmm(i)
  If i = 2 Then
  tr = tr + uu
  End If
Next i

tr = tr + dd
tr = ((tr) Mod 7)

Print #2, su(tr)

End
End Sub
