Attribute VB_Name = "Mbas"
Option Explicit
Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Const GWL_WNDPROC = (-4)
Public Const WM_MOUSEWHEEL = &H20A
Public gHW As Long, WScroll As Boolean
Dim PrevProc As Long
'`휠사용관련
Private Declare Function CreateRoundRectRgn Lib "gdi32.dll" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function SetWindowRgn Lib "user32.dll" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private m_lpBordrPoints()   As POINTAPI
'`화면 조정관련
Public Declare Function GetTickCount Lib "kernel32" () As Long
'`시간 받아오기
Public Declare Function GetCursorPos Lib "user32.dll" (ByRef lpPoint As POINTAPI) As Long
        Private Type POINTAPI
            X As Long
            Y As Long
        End Type
'`커서 인식
Private Declare Function GetModuleHandle Lib "kernel32.dll" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
'Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, Y, ByVal cX As Long, ByVal cY As Long, ByVal wFlags As Long) As Long
        Private Enum TransType
            byColor
            byvalue
        End Enum
Private Const HWND_TOPMOST = -1
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1
Private Const TOPMOST_FLAGS = SWP_NOMOVE Or SWP_NOSIZE
Private Const LWA_COLORKEY = &H1
Private Const LWA_ALPHA = &H2
Private Const WS_EX_LAYERED = &H80000
Private Const GWL_EXSTYLE = -20
'`폼 반투명화 관련

Private Type ManType
    Name As String          'Set! Cris
    Gender As Boolean       'T=M:F=W
    Years As Integer
    Weight As Integer
    Height As Integer
    Enabled As Boolean
    Tag As Boolean
End Type

Private Type StringType
    Title As String
    Text As String
    Date As String
    Lock As Boolean
    Tag As String
End Type

Private Type IconType
    X As Integer
    Y As Integer
    Enable As Boolean
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
    Index As Integer
End Type

'독자적인 타입

Public RedCntF As Integer, GreenCntF As Integer, BlueCntF As Integer, RedCnt As Integer, GreenCnt As Integer, BlueCnt As Integer '색상 변화 변수
Public ScreenHeight As Long, ScreenWidth As Long                '화면정보 변수
Public iConLP(3) As IconType                                    '아이콘 함수
Public Cris As ManType, UserX As ManType, CrisMind As AImind    '크리스 설정변수
Public i As Integer, j As Integer, k As Integer, N_Integer As Integer, N_Long As Long, N_String As String, N_Locate As String
        '일반 사용 변수 (i,j는 for문에 n_변수형 변수는 임시정보저장용
Public Cur As POINTAPI, CurS As POINTAPI, CurStack As Long, CurDelay As Long
        '커서에대한 POINTAPI 등 , 커서 시간스텍과 커서 입력 딜레이
Public RemindXT As String, MemoX(500) As StringType, RemindX(500) As StringType, MemoXCnt As Integer, RemindXCnt As Integer
        '알림 배열과 알림 갯수 변수와 알림제목 배열
        '메모 배열과 메모 갯수 변수와 메모제목 배열
Public HomeString(5) As String, TboxKeyUp As Long, IndexMatch As Integer
Public M_State As Boolean, N_State As Boolean, T_State As Integer, S_State As Boolean, HookX As Boolean
        'M_,N_은 메인폼의 보여주기상태, T_는 알림폼의 화면표시상태, S_는 설정창관련,HookX는 톡 훅관련
Public HomeTitle(3) As String, NewStart As Boolean
        '폼의 여러가지 상태를 나타냅니다. NewStart는 처음시작인지아닌지를나타냅니다.
Public APM As Boolean, SecondON As Boolean
        '설정의 설정값 -APM 24시간제사용안함 -SecondON 초단위 표시
Public ChatY As Long, ChatLY As Long, ChatYY As Long, ChatYYDelay As Integer
Public MessageCNT As Integer, MessageX(250) As MessageType, MessageTextCnt As Integer, MessageXtext(500) As MessageTextType
        '채팅상수를 반환합니다.
Private Sub CreateTransparentWindowStyle(lhWnd)
 On Error Resume Next
 
Dim Ret As Long

       Ret = GetWindowLong(lhWnd, GWL_EXSTYLE)
       Ret = Ret Or WS_EX_LAYERED
       SetWindowLong lhWnd, GWL_EXSTYLE, Ret

End Sub
Private Sub WindowTransparency(lhWnd&, TransparencyBy As TransType, _
                                      Optional clr As Long, _
                                      Optional TransVal As Long)
On Error Resume Next

    Call CreateTransparentWindowStyle(lhWnd)
    
    If TransparencyBy = byColor Then
         SetLayeredWindowAttributes lhWnd, clr, 100, LWA_COLORKEY
    ElseIf TransparencyBy = byvalue Then
         SetLayeredWindowAttributes lhWnd, 100, TransVal, LWA_ALPHA
    End If
    
End Sub
Public Sub Error_(ByVal Index As Integer)
    Select Case Index
        Case 0
            MsgBox "최소 800×600 이상의 해상도가 필요합니다."
            End
        Case 1
            MsgBox "X,Y의 픽셀당 트윕수가 맞지않습니다. 조절해주세요."
        Case 2
            MsgBox "화면의 해상도가 조절되었습니다. 다시 시작해주세요."
        Case 3
            MsgBox "화면의 해상도가 너무큽니다. 너비가 2560으로 자동조절됩니다."
        Case 4
            MsgBox "화면의 해상도가 너무큽니다. 높이가 1600으로 자동조절됩니다."
    End Select
End Sub
Public Sub ShowEffect()
GetCursorPos Cur
        If (Cur.X > PixV(Noti.Left) And Cur.X < PixV(Noti.Width + Noti.Left) And Cur.Y <= PixV(Noti.Height)) Then
                If CurStack = 0 Then CurStack = GetTickCount: CurDelay = 0
                If GetTickCount >= CurStack + 500 Then
                        If Noti.Height < 375 Then Noti.Height = Noti.Height + 3 + (375 - Noti.Height) / 5
                End If
        Else
                If CurDelay + 2500 <= GetTickCount Then CurStack = 0: CurDelay = 0
                If CurDelay = 0 Then CurDelay = GetTickCount
                If Not M_State And Not Notifi.Visible Then
                        If Noti.Height > 10 Then Noti.Height = Noti.Height - 1 - (Noti.Height - 10) / 7
                End If
        End If
        
        If M_State Then
                If TwiV(Cur.Y) - Notifi.Height < 0 Then Notifi.Top = TwiV(Cur.Y) - Notifi.Height
        Else
                If Notifi.Visible And Notifi.Top < 0 And Not N_State Then
                        Notifi.Top = Notifi.Top + 3 + (0 - Notifi.Top) / 5
                        If Noti.Height < 375 Then Noti.Height = Noti.Height + 3 + (375 - Noti.Height) / 5
                End If
        End If
        
        If N_State And Notifi.Top > -7750 Then
                Notifi.Top = Notifi.Top - 3 - (Notifi.Top + 7725) / 3
        ElseIf Not N_State And Notifi.Top > 0 Then
                Notifi.Top = 0
        End If
        
If Notifi.Top > -Notifi.Height Then Notifi.Visible = True
If Notifi.Top < -7725 And Notifi.Visible Then Notifi.Visible = False: N_State = False: Notifi.Top = TwiV(-540)

End Sub
Public Sub RandomColor()
    RedCntF = RedCntF + RedCnt
    Randomize
        If RedCntF >= 257 Or RedCntF <= 0 Then RedCnt = ((Rnd * 4) + 1) * -1 * (RedCnt / ((RedCnt ^ 2) ^ (1 / 2))): RedCntF = RedCntF + RedCnt * 5
    GreenCntF = GreenCntF + GreenCnt
    Randomize
        If GreenCntF >= 257 Or GreenCntF <= 0 Then GreenCnt = ((Rnd * 4) + 1) * -1 * (GreenCnt / ((GreenCnt ^ 2) ^ (1 / 2))): GreenCntF = GreenCntF + GreenCnt * 5
    BlueCntF = BlueCntF + BlueCnt
    Randomize
        If BlueCntF >= 257 Or BlueCntF <= 0 Then BlueCnt = ((Rnd * 4) + 1) * -1 * (BlueCnt / ((BlueCnt ^ 2) ^ (1 / 2))): BlueCntF = BlueCntF + BlueCnt * 5
End Sub
Public Function TimerCal()
N_String = Format(Now, "H시 N분")
If SecondON Then N_String = N_String & Format(Now, " S초")
    If Not APM Then
        TimerCal = N_String: Exit Function
    Else
        For i = 1 To Len(N_String)
            If Mid(N_String, i, 1) = "시" Then N_Integer = Val(Left(N_String, i - 1)): Exit For
        Next i
            If N_Integer <= 12 Then
                TimerCal = "오전 " & N_String: Exit Function
            Else
                TimerCal = "오후 " & (N_Integer - 12) & Right(N_String, Len(N_String) - i + 1): Exit Function
            End If
    End If
End Function
Public Sub Hook(hwnd As Long)
    gHW = hwnd
    PrevProc = SetWindowLong(hwnd, GWL_WNDPROC, AddressOf WindowProc)
End Sub
Public Sub UnHook()
    SetWindowLong gHW, GWL_WNDPROC, PrevProc
End Sub
Public Function WindowProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    WindowProc = CallWindowProc(PrevProc, hwnd, uMsg, wParam, lParam)
    
    If uMsg = WM_MOUSEWHEEL Then
        If wParam < 0 Then
          ' 휠 Down
            If ChatY < (ChatLY - 470) Then
                    If ChatYY < 0 Then ChatYY = 0
                ChatY = ChatY + 15 + ChatYY
                ChatYY = ChatYY + 1
            End If
        Else
          ' 휠 Up
            If ChatY > 380 Then
                    If ChatYY > 0 Then ChatYY = 0
                ChatY = ChatY - 15 + ChatYY
                ChatYY = ChatYY - 1
            End If
        End If
  End If
End Function
Public Sub GetFile(Path As String, ArrayX() As StringType)
On Error GoTo Err_X

    Open Path For Input As #1
        Line Input #1, ArrayX(i).Title
        Line Input #1, ArrayX(i).Date
        Line Input #1, N_String
    ArrayX(i).Text = ""
Do
    Line Input #1, N_String
    ArrayX(i).Text = ArrayX(i).Text & N_String & vbNewLine
Loop
Err_X:
    Close #1
End Sub
Public Sub InputFile()
With Noti.InputF
.Path = N_Locate & "\Resource\Note"
.Pattern = "*.memo"
MemoXCnt = .ListCount - 1
    For i = 0 To .ListCount - 1
        GetFile .Path & "\" & .List(i), MemoX
    Next i
.Path = N_Locate & "\Resource\Remind"
.Pattern = "*.Remind"
RemindXCnt = .ListCount - 1
    For i = 0 To .ListCount - 1
        GetFile .Path & "\" & .List(i), RemindX
    Next i
End With
End Sub
Public Sub StartSet()
Dim hRgn As Long, hRgn2 As Long
'CreateObject("SAPI.SpVoice").speak "Hellow? My name is Cris"

S_State = True
If GetSetting(App.ProductName, "Cris", "Start", 1) Then
    NewStart = True
End If
SaveSetting App.ProductName, "Cris", "Start", 1
N_Locate = GetSetting(App.ProductName, "App", "Locate", "C:\Users\Maybe\AppData\Local\Cris")
    InputFile

ScreenHeight = PixV(Screen.Height)
ScreenWidth = PixV(Screen.Width)
If ScreenHeight < 600 Then Error_ 0
If ScreenWidth < 800 Then Error_ 0
If ScreenHeight > 1600 Then Error_ 3
If ScreenWidth > 2560 Then Error_ 4

'화면처리 시작---------------------------------------------------------------------------------------------------#
        hRgn = CreateRoundRectRgn(0, 0, ScreenHeight, 25, 10, 10)
        hRgn2 = CreateRoundRectRgn(0, 0, ScreenHeight - 5, 540, 25, 25)
        
                SetWindowRgn Noti.hwnd, hRgn, True
        DeleteObject hRgn
                SetWindowRgn Notifi.hwnd, hRgn2, True
        DeleteObject hRgn2

SetWindowPos Noti.hwnd, HWND_TOPMOST, 0, 0, 0, 0, TOPMOST_FLAGS
WindowTransparency Notifi.hwnd, byvalue, , 222
'화면처리----------------------------------------------------------------------------------------------------------!

With Noti
        .WindowState = 0
        .Show
        .Left = ((TwiV(ScreenWidth - ScreenHeight)) / 2)
        .Top = 0
        .DrawWidth = 3
        .Font = "나눔고딕"
        .FontSize = 12
        .Height = 375
        .Width = Screen.Height
End With
With Notifi
        .Show
        .Left = ((TwiV(ScreenWidth - ScreenHeight)) / 2) + 40
        .Top = TwiV(-540)
        .Height = TwiV(540)
        .Width = Screen.Height
        .DrawWidth = 3
        .Font = "나눔고딕"
        .FontSize = 12
        .Visible = False
        
        .ButtonSpace.Top = 60
        .ButtonSpace.Left = 15
        .ButtonSpace.Height = 424
        .ButtonSpace.Width = 64
        .ButtonSpace.BorderStyle = 0
        
        .RaySpace.Top = 85
        .RaySpace.Left = 100
        .RaySpace.Height = 425
        .RaySpace.Width = 165
        .RaySpace.BorderStyle = 0
        
        
        .Tbox.Left = 285
        .Tbox.Top = 110
        .Tbox.Font = "나눔고딕"
        .Tbox.Height = 415
        .Tbox.Width = ScreenHeight - .Tbox.Left - 30
        .Tbox.BorderStyle = fmBorderStyleNone
        .Tbox.Text = .Tbox.Tag
        
        .TTitle.Left = 265
        .TTitle.Top = 65
        .TTitle.Font = "나눔고딕"
        .TTitle.Height = 25
        .TTitle.Width = ScreenHeight - .Tbox.Left - 115
        .TTitle.BorderStyle = fmBorderStyleNone
        .TTitle.Text = .TTitle.Tag
        
        .SBox.Left = 35
        .SBox.Top = 15
        .SBox.Font = "나눔고딕"
        .SBox.Height = 25
        .SBox.Width = 125
        .SBox.Text = .SBox.Tag
        .SBox.Visible = False
End With

For i = 0 To 3
    iConLP(i).Enable = True
    iConLP(i).X = 15
    iConLP(i).Y = 60 + (120 * i)
Next i

        RedCnt = 1: GreenCnt = 2: BlueCnt = 3
        
        CurStack = 0
        N_State = False
        M_State = False
        
    APM = GetSetting(App.ProductName, "Set", "24Time", True): If Not APM Then Fset.TimeOp.Value = True
    SecondON = GetSetting(App.ProductName, "Set", "SecondON", False): Fset.TimeSp.Value = SecondON
    UserX.Enabled = GetSetting(App.ProductName, "User", "ON", False): Fset.Nuser.Value = UserX.Enabled
    If UserX.Enabled Then _
        UserX.Name = GetSetting(App.ProductName, "User", "Name", "사용자"): Fset.UserL.Caption = UserX.Name: _
        UserX.Gender = GetSetting(App.ProductName, "User", "Gender", True): _
        UserX.Height = Val(GetSetting(App.ProductName, "User", "Height", "175")): _
        UserX.Weight = Val(GetSetting(App.ProductName, "User", "Weight", "63")): _
        UserX.Years = Val(GetSetting(App.ProductName, "User", "Years", "19"))
        
        HomeString(0) = "크리스 둘러보기"
        HomeString(1) = "크리스 설정하기"
        HomeString(2) = "크리스 주요기능"
        HomeString(3) = "   더 알아보기   "
        HomeTitle(0) = "메인"
        HomeTitle(1) = "알림"
        HomeTitle(2) = "달력"
        HomeTitle(3) = "메모"
    
    RemindXT = "알림이 #remindCNT#개 있습니다."
    MessageCNT = 0
    MessageTextCnt = 0
    ChatLY = 430

If NewStart Then _
        fTalk.MessageTalk ChatLY, "처음뵙겠어요 전 크리스라고해요.", False: _
        fTalk.MessageTalk ChatLY, "전 이제부터 당신의 명령을 듣고 수행할꺼에요.", False: _
        fTalk.MessageTalk ChatLY, "설정에서 좀더 세밀한 설정을 할 수 있어요.", False: _
        fTalk.MessageTalk ChatLY, "제가 말을 잘 듣지 않는다면 jiun0623@naver.com 에게 연락해줘요,", False: _
        fTalk.MessageTalk ChatLY, "앞으로 잘 부탁드려요.", False

S_State = False
End Sub
