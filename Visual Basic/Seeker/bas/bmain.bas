Attribute VB_Name = "bmain"
Option Explicit
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long

Public Type POINTAPI
        X As Long
        Y As Long
End Type

Public i As Integer, j As Integer, k As Integer

Public ChkWalk  As Byte ' chkwalk=1,좌걷는중.2,우걷는중.0,정지
Public FPS_F As Integer, FPS_S As Long                                       'fps측정
Public OpenX As Integer, OpenY As Integer                                    'xy좌표측정 (로딩배경이미지)
Public OpAdX As Integer, OpAdY As Integer                                   'xy가속도 측정
Public FKeep As Integer, Kping As Integer                                       'fkeep = 화면 kping = 화면이동중유무
Public MouX As Long, MouY As Long, MouXY As Boolean, MXY As POINTAPI    '마우스 좌표 XY
Public GMap As Integer, Gaming As Boolean                                   'Gmap = 위치
Public OpBoxInt As Byte                                                                   '옵션박스 배열
Public OpenBarX(3) As Integer, OpenBarY(3) As Integer, OpenBar(4) As Integer, OpBox
Public BoxXY(7) As Integer, UIBox(3) As Byte                            'ui설정
Public CamX As Long, CamY As Long                                       '카메라좌표
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Sub StartOn()
Dim Start As Integer
                fmain.Consol.Text = "콘솔창에대한 도움말을 보시려면 콘솔창에 help 를 입력후 엔터를 눌러주시고," & vbNewLine & _
                                                            "콘솔창을 닫으려면 exit를 입력후 엔터를 눌러주세요," & vbNewLine & _
                                                            "콘솔창에대한 기술지원은 하지않습니다." & vbNewLine & _
                                                            "콘솔창에서 실행되는 명령어는 직접적으로 레지스트리를 수정합니다." & vbNewLine & _
                                                            "따라서 세이브 데이터 또한 오류가 날 수 도 있으며," & vbNewLine & _
                                                            "피해에대한 책임은 사용자에게 있습니다." & vbNewLine & _
                                                            "엔터의 입력인식은 맨 마지막줄에서만됩니다."
    Start = GetSetting(App.ProductName, "Zenith", "Start", 0)
        If Start = 0 Then
            BoxShow 450, 250, 550, 270, "처음시작하시는군요." & vbNewLine & "탑의 도전자를 환영합니다."
        End If
    
    For i = 0 To 4
        OpBox(i) = GetSetting(App.ProductName, "Zenith", "OffSet" & i, OpBox(i))
    Next i
End Sub
Public Sub SetOff()
        SaveSetting App.ProductName, "Zenith", "Start", 1
    For i = 0 To 4
        SaveSetting App.ProductName, "Zenith", "OffSet" & i, OpBox(i)
    Next i
End Sub
Public Sub OpenLoop()
Dim BoxRes As Long

    Do
            GTCValue = GetTickCount + 1                 '
        Do                                              '
            DoEvents                                    'DoEvents 문 발동 함수
        Loop Until GTCValue < GetTickCount              '
            
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Call BltImage                                    '화면에 이미지 뿌리기 bltbas 참조
            Call CNTFPS                                      'fps를 계산
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If Gaming = False Then
        Select Case FKeep
            Case 0
                If OpBox(1) > 2 Then
                    OpenX = OpenX + OpAdX                  '화면에 출력하는 mainBG의 위치계산X
                    OpenY = OpenY + OpAdY                  '화면에 출력하는 mainBG의 위치계산Y
                End If
            Case 1
            Case 2
            Case 3
        End Select
        
        If OpenBarX(0) > 970 And Kping = 1 Then
            For i = 0 To 3
                OpenBarX(i) = OpenBarX(i) - 15      '처음에 나오는 메뉴의 위치 애니메이션 처리
            Next i
        ElseIf OpenBarX(0) < 1370 And Kping = -1 Then
            For i = 0 To 3
                OpenBarX(i) = OpenBarX(i) + 15      '처음에 나오는 메뉴의 위치 애니메이션 처리
            Next i
        Else
        End If

        If OpenX = 220 Or OpenX = 0 Then
            OpAdX = OpAdX * -1                          '화면에 출력하는 mainBG의 위치계산의 방향계산X
        End If
        If OpenY = 278 Or OpenY = 0 Then
            OpAdY = OpAdY * -1                          '화면에 출력하는 mainBG의 위치계산의 방향계산Y
        End If
Else
        BltMouse MouX, MouY, 0
        'CamSeeking
End If
    Loop
End Sub
Public Sub CamSeeking()
        If Mi.X > (CamX + 650) Then
            CamX = CamX + ((((Mi.X - CamX - 650) ^ 2) ^ (1 / 2)) / 100)
        ElseIf Mi.X < (CamX + 650) Then
            CamX = CamX - ((((Mi.X - CamX - 650) ^ 2) ^ (1 / 2)) / 100)
        End If
End Sub
Public Sub M_Click(ByVal Index As Integer)
        Select Case Index
            Case 0                                                                                                              '새로운 시작
                    NewMi
                    Gaming = True
                    GMap = 0
                    Gmaping
                    Gstart
            Case 1                                                                                                              '이어 하기
                If GetSetting(App.ProductName, "Zenith", "Save", 0) = 0 Then
                    BoxShow 450, 250, 550, 270, "저장된 데이터가 없습니다." & vbNewLine & "새로시작해야합니다."
                Else
                
                End If
            Case 2                                                                                                              '설정
                FKeep = 1
                Kping = -1
            Case 3                                                                                                              '끝내기
                End
            Case 4                                                                                                              '설정에서돌아오기
                FKeep = 0
                Kping = 1
        End Select
End Sub
Public Sub CNTFPS()                                'fps를 계산합니다.
    FPS_F = FPS_F + 1
        If FPS_S < Int(GetTickCount / 1000) Then
            fmain.Caption = "Seeker - TheZenith - Ver" & App.Major & "." & App.Minor & "." & App.Revision & "    FPS:" & FPS_F
            FPS_S = Int(GetTickCount / 1000)
            FPS_F = 0
        End If
End Sub
Public Function BoxShow(ByVal X As Integer, ByVal Y As Integer, ByVal Width As Integer, ByVal Height As Integer, ByVal Default As String)
With fmain.mL
    .Top = Y + 50
    .Left = X + 45
    .Width = Width - 140
    .Height = Height - 140
    .Visible = True
    .Caption = Default
End With
    BoxXY(0) = 1
    BoxXY(1) = X
    BoxXY(2) = Y
    BoxXY(3) = Width
    BoxXY(4) = Height
End Function


