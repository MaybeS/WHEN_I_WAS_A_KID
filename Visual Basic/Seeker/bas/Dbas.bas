Attribute VB_Name = "Dbas"
Public Type BackObj
        X As Long               'x좌표
        Y As Long               'y좌표
        Name As String      '이름
        Ani As Boolean      '움직이는그림인지판단
        AniCnt As Integer   '움직이는그림일시 인덱스
        Visible As Boolean  '보이는지 안보이는지
End Type
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Type Obj
        X As Long               'x좌표
        Y As Long               'y좌표
        Name As String          '이름
        
        Standing As Boolean     'True = 오른쪽 False = 왼쪽
        Walking As Integer          '현재 걷는동작-
        Act As Integer          '현재 취하는동작 - 에따라 blt 명령변경
                                    ' 0=Normal,1=Walking,2=Attacking,3=Defending
        NowLv As Integer        '현재 레벨
        
        NowHp As Long           '현재 체력
        NowXp As Long           '현재 경험치
        NowFi As Integer        '현재 발열량
        
        MaxHp As Long           '최대 체력
        MaxXp As Long           '최대 경험치
        MaxFi As Integer        '최대 발열량
        
        NowCast As Integer      '현재 시전중
        Casted As Integer           '캐스팅된 주문
        NowBuf(50) As Integer   '현재 버프
        NowDuf(50) As Integer   '현재 디버프
        
        Spd As Integer          '이동속도
        AttkSp As Integer       '물리공격속도
        AttkAp As Integer       '시전가속도
        
        CriPer As Integer       '치명타확률
        CriDam As Integer       '치명타데미지배율
        CriTar As Integer       '적중확률
        
        NPyAtk As Integer       '기본물리데미지
        NPyArm As Integer       '기본물리방어
        
        Admire As Integer       '평판
        Unions As String        '세력
        
        Death As Boolean        '죽음판별
        Visible As Boolean          '보이는지 안보이는지
        Battlex As Boolean      '전투중 True
        MoveX As Boolean        '이동가능 True
        AttkX As Boolean        '공격가능 True
End Type
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Mi As Obj
Public FireBG(25) As BackObj
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Sub SetOn()                                 '초기 값을 설정합니다
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
    
    fmain.Show                                          '처음에 fmain을 보여줍니다.
    
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
        Mi.Unions = "세력 없음"
        Mi.Battlex = False
        Mi.MoveX = True
        Mi.AttkX = True
End Sub
