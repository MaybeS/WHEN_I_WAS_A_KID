Attribute VB_Name = "S_bas"
Option Explicit

Public Enum TransType
    byColor
    byValue
End Enum

Public Enum Wheel_Sens
    WHEEL_UP
    WHEEL_DOWN
End Enum

Public Enum WIN_STATUS
    STA_MIN
    STA_NORMAL
End Enum

Public Type NOTIFYICONDATA
    cbSize As Long
    hWnd As Long
    uID As Long
    uFlags As Long
    uCallbackMessage As Long
    hIcon As Long
    szTip As String * 128
    dwState As Long
    dwStateMask As Long
    szInfo As String * 256
    uTimeout As Long
    szInfoTitle As String * 64
    dwInfoFlags As Long
End Type

Public Type POINTAPI
    X As Long
    Y As Long
End Type

Public Type FormSize
    Width As Long
    Height As Long
End Type

'`타입선언부

Public gHW As Long, WScroll As Boolean
Dim PrevProc As Long
'`휠사용관련

Public myData As NOTIFYICONDATA, glWinRet As Long, OrgWinRet As Long, Status As WIN_STATUS, MyForm As Form
Public Const TRAY_CALLBACK = (&H400 + 1001&)
Public Const WM_LBUTTONUP = &H202
Public Const WM_RBUTTONUP = &H205
Public Const WM_MOUSEWHEEL = &H20A
Public Const GWL_WNDPROC = -4
'`Tray 관련

Public Declare Function GetTickCount Lib "kernel32" () As Long
'`시간 받아오기

Public Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Public Declare Function ReleaseCapture Lib "user32" () As Long
'`폼 위치이동관련, Drag Option-

Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Public Declare Function CreatePolygonRgn Lib "gdi32" (lpPoint As POINTAPI, ByVal nCount As Long, ByVal nPolyFillMode As Long) As Long
Public Declare Function CreateRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Public Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
Public Declare Function CreateRoundRectRgn Lib "gdi32.dll" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Public Declare Function CreateEllipticRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Public Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Public Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
'`Region API와 관련함수

Public Declare Function GetCursorPos Lib "user32.dll" (ByRef lpPoint As POINTAPI) As Long
'`커서 인식 Has Type PointAPI

Public Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
'`키 후킹 관련

Public Declare Function GetModuleHandle Lib "kernel32.dll" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Public Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hWnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, Y, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function Shell_NotifyIcon Lib "shell32.dll" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Long
'`폼 반투명화 관련 SetWindowLong
Dim PointLucid(5) As POINTAPI
Public Sub CreateTransparentWindowStyle(lhWnd)
On Error Resume Next
Dim Ret As Long
       Ret = GetWindowLong(lhWnd, -20)
       Ret = Ret Or &H80000
       SetWindowLong lhWnd, -20, Ret
       
'폼의 반투명화와 관련되었습니다.
End Sub
Public Sub WindowTransparency(lhWnd&, TransparencyBy As TransType, Optional clr As Long, Optional TransVal As Long)
On Error Resume Next
    Call CreateTransparentWindowStyle(lhWnd)
    
    If TransparencyBy = byColor Then
         SetLayeredWindowAttributes lhWnd, clr, 100, &H1
    ElseIf TransparencyBy = byValue Then
         SetLayeredWindowAttributes lhWnd, 100, TransVal, &H2
    End If
    
'폼의 반투명화와 관련되어있습니다.
End Sub
Public Function CallbackMsgs(ByVal wHwnd As Long, ByVal wMsg As Long, ByVal wp_id As Long, ByVal lp_id As Long) As Long
On Error Resume Next

    If wMsg = TRAY_CALLBACK Then
        With MyForm
        
            Select Case CLng(lp_id)
                Case WM_RBUTTONUP
                    .PopupMenu .mn_Tray
            End Select
            
        End With
    End If
    
    CallbackMsgs = CallWindowProc(glWinRet, wHwnd, wMsg, wp_id, lp_id)

'Tray설정과 관련있습니다. Tray에서 출력되는 메세지의 Adress값을 반환합니다.
End Function
Public Function ShowTip(ByVal TipTitle As String, ByVal TipContent As String, TipIco As Integer)

With myData
    .szInfoTitle = TipTitle & vbNullChar
    .szInfo = TipContent & vbNullChar
    .dwInfoFlags = TipIco
End With

    Shell_NotifyIcon &H1, myData
    
'Tray상태에서 Tip을 보여주는 함수입니다.
End Function
Public Function CreatTray(ByRef TheForm As Form, TipMove As String, TipTitle As String, TipContent As String, TipIco As Long)
Set MyForm = TheForm
    OrgWinRet = GetWindowLong(MyForm.hWnd, GWL_WNDPROC)

With myData
    .cbSize = Len(myData)
    .hWnd = MyForm.hWnd
    .uID = vbNull
    .uFlags = &H2 Or &H4 Or &H10 Or &H1
    .uCallbackMessage = TRAY_CALLBACK
    .hIcon = MyForm.Icon
    .szTip = TipMove & vbNullChar
    .dwState = 0
    .dwStateMask = 0
    .szInfoTitle = TipTitle & vbNullChar
    .szInfo = TipContent & vbNullChar
    .dwInfoFlags = TipIco
    .uTimeout = 10000
End With

    Shell_NotifyIcon &H0, myData
    glWinRet = SetWindowLong(MyForm.hWnd, GWL_WNDPROC, AddressOf CallbackMsgs)

'Tray상태로 만듭니다.
End Function
Public Function UnloadTray()
    Shell_NotifyIcon &H2, myData
    SetWindowLong MyForm.hWnd, GWL_WNDPROC, OrgWinRet

'만들어진 Tray를 삭제합니다.
End Function
Public Function CreateHexRgn(ByVal X As Integer, ByVal Y As Integer, ByVal Size As Integer)
Dim Hexpoint(5) As POINTAPI

Hexpoint(0).X = X + ((3 ^ (1 / 2) * Size) / 2)
Hexpoint(0).Y = Y + 0
Hexpoint(1).X = X + ((3 ^ (1 / 2)) * Size)
Hexpoint(1).Y = Y + (Size / 2)
Hexpoint(2).X = X + ((3 ^ (1 / 2)) * Size)
Hexpoint(2).Y = Y + ((3 * Size) / 2)
Hexpoint(3).X = X + ((3 ^ (1 / 2) * Size) / 2)
Hexpoint(3).Y = Y + ((4 * Size) / 2)
Hexpoint(4).X = X + 0
Hexpoint(4).Y = Y + ((3 * Size) / 2)
Hexpoint(5).X = X + 0
Hexpoint(5).Y = Y + (Size / 2)
'육각형을 그리는 정보입니다.

    CreateHexRgn = CreatePolygonRgn(Hexpoint(0), 6, 1)
    
'CreateHexRgn은 육각형의 Region을 반환합니다. CreatePolygonRgn API로 제작되었습니다.
End Function
Public Function CreateSAORgn(ByVal TriangleY As Integer, ByVal Width As Integer, ByVal Height As Integer)
Dim SAOpoint(6) As POINTAPI
Dim RgnX As Long, RgnA As Long, RgnB As Long, RgnC As Long, PolygonRgn As Long, EllipRgn As Long
    
SAOpoint(0).X = 40
SAOpoint(0).Y = 0
SAOpoint(1).X = 40
SAOpoint(1).Y = TriangleY
SAOpoint(2).X = 14
SAOpoint(2).Y = TriangleY + 26
SAOpoint(3).X = 40
SAOpoint(3).Y = TriangleY + 52
SAOpoint(4).X = 40
SAOpoint(4).Y = Height
SAOpoint(5).X = 43
SAOpoint(5).Y = Height
SAOpoint(6).X = 43
SAOpoint(6).Y = 0
    
    RgnX = CreateRectRgn(0, 0, 0, 0)
    RgnA = CreateRectRgn(50, 0, Width, Height)
    RgnB = CreateRectRgn(0, 0, 0, 0)
    RgnC = CreateRectRgn(Width, 7, Width + 5, 7 + F_Sub.TopBar.Height)

    PolygonRgn = CreatePolygonRgn(SAOpoint(0), 7, 1)
    EllipRgn = CreateEllipticRgn(28, TriangleY + 22, 38, TriangleY + 32)
    
    CombineRgn RgnX, PolygonRgn, EllipRgn, 4
    
SAOpoint(0).X = 50
SAOpoint(0).Y = 7
SAOpoint(1).X = 45
SAOpoint(1).Y = 12
SAOpoint(2).X = 45
SAOpoint(2).Y = 44
SAOpoint(3).X = 50
SAOpoint(3).Y = 49

    DeleteObject PolygonRgn
    DeleteObject EllipRgn
    
    PolygonRgn = CreatePolygonRgn(SAOpoint(0), 4, 1)
    
    CombineRgn RgnX, PolygonRgn, RgnX, 2
    CombineRgn RgnB, RgnA, RgnC, 2
    CombineRgn RgnB, RgnX, RgnB, 2
    
    DeleteObject RgnX
    DeleteObject RgnA
    DeleteObject RgnC
    DeleteObject PolygonRgn
    
        CreateSAORgn = RgnB
    
'CreateSAORgn은 SAO 틀을 반환합니다.  CreatePolygonRgn API로 제작되었습니다.
End Function
Public Function CreateLucidRgn(ByVal Height As Long, ByVal Width As Long)
Dim RgnX As Long, RectRgn As Long, PolygonRgn As Long

PointLucid(0).X = 15
PointLucid(0).Y = 0
PointLucid(1).X = 0
PointLucid(1).Y = 15
PointLucid(2).X = 0
PointLucid(2).Y = Height
PointLucid(3).X = 30
PointLucid(3).Y = Height
PointLucid(4).X = 30
PointLucid(4).Y = 0

    RgnX = CreateRectRgn(0, 0, 0, 0)
    PolygonRgn = CreatePolygonRgn(PointLucid(0), 5, 1)
    RectRgn = CreateRectRgn(35, 0, Width, Height)
    
    CombineRgn RgnX, RectRgn, PolygonRgn, 2
    
    CreateLucidRgn = RgnX
    
    DeleteObject PolygonRgn
    DeleteObject RectRgn

End Function
Public Function SMove(ByVal X1 As Long, X2 As Long, Slash As Integer)

    If X1 = X2 Then SMove = X1 Else _
        SMove = X1 + ((X2 - X1) / Abs(X2 - X1)) + ((X2 - X1) / Slash)

'X1부터 X2까지 Slash만큼의 비율로 움직입니다.
'여러번 호출하여 목적지까지 움직일 수 있습니다.
End Function
Public Function Distance(ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long)

    Distance = ((X2 - X1) ^ 2 + (Y2 - Y1) ^ 2) ^ (1 / 2)
    
'해당 함수는 (x1,y1)-(x2,y2)사이의 거리를 반환합니다.
End Function
Public Function RealValue(ByVal Max As Long, Min As Long, value As Long)

    If value > Max Then
        
        RealValue = Max
        
    ElseIf value < Min Then
    
        RealValue = Min
    
    Else
    
        RealValue = value
    
    End If
    
'해당함수는 Max 와 Min 사이의값만 반환합니다. 값이 초과시에 Max나 Min으로 맞춰집니다.
End Function
Public Function BooleanValue(ByVal value As Boolean)

    If value Then BooleanValue = 1 Else BooleanValue = 0

End Function
Public Function ChangeBoolean(ByVal value As Boolean)
    
    If value Then ChangeBoolean = False Else ChangeBoolean = True
    
End Function
Public Sub PushTextArray()
Dim i As Integer

    For i = 499 To 0 Step -1
    
        MessageXtext(i + 1) = MessageXtext(i)
        
    Next i
End Sub
Public Sub PushMessageArray()
Dim i As Integer

    For i = 249 To 0 Step -1
    
        MessageX(i + 1) = MessageX(i)
        
    Next i
End Sub
Public Sub MessageTalk(ByVal Y As Integer, ByVal Text As String, ByVal Who As Boolean)
Dim TextLine As Long, TextLen As Long, StrLen As Long, Whois As Integer

If MessageCNT > 250 Then

    SaveLog
    PushMessageArray
    MessageCNT = 250
    
End If

If MessageTextCnt > 500 Then

    SaveLog
    PushTextArray
    MessageTextCnt = 500
    
End If
            
TextLine = 0
Whois = ((Abs(Int(Who)) + 1) Mod 2)
MessageX(MessageCNT).Text = Left$(Who, 1) & F_Sub.UserText.Text
            
CheckStrAgain:
    TextLen = GetStringLen(Text, 10)
    
        If TextLen > (F_Sub.SubBox(0).Width - 50) Then
        
            StrLen = StringCut(Text, (F_Sub.SubBox(0).Width - 45), 10)
                MessageXtext(MessageTextCnt).Text = Left$(Text, StrLen)
                MessageXtext(MessageTextCnt).X = 30
                MessageXtext(MessageTextCnt).Y = Y + TextLine * 20 - 100
                MessageXtext(MessageTextCnt).index = MessageCNT
                MessageTextCnt = MessageTextCnt + 1
                
            Text = Right$(Text, Len(Text) - StrLen)
            TextLine = TextLine + 1
            GoTo CheckStrAgain:
            
        Else
        
            MessageXtext(MessageTextCnt).Text = Text
            MessageXtext(MessageTextCnt).X = (F_Sub.SubBox(0).Width - 20) - TextLen * ((Whois + 1) Mod 2) - (F_Sub.SubBox(0).Width - 45) * Whois
            MessageXtext(MessageTextCnt).Y = Y + TextLine * 20 - 100
            MessageXtext(MessageTextCnt).index = MessageCNT
            MessageTextCnt = MessageTextCnt + 1
            
        End If
        
    If TextLine Then
    
        MessageX(MessageCNT).X = 20
        MessageX(MessageCNT).Y = Y - 7 - 100
        MessageX(MessageCNT).Width = (F_Sub.SubBox(0).Width - 20)
        MessageX(MessageCNT).Height = (TextLine + 1) * 20 + 23
        MessageX(MessageCNT).Who = Who
            ChatLY = ChatLY + (TextLine + 1) * 20 + 23
            
    Else
    
        MessageX(MessageCNT).X = (F_Sub.SubBox(0).Width - 25) - TextLen * ((Whois + 1) Mod 2) - (F_Sub.SubBox(0).Width - 45) * Whois
        MessageX(MessageCNT).Y = Y - 7 - 100
        MessageX(MessageCNT).Width = (TextLen + 25)
        MessageX(MessageCNT).Height = 43
        MessageX(MessageCNT).Who = Who
            ChatLY = ChatLY + 40
            
    End If
    
    MessageCNT = MessageCNT + 1

    If ChatLY > (F_Sub.SubBox(0).Height + 60) Or ChatY < 0 Then ChatY = ChatLY - (F_Sub.SubBox(0).Height + 60)
    
End Sub
Public Function GetStringLen(ByVal index As String, ByVal Size As Integer) As Integer
' 폰트크기에대한 문자열의 실제 픽셀 크기를 구합니다. textbox 기준
        If Size Then
            F_Main.Text_null.FontSize = Size
        Else
            F_Main.Text_null.FontSize = F_Main.FontSize
        End If
        
        F_Main.Text_null.Caption = Replace(index, vbNewLine, "  ")
        GetStringLen = F_Main.Text_null.Width
        
End Function
Public Function GetStringHeight(ByVal index As String, ByVal Size As Integer) As Integer
'폰트크기에대한 문자열의 실제 픽셀 크기를 구합니다. textbox기준
        GetStringLen index, Size
        GetStringHeight = F_Main.Text_null.Height
        
End Function
Public Function StringCut(ByVal Str As String, ByVal Width As Integer, ByVal Size As Integer)
'해당문자열을 잘라줍니다. str, 을 width에 기반해 size로
Dim i As Integer

    For i = 0 To Len(Str)
    
        If GetStringLen(Str, Size) < Width Then: StringCut = Len(Str): Exit Function
        
        If GetStringLen(Left$(Str, i + 1), Size) > Width Then
        
            StringCut = i
            Exit Function
            
        End If
        
    Next i
    
End Function
Public Function GetLanInf(ByVal Key As String)
Dim i As Integer, KeyArray() As String, Nstr As String
'Key값에 해당하는 현재설정언어를 불러옵니다.

If InStr(Key, "+") = 0 Then
    
    If Left$(Key, 1) = """" Then GetLanInf = Right$(Key, Len(Key) - 1): Exit Function
    
    For i = 1 To UBound(Lan_Custom(0).Key)
    
        If Lan_Custom(0).Key(i) = Key Then GetLanInf = Lan_Custom(NowLan).Tey(i): Exit Function
        
    Next i
    
    GetLanInf = Key: Exit Function
    
Else
    
    KeyArray = Split(Key, "+")
    
    For i = 0 To UBound(KeyArray)
        
        Nstr = Nstr & " " & (GetLanInf(Replace(KeyArray(i), "+", " ")))
        
    Next i
        
        GetLanInf = Nstr
        
End If
    
End Function
Public Function SaveFileEX(ByVal Locate As String, ByVal SaveString As String)
On Error Resume Next

    Dim Fs As String
    Open Locate For Output As #1
        Print #1, SaveString
    Close #1

End Function
Public Function LoadFileEX(ByVal Locate As String)
On Error Resume Next

    Dim Fs As String
    Open Locate For Binary As #1
        Fs = Space(LOF(1))
        Get 1, , Fs
        LoadFileEX = Fs
    Close #1
        
End Function
Public Function GetID()
On Error Resume Next
Dim Cnt As Integer, i As Integer, NullText As String, Dcnt As Integer

    Dcnt = 0
    Cnt = GetSetting("Ayou", "ID", "Cnt", 0)

    For i = 0 To Val(Cnt) - 1
        
        NullText = GetSetting("Ayou", "ID", i, "")
            If NullText = "" Then
                Dcnt = Dcnt + 1
                GoTo EndOfFor
            Else
                IDArray(i).ID = NullText
            End If
        IDArray(i).PW = GetSetting("Ayou", "PW", IDArray(i).ID, 0)
        F_Main.List_ID.AddItem IDArray(i).ID, i - Dcnt
        
            If F_Main.List_ID.Height < 150 Then
            
                F_Main.List_ID.Height = F_Main.List_ID.Height + 40
                F_Main.List_ID.Top = F_Main.List_ID.Top - 21
                
            End If
EndOfFor:
    Next i
    
    'Cnt = Cnt - Dcnt
    GetID = Cnt
    
End Function
Public Sub Hook(hWnd As Long)

    gHW = hWnd
    PrevProc = SetWindowLong(hWnd, GWL_WNDPROC, AddressOf WindowProc)
    
End Sub
Public Sub UnHook()

    SetWindowLong gHW, GWL_WNDPROC, PrevProc
    
End Sub
Public Function WindowProc(ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    WindowProc = CallWindowProc(PrevProc, hWnd, uMsg, wParam, lParam)
    
    If uMsg = WM_MOUSEWHEEL Then
    
        If wParam < 0 Then
          ' 휠 Down
            
                If ChatYY < 0 Then ChatYY = 0
                
            ChatYY = ChatYY + 1
            ChatY = ChatY + 10 + ChatYY / 2
        
        Else
          ' 휠 Up
            If ChatLY > 360 Then
                
                    If ChatYY > 0 Then ChatYY = 0
                    
                ChatYY = ChatYY - 1
                ChatY = ChatY - 10 + ChatYY / 2
            
            End If
            
        End If
        
  End If
  
End Function
Public Sub GetRGB(R As Long, G As Long, b As Long, Color As Long)
Dim N_Long As Long

    TranslateColor Color, 0, N_Long
    R = (N_Long And &HFF&)
    G = (N_Long And &HFF00&) \ &H100&
    b = (N_Long And &HFF0000) \ &H10000
    
'10진수 Long형 색상값에서 각각의 R,G,B값을 뽑아냅니다.
End Sub
Public Sub CalendarSet()
Dim Month1 As String, i As Integer, j As Integer

    Month1 = Format$(Now, "YYYY-MM-1")
    j = Weekday(Month1)
    

End Sub
Public Function TodayX()
Dim Week

End Function
