VERSION 5.00
Begin VB.Form fMain 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  '단일 고정
   Caption         =   "Seeker.ρ"
   ClientHeight    =   9255
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11730
   DrawWidth       =   5
   BeginProperty Font 
      Name            =   "맑은 고딕"
      Size            =   14.25
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H000000FF&
   LinkTopic       =   "form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   617
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   782
   StartUpPosition =   2  '화면 가운데
End
Attribute VB_Name = "fMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SetProcessWorkingSetSize Lib "kernel32" (ByVal hProcess As Long, ByVal dwMinimumWorkingSetSize As Long, ByVal dwMaximumWorkingSetSize As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
        KeyPressCheck = True
        KeySet(KeyCode) = True
    If Shift = 1 Then
        KeySet(255) = True
    End If
End Sub
Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
        KeyPressCheck = False
        KeySet(KeyCode) = False
    If Shift = 0 Then
        KeySet(255) = False
    End If
End Sub
Private Sub Form_Load()
SetProcessWorkingSetSize GetCurrentProcess(), -1&, -1&
    
    Me.Show
    bSet.SetValue
    bMain.MainLoop
End Sub
Private Sub Form_Unload(Cancel As Integer)
    End
End Sub
Public Sub CheckKeyPress()
        If KeySet(255) Then
            If KeySet(37) And Mi.X > -5 Then Mi.X = Mi.X - 2
                    
            If KeySet(38) And Mi.Y > -5 Then Mi.Y = Mi.Y - 2
                    
            If KeySet(39) And Mi.X < (fMain.ScaleWidth + 30) Then Mi.X = Mi.X + 2
                    
            If KeySet(40) And Mi.Y < (fMain.ScaleHeight - 30) Then Mi.Y = Mi.Y + 2
        Else
        
            If KeySet(37) And Mi.X > 0 Then Mi.X = Mi.X - Mi.Xs - 3 '왼쪽
                    
            If KeySet(38) And Mi.Y > -25 Then Mi.Y = Mi.Y - Mi.Ys - 3 '위쪽
                    
            If KeySet(39) And Mi.X < (fMain.ScaleWidth - 20) Then Mi.X = Mi.X + Mi.Xs + 3 '오른쪽
                    
            If KeySet(40) And Mi.Y < (fMain.ScaleHeight - 45) Then Mi.Y = Mi.Y + Mi.Ys + 3 '아래쪽
    End If
End Sub

