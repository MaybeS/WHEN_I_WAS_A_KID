Attribute VB_Name = "basM"
Option Explicit
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long
Public i As Integer, j As Integer, DefaultIndex As Integer, FlowerIndex As Integer, FPS As Integer, FpsCnt As Integer, FpsDat As String
Public PageX As Integer, Menu(4, 2) As Integer, Fcnt As Integer
Public StarX(25, 3) As Integer
Public AnimatedLogo As String, AnimatedKeyPress As String, AnimatedStar As String, AnimatedFlower As String
Public Sub MainLoop()

    Do
            GTCValue = GetTickCount + 1                   '
        Do                                                                       '
            DoEvents                                                        'DoEvents �� �ߵ� �Լ�
        Loop Until GTCValue < GetTickCount           '

            basB.MainBlt
            BGStar
            DefaultIndex = DefaultCnt(DefaultIndex)
            FlowerIndex = FlowerCnt(FlowerIndex)
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
                
        Else
                LoadSetting
        End If

PageX = 0
End Sub
Public Sub LoadSetting()


PageX = 1
End Sub
Public Sub StartSetting()
PageX = 2
BGStarSet

With fMain
For i = 0 To 12
    .LogoPic(i).Picture = .BList.ListImages(i + 1).Picture
Next i
    .ObjectBox(0).Picture = .OList.ListImages(1).Picture
    .ObjectBox(1).Picture = .OList.ListImages(2).Picture
    .PanelBox(0).Picture = .PList.ListImages(1).Picture
    .PanelBox(1).Picture = .PList.ListImages(2).Picture
    .PanelBox(2).Picture = .PList.ListImages(3).Picture
    
End With

            AnimatedLogo = "1008.295.4.5.20."
            AnimatedKeyPress = "277.44.2.3.5."
            AnimatedStar = "65.65.5.1.5."
            AnimatedFlower = "200.400.10.1.10."
            FlowerIndex = 0
            
            For i = 0 To 2
                Menu(i, 0) = 800
                Menu(i, 1) = 350 + 80 * i
            Next i
                Menu(3, 0) = -100
                Menu(3, 1) = 530
            
PageX = 3
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
Public Function DefaultCnt(ByVal Index As Integer)
        Index = Index + 1
                    If Index = 200 Then
                        Index = 0
                    End If
DefaultCnt = Index
End Function
Public Function FlowerCnt(ByVal Index As Integer)
        If Index = 0 Then
            Fcnt = 0: Index = 1
        ElseIf Index = 59 Then
            Fcnt = 0: Index = 58
        End If
        Index = Index + Fcnt
FlowerCnt = Index
End Function
