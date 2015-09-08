VERSION 5.00
Begin VB.Form fmain 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  '단일 고정
   Caption         =   "Presented by Maybe"
   ClientHeight    =   5625
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   12000
   BeginProperty Font 
      Name            =   "굴림"
      Size            =   9.75
      Charset         =   129
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   375
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   800
   StartUpPosition =   3  'Windows 기본값
   Begin VB.Timer Xtime 
      Interval        =   1
      Left            =   120
      Top             =   120
   End
End
Attribute VB_Name = "fmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 32 And Mex.Y > 285 Then
        
        mexv = 34
        
    End If

End Sub
Private Sub Form_Load()
    Mex.X = 150
    Mex.Y = 300
    FrameCNT = 0
    Levelx = 1
    
End Sub
#If FrameCNT = 0 Then
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    If X > 300 And X < 450 Then
    
        If Y > 75 And Y < 150 Then
            
            ScoreX = 0
            FrameCNT = 1
            
        ElseIf Y > 175 And Y < 250 Then
        
            If FrameCNT = 0 Then End
            
        End If
    
    ElseIf X > 300 And X < 500 Then
        
        If Y > a And Y < b Then
        
        
        
        End If
        
    End If


End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

Select Case FrameCNT
    Case 0
    
        If X > 300 And X < 450 Then
        
            If Y > 75 And Y < 150 Then
                
                TextPrint 336, 101, "시작", vbRed, 32
                
            ElseIf Y > 175 And Y < 250 Then
            
                TextPrint 315, 201, "끝내기", vbRed, 32
                
            End If
        
        End If
    
    Case 1
    
        
    
    Case 2
    
        
    
End Select
    
End Sub
#End If
Public Sub CreateSubject()
Randomize
    objX(Leveln).X = 850
    objX(Leveln).Y = 300
    objX(Leveln).Z = Rnd * Int((Levelx) * 15) + 20
        If objX(Leveln).Z > 200 Then objX(Leveln).Z = 125
            ScoreX = ScoreX + (objX(Leveln).Z - 10) * 100
        Leveln = Leveln + 1
            If Leveln > Levelx * 5 Then
                Levelx = Levelx + 1
                Leveln = 0
            End If
End Sub
Private Sub Xtime_Timer()

Dim PointX As POINTAPI, hdcX As Long
Dim hPen As Long, hBrush As Long, hOldPen As Long, hOldBrush As Long

fmain.Cls

Select Case FrameCNT
    Case 0
    
        TextPrint 50, 10, ScoreX, vbBlack, 10
        TextPrint 335, 100, "시작", vbBlack, 32
        TextPrint 315, 200, "끝내기", vbBlack, 32
        TextPrint 20, 330, "English", vbBlack, 20
    
    Case 1
        
        TextPrint 750, 10, Levelx, vbBlack, 10
        TextPrint 50, 10, ScoreX, vbBlack, 10
        
        Rectangle hdc, 100, 300, 800, 325
        Ellipse hdc, Mex.X, Mex.Y, Mex.X + 25, Mex.Y - 25
        
            For i = 0 To 500
                If objX(i).X > 100 Then Rectangle hdc, objX(i).X, objX(i).Y, objX(i).X + 20, objX(i).Y - objX(i).Z
                If objX(i).X = 0 Then Exit For
            Next i
            
    
If CreateCnt = 0 Then
    Randomize
    t = Int(Rnd * 100)
        If t > 50 - Levelx Then
            CreateSubject
            
            If Level > 35 Then
                CreateCnt = 75 - Level * 2
            Else
                CreateCnt = 25
            End If
        Else
            CreateCnt = 15
        End If
Else
    CreateCnt = CreateCnt - 1
End If

    If FrameCNT = 1 Then ScoreX = ScoreX + 1
    
If TEM > 0 And mexv <> 0 Then
    If Mex.Y > 300 Then
    Else
        mexv = mexv - (G / 2)
        Mex.Y = Mex.Y - mexv
            If Mex.Y > 300 Then
                Mex.Y = 300: mexv = 0
            End If
    End If
    TEM = 0
Else
    TEM = TEM + 1
End If


    For i = 0 To 500
        If objX(i).X > 100 Then objX(i).X = objX(i).X - 7
        
            If Distance(objX(i).X + 10, objX(i).Y - objX(i).Z / 2, Mex.X + 12, Mex.Y - 12) < 15 Then
                        Mex.X = 150
                        Mex.Y = 300
                        FrameCNT = 0
                        Levelx = 1
                    Leveln = 0
                    CreateCnt = 0
                        For j = 0 To 1000
                            objX(i).X = 0
                        Next j
                    fmain.Cls
            End If
        If objX(i).X = 0 Then Exit For
    Next i
End Select

End Sub
Public Function Distance(ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long)

    Distance = ((X2 - X1) ^ 2 + (Y2 - Y1) ^ 2) ^ (1 / 2)
    
'해당 함수는 (x1,y1)-(x2,y2)사이의 거리를 반환합니다.
End Function
