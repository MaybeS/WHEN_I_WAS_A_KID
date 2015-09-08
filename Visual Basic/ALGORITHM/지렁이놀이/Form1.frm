VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3180
   ClientLeft      =   60
   ClientTop       =   360
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3180
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows 기본값
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   1080
      Top             =   2400
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   120
      Top             =   2640
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dx, dy, x, y, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, yy
Dim cnt1, cnt2, cnt3, cnt4, r1, r2, r3, r4, r5, r6, r7
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 32 Then
Cls
ElseIf KeyCode = 13 Then
x = 5000: y = 5000: x3 = 5000: y3 = 5000: x4 = 5000: y4 = 5000: x5 = 5000: y5 = 5000
x6 = 5000: y6 = 5000: x7 = 5000: y7 = 5000: x8 = 5000: y8 = 5000
ElseIf KeyCode = 65 Then
Cls
x = 5000: y = 5000: x3 = 5000: y3 = 5000: x4 = 5000: y4 = 5000: x5 = 5000: y5 = 5000
x6 = 5000: y6 = 5000: x7 = 5000: y7 = 5000: x8 = 5000: y8 = 5000
Cls
End If

End Sub
Private Sub Form_Load()
TT:
dj = InputBox("위쪽, 왼쪽, 오른쪽, 아래쪽, 중에 한가지를 선택하시오", "지렁이게임")
If dj = "위쪽" Then
yy = dj
ElseIf dj = "왼쪽" Then
yy = dj
ElseIf dj = "아래쪽" Then
yy = dj
ElseIf dj = "오른쪽" Then
yy = dj
Else
GoTo TT
End If

cnt1 = 0:: cnt2 = 0: cnt3 = 0: cnt4 = 0

Randomize
dx = Array(1, 0, -1, 0)
dy = Array(0, 1, 0, -1)
Caption = "Random Walk Simulation v1.0 Programed by jiun"
Width = 10000: Height = 10000
AutoRedraw = True
DrawWidth = 5
x = Width / 2
y = Height / 2
x3 = Width / 2
y3 = Height / 2
x4 = Width / 2
y4 = Height / 2
x5 = Width / 2
y5 = Height / 2
x6 = Width / 2
y6 = Height / 2
x7 = Width / 2
y7 = Height / 2
x8 = Width / 2
y8 = Height / 2
End Sub
Private Sub RndWalk()
 
 If x < 0 Then
cnt1 = cnt1 + 1: r1 = 1
 ElseIf x > Width Then
cnt2 = cnt2 + 1: r1 = 1
 ElseIf y < 0 Then
cnt3 = cnt3 + 1: r1 = 1
 ElseIf y > Height Then
cnt4 = cnt4 + 1: r1 = 1
 End If
 
tx = x + Int(Rnd * 500) - 250
ty = y + Int(Rnd * 500) - 250
 Line (x, y)-(tx, ty), QBColor(Int(Rnd * 16))
 x = tx: y = ty

End Sub
Private Sub RndWalk1()

 If x3 < 0 Then
cnt1 = cnt1 + 1: r2 = 1
 ElseIf x3 > Width Then
cnt2 = cnt2 + 1: r2 = 1
 ElseIf y3 < 0 Then
cnt3 = cnt3 + 1: r2 = 1
 ElseIf y3 > Height Then
cnt4 = cnt4 + 1: r2 = 1
 End If

ax = x3 + Int(Rnd * 500) - 250
ay = y3 + Int(Rnd * 500) - 250
 Line (x3, y3)-(ax, ay), QBColor(Int(Rnd * 16))
 x3 = ax: y3 = ay

End Sub
Private Sub RndWalk2()

 If x8 < 0 Then
cnt1 = cnt1 + 1: r7 = 1
 ElseIf x8 > Width Then
cnt2 = cnt2 + 1: r7 = 1
 ElseIf y8 < 0 Then
cnt3 = cnt3 + 1: r7 = 1
 ElseIf y8 > Height Then
cnt4 = cnt4 + 1: r7 = 1
 End If

hx = x8 + Int(Rnd * 500) - 250
hy = y8 + Int(Rnd * 500) - 250
 Line (x8, y8)-(hx, hy), QBColor(Int(Rnd * 16))
 x8 = hx: y8 = hy

End Sub
Private Sub RndWalk3()

 If x4 < 0 Then
cnt1 = cnt1 + 1: r3 = 1
 ElseIf x4 > Width Then
cnt2 = cnt2 + 1: r3 = 1
 ElseIf y4 < 0 Then
cnt3 = cnt3 + 1: r3 = 1
 ElseIf y4 > Height Then
cnt4 = cnt4 + 1: r3 = 1
 End If

cx = x4 + Int(Rnd * 500) - 250
cy = y4 + Int(Rnd * 500) - 250
 Line (x4, y4)-(cx, cy), QBColor(Int(Rnd * 16))
 x4 = cx: y4 = cy

End Sub
Private Sub RndWalk4()

 If x5 < 0 Then
cnt1 = cnt1 + 1: r4 = 1
 ElseIf x5 > Width Then
cnt2 = cnt2 + 1: r4 = 1
 ElseIf y5 < 0 Then
cnt3 = cnt3 + 1: r4 = 1
 ElseIf y5 > Height Then
cnt4 = cnt4 + 1: r4 = 1
 End If

ex = x5 + Int(Rnd * 500) - 250
ey = y5 + Int(Rnd * 500) - 250
 Line (x5, y5)-(ex, ey), QBColor(Int(Rnd * 16))
 x5 = ex: y5 = ey

End Sub
Private Sub RndWalk5()

 If x6 < 0 Then
cnt1 = cnt1 + 1: r5 = 1
 ElseIf x6 > Width Then
cnt2 = cnt2 + 1: r5 = 1
 ElseIf y6 < 0 Then
cnt3 = cnt3 + 1: r5 = 1
 ElseIf y6 > Height Then
cnt4 = cnt4 + 1: r5 = 1
 End If

fx = x6 + Int(Rnd * 500) - 250
fy = y6 + Int(Rnd * 500) - 250
 Line (x6, y6)-(fx, fy), QBColor(Int(Rnd * 16))
 x6 = fx: y6 = fy

End Sub
Private Sub RndWalk6()

 If x7 < 0 Then
cnt1 = cnt1 + 1: r6 = 1
 ElseIf x7 > Width Then
cnt2 = cnt2 + 1: r6 = 1
 ElseIf y7 < 0 Then
cnt3 = cnt3 + 1: r6 = 1
 ElseIf y7 > Height Then
cnt4 = cnt4 + 1: r6 = 1
 End If

gx = x7 + Int(Rnd * 500) - 250
gy = y7 + Int(Rnd * 500) - 250
 Line (x7, y7)-(gx, gy), QBColor(Int(Rnd * 16))
 x7 = gx: y7 = gy

End Sub
Private Sub Timer1_Timer()
If r1 <> 1 Then
  Call RndWalk
End If
If r2 <> 1 Then
  Call RndWalk1
End If
If r7 <> 1 Then
  Call RndWalk2
End If
If r3 <> 1 Then
  Call RndWalk3
End If
If r4 <> 1 Then
  Call RndWalk4
End If
If r5 <> 1 Then
  Call RndWalk5
End If
If r6 <> 1 Then
  Call RndWalk6
End If
End Sub
Private Sub Timer2_Timer()


If cnt1 + cnt2 + cnt3 + cnt4 = 7 Then
Max = 0

  If cnt1 > Max Then
  Max = cnt1: tr = "왼쪽"
  ElseIf cnt2 > Max Then
  Max = cnt2: tr = "오른쪽"
  ElseIf cnt3 > Max Then
  Max = cnt3: tr = "위쪽"
  ElseIf cnt4 > Max Then
  Max = cnt4: tr = "아래쪽"
  End If
  
djww = MsgBox(" 지렁이는 " & tr & " 으로 많이갔습니다", vbOKOnly, "지렁이게임")
If yy = tr Then
djww = MsgBox("맞았네요.", vbOKOnly, "지렁이게임")
End
Else
djww = MsgBox("틀렸네요.", vbOKOnly, "지렁이게임")
End
End If

End If



End Sub
