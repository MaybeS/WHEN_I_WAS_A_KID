Attribute VB_Name = "Dbas"
Public Type BackObj
        X As Long               'x��ǥ
        Y As Long               'y��ǥ
        Name As String      '�̸�
        Ani As Boolean      '�����̴±׸������Ǵ�
        AniCnt As Integer   '�����̴±׸��Ͻ� �ε���
        Visible As Boolean  '���̴��� �Ⱥ��̴���
End Type
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Type Obj
        X As Long               'x��ǥ
        Y As Long               'y��ǥ
        Name As String          '�̸�
        
        Standing As Boolean     'True = ������ False = ����
        Walking As Integer          '���� �ȴµ���-
        Act As Integer          '���� ���ϴµ��� - ������ blt ��ɺ���
                                    ' 0=Normal,1=Walking,2=Attacking,3=Defending
        NowLv As Integer        '���� ����
        
        NowHp As Long           '���� ü��
        NowXp As Long           '���� ����ġ
        NowFi As Integer        '���� �߿���
        
        MaxHp As Long           '�ִ� ü��
        MaxXp As Long           '�ִ� ����ġ
        MaxFi As Integer        '�ִ� �߿���
        
        NowCast As Integer      '���� ������
        Casted As Integer           'ĳ���õ� �ֹ�
        NowBuf(50) As Integer   '���� ����
        NowDuf(50) As Integer   '���� �����
        
        Spd As Integer          '�̵��ӵ�
        AttkSp As Integer       '�������ݼӵ�
        AttkAp As Integer       '�������ӵ�
        
        CriPer As Integer       'ġ��ŸȮ��
        CriDam As Integer       'ġ��Ÿ����������
        CriTar As Integer       '����Ȯ��
        
        NPyAtk As Integer       '�⺻����������
        NPyArm As Integer       '�⺻�������
        
        Admire As Integer       '����
        Unions As String        '����
        
        Death As Boolean        '�����Ǻ�
        Visible As Boolean          '���̴��� �Ⱥ��̴���
        Battlex As Boolean      '������ True
        MoveX As Boolean        '�̵����� True
        AttkX As Boolean        '���ݰ��� True
End Type
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Mi As Obj
Public FireBG(25) As BackObj
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Sub SetOn()                                 '�ʱ� ���� �����մϴ�
    For i = 0 To 3
        OpenBarX(i) = 1270 - (30 * i)
        OpenBarY(i) = 320 + (80 * i)
        OpenBar(i) = 0
        BoxXY(i + 1) = 0
        UIBox(i) = 0
        fmain.Num(i).Picture = fmain.SFList.ListImages(12 + i).Picture
    Next i
    For i = 0 To 7
        fmain.cha(i).Picture = fmain.chaList.ListImages(i + 1).Picture
    Next i
        OpenBar(4) = 0
        OpBox = Array(1, 4, 1, 4, 4)
        OpBoxInt = 0
        BoxXY(0) = 0
        BoxXY(5) = 0
        GMap = 0
        Gaming = False
        MouXY = False
    
    OpenX = 0: OpenY = 0: OpAdX = 1: OpAdY = 1: CamX = 0
    FPS_F = 0: FPS_S = 0: FKeep = 0: Kping = 1: CamY = 0: ChkWalk = 0
    
With fmain.SFList
    fmain.BackBG.Picture = .ListImages(1).Picture
    fmain.Rock(0).Picture = .ListImages(2).Picture
    fmain.Rock(1).Picture = .ListImages(3).Picture
    fmain.OBox(0).Picture = .ListImages(4).Picture
    fmain.OBox(1).Picture = .ListImages(5).Picture
    fmain.Texts(0).Picture = .ListImages(6).Picture
    fmain.Texts(1).Picture = .ListImages(7).Picture
    fmain.MenuBar(0).Picture = .ListImages(8).Picture
    fmain.MenuBar(1).Picture = .ListImages(9).Picture
    fmain.Tex(0).Picture = .ListImages(10).Picture
    fmain.Tex(1).Picture = .ListImages(11).Picture
    fmain.OpenFire(0).Picture = .ListImages(16).Picture
    fmain.OpenFire(1).Picture = .ListImages(17).Picture
End With
With fmain
        .FireObj.Picture = .ObjectList(0).ListImages(1).Picture
    For i = 0 To 5
        .UIi(i).Picture = .UIlist.ListImages(i + 1).Picture
    Next i
    For i = 0 To 13
        .Boxs(i).Picture = .BoxList.ListImages(i + 1).Picture
    Next i
        .Mou(0).Picture = .BoxList.ListImages(15).Picture
        .Mou(1).Picture = .BoxList.ListImages(16).Picture
End With
    StartOn
    
    fmain.Show                                          'ó���� fmain�� �����ݴϴ�.
    
End Sub
Public Sub NewFireBG(ByVal Index As Integer, ByVal Name As String, ByVal X As Integer, ByVal Y As Integer)
                FireBG(Index).Ani = True
Randomize
                FireBG(Index).AniCnt = Int(Rnd * 40)
                FireBG(Index).Name = Name
                FireBG(Index).Visible = True
                FireBG(Index).X = X
                FireBG(Index).Y = Y

End Sub
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Sub NewMi()
        Mi.X = 0
        Mi.Y = 0
        Mi.Standing = True
        Mi.Act = 0
        Mi.Walking = 0
        Mi.Act = 0
        Mi.NowLv = 1
        Mi.NowHp = 50
        Mi.NowXp = 0
        Mi.NowFi = 0
        Mi.MaxHp = 50
        Mi.MaxXp = 10
        Mi.MaxFi = 50
        Mi.NowCast = 0
            For i = 0 To 50
                Mi.NowBuf(i) = 0
                Mi.NowDuf(i) = 0
            Next i
        Mi.Spd = 100
        Mi.AttkSp = 100
        Mi.AttkAp = 100
        Mi.CriPer = 0
        Mi.CriDam = 100
        Mi.CriTar = 100
        Mi.NPyAtk = 5
        Mi.NPyArm = 0
        Mi.Admire = 0
        Mi.Unions = "���� ����"
        Mi.Battlex = False
        Mi.MoveX = True
        Mi.AttkX = True
End Sub
