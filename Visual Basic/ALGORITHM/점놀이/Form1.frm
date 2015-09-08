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
   StartUpPosition =   3  'Windows ±âº»°ª
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
Dim dx, dy, x, y
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 32 Then
Cls
End If

End Sub

Private Sub Form_Load()
Randomize
dx = Array(1, 0, -1, 0)
dy = Array(0, 1, 0, -1)
Caption = "Random Walk Simulation v1.0 Programed by jiun"
Width = 10000: Height = 10000
AutoRedraw = True
DrawWidth = 5
x = 0
y = 0

End Sub
Private Sub RndWalk()
 
 If x < 0 And x > Width And y < 0 And y > Height Then
 x = 4000: y = 4000
 End If
 
tx = x + Int(Rnd * 2500) - 200
ty = y + Int(Rnd * 2500) - 200
Randomize
r = Int(Rnd * 4)
If r = 0 Then
 Line (x, y)-(tx, ty), vbBlue
ElseIf r = 1 Then
 Line (x, y)-(tx, ty), vbGreen
ElseIf r = 2 Then
 Line (x, y)-(tx, ty), vbWhite
ElseIf r = 3 Then
 Line (x, y)-(tx, ty), vbBlue Or vbGreen
End If
 'x = tx: y = ty

End Sub
Private Sub Timer1_Timer()
  Call RndWalk
End Sub
