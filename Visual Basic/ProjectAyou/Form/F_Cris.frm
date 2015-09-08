VERSION 5.00
Begin VB.Form F_Ayou 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00404040&
   BorderStyle     =   0  '없음
   Caption         =   "Form1"
   ClientHeight    =   7335
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   17850
   ClipControls    =   0   'False
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
      Left            =   720
      ScaleHeight     =   150
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   150
      TabIndex        =   8
      Top             =   840
      Visible         =   0   'False
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
      Left            =   720
      ScaleHeight     =   150
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   150
      TabIndex        =   7
      Top             =   3360
      Visible         =   0   'False
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
      Left            =   3120
      ScaleHeight     =   150
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   150
      TabIndex        =   6
      Top             =   840
      Visible         =   0   'False
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
      Left            =   5520
      ScaleHeight     =   150
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   150
      TabIndex        =   5
      Top             =   840
      Visible         =   0   'False
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
      Left            =   7920
      ScaleHeight     =   150
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   150
      TabIndex        =   4
      Top             =   840
      Visible         =   0   'False
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
      Left            =   10320
      ScaleHeight     =   150
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   150
      TabIndex        =   3
      Top             =   840
      Visible         =   0   'False
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
      Left            =   12720
      ScaleHeight     =   150
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   150
      TabIndex        =   2
      Top             =   840
      Visible         =   0   'False
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
      Index           =   6
      Left            =   15120
      ScaleHeight     =   150
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   150
      TabIndex        =   1
      Top             =   840
      Visible         =   0   'False
      Width           =   2250
   End
   Begin VB.Timer TimerShift 
      Interval        =   15
      Left            =   3720
      Top             =   4800
   End
   Begin VB.Timer KeyTime 
      Interval        =   10
      Left            =   4200
      Top             =   4800
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
      Left            =   6840
      Picture         =   "F_Cris.frx":7939
      ScaleHeight     =   100
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   260
      TabIndex        =   0
      Top             =   3360
      Visible         =   0   'False
      Width           =   3900
   End
   Begin VB.Timer AutoTimer 
      Interval        =   3000
      Left            =   4680
      Top             =   4800
   End
End
Attribute VB_Name = "F_Ayou"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim KeyResult As Long, Shift As Boolean
Private Sub Form_Click()
Dim i As Integer, Xs As Integer, Ys As Integer

If AyouState.FrameCnt = 0 Then

    GetCursorPos CurC
        
    For i = 0 To 6
    
        Xs = CurX.X - (((3 ^ (1 / 2)) * (AyouState.UI_Size - AyouState.UI_Size)) / 2) - AyouState.UI_Size * 2 + AyouState.Rgn_Nex(i).X
        Ys = CurX.Y - AyouState.UI_Size * (3 ^ (1 / 2)) + AyouState.Rgn_Nex(i).Y
    
        If Distance(CurC.X, CurC.Y, Xs, Ys) < AyouState.UI_Size Then
        
            NHex = i
            HexRgn_Click i
            Exit For
            
        End If
        
    Next i
    
End If

End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim i As Integer, Xs As Integer, Ys As Integer

If AyouState.FrameCnt = 0 Then

    GetCursorPos CurC
        
    For i = 0 To 6
    
        Xs = CurX.X - (((3 ^ (1 / 2)) * (AyouState.UI_Size - AyouState.UI_Size)) / 2) - AyouState.UI_Size * 2 + AyouState.Rgn_Nex(i).X
        Ys = CurX.Y - AyouState.UI_Size * (3 ^ (1 / 2)) + AyouState.Rgn_Nex(i).Y
    
        If Distance(CurC.X, CurC.Y, Xs, Ys) < AyouState.UI_Size Then
            
            HexRgn_MouseDown i
            Exit For
            
        End If
        
    Next i

End If

End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim i As Integer, Xs As Integer, Ys As Integer
    GetCursorPos CurC
        
    For i = 0 To 6
    
        Xs = CurX.X - (((3 ^ (1 / 2)) * (AyouState.UI_Size - AyouState.UI_Size)) / 2) - AyouState.UI_Size * 2 + AyouState.Rgn_Nex(i).X
        Ys = CurX.Y - AyouState.UI_Size * (3 ^ (1 / 2)) + AyouState.Rgn_Nex(i).Y
    
        If Distance(CurC.X, CurC.Y, Xs, Ys) < AyouState.UI_Size Then
            HexRgn_MouseOver i
            Exit For
            
        End If
        
    Next i
End Sub
Public Sub HexRgn_Click(ByVal index As Integer)

    DrawUI_Click index
    Event_Click index
    
End Sub
Public Sub HexRgn_MouseOver(ByVal index As Integer)

    DrawUI_Over index
    Event_MouseOver index
    
End Sub
Public Sub HexRgn_MouseDown(ByVal index As Integer)

    Event_MouseDown index
    
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
                        If AyouState.FrameCnt = 0 Then
                            If F_Ayou.Visible Then
                                AyouState.Show = False
                                AyouState.FrameCnt = AyouState.MaxFrameCnt
                            Else
                                AyouState.SubShow = False
                                AyouState.SubFrameCnt = 15
                                AyouState.Show = True
                                AyouState.FrameCnt = AyouState.MaxFrameCnt
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
    
    If AyouState.Show Then
    
        If Not F_Ayou.Visible Then Ayou_HexRgn: F_Ayou.Visible = True: NHex = 0

        If AyouState.FrameCnt > 0 Then
        
            AyouState.FrameCnt = AyouState.FrameCnt - 1
            
                For i = 1 To 6
                
                    AyouState.Rgn_Nex(i).X = SMove(AyouState.Rgn_Nex(i).X, AyouState.Rgn_Hex(i).X, AyouState.UI_Speed)
                    AyouState.Rgn_Nex(i).Y = SMove(AyouState.Rgn_Nex(i).Y, AyouState.Rgn_Hex(i).Y, AyouState.UI_Speed)
                    
                Next i
                    'SMove함수를 이용해 Hexagon UI들이 자기자리로 갑니다.
                
            'Me.Cls
            Ayou_HexRgn
            WindowTransparency F_Ayou.hWnd, byValue, , 255 - (((AyouState.FrameCnt) / AyouState.MaxFrameCnt) * 155 + 45)
                '점점 또렸해집니다. 초기값은 FrameCnt와 같습니다.
            DoEvents
            
        End If
        
    Else
    
        If AyouState.FrameCnt > 0 Then
            
            AyouState.FrameCnt = AyouState.FrameCnt - 1
            
                For i = 1 To 6
                
                    If i = NHex Then
                    
                        AyouState.Rgn_Nex(i).X = SMove(AyouState.Rgn_Nex(i).X, AyouState.Rgn_Hex(0).X, AyouState.UI_Speed)
                        AyouState.Rgn_Nex(i).Y = SMove(AyouState.Rgn_Nex(i).Y, AyouState.Rgn_Hex(0).Y, AyouState.UI_Speed)
                        
                    End If
                    
                Next i
                    'SMove함수를 이용해 Hexagon UI들이 0위치로 갑니다.
            
            'Me.Cls
            Ayou_HexRgn
            WindowTransparency F_Ayou.hWnd, byValue, , (((AyouState.FrameCnt) / AyouState.MaxFrameCnt) * 155 + 45)
                '점점 흐려집니다. 초기값은 FrameCnt와 같습니다.
            DoEvents
            
        Else
                For i = 1 To 6
                    AyouState.Rgn_Nex(i).X = AyouState.Rgn_Hex(0).X
                    AyouState.Rgn_Nex(i).Y = AyouState.Rgn_Hex(0).Y
                Next i
                
            If F_Ayou.Visible Then F_Ayou.Visible = False
            
        End If
        
    End If
    
    '~~~~~~~~~~~~~~~~~~~~~
    
    If AyouState.SubShow Then
                
        Select Case NHex
            
            Case 0
            
                    MessageBlt
                    
                    If ChatLY > 360 Then
                    
                        If ChatY < -170 Then ChatY = ChatY + (-170 - ChatY) / 10 + 1
                        
                    End If
                    
                    If ChatLY - (F_Sub.SubBox(0).Height + 65) < ChatY Then ChatY = ChatY - ((ChatY - ChatLY + (F_Sub.SubBox(0).Height + 65)) / 10) - 1
                    
                        
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
                
                If AyouSet.Setting.Move Then
                    
                    AyouSet.Setting.IndexValue = SMove(AyouSet.Setting.IndexValue, NSet * 35 + 40, AyouState.UI_Speed)
                    
                    If MSet = NSet Then
                    Else
                        F_Sub.SetBox(MSet).Top = SMove(F_Sub.SetBox(MSet).Top, AyouSet.Setting.N_Long, AyouState.UI_Speed)
                        F_Sub.SetBox(NSet).Top = SMove(F_Sub.SetBox(NSet).Top, 35, AyouState.UI_Speed)
                    End If
                    
                    AyouSubBoxBlt
                    
                    If Distance(F_Sub.SetBox(NSet).Top, 0, 0, 0) < 1 Then
                    
                        AyouSet.Setting.N_Boolean = False
                        F_Sub.SetBox(NSet).Top = 35
                        
                    End If
                    
                    If Distance(F_Sub.SetBox(NSet).Top, 0, 35, 0) < 1 Then
                    
                        AyouSet.Setting.Move = False
                    
                    End If
                    
                End If
                
            Case 3
                
                AyouSubBoxBlt
                
                If CurA.X > (F_Sub.Left / Screen.TwipsPerPixelX) + 45 And CurA.X < F_Sub.SubBox(3).Left + F_Sub.Text_Memo.Left + (F_Sub.Left / Screen.TwipsPerPixelX) Then
                    
                    F_Sub.Text_Memo.Left = SMove(F_Sub.Text_Memo.Left, 160, AyouState.UI_Speed)
                    F_Sub.List_Memo.Left = F_Sub.Text_Memo.Left - F_Sub.List_Memo.Width - 10
                
                Else
                
                    If SubBoxBoolean(3) Then
                    Else
                    
                        F_Sub.Text_Memo.Left = SMove(F_Sub.Text_Memo.Left, 6, AyouState.UI_Speed)
                        F_Sub.List_Memo.Left = F_Sub.Text_Memo.Left - F_Sub.List_Memo.Width - 10
                    
                    End If
            
                End If
                
                If CurA.Y > F_Sub.Top / Screen.TwipsPerPixelY And CurA.Y < F_Sub.Text_Memo.Top + F_Sub.Top / Screen.TwipsPerPixelY Then
                    
                    If F_Sub.Text_Memo.Top < 75 Then
                        
                        F_Sub.Text_Memo.Top = SMove(F_Sub.Text_Memo.Top, 75, AyouState.UI_Speed)
                        
                    Else
                        
                        F_Sub.Text_Memo.Top = 75
                        
                    End If
                    
                
                Else
                    
                    If MemoTopLock Then
                    Else
                    
                        If F_Sub.Text_Memo.Top > 45 Then
                            
                            F_Sub.Text_Memo.Top = SMove(F_Sub.Text_Memo.Top, 45, AyouState.UI_Speed)
                            
                        Else
                            
                            F_Sub.Text_Memo.Top = 45
                            
                        End If
                    
                    End If
                    
                End If
                
            Case 4
            Case 5
            Case 6
                
                     
        End Select
        
                SubGradationAlt F_Sub.SubBox(0), 0, 0, AyouSet.SubForm(0).Height
            
            '~~~~~~~~~~~~~~~~~~~~~~~
            
    If Not F_Sub.Visible Then F_Sub.Visible = True
        
        If AyouState.SubFrameCnt > 0 Then
        
            AyouState.SubFrameCnt = AyouState.SubFrameCnt - 1
            'Ayou_SubRgn
            'F_Sub.Left = F_Sub.Left + 10 * ((16 - AyouState.SubFrameCnt) / 3)
            WindowTransparency F_Sub.hWnd, byValue, , 255 - (((AyouState.FrameCnt) / AyouState.MaxFrameCnt) * 155 + 25)
            DoEvents
        
        Else
        End If
    
    Else
    
        
        If AyouState.SubFrameCnt > 0 Then
        
            AyouState.SubFrameCnt = AyouState.SubFrameCnt - 1
            WindowTransparency F_Sub.hWnd, byValue, , (((AyouState.FrameCnt) / AyouState.MaxFrameCnt) * 145 + 35)
            DoEvents
        
        Else
        
            If F_Sub.Visible Then F_Sub.Visible = False
        
        End If
    
    End If
    
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    If (AyouX.Mind.Quest) Then
    
    
    
    End If
    
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    If AyouState.NotiShow Then
    
        TextPrint F_Noti, 45, 3, GetLanInf("Text.5"), vbWhite, 13
        TextPrint F_Noti, 55, 30, "Facebook 10건", vbWhite, 10
        TextPrint F_Noti, 55, 45, "Twitter 5건", vbWhite, 10
        TextPrint F_Noti, 55, 60, "네이버me 7건", vbWhite, 10
        TextPrint F_Noti, 55, 75, "Gmail 3건", vbWhite, 10
    
    Else
    
        
    
    End If
    
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    If AyouState.NotiVisible Then
    
        If F_Noti.Left = Screen.Width Then F_Noti.Visible = True: F_Noti.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
        
        If CurA.X > F_Noti.Left / Screen.TwipsPerPixelX _
                And CurA.Y > (F_Noti.Top / Screen.TwipsPerPixelY) _
                And CurA.Y < (F_Noti.Top / Screen.TwipsPerPixelY + F_Noti.ScaleHeight) Then
        
            If Distance(F_Noti.Left, 0, Screen.Width - F_Noti.Width, 0) > 3 Then
            
                AyouState.NotiFrameCnt = AyouState.NotiFrameCnt + 1
                F_Noti.Left = SMove(F_Noti.Left, Screen.Width - F_Noti.Width, AyouState.UI_Speed + 5)
            
            End If
        
        Else
        
            If AyouState.NotiFrameCnt > 0 Then
            
                AyouState.NotiFrameCnt = AyouState.NotiFrameCnt - 1
                F_Noti.Left = SMove(F_Noti.Left, Screen.Width - 10 * Screen.TwipsPerPixelX, AyouState.UI_Speed)
            
            ElseIf AyouState.NotiFrameCnt = 0 And F_Noti.Left <> Screen.Width - 10 * Screen.TwipsPerPixelX Then
            
                F_Noti.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
            
            End If
        
        End If
    
    Else
            
            If AyouState.NotiFrameCnt > 0 Then
            
                AyouState.NotiFrameCnt = AyouState.NotiFrameCnt - 1
                F_Noti.Left = SMove(F_Noti.Left, Screen.Width - 10 * Screen.TwipsPerPixelX, AyouState.UI_Speed)
            
            ElseIf AyouState.NotiFrameCnt = 0 And F_Noti.Left <> Screen.Width Then
            
                F_Noti.Left = Screen.Width
                F_Noti.Visible = False
            
            End If
        
    End If
    
    '~~~~~~~~~~~~~~~~~
    
    If AyouState.MemoVisible Then
    
        If F_Memo.Left = Screen.Width Then F_Memo.Visible = True: F_Memo.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
        
        If CurA.X > F_Memo.Left / Screen.TwipsPerPixelX _
                And CurA.Y > (F_Memo.Top / Screen.TwipsPerPixelY) _
                And CurA.Y < (F_Memo.Top / Screen.TwipsPerPixelY + F_Memo.ScaleHeight) Then
        
            If AyouState.MemoFrameCnt < 14 Then
            
                AyouState.MemoFrameCnt = AyouState.MemoFrameCnt + 1
                F_Memo.Left = SMove(F_Memo.Left, 900 * Screen.TwipsPerPixelX, AyouState.UI_Speed * 10 + 40)
            
            End If
        
        Else
        
            If AyouState.MemoFrameCnt > 0 Then
            
                AyouState.MemoFrameCnt = AyouState.MemoFrameCnt - 1
                F_Memo.Left = SMove(F_Memo.Left, Screen.Width - 10 * Screen.TwipsPerPixelX, AyouState.UI_Speed)
            
            ElseIf AyouState.MemoFrameCnt = 0 And F_Memo.Left <> Screen.Width - 10 * Screen.TwipsPerPixelX Then
            
                F_Memo.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
            
            End If
        
        End If
    
    Else
            
            If AyouState.MemoFrameCnt > 0 Then
            
                AyouState.MemoFrameCnt = AyouState.MemoFrameCnt - 1
                F_Memo.Left = SMove(F_Memo.Left, Screen.Width - 10 * Screen.TwipsPerPixelX, AyouState.UI_Speed)
            
            ElseIf AyouState.MemoFrameCnt = 0 And F_Memo.Left <> Screen.Width Then
            
                F_Memo.Left = Screen.Width
                F_Memo.Visible = False
            
            End If
        
    End If

    '~~~~~~~~~~~~~
    
End If

End Sub
