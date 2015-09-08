VERSION 5.00
Begin VB.Form F_Cris 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00404040&
   BorderStyle     =   0  '없음
   Caption         =   "Form1"
   ClientHeight    =   7335
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   17850
   BeginProperty Font 
      Name            =   "맑은 고딕"
      Size            =   12
      Charset         =   129
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "F_Cris.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   489
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   1190
   StartUpPosition =   2  '화면 가운데
   Visible         =   0   'False
   Begin VB.PictureBox Contain 
      Appearance      =   0  '평면
      BackColor       =   &H00FFC0C0&
      BeginProperty Font 
         Name            =   "굴림"
         Size            =   9
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   6735
      Left            =   240
      ScaleHeight     =   447
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   1127
      TabIndex        =   0
      Top             =   240
      Visible         =   0   'False
      Width           =   16935
      Begin VB.PictureBox Pic_ico 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   615
         Index           =   0
         Left            =   6240
         ScaleHeight     =   615
         ScaleWidth      =   615
         TabIndex        =   10
         Top             =   4320
         Width           =   615
      End
      Begin VB.PictureBox Pic_Logo 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   1500
         Left            =   6240
         Picture         =   "F_Cris.frx":C2B2
         ScaleHeight     =   100
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   260
         TabIndex        =   9
         Top             =   2760
         Width           =   3900
      End
      Begin VB.Timer KeyTime 
         Interval        =   1
         Left            =   3600
         Top             =   4200
      End
      Begin VB.Timer TimerShift 
         Interval        =   5
         Left            =   3120
         Top             =   4200
      End
      Begin VB.PictureBox HexUIImg 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         FillColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2250
         Index           =   6
         Left            =   14520
         ScaleHeight     =   150
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   150
         TabIndex        =   8
         Top             =   240
         Width           =   2250
      End
      Begin VB.PictureBox HexUIImg 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         FillColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2250
         Index           =   5
         Left            =   12120
         ScaleHeight     =   150
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   150
         TabIndex        =   7
         Top             =   240
         Width           =   2250
      End
      Begin VB.PictureBox HexUIImg 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         FillColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2250
         Index           =   4
         Left            =   9720
         ScaleHeight     =   150
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   150
         TabIndex        =   6
         Top             =   240
         Width           =   2250
      End
      Begin VB.PictureBox HexUIImg 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         FillColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2250
         Index           =   3
         Left            =   7320
         ScaleHeight     =   150
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   150
         TabIndex        =   5
         Top             =   240
         Width           =   2250
      End
      Begin VB.PictureBox HexUIImg 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         FillColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2250
         Index           =   2
         Left            =   4920
         ScaleHeight     =   150
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   150
         TabIndex        =   4
         Top             =   240
         Width           =   2250
      End
      Begin VB.PictureBox HexUIImg 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         FillColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2250
         Index           =   1
         Left            =   2520
         ScaleHeight     =   150
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   150
         TabIndex        =   3
         Top             =   240
         Width           =   2250
      End
      Begin VB.PictureBox HexUIMask 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  '없음
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2250
         Left            =   120
         ScaleHeight     =   150
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   150
         TabIndex        =   2
         Top             =   2760
         Width           =   2250
      End
      Begin VB.PictureBox HexUIImg 
         Appearance      =   0  '평면
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  '없음
         FillColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2250
         Index           =   0
         Left            =   120
         ScaleHeight     =   150
         ScaleMode       =   3  '픽셀
         ScaleWidth      =   150
         TabIndex        =   1
         Top             =   240
         Width           =   2250
      End
   End
End
Attribute VB_Name = "F_Cris"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim KeyResult As Long, Shift As Boolean
Private Sub Form_Click()
Dim i As Integer, Xs As Integer, Ys As Integer

If CrisState.FrameCnt = 0 Then

    GetCursorPos CurC
        
    For i = 0 To 6
    
        Xs = CurX.x - (((3 ^ (1 / 2)) * (CrisState.UI_Size - CrisState.UI_Size)) / 2) - CrisState.UI_Size * 2 + CrisState.Rgn_Nex(i).x
        Ys = CurX.Y - CrisState.UI_Size * (3 ^ (1 / 2)) + CrisState.Rgn_Nex(i).Y
    
        If Distance(CurC.x, CurC.Y, Xs, Ys) < CrisState.UI_Size Then
            
            NHex = i
            HexRgn_Click i
            Exit For
            
        End If
        
    Next i
    
End If

End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
Dim i As Integer, Xs As Integer, Ys As Integer

If CrisState.FrameCnt = 0 Then

    GetCursorPos CurC
        
    For i = 0 To 6
    
        Xs = CurX.x - (((3 ^ (1 / 2)) * (CrisState.UI_Size - CrisState.UI_Size)) / 2) - CrisState.UI_Size * 2 + CrisState.Rgn_Nex(i).x
        Ys = CurX.Y - CrisState.UI_Size * (3 ^ (1 / 2)) + CrisState.Rgn_Nex(i).Y
    
        If Distance(CurC.x, CurC.Y, Xs, Ys) < CrisState.UI_Size Then
            
            HexRgn_MouseDown i
            Exit For
            
        End If
        
    Next i

End If

End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
Dim i As Integer, Xs As Integer, Ys As Integer
    GetCursorPos CurC
        
    For i = 0 To 6
    
        Xs = CurX.x - (((3 ^ (1 / 2)) * (CrisState.UI_Size - CrisState.UI_Size)) / 2) - CrisState.UI_Size * 2 + CrisState.Rgn_Nex(i).x
        Ys = CurX.Y - CrisState.UI_Size * (3 ^ (1 / 2)) + CrisState.Rgn_Nex(i).Y
    
        If Distance(CurC.x, CurC.Y, Xs, Ys) < CrisState.UI_Size Then
            HexRgn_MouseOver i
            Exit For
            
        End If
        
    Next i
End Sub
Public Sub HexRgn_Click(ByVal Index As Integer)

    DrawUI_Click Index
    Event_Click Index
    
End Sub
Public Sub HexRgn_MouseOver(ByVal Index As Integer)

    DrawUI_Over Index
    Event_MouseOver Index
    
End Sub
Public Sub HexRgn_MouseDown(ByVal Index As Integer)

    Event_MouseDown Index
    
End Sub
Private Sub KeyTime_Timer()

If Not F_Main.Visible Then

'`~~~~~~~~~~~~~~~~~~~~~~~~~~~~KeyLog 해당키를 핫키로 인식할떄 사용됩니다.

KeyResult = GetAsyncKeyState(13)
    If KeyResult = -32767 Then
        'Enter
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(17)
    If KeyResult = -32767 Then
        'Ctrl
            If Shift Then
                        If CrisState.FrameCnt = 0 Then
                            If F_Cris.Visible Then
                                CrisState.Show = False
                                CrisState.FrameCnt = 15
                            Else
                                CrisState.SubShow = False
                                CrisState.SubFrameCnt = 15
                                CrisState.Show = True
                                CrisState.FrameCnt = 15
                                GetCursorPos CurX
                            End If
                        End If
            End If
    End If

KeyResult = GetAsyncKeyState(8)
    If KeyResult = -32767 Then
        'BackSpace
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(9)
    If KeyResult = -32767 Then
        'Tab
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(18)
    If KeyResult = -32767 Then
        'Alt
        GoTo KeyFound
    End If
   
KeyResult = GetAsyncKeyState(19)
    If KeyResult = -32767 Then
        'Pause
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(27)
    If KeyResult = -32767 Then
        'ESC
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(33)
    If KeyResult = -32767 Then
        'PageUP
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(34)
    If KeyResult = -32767 Then
        'PageDown
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(35)
    If KeyResult = -32767 Then
        'End
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(36)
    If KeyResult = -32767 Then
        'Home
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(45)
    If KeyResult = -32767 Then
        'Insert
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(46)
    If KeyResult = -32767 Then
        'Delete
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(144)
    If KeyResult = -32767 Then
        'Numlock
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(37)
    If KeyResult = -32767 Then
        'Left
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(38)
    If KeyResult = -32767 Then
        'Up
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(39)
    If KeyResult = -32767 Then
        'Right
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(40)
    If KeyResult = -32767 Then
        'Down
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(91)
    If KeyResult = -32767 Then
        'Windows
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(92)
    If KeyResult = -32767 Then
        'Windows
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(93)
    If KeyResult = -32767 Then
        'Properties
        GoTo KeyFound
    End If
    
'Keys
For i = 65 To 90 'alphabet
    KeyResult = GetAsyncKeyState(i)
        If KeyResult = -32767 Then
            GoTo KeyFound
        End If
Next i

For i = 48 To 57 'ding
    KeyResult = GetAsyncKeyState(i)
        If KeyResult = -32767 Then
            If Shift Then
                'If i = 49 Then AddKey Chr(33) '!
                'If i = 50 Then AddKey Chr(64) '@
                'If i = 51 Then AddKey Chr(35) '#
                'If i = 52 Then AddKey Chr(36) '$
                'If i = 53 Then AddKey Chr(37) '%
                'If i = 54 Then AddKey Chr(94) '^
                'If i = 55 Then AddKey Chr(38) '&
                'If i = 56 Then AddKey Chr(42) '*
                'If i = 57 Then AddKey Chr(40) '(
                'If i = 48 Then AddKey Chr(41) ')
            Else
                'AddKey Chr(i)
            End If
            GoTo KeyFound
        End If
Next i

KeyResult = GetAsyncKeyState(16) '219
    If KeyResult = -32767 And Not Shift Then
        'Shift
        Shift = True
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(32)
    If KeyResult = -32767 Then
        'Space
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(189)
    If KeyResult = -32767 Then
        If Shift Then '_ Else AddKey "-"
        End If
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(187)
    If KeyResult = -32767 Then
        If Shift Then 'AddKey "+" Else AddKey "="
        End If
        GoTo KeyFound
    End If
    
'------------FUNCTION KEYS

KeyResult = GetAsyncKeyState(112)
    If KeyResult = -32767 Then
        'F1
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(113)
    If KeyResult = -32767 Then
        'F2
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(114)
    If KeyResult = -32767 Then
        'F3
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(115)
    If KeyResult = -32767 Then
        'F4
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(116)
    If KeyResult = -32767 Then
        'F5
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(117)
    If KeyResult = -32767 Then
        'F6
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(118)
    If KeyResult = -32767 Then
        'F7
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(119)
    If KeyResult = -32767 Then
        'F8
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(120)
    If KeyResult = -32767 Then
        'F9
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(121)
    If KeyResult = -32767 Then
        'F10
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(122)
    If KeyResult = -32767 Then
        'F11
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(123)
    If KeyResult = -32767 Then
        'F12
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(124)
    If KeyResult = -32767 Then
        'F13
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(125)
    If KeyResult = -32767 Then
        'F14
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(126)
    If KeyResult = -32767 Then
        'F15
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(127)
    If KeyResult = -32767 Then
        'F16
        GoTo KeyFound
    End If
    
'Special Keys
KeyResult = GetAsyncKeyState(186)
    If KeyResult = -32767 Then
        'If Shift Then AddKey ":" Else AddKey ";"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(188)
    If KeyResult = -32767 Then
        'If Shift Then AddKey "<" Else AddKey ","
        GoTo KeyFound
    End If
     
KeyResult = GetAsyncKeyState(190)
    If KeyResult = -32767 Then
        'If Shift Then AddKey ">" Else AddKey "."
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(191)
    If KeyResult = -32767 Then
        'If Shift Then AddKey "?" Else AddKey "/"
        GoTo KeyFound
    End If
  
KeyResult = GetAsyncKeyState(192)
    If KeyResult = -32767 Then
        'If Shift Then AddKey "~" Else AddKey "`" '`
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(222)
    If KeyResult = -32767 Then
        'If Shift Then AddKey Chr(34) Else AddKey "'"
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(220)
    If KeyResult = -32767 Then
        'If Shift Then AddKey "|" Else AddKey "\"
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(221)
    If KeyResult = -32767 Then
        'If Shift Then AddKey "}" Else AddKey "]"
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(219) '219
    If KeyResult = -32767 Then
        'If Shift Then AddKey "{" Else AddKey "["
        GoTo KeyFound
    End If

'----------NUM PAD
KeyResult = GetAsyncKeyState(96)
    If KeyResult = -32767 Then
        'AddKey "0"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(97)
    If KeyResult = -32767 Then
        'AddKey "1"
        GoTo KeyFound
    End If
     

KeyResult = GetAsyncKeyState(98)
    If KeyResult = -32767 Then
        'AddKey "2"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(99)
    If KeyResult = -32767 Then
        'AddKey "3"
        GoTo KeyFound
    End If
    
    
KeyResult = GetAsyncKeyState(100)
    If KeyResult = -32767 Then
        'AddKey "4"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(101)
    If KeyResult = -32767 Then
        'AddKey "5"
        GoTo KeyFound
    End If
    
    
KeyResult = GetAsyncKeyState(102)
    If KeyResult = -32767 Then
        'AddKey "6"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(103)
    If KeyResult = -32767 Then
        'AddKey "7"
        GoTo KeyFound
    End If
    
    
KeyResult = GetAsyncKeyState(104)
    If KeyResult = -32767 Then
        'AddKey "8"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(105)
    If KeyResult = -32767 Then
        'AddKey "9"
        GoTo KeyFound
    End If
       
    
KeyResult = GetAsyncKeyState(106)
    If KeyResult = -32767 Then
        'AddKey "*"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(107)
    If KeyResult = -32767 Then
        'AddKey "+"
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(108)
    If KeyResult = -32767 Then
        'AddKey "[ENTER]"
        GoTo KeyFound
    End If
 
KeyResult = GetAsyncKeyState(109)
    If KeyResult = -32767 Then
        'AddKey "-"
        GoTo KeyFound
    End If
    
KeyResult = GetAsyncKeyState(110)
    If KeyResult = -32767 Then
        'AddKey "."
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(111)
    If KeyResult = -32767 Then
        'AddKey "/"
        GoTo KeyFound
    End If

KeyResult = GetAsyncKeyState(145)
    If KeyResult = -32767 Then
        If Scroll Then
            'AddKey "[ScrollLockOff]"
            Scroll = False
        Else
            'AddKey "[ScrollLockOn]"
            Scroll = True
        End If
        GoTo KeyFound
    End If

KeyFound:

If Shift Then
    KeyResult = GetAsyncKeyState(16) '219
    If KeyResult <> -32767 And KeyResult <> -32768 Then
        Shift = False
    End If
End If

End If

End Sub
Private Sub TimerShift_Timer()
Dim Xnr As Integer
GetCursorPos CurA

If Not F_Main.Visible Then
    
    If CrisState.Show Then
    
        If Not F_Cris.Visible Then Cris_HexRgn: F_Cris.Visible = True: NHex = 0
        
        If CrisState.FrameCnt > 0 Then
        
            CrisState.FrameCnt = CrisState.FrameCnt - 1
            
                For i = 1 To 6
                
                    CrisState.Rgn_Nex(i).x = SMove(CrisState.Rgn_Nex(i).x, CrisState.Rgn_Hex(i).x, CrisState.UI_Speed)
                    CrisState.Rgn_Nex(i).Y = SMove(CrisState.Rgn_Nex(i).Y, CrisState.Rgn_Hex(i).Y, CrisState.UI_Speed)
                    
                Next i
                    'SMove함수를 이용해 Hexagon UI들이 자기자리로 갑니다.
                
            'Me.Cls
            Cris_HexRgn
            WindowTransparency F_Cris.hWnd, byValue, , 200 - CrisState.FrameCnt * 10
                '점점 또렸해집니다. 초기값은 FrameCnt와 같습니다.
            DoEvents
            
        End If
        
    Else
    
        If CrisState.FrameCnt > 0 Then
            
            CrisState.FrameCnt = CrisState.FrameCnt - 1
            
                For i = 1 To 6
                
                    If i = NHex Then
                    
                        CrisState.Rgn_Nex(i).x = SMove(CrisState.Rgn_Nex(i).x, CrisState.Rgn_Hex(0).x, CrisState.UI_Speed)
                        CrisState.Rgn_Nex(i).Y = SMove(CrisState.Rgn_Nex(i).Y, CrisState.Rgn_Hex(0).Y, CrisState.UI_Speed)
                        
                    End If
                    
                Next i
                    'SMove함수를 이용해 Hexagon UI들이 0위치로 갑니다.
            
            'Me.Cls
            Cris_HexRgn
            WindowTransparency F_Cris.hWnd, byValue, , CrisState.FrameCnt * 10 + 50
                '점점 흐려집니다. 초기값은 FrameCnt와 같습니다.
            DoEvents
            
        Else
                For i = 1 To 6
                    CrisState.Rgn_Nex(i).x = CrisState.Rgn_Hex(0).x
                    CrisState.Rgn_Nex(i).Y = CrisState.Rgn_Hex(0).Y
                Next i
                
            If F_Cris.Visible Then F_Cris.Visible = False
            
        End If
        
    End If
    
    '~~~~~~~~~~~~~~~~~~~~~
    
    If CrisState.SubShow Then
                
        Select Case NHex
            
            Case 0
            
                    Messageblt
                    
                    If ChatLY > 360 Then
                    
                        If ChatY < -170 Then ChatY = ChatY + (-170 - ChatY) / 10 + 1
                        
                    End If
                    
                    If ChatLY - 460 < ChatY Then ChatY = ChatY - ((ChatY - ChatLY + 460) / 10) - 1
                    
                        
                If ChatYYDelay >= 10 Then
                    
                    If ChatYY > 0 Then ChatYY = ChatYY - 1 - (ChatYY / 10)
                    
                    If ChatYY < 0 Then ChatYY = ChatYY + 1 - (ChatYY / 10)
                    
                    If ChatYY > 25 Then ChatYY = 25
                    
                    If ChatYY < -25 Then ChatYY = -25
                    
                        ChatYYDelay = 0
                        
                Else
                
                        ChatYYDelay = ChatYYDelay + 1
                        
                End If
                    
            Case 1
            Case 2
                
                If CurA.Y > F_Sub.Top Then
                    
                End If
                
            Case 3
                
                CrisSubBoxBlt
                
                If CurA.x > (F_Sub.Left / Screen.TwipsPerPixelX) + 45 And CurA.x < F_Sub.SubBox(3).Left + F_Sub.Text_Memo.Left + (F_Sub.Left / Screen.TwipsPerPixelX) Then
                    
                    F_Sub.Text_Memo.Left = SMove(F_Sub.Text_Memo.Left, 160, CrisState.UI_Speed)
                    F_Sub.List_Memo.Left = F_Sub.Text_Memo.Left - F_Sub.List_Memo.Width - 10
                    F_Sub.Shape_null(5).Left = F_Sub.List_Memo.Left + 3
                    F_Sub.Text_Title.Left = F_Sub.Shape_null(5).Left + 13
                
                Else
                
                    F_Sub.Text_Memo.Left = SMove(F_Sub.Text_Memo.Left, 6, CrisState.UI_Speed)
                    F_Sub.List_Memo.Left = F_Sub.Text_Memo.Left - F_Sub.List_Memo.Width - 10
                    F_Sub.Shape_null(5).Left = F_Sub.List_Memo.Left + 3
                    F_Sub.Text_Title.Left = F_Sub.Shape_null(5).Left + 13
                    
                End If
                
                If CurA.Y > F_Sub.Top / Screen.TwipsPerPixelY And CurA.Y < F_Sub.Text_Memo.Top + F_Sub.Top / Screen.TwipsPerPixelY Then
                    
                    If F_Sub.Text_Memo.Top < 75 Then
                        
                        F_Sub.Text_Memo.Top = SMove(F_Sub.Text_Memo.Top, 75, CrisState.UI_Speed)
                        
                    Else
                        
                        F_Sub.Text_Memo.Top = 75
                        
                    End If
                    
                
                Else
                
                    If F_Sub.Text_Memo.Top > 45 Then
                        
                        F_Sub.Text_Memo.Top = SMove(F_Sub.Text_Memo.Top, 45, CrisState.UI_Speed)
                        
                    Else
                        
                        F_Sub.Text_Memo.Top = 45
                        
                    End If
                    
                End If
                
            Case 4
            Case 5
            Case 6
                
                     
        End Select
        
                SubGradationBlt F_Sub.SubBox(0), 0, 0, CrisSet.SubForm(0).Height
            
            '~~~~~~~~~~~~~~~~~~~~~~~
            
        If Not F_Sub.Visible Then F_Sub.Visible = True
        
        If CrisState.SubFrameCnt > 0 Then
        
            CrisState.SubFrameCnt = CrisState.SubFrameCnt - 1
            'Cris_SubRgn
            'F_Sub.Left = F_Sub.Left + 10 * ((16 - CrisState.SubFrameCnt) / 3)
            WindowTransparency F_Sub.hWnd, byValue, , 200 - CrisState.FrameCnt * 10
            DoEvents
        
        Else
        End If
    
    Else
    
        
        If CrisState.SubFrameCnt > 0 Then
        
            CrisState.SubFrameCnt = CrisState.SubFrameCnt - 1
            WindowTransparency F_Sub.hWnd, byValue, , CrisState.FrameCnt * 10 + 50
            DoEvents
        
        Else
        
            If F_Sub.Visible Then F_Sub.Visible = False
        
        End If
    
    End If
    
    '~~~~~~~~~~~~~~~~~~
    
    If CrisState.NotiShow Then
    
        'TextPrint F_Noti, 45, 3, GetLanInf("Text.5"), vbWhite, 13
        'TextPrint F_Noti, 55, 30, "Facebook 10건", vbWhite, 10
        'TextPrint F_Noti, 55, 45, "Twitter 5건", vbWhite, 10
        'TextPrint F_Noti, 55, 60, "네이버me 7건", vbWhite, 10
        'TextPrint F_Noti, 55, 75, "Gmail 3건", vbWhite, 10
    
    Else
    
        
    
    End If
    
    '~~~~~~~~~~~~~~~~
    
    If CrisState.NotiVisible Then
    
        If F_Noti.Left = Screen.Width Then F_Noti.Visible = True: F_Noti.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
        
        If CurA.x > F_Noti.Left / Screen.TwipsPerPixelX _
                And CurA.Y > (F_Noti.Top / Screen.TwipsPerPixelY) _
                And CurA.Y < (F_Noti.Top / Screen.TwipsPerPixelY + F_Noti.ScaleHeight) Then
        
            If CrisState.NotiFrameCnt < 14 Then
            
                CrisState.NotiFrameCnt = CrisState.NotiFrameCnt + 1
                F_Noti.Left = SMove(F_Noti.Left, 900 * Screen.TwipsPerPixelX, CrisState.UI_Speed * 10 + 40)
            
            End If
        
        Else
        
            If CrisState.NotiFrameCnt > 0 Then
            
                CrisState.NotiFrameCnt = CrisState.NotiFrameCnt - 1
                F_Noti.Left = SMove(F_Noti.Left, Screen.Width - 10 * Screen.TwipsPerPixelX, CrisState.UI_Speed)
            
            ElseIf CrisState.NotiFrameCnt = 0 And F_Noti.Left <> Screen.Width - 10 * Screen.TwipsPerPixelX Then
            
                F_Noti.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
            
            End If
        
        End If
    
    Else
            
            If CrisState.NotiFrameCnt > 0 Then
            
                CrisState.NotiFrameCnt = CrisState.NotiFrameCnt - 1
                F_Noti.Left = SMove(F_Noti.Left, Screen.Width - 10 * Screen.TwipsPerPixelX, CrisState.UI_Speed)
            
            ElseIf CrisState.NotiFrameCnt = 0 And F_Noti.Left <> Screen.Width Then
            
                F_Noti.Left = Screen.Width
                F_Noti.Visible = False
            
            End If
        
    End If
    
    '~~~~~~~~~~~~~~~~~
    
    If CrisState.MemoVisible Then
    
        If F_Memo.Left = Screen.Width Then F_Memo.Visible = True: F_Memo.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
        
        If CurA.x > F_Memo.Left / Screen.TwipsPerPixelX _
                And CurA.Y > (F_Memo.Top / Screen.TwipsPerPixelY) _
                And CurA.Y < (F_Memo.Top / Screen.TwipsPerPixelY + F_Memo.ScaleHeight) Then
        
            If CrisState.MemoFrameCnt < 14 Then
            
                CrisState.MemoFrameCnt = CrisState.MemoFrameCnt + 1
                F_Memo.Left = SMove(F_Memo.Left, 900 * Screen.TwipsPerPixelX, CrisState.UI_Speed * 10 + 40)
            
            End If
        
        Else
        
            If CrisState.MemoFrameCnt > 0 Then
            
                CrisState.MemoFrameCnt = CrisState.MemoFrameCnt - 1
                F_Memo.Left = SMove(F_Memo.Left, Screen.Width - 10 * Screen.TwipsPerPixelX, CrisState.UI_Speed)
            
            ElseIf CrisState.MemoFrameCnt = 0 And F_Memo.Left <> Screen.Width - 10 * Screen.TwipsPerPixelX Then
            
                F_Memo.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
            
            End If
        
        End If
    
    Else
            
            If CrisState.MemoFrameCnt > 0 Then
            
                CrisState.MemoFrameCnt = CrisState.MemoFrameCnt - 1
                F_Memo.Left = SMove(F_Memo.Left, Screen.Width - 10 * Screen.TwipsPerPixelX, CrisState.UI_Speed)
            
            ElseIf CrisState.MemoFrameCnt = 0 And F_Memo.Left <> Screen.Width Then
            
                F_Memo.Left = Screen.Width
                F_Memo.Visible = False
            
            End If
        
    End If

    '~~~~~~~~~~~~~
    
    If CrisSet.Setting.Move Then
    
        CrisSet.Setting.IndexValue = SMove(CrisSet.Setting.IndexValue, NSet * 35 + 40, CrisState.UI_Speed)
        
        If MSet = NSet Then
        Else
            F_Sub.SetBox(MSet).Top = SMove(F_Sub.SetBox(MSet).Top, CrisSet.Setting.N_Long, CrisState.UI_Speed)
            F_Sub.SetBox(NSet).Top = SMove(F_Sub.SetBox(NSet).Top, 35, CrisState.UI_Speed)
        End If
        
        CrisSubBoxBlt
        
        If Distance(F_Sub.SetBox(NSet).Top, 0, 0, 0) < 1 Then
        
            CrisSet.Setting.N_Boolean = False
            F_Sub.SetBox(NSet).Top = 35
            
        End If
        
    End If
    
End If

End Sub
