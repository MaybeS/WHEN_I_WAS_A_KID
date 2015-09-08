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
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   600
      Top             =   1440
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dx, dy, x, y
Private Sub Form_Load()
Randomize
dx = Array(1, 0, -1, 0)
dy = Array(0, 1, 0, -1)
Caption = "Random Walk Simulation v1.0 Programed by jiun"
Width = 8000: Height = 8000
AutoRedraw = True
DrawWidth = 5
x = Width / 2
y = Height / 2
End Sub
Private Sub RndWalk()
 
 If x < 0 Then
 dj = MsgBox("왼쪽", vbOKOnly, "Random Walk")
 x = 4000: y = 4000
 ElseIf x > Width Then
 dj = MsgBox("오른쪽", vbOKOnly, "Random Walk")
 x = 4000: y = 4000
 ElseIf y < 0 Then
 dj = MsgBox("위쪽", vbOKOnly, "Random Walk")
 x = 4000: y = 4000
 ElseIf y > Height Then
 dj = MsgBox("아래쪽", vbOKOnly, "Random Walk")
 x = 4000: y = 4000
 End If
 
  'd = Int(Rnd * 4)'
  'r = Int(Rnd * 300)'
tx = x + Int(Rnd * 500) - 250
ty = y + Int(Rnd * 500) - 250
 Line (x, y)-(tx, ty), QBColor(Int(Rnd * 16))
 x = tx: y = ty

End Sub

Private Sub Timer1_Timer()
  Call RndWalk
End Sub
