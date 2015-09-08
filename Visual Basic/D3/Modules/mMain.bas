Attribute VB_Name = "mMain"
Option Explicit
Private Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long
Public D_User As String
Public D_Key As String
Public FHeight As Long, FWidth As Long
Public GridStep As Long, GridRGB As Long, BGRGB As Long
' ������Ʈ�� ���� �ɼ�...
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
' ������Ʈ�� Ű ROOT ����...
Const HKEY_LOCAL_MACHINE = &H80000002
Const ERROR_SUCCESS = 0
Const REG_SZ = 1                         ' Unicode null ���� ���ڿ�
Const REG_DWORD = 4                      ' 32��Ʈ ����
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
    '������ �ε��ϰ� �����մϴ�.
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
    fMain.O_RotateRate.Caption = "ȸ���� : " & SetaPlus
    
fMain.Refresh
End Function
Public Function SetaSetting(ByVal index)
    SetaX(index) = 90
    SetaY(index) = 180
    SetaZ(index) = 180
    '�������� �Ϲ������� 90,180,180�Դϴ�.
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
                    fMain.Caption = "D3_Editor - �Է��� ��ٸ�����..."
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
    MsgBox "�� ������ Microsoft Windows �� �� ���� ���α׷��� �������� �ʽ��ϴ�." & vbNewLine & _
                 "Ȯ�� �� �ٽýõ� �Ͻʽÿ�.", vbRed, 100, 20
End Sub
Public Function GetKeyValue(KeyRoot As Long, KeyName As String, SubKeyRef As String, ByRef KeyVal As String) As Boolean
On Error Resume Next '��� ���� ����
    Dim i As Long                                           ' ���� ī����
    Dim Rc As Long                                          ' ��ȯ �ڵ�
    Dim hKey As Long                                        ' ���� �ִ� ������Ʈ�� Ű ó��
    Dim hDepth As Long                                      '
    Dim KeyValType As Long                                  ' ������Ʈ�� Ű�� ������ ����
    Dim tmpVal As String                                    ' ������Ʈ�� Ű ���� �ӽ÷� ����
    Dim KeyValSize As Long                                  ' ������Ʈ�� Ű ������ ũ��
    '------------------------------------------------------------
    ' Open RegKey Under KeyRoot {HKEY_LOCAL_MACHINE...}
    '------------------------------------------------------------
    Rc = RegOpenKeyEx(KeyRoot, KeyName, 0, KEY_ALL_ACCESS, hKey) ' ������Ʈ�� Ű�� ���ϴ�.
        If (Rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' ������ ó���մϴ�...
    tmpVal = String$(1024, 0)                             ' ������ ũ�⸦ �Ҵ��մϴ�.
    KeyValSize = 1024                                       ' ���� ũ�⸦ ǥ���մϴ�.
    '------------------------------------------------------------
    ' ������Ʈ�� Ű ���� �о�ɴϴ�...
    '------------------------------------------------------------
    Rc = RegQueryValueEx(hKey, SubKeyRef, 0, _
                         KeyValType, tmpVal, KeyValSize)    ' Ű ���� �������� �ۼ��մϴ�.
                        
        If (Rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' ������ ó���մϴ�.
        If (Asc(Mid(tmpVal, KeyValSize, 1)) = 0) Then           ' Win95�� Null ���� ���ڿ��� �߰��մϴ�...
            tmpVal = Left(tmpVal, KeyValSize - 1)               ' Null�� ã�ҽ��ϴ�. ���ڿ����� �����մϴ�.
        Else                                                    ' WinNT�� Null ���� ���ڿ� �߰����� �ʽ��ϴ�...
            tmpVal = Left(tmpVal, KeyValSize)                   ' Null�� ã�� ���߽��ϴ�. ���ڿ������� �����մϴ�.
        End If
    '------------------------------------------------------------
    ' Determine Key Value Type For Conversion...
    '------------------------------------------------------------
    Select Case KeyValType                                  ' ������ ������ �˻��մϴ�.
    Case REG_SZ                                             ' ���ڿ� ������Ʈ�� Ű ������ ����
        KeyVal = tmpVal                                     ' ���ڿ� ���� �����մϴ�.
    Case REG_DWORD                                          ' ���� �ܾ� ������Ʈ�� Ű ������ ����
        For i = Len(tmpVal) To 1 Step -1                    ' ���� ��Ʈ�� ��ȯ�մϴ�.
            KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))   ' �� ���ڸ� ���ں��� �ۼ��մϴ�.
        Next
            KeyVal = Format$("&h" + KeyVal)                     ' ���� �ܾ ���ڿ��� ��ȯ�մϴ�.
    End Select
    GetKeyValue = True                                      ' ������ ��ȯ�մϴ�.
    Rc = RegCloseKey(hKey)                                  ' ������Ʈ�� Ű�� �ݽ��ϴ�.
    Exit Function                                               ' �����մϴ�.
GetKeyError:                                                ' ������ �߻��ϸ� ����ϴ�...
    KeyVal = ""                                             ' ��ȯ���� �� ���ڿ��� �����մϴ�.
    GetKeyValue = False                                     ' ���и� ��ȯ�մϴ�.
    Rc = RegCloseKey(hKey)                                  ' ������Ʈ�� Ű�� �ݽ��ϴ�.
End Function

