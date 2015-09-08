Attribute VB_Name = "Mbas"
Option Explicit
Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Const GWL_WNDPROC = (-4)
Public Const WM_MOUSEWHEEL = &H20A
Public gHW As Long, WScroll As Boolean
Dim PrevProc As Long
'`�ٻ�����
Private Declare Function CreateRoundRectRgn Lib "gdi32.dll" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function SetWindowRgn Lib "user32.dll" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private m_lpBordrPoints()   As POINTAPI
'`ȭ�� ��������
Public Declare Function GetTickCount Lib "kernel32" () As Long
'`�ð� �޾ƿ���
Public Declare Function GetCursorPos Lib "user32.dll" (ByRef lpPoint As POINTAPI) As Long
        Private Type POINTAPI
            X As Long
            Y As Long
        End Type
'`Ŀ�� �ν�
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
'`�� ������ȭ ����

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

'�������� Ÿ��

Public RedCntF As Integer, GreenCntF As Integer, BlueCntF As Integer, RedCnt As Integer, GreenCnt As Integer, BlueCnt As Integer '���� ��ȭ ����
Public ScreenHeight As Long, ScreenWidth As Long                'ȭ������ ����
Public iConLP(3) As IconType                                    '������ �Լ�
Public Cris As ManType, UserX As ManType, CrisMind As AImind    'ũ���� ��������
Public i As Integer, j As Integer, k As Integer, N_Integer As Integer, N_Long As Long, N_String As String, N_Locate As String
        '�Ϲ� ��� ���� (i,j�� for���� n_������ ������ �ӽ����������
Public Cur As POINTAPI, CurS As POINTAPI, CurStack As Long, CurDelay As Long
        'Ŀ�������� POINTAPI �� , Ŀ�� �ð����ذ� Ŀ�� �Է� ������
Public RemindXT As String, MemoX(500) As StringType, RemindX(500) As StringType, MemoXCnt As Integer, RemindXCnt As Integer
        '�˸� �迭�� �˸� ���� ������ �˸����� �迭
        '�޸� �迭�� �޸� ���� ������ �޸����� �迭
Public HomeString(5) As String, TboxKeyUp As Long, IndexMatch As Integer
Public M_State As Boolean, N_State As Boolean, T_State As Integer, S_State As Boolean, HookX As Boolean
        'M_,N_�� �������� �����ֱ����, T_�� �˸����� ȭ��ǥ�û���, S_�� ����â����,HookX�� �� �Ű���
Public HomeTitle(3) As String, NewStart As Boolean
        '���� �������� ���¸� ��Ÿ���ϴ�. NewStart�� ó�����������ƴ�������Ÿ���ϴ�.
Public APM As Boolean, SecondON As Boolean
        '������ ������ -APM 24�ð��������� -SecondON �ʴ��� ǥ��
Public ChatY As Long, ChatLY As Long, ChatYY As Long, ChatYYDelay As Integer
Public MessageCNT As Integer, MessageX(250) As MessageType, MessageTextCnt As Integer, MessageXtext(500) As MessageTextType
        'ä�û���� ��ȯ�մϴ�.
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
            MsgBox "�ּ� 800��600 �̻��� �ػ󵵰� �ʿ��մϴ�."
            End
        Case 1
            MsgBox "X,Y�� �ȼ��� Ʈ������ �����ʽ��ϴ�. �������ּ���."
        Case 2
            MsgBox "ȭ���� �ػ󵵰� �����Ǿ����ϴ�. �ٽ� �������ּ���."
        Case 3
            MsgBox "ȭ���� �ػ󵵰� �ʹ�Ů�ϴ�. �ʺ� 2560���� �ڵ������˴ϴ�."
        Case 4
            MsgBox "ȭ���� �ػ󵵰� �ʹ�Ů�ϴ�. ���̰� 1600���� �ڵ������˴ϴ�."
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
N_String = Format(Now, "H�� N��")
If SecondON Then N_String = N_String & Format(Now, " S��")
    If Not APM Then
        TimerCal = N_String: Exit Function
    Else
        For i = 1 To Len(N_String)
            If Mid(N_String, i, 1) = "��" Then N_Integer = Val(Left(N_String, i - 1)): Exit For
        Next i
            If N_Integer <= 12 Then
                TimerCal = "���� " & N_String: Exit Function
            Else
                TimerCal = "���� " & (N_Integer - 12) & Right(N_String, Len(N_String) - i + 1): Exit Function
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
          ' �� Down
            If ChatY < (ChatLY - 470) Then
                    If ChatYY < 0 Then ChatYY = 0
                ChatY = ChatY + 15 + ChatYY
                ChatYY = ChatYY + 1
            End If
        Else
          ' �� Up
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

'ȭ��ó�� ����---------------------------------------------------------------------------------------------------#
        hRgn = CreateRoundRectRgn(0, 0, ScreenHeight, 25, 10, 10)
        hRgn2 = CreateRoundRectRgn(0, 0, ScreenHeight - 5, 540, 25, 25)
        
                SetWindowRgn Noti.hwnd, hRgn, True
        DeleteObject hRgn
                SetWindowRgn Notifi.hwnd, hRgn2, True
        DeleteObject hRgn2

SetWindowPos Noti.hwnd, HWND_TOPMOST, 0, 0, 0, 0, TOPMOST_FLAGS
WindowTransparency Notifi.hwnd, byvalue, , 222
'ȭ��ó��----------------------------------------------------------------------------------------------------------!

With Noti
        .WindowState = 0
        .Show
        .Left = ((TwiV(ScreenWidth - ScreenHeight)) / 2)
        .Top = 0
        .DrawWidth = 3
        .Font = "�������"
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
        .Font = "�������"
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
        .Tbox.Font = "�������"
        .Tbox.Height = 415
        .Tbox.Width = ScreenHeight - .Tbox.Left - 30
        .Tbox.BorderStyle = fmBorderStyleNone
        .Tbox.Text = .Tbox.Tag
        
        .TTitle.Left = 265
        .TTitle.Top = 65
        .TTitle.Font = "�������"
        .TTitle.Height = 25
        .TTitle.Width = ScreenHeight - .Tbox.Left - 115
        .TTitle.BorderStyle = fmBorderStyleNone
        .TTitle.Text = .TTitle.Tag
        
        .SBox.Left = 35
        .SBox.Top = 15
        .SBox.Font = "�������"
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
        UserX.Name = GetSetting(App.ProductName, "User", "Name", "�����"): Fset.UserL.Caption = UserX.Name: _
        UserX.Gender = GetSetting(App.ProductName, "User", "Gender", True): _
        UserX.Height = Val(GetSetting(App.ProductName, "User", "Height", "175")): _
        UserX.Weight = Val(GetSetting(App.ProductName, "User", "Weight", "63")): _
        UserX.Years = Val(GetSetting(App.ProductName, "User", "Years", "19"))
        
        HomeString(0) = "ũ���� �ѷ�����"
        HomeString(1) = "ũ���� �����ϱ�"
        HomeString(2) = "ũ���� �ֿ���"
        HomeString(3) = "   �� �˾ƺ���   "
        HomeTitle(0) = "����"
        HomeTitle(1) = "�˸�"
        HomeTitle(2) = "�޷�"
        HomeTitle(3) = "�޸�"
    
    RemindXT = "�˸��� #remindCNT#�� �ֽ��ϴ�."
    MessageCNT = 0
    MessageTextCnt = 0
    ChatLY = 430

If NewStart Then _
        fTalk.MessageTalk ChatLY, "ó���˰ھ�� �� ũ��������ؿ�.", False: _
        fTalk.MessageTalk ChatLY, "�� �������� ����� ����� ��� �����Ҳ�����.", False: _
        fTalk.MessageTalk ChatLY, "�������� ���� ������ ������ �� �� �־��.", False: _
        fTalk.MessageTalk ChatLY, "���� ���� �� ���� �ʴ´ٸ� jiun0623@naver.com ���� ���������,", False: _
        fTalk.MessageTalk ChatLY, "������ �� ��Ź�����.", False

S_State = False
End Sub
