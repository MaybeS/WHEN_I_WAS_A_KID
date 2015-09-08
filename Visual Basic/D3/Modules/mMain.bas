Attribute VB_Name = "mMain"
Option Explicit
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long
Public D_User As String
Public D_Key As String
Public FHeight As Long, FWidth As Long
Public GridStep As Long, GridRGB As Long, BGRGB As Long
' 레지스트리 보안 옵션...
Const READ_CONTROL = &H20000
Const KEY_QUERY_VALUE = &H1
Const KEY_SET_VALUE = &H2
Const KEY_CREATE_SUB_KEY = &H4
Const KEY_ENUMERATE_SUB_KEYS = &H8
Const KEY_NOTIFY = &H10
Const KEY_CREATE_LINK = &H20
Const KEY_ALL_ACCESS = KEY_QUERY_VALUE + KEY_SET_VALUE + _
                       KEY_CREATE_SUB_KEY + KEY_ENUMERATE_SUB_KEYS + _
                       KEY_NOTIFY + KEY_CREATE_LINK + READ_CONTROL
' 레지스트리 키 ROOT 형식...
Const HKEY_LOCAL_MACHINE = &H80000002
Const ERROR_SUCCESS = 0
Const REG_SZ = 1                         ' Unicode null 종료 문자열
Const REG_DWORD = 4                      ' 32비트 숫자
Const gREGKEYSYSINFOLOC = "SOFTWARE\Microsoft\Shared Tools Location"
Const gREGVALSYSINFOLOC = "MSINFO"
Const gREGKEYSYSINFO = "SOFTWARE\Microsoft\Shared Tools\MSINFO"
Const gREGVALSYSINFO = "PATH"
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Const WM_NCLBUTTONDOWN As Long = &HA1
Private Const HTCAPTION As Long = 2
Private Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Public Function CreatKey(index As Integer)
Dim i As Integer
    For i = 1 To index
        Randomize
        CreatKey = CreatKey & Int(Rnd * 10)
    Next i
End Function
Public Sub SaveSettings()
    SaveSetting App.ProductName, "App", "SetaPlus", SetaPlus
    SaveSetting App.ProductName, "App", "LibVisible", fMain.V_lib.Checked
    SaveSetting App.ProductName, "App", "LValue", fMain.V_3DRader.Checked
    SaveSetting App.ProductName, "App", "GridStep", GridStep
    SaveSetting App.ProductName, "App", "CheckGrid", fPop.ChGrid.Value
    SaveSetting App.ProductName, "App", "GridColor", GridRGB
    SaveSetting App.ProductName, "App", "BGColor", BGRGB
End Sub
Public Function Setting()
Call fMain.Form_Resize
    '설정을 로드하고 셋팅합니다.
fMain.BG.Left = 0
fMain.BG.Top = 0
RotateR = False
RotateRN = False

    SetaPlus = val(GetSetting(App.ProductName, "App", "SetaPlus", 5))
    GridStep = val(GetSetting(App.ProductName, "App", "GridStep", 100))
                            fPop.GridText.Text = GridStep
    fPop.ChGrid.Value = val(GetSetting(App.ProductName, "App", "CheckGrid", 0))
                            Call fPop.VisibleCheck(fPop.ChGrid)
    GridRGB = val(GetSetting(App.ProductName, "App", "GridColor", RGB(0, 0, 0)))
    BGRGB = val(GetSetting(App.ProductName, "App", "BGColor", RGB(255, 255, 255)))
                            fMain.BG.BackColor = BGRGB
    fMain.V_lib.Checked = GetSetting(App.ProductName, "App", "LibVisible", True)
    
        If fMain.V_lib.Checked = True Then
            fMain.BarX.Visible = True
        Else
            fMain.BarX.Visible = False
        End If
    fMain.O_RotateRate.Caption = "회전값 : " & SetaPlus
    
fMain.Refresh
End Function
Public Function SetaSetting(ByVal index)
    SetaX(index) = 90
    SetaY(index) = 180
    SetaZ(index) = 180
    '각도값은 일반적으로 90,180,180입니다.
End Function
Public Sub MainLoop()
Dim i As Integer, j As Integer
fMain.Show
    Do
        GTCValue = GetTickCount + 1
            Do
                DoEvents
            Loop Until GTCValue < GetTickCount
            
                        Call ResizeForm
                        
                    For i = 1 To fMain.Plist.ListCount
                        If i = ActIndex Then
                        Else
                            Call DRAWPLG(i)
                        End If
                    Next i
                    If ActIndex <> 0 Then
                            If Mid(fMain.Plist.List(ActIndex - 1), 1, 4) = "(3D)" Then
                                For j = 1 + ActIndex To Listmap(ActIndex) + ActIndex
                                    Call DRAWPLG(j)
                                Next j
                            Else
                                Call DRAWPLG(ActIndex)
                            End If
                    End If
   Loop
End Sub
Public Sub ResizeForm()
                fMain.BG.Cls
                Call DrawGrid
                Call RotateCheck
                Call CheckFPS
End Sub
Public Sub RotateCheck()
    If RotateCNT = 0 Then
                    If RotateR = True Then
                        If RotateRN = True Then
                            If fMain.O_Rotate(0).Checked = True Then
                                Randomize
                                SetaX(ActIndex) = SetaX(ActIndex) + Rnd * SetaPlus
                            End If
                            If fMain.O_Rotate(1).Checked = True Then
                                Randomize
                                SetaY(ActIndex) = SetaY(ActIndex) + Rnd * SetaPlus
                            End If
                            If fMain.O_Rotate(2).Checked = True Then
                                Randomize
                                SetaZ(ActIndex) = SetaZ(ActIndex) + Rnd * SetaPlus
                            End If
                        Else
                            If fMain.O_Rotate(0).Checked = True Then
                                SetaX(ActIndex) = SetaX(ActIndex) + SetaPlus
                            End If
                            If fMain.O_Rotate(1).Checked = True Then
                                SetaY(ActIndex) = SetaY(ActIndex) + SetaPlus
                            End If
                            If fMain.O_Rotate(2).Checked = True Then
                                SetaZ(ActIndex) = SetaZ(ActIndex) + SetaPlus
                            End If
                        End If
                    End If
    Else
        If RotateCNT = 2 Then
            RotateCNT = -1
        End If
    End If
        RotateCNT = RotateCNT + 1
End Sub
Private Sub CheckFPS()
          If Format(Now) <> TTL Then
              TTL = Format(Now)
                If Frames <> 0 Then
                    fMain.Caption = "D3_Editor - " & ((Frames)) / fMain.Plist.ListCount & "fps"
                Else
                    fMain.Caption = "D3_Editor - 입력을 기다리는중..."
                End If
              fMain.Tag = fMain.Caption
              Frames = 0
          End If
End Sub
Public Sub ViewPop(index As Integer)
Dim i As Integer
    For i = 0 To 4
        fPop.xF(i).Top = -5000
        fPop.xF(i).Expanded = True
    Next i
    fPop.xF(index).Expanded = True
    fPop.xF(index).Height = 4752
    fPop.xF(index).Top = 0
    fPop.xF(index).Left = 0
    fPop.Show
End Sub
Public Sub ViewSys()
On Error GoTo SysInfoErr
Dim Rc As Long
Dim SysInfoPath As String
    If GetKeyValue(HKEY_LOCAL_MACHINE, gREGKEYSYSINFO, gREGVALSYSINFO, SysInfoPath) Then
    ElseIf GetKeyValue(HKEY_LOCAL_MACHINE, gREGKEYSYSINFOLOC, gREGVALSYSINFOLOC, SysInfoPath) Then
        If (Dir(SysInfoPath & "\MSINFO32.EXE") <> "") Then
            SysInfoPath = SysInfoPath & "\MSINFO32.EXE"
        Else
            GoTo SysInfoErr
        End If
    Else
        GoTo SysInfoErr
    End If
    
    Call Shell(SysInfoPath, vbNormalFocus)
    
    Exit Sub
SysInfoErr:
    MsgBox "이 버전의 Microsoft Windows 는 이 응용 프로그램을 지원하지 않습니다." & vbNewLine & _
                 "확인 후 다시시도 하십시오.", vbRed, 100, 20
End Sub
Public Function GetKeyValue(KeyRoot As Long, KeyName As String, SubKeyRef As String, ByRef KeyVal As String) As Boolean
On Error Resume Next '모든 오류 무시
    Dim i As Long                                           ' 루프 카운터
    Dim Rc As Long                                          ' 반환 코드
    Dim hKey As Long                                        ' 열려 있는 레지스트리 키 처리
    Dim hDepth As Long                                      '
    Dim KeyValType As Long                                  ' 레지스트리 키의 데이터 형식
    Dim tmpVal As String                                    ' 레지스트리 키 값을 임시로 저장
    Dim KeyValSize As Long                                  ' 레지스트리 키 변수의 크기
    '------------------------------------------------------------
    ' Open RegKey Under KeyRoot {HKEY_LOCAL_MACHINE...}
    '------------------------------------------------------------
    Rc = RegOpenKeyEx(KeyRoot, KeyName, 0, KEY_ALL_ACCESS, hKey) ' 레지스트리 키를 엽니다.
        If (Rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' 오류를 처리합니다...
    tmpVal = String$(1024, 0)                             ' 변수의 크기를 할당합니다.
    KeyValSize = 1024                                       ' 변수 크기를 표시합니다.
    '------------------------------------------------------------
    ' 레지스트리 키 값을 읽어옵니다...
    '------------------------------------------------------------
    Rc = RegQueryValueEx(hKey, SubKeyRef, 0, _
                         KeyValType, tmpVal, KeyValSize)    ' 키 값을 가져오고 작성합니다.
                        
        If (Rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' 오류를 처리합니다.
        If (Asc(Mid(tmpVal, KeyValSize, 1)) = 0) Then           ' Win95는 Null 종료 문자열을 추가합니다...
            tmpVal = Left(tmpVal, KeyValSize - 1)               ' Null을 찾았습니다. 문자열에서 추출합니다.
        Else                                                    ' WinNT는 Null 종료 문자열 추가하지 않습니다...
            tmpVal = Left(tmpVal, KeyValSize)                   ' Null을 찾지 못했습니다. 문자열에서만 추출합니다.
        End If
    '------------------------------------------------------------
    ' Determine Key Value Type For Conversion...
    '------------------------------------------------------------
    Select Case KeyValType                                  ' 데이터 형식을 검색합니다.
    Case REG_SZ                                             ' 문자열 레지스트리 키 데이터 형식
        KeyVal = tmpVal                                     ' 문자열 값을 복사합니다.
    Case REG_DWORD                                          ' 이진 단어 레지스트리 키 데이터 형식
        For i = Len(tmpVal) To 1 Step -1                    ' 각각 비트를 변환합니다.
            KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))   ' 값 문자를 문자별로 작성합니다.
        Next
            KeyVal = Format$("&h" + KeyVal)                     ' 이진 단어를 문자열로 변환합니다.
    End Select
    GetKeyValue = True                                      ' 성공을 반환합니다.
    Rc = RegCloseKey(hKey)                                  ' 레지스트리 키를 닫습니다.
    Exit Function                                               ' 종료합니다.
GetKeyError:                                                ' 오류가 발생하면 지웁니다...
    KeyVal = ""                                             ' 반환값을 빈 문자열로 설정합니다.
    GetKeyValue = False                                     ' 실패를 반환합니다.
    Rc = RegCloseKey(hKey)                                  ' 레지스트리 키를 닫습니다.
End Function

