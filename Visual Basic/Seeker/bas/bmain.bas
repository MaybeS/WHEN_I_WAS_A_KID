Attribute VB_Name = "bmain"
Option Explicit
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long

Public Type POINTAPI
        X As Long
        Y As Long
End Type

Public i As Integer, j As Integer, k As Integer

Public ChkWalk  As Byte ' chkwalk=1,�°ȴ���.2,��ȴ���.0,����
Public FPS_F As Integer, FPS_S As Long                                       'fps����
Public OpenX As Integer, OpenY As Integer                                    'xy��ǥ���� (�ε�����̹���)
Public OpAdX As Integer, OpAdY As Integer                                   'xy���ӵ� ����
Public FKeep As Integer, Kping As Integer                                       'fkeep = ȭ�� kping = ȭ���̵�������
Public MouX As Long, MouY As Long, MouXY As Boolean, MXY As POINTAPI    '���콺 ��ǥ XY
Public GMap As Integer, Gaming As Boolean                                   'Gmap = ��ġ
Public OpBoxInt As Byte                                                                   '�ɼǹڽ� �迭
Public OpenBarX(3) As Integer, OpenBarY(3) As Integer, OpenBar(4) As Integer, OpBox
Public BoxXY(7) As Integer, UIBox(3) As Byte                            'ui����
Public CamX As Long, CamY As Long                                       'ī�޶���ǥ
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Sub StartOn()
Dim Start As Integer
                fmain.Consol.Text = "�ܼ�â������ ������ ���÷��� �ܼ�â�� help �� �Է��� ���͸� �����ֽð�," & vbNewLine & _
                                                            "�ܼ�â�� �������� exit�� �Է��� ���͸� �����ּ���," & vbNewLine & _
                                                            "�ܼ�â������ ��������� �����ʽ��ϴ�." & vbNewLine & _
                                                            "�ܼ�â���� ����Ǵ� ��ɾ�� ���������� ������Ʈ���� �����մϴ�." & vbNewLine & _
                                                            "���� ���̺� ������ ���� ������ �� �� �� ������," & vbNewLine & _
                                                            "���ؿ����� å���� ����ڿ��� �ֽ��ϴ�." & vbNewLine & _
                                                            "������ �Է��ν��� �� �������ٿ������˴ϴ�."
    Start = GetSetting(App.ProductName, "Zenith", "Start", 0)
        If Start = 0 Then
            BoxShow 450, 250, 550, 270, "ó�������Ͻô±���." & vbNewLine & "ž�� �����ڸ� ȯ���մϴ�."
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
            DoEvents                                    'DoEvents �� �ߵ� �Լ�
        Loop Until GTCValue < GetTickCount              '
            
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Call BltImage                                    'ȭ�鿡 �̹��� �Ѹ��� bltbas ����
            Call CNTFPS                                      'fps�� ���
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If Gaming = False Then
        Select Case FKeep
            Case 0
                If OpBox(1) > 2 Then
                    OpenX = OpenX + OpAdX                  'ȭ�鿡 ����ϴ� mainBG�� ��ġ���X
                    OpenY = OpenY + OpAdY                  'ȭ�鿡 ����ϴ� mainBG�� ��ġ���Y
                End If
            Case 1
            Case 2
            Case 3
        End Select
        
        If OpenBarX(0) > 970 And Kping = 1 Then
            For i = 0 To 3
                OpenBarX(i) = OpenBarX(i) - 15      'ó���� ������ �޴��� ��ġ �ִϸ��̼� ó��
            Next i
        ElseIf OpenBarX(0) < 1370 And Kping = -1 Then
            For i = 0 To 3
                OpenBarX(i) = OpenBarX(i) + 15      'ó���� ������ �޴��� ��ġ �ִϸ��̼� ó��
            Next i
        Else
        End If

        If OpenX = 220 Or OpenX = 0 Then
            OpAdX = OpAdX * -1                          'ȭ�鿡 ����ϴ� mainBG�� ��ġ����� ������X
        End If
        If OpenY = 278 Or OpenY = 0 Then
            OpAdY = OpAdY * -1                          'ȭ�鿡 ����ϴ� mainBG�� ��ġ����� ������Y
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
            Case 0                                                                                                              '���ο� ����
                    NewMi
                    Gaming = True
                    GMap = 0
                    Gmaping
                    Gstart
            Case 1                                                                                                              '�̾� �ϱ�
                If GetSetting(App.ProductName, "Zenith", "Save", 0) = 0 Then
                    BoxShow 450, 250, 550, 270, "����� �����Ͱ� �����ϴ�." & vbNewLine & "���ν����ؾ��մϴ�."
                Else
                
                End If
            Case 2                                                                                                              '����
                FKeep = 1
                Kping = -1
            Case 3                                                                                                              '������
                End
            Case 4                                                                                                              '�����������ƿ���
                FKeep = 0
                Kping = 1
        End Select
End Sub
Public Sub CNTFPS()                                'fps�� ����մϴ�.
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


