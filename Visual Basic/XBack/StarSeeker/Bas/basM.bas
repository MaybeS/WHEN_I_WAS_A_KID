Attribute VB_Name = "basM"
Option Explicit
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long
Public i As Integer, j As Integer, DefaultIndex As Integer, FPS As Integer, FpsCnt As Integer, FpsDat As String
Public PageX As Integer
Public StarX(25, 3) As Integer
Public AnimatedLogo As String, AnimatedKeyPress As String
Public Sub MainLoop()

    Do
            GTCValue = GetTickCount + 1                   '
        Do                                                                       '
            DoEvents                                                        'DoEvents �� �ߵ� �Լ�
        Loop Until GTCValue < GetTickCount           '

            basB.MainBlt
            BGStar
            DefaultIndex = DefaultCnt(DefaultIndex)
            CheckFPS

    Loop
    
End Sub
'--------------------------------------BGStarSetting---------------------------------------------------------
Public Sub BGStar()
        For i = 0 To 25
            StarX(i, 0) = StarX(i, 0) + StarX(i, 2)
            StarX(i, 1) = StarX(i, 1) + StarX(i, 3)
                If StarX(i, 0) < -100 Then StarX(i, 0) = 1200: StarX(i, 1) = -400
                If StarX(i, 1) > 700 Then StarX(i, 0) = 1200: StarX(i, 1) = -400
        Next i
End Sub
Public Sub BGStarSet()
        For i = 0 To 25
            StarX(i, 0) = 1200
            StarX(i, 1) = -400
    Randomize
            StarX(i, 2) = Rnd * 2 - 5
    Randomize
            StarX(i, 3) = Rnd * 4 + 2
        Next i
End Sub
'--------------------------------------BGStarSetting---------------------------------------------------------
'--------------------------------------StartSetting-���۽� üũ���� ����----------------------------------
Public Sub StartCheck()
        If GetSetting(App.ProductName, "Check", "Started", 1) Then  '������ ����Ǿ����� �Ǻ�
                SaveSetting App.ProductName, "Check", "Started", 0         '���� �����ʾ����Ƿ� ��������� ���
                
        End If

            AnimatedLogo = "1008.295.4.5.20."
            AnimatedKeyPress = "277.44.2.3.5."
            
PageX = 0
End Sub
Public Sub LoadSetting()

BGStarSet
PageX = 1
End Sub
Public Sub StartSetting()
With fMain
    .LogoPic(0).Picture = .BList.ListImages(1).Picture
    .LogoPic(1).Picture = .BList.ListImages(2).Picture
    .LogoPic(2).Picture = .BList.ListImages(3).Picture
    .LogoPic(3).Picture = .BList.ListImages(4).Picture
    .LogoPic(4).Picture = .BList.ListImages(5).Picture
    .ObjectBox(0).Picture = .OList.ListImages(1).Picture
End With

PageX = 2
End Sub
'--------------------------------------StartSetting-���۽� üũ���� ����----------------------------------
'--------------------------------------StartSetting-����� üũ���� ����----------------------------------
Public Sub SaveSettingSeeker()

End Sub
'--------------------------------------StartSetting-����� üũ���� ����----------------------------------
Public Sub CheckFPS()
'�ʴ� �����Ӽ��� �����մϴ�. �ð�������� ��ǻ���� �ð������ �� ������������ �ֽ��ϴ�.
'1�ʴ����� �����ϹǷ� ��Ȯ���� ������ ���� �ֽ��ϴ�.
FpsCnt = FpsCnt + 1
If FpsDat <> Format(Now, "TT-MM-SS") Then
    fMain.Caption = fMain.Tag & FPS
    FPS = FpsCnt
    FpsCnt = 0
    FpsDat = Format(Now, "TT-MM-SS")
End If
End Sub
Public Function DefaultCnt(ByVal index As Integer)
        index = index + 1
                    If index = 100 Then
                        index = 0
                            If PageX = 2 Then
                                PageX = 3
                            End If
                    End If
DefaultCnt = index
End Function
