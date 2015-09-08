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
Dim k(300), na(300), co(300), at(300), bt(300), ct(300), kt(300)
Dim co2(300), at2(300), bt2(300), ct2(300), cs2(300), cs(300)
Dim na1, co1, at1, bt1, ct1: na1 = 1: co1 = 1: at1 = 1: bt1 = 1: ct1 = 1
For i = 1 To n: co2(i) = 1: at2(i) = 1: bt2(i) = 1: ct2(i) = 1: cs2(i) = 1: kt(i) = 1: Next i
For i = 1 To n
Line Input #1, k(i)
Next i
For i = 1 To n
k(i) = k(i) & " ": cnt = 0: sd = 1
  For j = 1 To Len(k(i))
  tr = Mid(k(i), j, 1)
  If tr = " " Then
  cnt = cnt + 1
    If cnt = 1 Then
    na(na1) = Mid(k(i), sd, (j - sd))
    na1 = na1 + 1
    ElseIf cnt = 2 Then
    co(co1) = Mid(k(i), sd, (j - sd))
      If Max < Mid(k(i), sd, (j - sd)) Then
      Max = Mid(k(i), sd, (j - sd))
      End If
    co1 = co1 + 1
    ElseIf cnt = 3 Then
    at(at1) = Mid(k(i), sd, (j - sd))
    at1 = at1 + 1
    ElseIf cnt = 4 Then
    bt(bt1) = Mid(k(i), sd, (j - sd))
    bt1 = bt1 + 1
    ElseIf cnt = 5 Then
    ct(ct1) = Mid(k(i), sd, (j - sd))
    ct1 = ct1 + 1
    End If
  sd = j + 1
  End If
  Next j
Next i
For i = 0 To n
cs(i) = Val(at(i)) + Val(bt(i)) + Val(ct(i))
Next i
For i = 1 To n - 1
  For j = i + 1 To n
  If Val(at(i)) < Val(at(j)) Then at2(i) = at2(i) + 1
  If Val(at(j)) < Val(at(i)) Then at2(j) = at2(j) + 1
  Next j
Next i
For i = 1 To n - 1
  For j = i + 1 To n
  If Val(bt(i)) < Val(bt(j)) Then bt2(i) = bt2(i) + 1
  If Val(bt(j)) < Val(bt(i)) Then bt2(j) = bt2(j) + 1
  Next j
Next i
For i = 1 To n - 1
  For j = i + 1 To n
  If Val(ct(i)) < Val(ct(j)) Then ct2(i) = ct2(i) + 1
  If Val(ct(j)) < Val(ct(i)) Then ct2(j) = ct2(j) + 1
  Next j
Next i
For i = 1 To n - 1
  For j = i + 1 To n
  If Val(cs(i)) < Val(cs(j)) Then cs2(i) = cs2(i) + 1
  If Val(cs(j)) < Val(cs(i)) Then cs2(j) = cs2(j) + 1
  Next j
Next i

For i = 1 To n - 1
  For j = i + 1 To n
    If co(i) = co(j) Then
      If Val(cs(i)) < Val(cs(j)) Then kt(i) = kt(i) + 1
      If Val(cs(j)) < Val(cs(i)) Then kt(j) = kt(j) + 1
    End If
  Next j
Next i

For i = 1 To n
Print #2, na(i) & " " & co(i) & "(" & kt(i) & ")" & " " & cs(i) & "(" & cs2(i) & ")" & " " & at(i) & "(" & at2(i) & ")" & " " & bt(i) & "(" & bt2(i) & ")" & " " & ct(i) & "(" & ct2(i) & ")"
Next i
End
End Sub
