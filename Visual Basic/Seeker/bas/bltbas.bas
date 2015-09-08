Attribute VB_Name = "bltbas"
Option Explicit
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Const SRCCOPY As Long = &HCC0020
Public cnts As Integer
Public Sub BltImage()                          '화면에 뿌려지는 이미지
        fmain.Cls
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If Gaming Then
        BitBlt fmain.hDC, 0, 0, 1280, 650, fmain.BackBG.hDC, CamX, CamY, SRCPAINT                 '메인배경화면을 출력합니다.
                            Call CheckBG
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Select Case Mi.Act
        Case 0
            If Mi.Walking = 1 Or Mi.Walking = 21 Or Mi.Walking = 43 Or Mi.Walking = 69 Then
                Mi.Walking = 1
            Else
                Mi.Walking = (Mi.Walking Mod 69) + 1
            End If
                    If Mi.Standing Then
                        BitBlt fmain.hDC, CamX - Mi.X, 275, 210, 273, fmain.cha(5).hDC, 1260 - Int(Mi.Walking / 10) * 210, 0, SRCPAINT      '캐릭터
                        BitBlt fmain.hDC, CamX - Mi.X, 275, 210, 273, fmain.cha(4).hDC, 1260 - Int(Mi.Walking / 10) * 210, 0, SRCAND
                    Else
                        BitBlt fmain.hDC, CamX - Mi.X, 275, 210, 273, fmain.cha(7).hDC, Int(Mi.Walking / 10) * 210, 0, SRCPAINT       '캐릭터
                        BitBlt fmain.hDC, CamX - Mi.X, 275, 210, 273, fmain.cha(6).hDC, Int(Mi.Walking / 10) * 210, 0, SRCAND
                    End If
        Case 1
                Mi.Walking = (Mi.Walking Mod 69) + 1
                    If Mi.Standing Then
                        BitBlt fmain.hDC, CamX - Mi.X, 275, 210, 273, fmain.cha(5).hDC, 1260 - Int(Mi.Walking / 10) * 210, 0, SRCPAINT      '캐릭터
                        BitBlt fmain.hDC, CamX - Mi.X, 275, 210, 273, fmain.cha(4).hDC, 1260 - Int(Mi.Walking / 10) * 210, 0, SRCAND
                    Else
                        BitBlt fmain.hDC, CamX - Mi.X, 275, 210, 273, fmain.cha(7).hDC, Int(Mi.Walking / 10) * 210, 0, SRCPAINT       '캐릭터
                        BitBlt fmain.hDC, CamX - Mi.X, 275, 210, 273, fmain.cha(6).hDC, Int(Mi.Walking / 10) * 210, 0, SRCAND
            End If
            
        Case 2
        Case 3
    End Select
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~UI출력
        If Mi.NowLv < 10 Then
            BltNum 23, 23, Mi.NowLv, 0
        Else
            BltNum 11, 23, Mi.NowLv, 0
        End If
            If Mi.NowFi >= Mi.MaxFi Then
                BitBlt fmain.hDC, 300, 33, 15, 27, fmain.UIi(3).hDC, 49, 5, SRCPAINT            '발열량 Max경고
                BitBlt fmain.hDC, 300, 33, 15, 27, fmain.UIi(2).hDC, 49, 5, SRCAND
            End If
            
            If Mi.Battlex = True Then
                BitBlt fmain.hDC, 15, 44, 18, 28, fmain.UIi(3).hDC, 25, 5, SRCPAINT             '전투상태표시
                BitBlt fmain.hDC, 15, 44, 18, 28, fmain.UIi(2).hDC, 25, 5, SRCAND
            Else
                BitBlt fmain.hDC, 15, 44, 18, 28, fmain.UIi(3).hDC, 5, 5, SRCPAINT                  '전투상태표시
                BitBlt fmain.hDC, 15, 44, 18, 28, fmain.UIi(2).hDC, 5, 5, SRCAND
            End If
        BitBlt fmain.hDC, 0, 0, 325, 85, fmain.UIi(1).hDC, 0, 0, SRCPAINT                       '체력,발열량 바 표시
        BitBlt fmain.hDC, 0, 0, 325, 85, fmain.UIi(0).hDC, 0, 0, SRCAND
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~UI출력
        BitBlt fmain.hDC, 0, 548, 1280, 102, fmain.UIi(4).hDC, 0, 0, SRCCOPY                    'UI출력
            BitBlt fmain.hDC, 1150, 555, 101, 41, fmain.UIi(5).hDC, 101 * UIBox(0), 0, SRCCOPY                  'UI출력
            BitBlt fmain.hDC, 1150, 605, 101, 41, fmain.UIi(5).hDC, 101 * UIBox(1), 0, SRCCOPY                  'UI출력
            BitBlt fmain.hDC, 1030, 555, 101, 41, fmain.UIi(5).hDC, 101 * UIBox(2), 0, SRCCOPY                  'UI출력
            BitBlt fmain.hDC, 1030, 605, 101, 41, fmain.UIi(5).hDC, 101 * UIBox(3), 0, SRCCOPY                  'UI출력
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Else
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            BitBlt fmain.hDC, 0, 0, 1280, 650, fmain.BackBG.hDC, OpenX, OpenY, SRCPAINT                 '메인배경화면을 출력합니다.
If OpBox(1) > 3 Then
            BitBlt fmain.hDC, 0, 150, 1280, 500, fmain.Rock(1).hDC, 0, 0, SRCPAINT
            BitBlt fmain.hDC, 0, 150, 1280, 500, fmain.Rock(0).hDC, 0, 0, SRCAND
End If
        
            BitBlt fmain.hDC, 1150, 400, 80, 199, fmain.OpenFire(1).hDC, 1, 0, SRCPAINT
            BitBlt fmain.hDC, 1150, 400, 80, 199, fmain.OpenFire(0).hDC, 1 + (((Int(fmain.OpenFire(0).Tag) / 2) Mod 9) * 80), ((Int(fmain.OpenFire(0).Tag) / 2) \ 9) * 200, SRCAND
                    fmain.OpenFire(0).Tag = fmain.OpenFire(0).Tag + 1
                    If Int(fmain.OpenFire(0).Tag) = 27 * 2 - 1 Then
                            fmain.OpenFire(0).Tag = 0
                    End If
        
        For i = 0 To 3                                                                              '메뉴창 4개를 출력합니다.
            BitBlt fmain.hDC, OpenBarX(i) + OpenBar(i), OpenBarY(i) + OpenBar(i), 180, 60, fmain.MenuBar(1).hDC, 1, 0, SRCPAINT
            BitBlt fmain.hDC, OpenBarX(i) + OpenBar(i), OpenBarY(i) + OpenBar(i), 180, 60, fmain.MenuBar(0).hDC, 1, 0, SRCAND
        
            BitBlt fmain.hDC, OpenBarX(i) + OpenBar(i) + 30, OpenBarY(i) + OpenBar(i) + 15, 119, 30, fmain.Tex(1).hDC, 119 * i + 1, 0, SRCPAINT
            BitBlt fmain.hDC, OpenBarX(i) + OpenBar(i) + 30, OpenBarY(i) + OpenBar(i) + 15, 119, 30, fmain.Tex(0).hDC, 119 * i + 1, 0, SRCAND
        Next i
        
        If (Kping = -1 And FKeep = 1) Or (Kping = 1 And FKeep = 0) Then                             '설정창을 열거나 닫는 중입니다.
        
            BitBlt fmain.hDC, OpenBarX(0) * 3 - 4150, 0, 1280, 650, fmain.OBox(1).hDC, 0, 0, SRCPAINT
            BitBlt fmain.hDC, OpenBarX(0) * 3 - 4150, 0, 1280, 650, fmain.OBox(0).hDC, 0, 0, SRCAND
        
            BitBlt fmain.hDC, OpenBarX(0) - 1350 + OpenBar(4), 550 + OpenBar(4), 180, 60, fmain.MenuBar(1).hDC, 1, 0, SRCPAINT
            BitBlt fmain.hDC, OpenBarX(0) - 1350 + OpenBar(4), 550 + OpenBar(4), 180, 60, fmain.MenuBar(0).hDC, 1, 0, SRCAND
        
            BitBlt fmain.hDC, OpenBarX(0) - 1320 + OpenBar(4), 565 + OpenBar(4), 119, 30, fmain.Tex(1).hDC, 476, 0, SRCPAINT
            BitBlt fmain.hDC, OpenBarX(0) - 1320 + OpenBar(4), 565 + OpenBar(4), 119, 30, fmain.Tex(0).hDC, 476, 0, SRCAND
            
                For i = 0 To 4
                    BitBlt fmain.hDC, OpenBarX(0) * 3 - 3250, 85 + (i * 85), 60, 30, fmain.Tex(1).hDC, (119 / 2) * OpBox(i), 33, SRCPAINT
                        If OpBoxInt = i Then
                        Else
                            BitBlt fmain.hDC, OpenBarX(0) * 3 - 3250, 85 + (i * 85), 60, 30, fmain.Tex(0).hDC, (119 / 2) * OpBox(i), 33, SRCAND
                        End If
                Next i
        ElseIf Kping = 0 And FKeep = 1 Then                                                         '설정창이 열렸을떄입니다.
       
            BitBlt fmain.hDC, 0, 0, 1280, 650, fmain.OBox(1).hDC, 0, 0, SRCPAINT
            BitBlt fmain.hDC, 0, 0, 1280, 650, fmain.OBox(0).hDC, 0, 0, SRCAND
       
            BitBlt fmain.hDC, OpenBarX(0) - 1350 + OpenBar(4), 550 + OpenBar(4), 180, 60, fmain.MenuBar(1).hDC, 1, 0, SRCPAINT
            BitBlt fmain.hDC, OpenBarX(0) - 1350 + OpenBar(4), 550 + OpenBar(4), 180, 60, fmain.MenuBar(0).hDC, 1, 0, SRCAND
       
            BitBlt fmain.hDC, OpenBarX(0) - 1320 + OpenBar(4), 565 + OpenBar(4), 119, 30, fmain.Tex(1).hDC, 476, 0, SRCPAINT
            BitBlt fmain.hDC, OpenBarX(0) - 1320 + OpenBar(4), 565 + OpenBar(4), 119, 30, fmain.Tex(0).hDC, 476, 0, SRCAND
                
                For i = 0 To 4
                    BitBlt fmain.hDC, OpenBarX(0) * 3 - 3250, 85 + (i * 85), 60, 30, fmain.Tex(1).hDC, (119 / 2) * OpBox(i), 33, SRCPAINT
                        If OpBoxInt = i Then
                        Else
                            BitBlt fmain.hDC, OpenBarX(0) * 3 - 3250, 85 + (i * 85), 60, 30, fmain.Tex(0).hDC, (119 / 2) * OpBox(i), 33, SRCAND
                        End If
                Next i
        End If
        
        BitBlt fmain.hDC, 0, 2000 - OpenBarX(0) * 2, 975, 475, fmain.Texts(1).hDC, -3, -1, SRCPAINT         '텍스트를 출력합니다.
        BitBlt fmain.hDC, 0, 2000 - OpenBarX(0) * 2, 975, 475, fmain.Texts(0).hDC, 0, 0, SRCAND
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
End If
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    If BoxXY(0) <> 0 Then
        BltBox BoxXY(1), BoxXY(2), BoxXY(3), BoxXY(4), 0
    End If
End Sub
Public Sub CheckBG()

For i = 0 To 24
        If FireBG(i).Visible = True Then
                    BitBlt fmain.hDC, FireBG(i).X, FireBG(i).Y, 99, 78, fmain.FireObj.hDC, 100 * ((FireBG(i).AniCnt / 7) Mod 4), 161 + 80 * ((FireBG(i).AniCnt / 7) \ 4), SRCPAINT
                    BitBlt fmain.hDC, FireBG(i).X, FireBG(i).Y, 99, 79, fmain.FireObj.hDC, 100 * ((FireBG(i).AniCnt / 7) Mod 4), 80 * ((FireBG(i).AniCnt / 7) \ 4), SRCAND

                        FireBG(i).AniCnt = FireBG(i).AniCnt + 1
                    If FireBG(i).AniCnt = 45 Then
                        FireBG(i).AniCnt = 0
                    End If
        End If
        
Next i

'배경출력plg bit

        






























End Sub
Public Sub BltMouse(ByVal X As Long, ByVal Y As Long, ByVal Default As Integer) '마우스를 표시합니다.'
    BitBlt fmain.hDC, X, Y, 80, 80, fmain.Mou(1).hDC, 0, 0, SRCPAINT
    BitBlt fmain.hDC, X, Y, 80, 80, fmain.Mou(0).hDC, 0, 0, SRCAND
End Sub
Public Sub BltNum(ByVal X As Integer, ByVal Y As Integer, ByVal Num As String, ByVal Default As Byte)
Dim NumS As Integer
For i = 0 To Len(Num) - 1
        NumS = Mid(Num, i + 1, 1)
        NumS = NumS - 1
    If NumS = -1 Then NumS = 9
        BitBlt fmain.hDC, X + 32 * i, Y, 32, 50, fmain.Num(1).hDC, NumS * 32 + 1, 0, SRCPAINT
        BitBlt fmain.hDC, X + 32 * i, Y, 32, 50, fmain.Num(0).hDC, NumS * 32 + 1, 0, SRCAND
Next i
End Sub
Public Sub BltBox(ByVal X As Integer, ByVal Y As Integer, ByVal Width As Integer, ByVal Height As Integer, ByVal Default As Byte)
'알림상자를 출력합니다 형식은 X좌표,Y좌표,넓이,높이,문자값입니다.

    BitBlt fmain.hDC, X + 30, Y + 30, Width - 140, Height - 140, fmain.Boxs(13).hDC, 0, 0, SRCPAINT
    BitBlt fmain.hDC, X + 30, Y + 30, Width - 140, Height - 140, fmain.Boxs(12).hDC, 0, 0, SRCAND
    
    BitBlt fmain.hDC, X + 60, Y + 8, Width - 190, 26, fmain.Boxs(1).hDC, 1, 0, SRCPAINT
    BitBlt fmain.hDC, X + 60, Y + 8, Width - 190, 26, fmain.Boxs(0).hDC, 1, 0, SRCAND
    BitBlt fmain.hDC, X + 9, Y + 60, 26, Height - 190, fmain.Boxs(3).hDC, 1, 0, SRCPAINT
    BitBlt fmain.hDC, X + 9, Y + 60, 26, Height - 190, fmain.Boxs(2).hDC, 1, 0, SRCAND
    
    BitBlt fmain.hDC, X + 50, Y + Height - 120, Width - 180, 19, fmain.Boxs(1).hDC, 1, 0, SRCPAINT
    BitBlt fmain.hDC, X + 50, Y + Height - 120, Width - 180, 19, fmain.Boxs(0).hDC, 1, 0, SRCAND
    BitBlt fmain.hDC, X + Width - 121, Y + 50, 20, Height - 190, fmain.Boxs(3).hDC, 1, 0, SRCPAINT
    BitBlt fmain.hDC, X + Width - 121, Y + 50, 20, Height - 190, fmain.Boxs(2).hDC, 1, 0, SRCAND
    
    BitBlt fmain.hDC, X, Y, 67, 65, fmain.Boxs(5).hDC, 1, 0, SRCPAINT
    BitBlt fmain.hDC, X, Y, 67, 65, fmain.Boxs(4).hDC, 1, 0, SRCAND
    
    BitBlt fmain.hDC, X + Width - 139, Y + 11, 39, 45, fmain.Boxs(7).hDC, 2, 0, SRCPAINT
    BitBlt fmain.hDC, X + Width - 139, Y + 11, 39, 45, fmain.Boxs(6).hDC, 2, 0, SRCAND
    BitBlt fmain.hDC, X + Width - 139, Y + Height - 140, 40, 40, fmain.Boxs(9).hDC, 3, 1, SRCPAINT
    BitBlt fmain.hDC, X + Width - 139, Y + Height - 140, 40, 40, fmain.Boxs(8).hDC, 3, 1, SRCAND
    BitBlt fmain.hDC, X + 10, Y + Height - 140, 44, 40, fmain.Boxs(11).hDC, 0, 1, SRCPAINT
    BitBlt fmain.hDC, X + 10, Y + Height - 140, 44, 40, fmain.Boxs(10).hDC, 0, 1, SRCAND

End Sub
