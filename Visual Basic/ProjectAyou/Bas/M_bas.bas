Attribute VB_Name = "M_bas"
Option Explicit

Private Type AyouStateType

    Show As Boolean         '현재폼 활성/비활성 유무
    FrameCnt As Integer     '현재폼 프레임
    MaxFrameCnt As Integer  '현재폼의 최대 프레임 (ui_speed비례)
    
    SubShow As Boolean      '서브폼 활성/비활성 유무
    SubFrameCnt As Integer  '서브폼 프레임
        
    NotiShow As Boolean     '알림창의 활성/비활성 융무
    NotiVisible As Boolean  '알림창의 가시/비가시 유무
    NotiFrameCnt As Integer '알림창의 현재프레임
    
    MemoShow As Boolean     '메모창의 활성/비활성 유무
    MemoVisible As Boolean  '메모창의 가시/비가시 유무
    MemoFrameCnt As Integer '메모창의 현재 프레임
    
    UI_Size As Integer      'UI크기
    UI_Speed As Integer
    UI_Alpha As Integer
    
    BackColor(6) As Long    '배경색
    Rgn_Name(6) As String   '항목이름
    Rgn_Hex(6) As POINTAPI  '원래위치
    Rgn_Nex(6) As POINTAPI  '현재위치
    Rgn_Ico(6) As String    '아이콘 인덱스
    
    Set_Name(6) As String   '설정 항목이름
    Set_Ico(6) As String    '설정 아이콘 인덱스
    
End Type

Private Type UserInfoType
    Name As String
End Type

Private Type AyouSettingType
    
    index As Integer
    IndexValue As Integer
    Move As Boolean
    
    N_Boolean As Boolean
    N_Integer As Integer
    N_Long As Long
    N_String As String
    
End Type

Private Type AyouSetType

    SubForm(6) As FormSize      '서브창 크기
    Ayou As AyouSettingType     '서브-크리스
    Remind As AyouSettingType   '서브-알림
    Setting As AyouSettingType  '서브-설정
    
End Type

Public Type LanguageType
    
    Name As String          '언어이름
    Key(100) As String      '
    Tey(100) As String

End Type

Public Type MessageType

    X As Long
    Y As Long
    Text As String
    Height As Integer
    Width As Integer
    Who As Boolean
    
End Type

Public Type MessageTextType

    X As Long
    Y As Long
    Text As String
    index As Integer
    
End Type

Public Type IDType
    
    ID As String
    PW As String
    Auto As Boolean

End Type

Public Type MemoType
    
    Main As String
    Lock As Boolean
    Star As Boolean
    LockPass As String
    
End Type

Public UserInfo As UserInfoType
Public MessageCNT As Integer, MessageX(250) As MessageType, MessageTextCnt As Integer, MessageXtext(500) As MessageTextType
Public AyouState As AyouStateType, AyouSet As AyouSetType
Public CurX As POINTAPI, CurA As POINTAPI, CurB As POINTAPI, CurC As POINTAPI

Public IDArray(100) As IDType, IDcnt As Integer
Public Lan_Custom(10) As LanguageType, NowLan As Integer

Public ChatY As Long, ChatLY As Long, ChatYY As Long, ChatYYDelay As Integer, HookX As Boolean
Public SubBoxFrameCnt(7) As Integer, WaitCnt(7) As Integer, SubBoxBoolean(7) As Boolean

Public Memo(100) As MemoType, MemoNow As Integer, MemoBef As Integer, MemoQuick As Integer, MemoTopLock As Boolean

Public NHex As Integer, NSet As Integer, MSet As Integer, NullSetBox(6) As Integer, N_Locate As String, N_User As String, N_Key As String
Public N_String As String, N_Long As Long

Public Sub SaveLog()

End Sub
Public Sub SaveSet()
Dim i As Integer
    
    SaveSetting "Ayou", "Set", "UI_Size", AyouState.UI_Size
    SaveSetting "Ayou", "Set", "UI_Speed", AyouState.UI_Speed
    SaveSetting "Ayou", "Set", "UI_Alpha", AyouState.UI_Alpha
    
For i = 0 To 6
    SaveSetting "Ayou", "Set", "BackColor" & i, AyouState.BackColor(i)
Next i

    SaveSetting "Ayou", "Set", "Lan", NowLan
    
End Sub
Public Sub LoadAyouSet()
Dim i As Integer

    SaveSetting "Ayou", "Ayou", "Run", "Running"
        '아유 실행중에 Ayou.RUN = TRUE 값을 넣어놓습니다.
        
        
With AyouState

    .UI_Size = GetSetting("Ayou", "Set", "UI_Size", 50)
    .UI_Speed = GetSetting("Ayou", "Set", "UI_Speed", 7)
        F_Sub.HScroll1.value = .UI_Speed
    .UI_Alpha = GetSetting("Ayou", "Set", "UI_Alpha", 200)
        F_Sub.HScroll2.value = .UI_Alpha
        
        .MaxFrameCnt = AyouState.UI_Speed * 2 + 1
        
    .BackColor(0) = Val(GetSetting("Ayou", "Set", "BackColor0", RGB(0, 121, 255)))
    .BackColor(1) = GetSetting("Ayou", "Set", "BackColor1", RGB(0, 200, 75))
    .BackColor(2) = GetSetting("Ayou", "Set", "BackColor2", RGB(255, 75, 75))
    .BackColor(3) = GetSetting("Ayou", "Set", "BackColor3", RGB(75, 255, 125))
    .BackColor(4) = GetSetting("Ayou", "Set", "BackColor4", RGB(200, 75, 255))
    .BackColor(5) = GetSetting("Ayou", "Set", "BackColor5", RGB(255, 200, 75))
    .BackColor(6) = GetSetting("Ayou", "Set", "BackColor6", RGB(75, 75, 255))
    
    N_Locate = GetSetting("Ayou", "App", "Locate", "c:\temp")
    N_User = "Maybe"
    
    NowLan = GetSetting("Ayou", "Set", "Lan", 0)
    
    SetLan LoadFileEX(N_Locate & "\Resource\System\Lan.inf")

    F_Main.Button_Ok.Caption = GetLanInf("OK")
    
End With

End Sub
Public Sub SetLan(ByVal StringX As String)
Dim LanArray() As String, LanArrayX() As String, LanArrayY() As String
Dim i As Integer, j As Integer, Cnt As Integer, Equ As Boolean, EquI As Integer, EquJ As Integer
'지정된 언어들을 불러옵니다,.
'Key값은 항목값이고 Tey값이 값

F_Sub.Set_Lan.Clear

    LanArray = Split(StringX, " = ")
    F_Sub.Set_Lan.AddItem "기본(한국어)", 0
    
    SetEmbedLan
    
If UBound(LanArray) <= 0 Then

    NowLan = 0
    
Else
    
    For i = 1 To UBound(LanArray)
    
        LanArrayX = Split(LanArray(i), vbCrLf)
        
        Lan_Custom(i).Name = Left$(LanArrayX(0), Len(LanArrayX(0)) - 1)
        F_Sub.Set_Lan.AddItem Lan_Custom(i).Name, i
        
        
        For j = 1 To UBound(LanArrayX) - 1
            LanArrayY = Split(LanArrayX(j), "=")
            
            Lan_Custom(i).Key(j) = Trim(LanArrayY(0))
            Lan_Custom(i).Tey(j) = Trim(LanArrayY(1))
        Next j
            
    Next i
    
End If
    
    F_Sub.Set_Lan.ListIndex = NowLan


End Sub
Private Sub SetEmbedLan()
'내장 언어팩

Lan_Custom(0).Key(1) = "Ayou"
Lan_Custom(0).Key(2) = "Ayou_"
Lan_Custom(0).Key(3) = "Remind"
Lan_Custom(0).Key(4) = "Setting"
Lan_Custom(0).Key(5) = "Memo"
Lan_Custom(0).Key(6) = "Music"
Lan_Custom(0).Key(7) = "SocialNetworkService"
Lan_Custom(0).Key(8) = "Calendar"
Lan_Custom(0).Key(9) = "General"
Lan_Custom(0).Key(10) = "Graphic"
Lan_Custom(0).Key(11) = "Data"
Lan_Custom(0).Key(12) = "User"
Lan_Custom(0).Key(13) = "Network"
Lan_Custom(0).Key(14) = "Security"
Lan_Custom(0).Key(15) = "Lab"

Lan_Custom(0).Key(16) = "OK"
Lan_Custom(0).Key(17) = "Cancel"
Lan_Custom(0).Key(18) = "Exit"
Lan_Custom(0).Key(19) = "Use"
Lan_Custom(0).Key(20) = "Logout"

Lan_Custom(0).Key(21) = "Language"
Lan_Custom(0).Key(22) = "Password"
Lan_Custom(0).Key(23) = "AutoStart"
Lan_Custom(0).Key(24) = "AutoLogin"
Lan_Custom(0).Key(25) = "Version"
Lan_Custom(0).Key(26) = "Size"
Lan_Custom(0).Key(27) = "Shape"
Lan_Custom(0).Key(28) = "Effect"
Lan_Custom(0).Key(29) = "Menu"
Lan_Custom(0).Key(30) = "Speed"

Lan_Custom(0).Key(31) = "Local"
Lan_Custom(0).Key(32) = "Private"
Lan_Custom(0).Key(33) = "Public"


Lan_Custom(0).Key(51) = "Text.1"
Lan_Custom(0).Key(52) = "Text.2"
Lan_Custom(0).Key(53) = "Text.3"
Lan_Custom(0).Key(54) = "Text.4"
Lan_Custom(0).Key(55) = "Text.5"
Lan_Custom(0).Key(56) = "Text.6"


Lan_Custom(0).Tey(1) = "Ayou"
Lan_Custom(0).Tey(2) = "아유"
Lan_Custom(0).Tey(3) = "알림"
Lan_Custom(0).Tey(4) = "설정"
Lan_Custom(0).Tey(5) = "메모"
Lan_Custom(0).Tey(6) = "음악"
Lan_Custom(0).Tey(7) = "SNS"
Lan_Custom(0).Tey(8) = "달력"
Lan_Custom(0).Tey(9) = "일반"
Lan_Custom(0).Tey(10) = "그래픽"
Lan_Custom(0).Tey(11) = "데이터"
Lan_Custom(0).Tey(12) = "사용자"
Lan_Custom(0).Tey(13) = "네트워크"
Lan_Custom(0).Tey(14) = "보안"
Lan_Custom(0).Tey(15) = "실험"

Lan_Custom(0).Tey(16) = "확인"
Lan_Custom(0).Tey(17) = "취소"
Lan_Custom(0).Tey(18) = "종료"
Lan_Custom(0).Tey(19) = "사용"
Lan_Custom(0).Tey(20) = "로그아웃"

Lan_Custom(0).Tey(21) = "언어"
Lan_Custom(0).Tey(22) = "비밀번호"
Lan_Custom(0).Tey(23) = "자동 시작"
Lan_Custom(0).Tey(24) = "자동 로그인"
Lan_Custom(0).Tey(25) = "버전"
Lan_Custom(0).Tey(26) = "크기"
Lan_Custom(0).Tey(27) = "모양"
Lan_Custom(0).Tey(28) = "효과"
Lan_Custom(0).Tey(29) = "메뉴"
Lan_Custom(0).Tey(30) = "속도"

Lan_Custom(0).Tey(31) = "지역의"
Lan_Custom(0).Tey(32) = "개인의"
Lan_Custom(0).Tey(33) = "공공의"

Lan_Custom(0).Tey(51) = "Ayou가 정상적으로 설치되지 않았어요."
Lan_Custom(0).Tey(52) = "마지막 종료가 비정상적으로 종료되었어요."
Lan_Custom(0).Tey(53) = "이미 Ayou가 실행되고 있어요."
Lan_Custom(0).Tey(54) = "Ayou가 시작되었어요. Shfit+Ctrl 를 눌러 활성화 하세요."
Lan_Custom(0).Tey(55) = "알림이있어요."
Lan_Custom(0).Tey(56) = "으로 로그인 되었어요."

End Sub
Public Sub SetAyou()
On Error Resume Next
Dim i As Integer

    CalendarSet
    
    
    Randomize
    N_Key = Hex(Rnd * (16 ^ 4))

F_Ayou.Cls
F_Sub.Cls
    
    F_Sub.Label_UserName.Caption = UserInfo.Name
    
With AyouSet

    .SubForm(0).Width = 275
    .SubForm(0).Height = 425
    .SubForm(1).Width = 265
    .SubForm(1).Height = 400
    .SubForm(2).Width = 350
    .SubForm(2).Height = 465
    .SubForm(3).Width = 329
    .SubForm(3).Height = 489
    .SubForm(4).Width = 265
    .SubForm(4).Height = 393
    .SubForm(5).Width = 265
    .SubForm(5).Height = 393
    .SubForm(6).Width = 265
    .SubForm(6).Height = 393
    
    .Remind.N_Integer = 3
        '리마인더의 기본값 날짜 = 3 (중앙)
    
End With

With AyouState

    .Show = False
    .FrameCnt = 0
    
    .SubShow = False
    .SubFrameCnt = 0
    
    .NotiVisible = True
    .NotiShow = True
    .NotiFrameCnt = 0
    
    .MemoVisible = True
    .MemoShow = True
    .MemoFrameCnt = 0
    
    .Rgn_Hex(0).X = .UI_Size * (2)
    .Rgn_Hex(0).Y = .UI_Size * (3 ^ (1 / 2))
    .Rgn_Hex(1).X = .UI_Size * (4)
    .Rgn_Hex(1).Y = .UI_Size * (3 ^ (1 / 2))
    .Rgn_Hex(2).X = .UI_Size * (3)
    .Rgn_Hex(2).Y = .UI_Size * ((3 ^ (1 / 2)) * 2)
    .Rgn_Hex(3).X = .UI_Size * (1)
    .Rgn_Hex(3).Y = .UI_Size * ((3 ^ (1 / 2)) * 2)
    .Rgn_Hex(4).X = 0
    .Rgn_Hex(4).Y = .UI_Size * (3 ^ (1 / 2))
    .Rgn_Hex(5).X = .UI_Size * (1)
    .Rgn_Hex(5).Y = 0
    .Rgn_Hex(6).X = .UI_Size * (3)
    .Rgn_Hex(6).Y = 0
    'Hexagon UI의 제위치를 설정합니다.
    
End With
    
    For i = 0 To 6
    
        AyouState.Rgn_Ico(i) = Lan_Custom(0).Key(i + 2)
        AyouState.Rgn_Name(i) = GetLanInf(Lan_Custom(0).Key(i + 2))
        
        AyouState.Set_Ico(i) = Lan_Custom(0).Key(i + 9)
        AyouState.Set_Name(i) = GetLanInf(Lan_Custom(0).Key(i + 9))
                
        AyouState.Rgn_Nex(i).X = AyouState.Rgn_Hex(0).X
        AyouState.Rgn_Nex(i).Y = AyouState.Rgn_Hex(0).Y
        
        F_Sub.SubBox(i).Height = AyouSet.SubForm(i).Height
        F_Sub.SubBox(i).Width = AyouSet.SubForm(i).Width
        F_Sub.SubBox(i).Left = 50
        F_Sub.SubBox(i).Top = 0
        F_Sub.SubBox(i).Visible = False
        
        F_Sub.SetBox(i).Height = 417
        F_Sub.SetBox(i).Width = 289
        F_Sub.SetBox(i).Left = 55
        F_Sub.SetBox(i).Top = 37
        F_Sub.SetBox(i).Visible = True
        
    Next i
    'Hexagon UI의 현재위치를 설정합니다.
    
    F_Ayou.Width = AyouState.UI_Size * 6 * Screen.TwipsPerPixelX
    F_Ayou.Height = AyouState.UI_Size * 6 * Screen.TwipsPerPixelY
    F_Ayou.Left = 0
    F_Ayou.Top = 0
        '메인창 설정
    
    F_Sub.Width = 400 * Screen.TwipsPerPixelX
    F_Sub.Height = 555 * Screen.TwipsPerPixelY
    F_Sub.TopBar.Left = 50
    F_Sub.TopBar.Top = 7
        F_Sub.BackColor = RGB(0, 121, 255)
        '서브창의 설정
        
    F_Noti.Width = 450 * Screen.TwipsPerPixelX
    F_Noti.Height = 150 * Screen.TwipsPerPixelY
    F_Noti.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
    F_Noti.Top = Screen.Height - 200 * Screen.TwipsPerPixelY
        F_Noti.BackColor = RGB(0, 121, 255)
        '알림창의 설정
        
    F_Memo.Width = 400 * Screen.TwipsPerPixelX
    F_Memo.Height = 300 * Screen.TwipsPerPixelY
    F_Memo.Left = Screen.Width - 10 * Screen.TwipsPerPixelX
    F_Memo.Top = Screen.Height - 500 * Screen.TwipsPerPixelY
        F_Memo.BackColor = RGB(0, 121, 255)
        '메모창의 설정
    
    SetWindowPos F_Ayou.hWnd, -1, 0, 0, 0, 0, &H2 Or &H1
    SetWindowPos F_Sub.hWnd, -1, 0, 0, 0, 0, &H2 Or &H1
    SetWindowPos F_Noti.hWnd, -1, 0, 0, 0, 0, &H2 Or &H1
    SetWindowPos F_Memo.hWnd, -1, 0, 0, 0, 0, &H2 Or &H1
    'Ayou폼을 항상위에 보여줍니다.
    
    NHex = 0
    '현재 서브폼의 값입니다. index
    NSet = 0
    '현재 설정창 index 값
    MSet = 0
    '과거 설정창 index 값
    
    AyouSet.Setting.IndexValue = 40
    AyouSet.Setting.Move = False
    
    DrawUIImg
    'UI이미지를 드로우합니다. 드로잉되는 객체의 색은 설정된값을따릅니다.
    
    F_Noti.Show
    F_Memo.Show
    
    AyouSpeakCnt = 0
    AyouX.Mind.Quest = 0
    
    LoadMemo
        MemoNow = 0
        MemoBef = 0
    
    SetLanInf
    
    Ayou_NotiRgn
    Ayou_MemoRgn
    'f_ayou.Show
    
    F_Sub.Label_Version.Caption = App.Major & "." & App.Minor & "." & App.Revision & " " & N_Key
    '설정을 마친후에 폼을 보여줍니다.
    
    CurX.X = 100
    CurX.Y = 100
    
End Sub
Public Sub SetLanInf()
On Error Resume Next
Dim i As Integer
    
    For i = 0 To 15
        
        F_Sub.N_Label(i).AutoSize = False
        F_Sub.N_Label(i).Caption = GetLanInf(F_Sub.N_Label(i).Tag)
        F_Sub.N_Label(i).Width = GetStringLen(F_Sub.N_Label(i).Caption, F_Sub.N_Label(i).Font.Size)
        
    Next i
    
End Sub
