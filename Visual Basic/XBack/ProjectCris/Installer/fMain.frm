VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form fMain 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  '���� ����
   ClientHeight    =   6000
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   9000
   ControlBox      =   0   'False
   DrawWidth       =   3
   BeginProperty Font 
      Name            =   "���� ���"
      Size            =   9.75
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "fMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   400
   ScaleMode       =   3  '�ȼ�
   ScaleWidth      =   600
   StartUpPosition =   2  'ȭ�� ���
   Tag             =   "1"
   Begin MSComDlg.CommonDialog CDT 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DialogTitle     =   "��ġ �����ϱ�"
      InitDir         =   "c:\"
   End
   Begin VB.Timer Tx 
      Left            =   480
      Top             =   120
   End
End
Attribute VB_Name = "fMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function SetProcessWorkingSetSize Lib "kernel32" (ByVal hProcess As Long, ByVal dwMinimumWorkingSetSize As Long, ByVal dwMaximumWorkingSetSize As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
'~Unzip
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
'~CommonDialog
Private Const BIF_RETURNONLYFSDIRS = 1
Private Const BIF_DONTGOBELOWDOMAIN = 2
Private Const MAX_PATH = 260
        Private Declare Function SHBrowseForFolder Lib "shell32" (lpbi As BrowseInfo) As Long
        Private Declare Function SHGetPathFromIDList Lib "shell32" (ByVal pidList As Long, ByVal lpBuffer As String) As Long

    Private Type BrowseInfo
         hWndOwner      As Long
         pIDLRoot       As Long
         pszDisplayName As Long
         lpszTitle      As String
         ulFlags        As Long
         lpfnCallback   As Long
         lParam         As Long
         iImage         As Long
    End Type
'~�� ���İ�
Private Declare Function GetModuleHandle Lib "kernel32.dll" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, Y, ByVal cX As Long, ByVal cY As Long, ByVal wFlags As Long) As Long
        Private Enum TransType
            byColor
            byValue
        End Enum
        
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
'`�� ��ġ�̵�����, Drag Option-

Private Const HWND_TOPMOST = -1
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1
Private Const TOPMOST_FLAGS = SWP_NOMOVE Or SWP_NOSIZE
Private Const LWA_COLORKEY = &H1
Private Const LWA_ALPHA = &H2
Private Const WS_EX_LAYERED = &H80000
Private Const GWL_EXSTYLE = (-20)

Private Ver As String, MSG(4) As String, ShowM As Boolean, i As Integer
Private RedCntF As Integer, GreenCntF As Integer, BlueCntF As Integer, RedCnt As Integer, GreenCnt As Integer, BlueCnt As Integer '���� ��ȭ ����
Private Falpha As Long, State As Integer, InsOp(7) As Boolean, N_string As String, N_Locate As String, UserName_ As String
Private Sub CreateTransparentWindowStyle(lhWnd)
 On Error Resume Next
 
Dim Ret As Long

       Ret = GetWindowLong(lhWnd, GWL_EXSTYLE)
       Ret = Ret Or WS_EX_LAYERED
       SetWindowLong lhWnd, GWL_EXSTYLE, Ret
            
End Sub
Private Sub WindowTransparency(lhWnd&, TransparencyBy As TransType, _
                                      Optional Clr As Long, _
                                      Optional TransVal As Long)
On Error Resume Next

    Call CreateTransparentWindowStyle(lhWnd)
    
    If TransparencyBy = byColor Then
         SetLayeredWindowAttributes lhWnd, Clr, 100, LWA_COLORKEY
    ElseIf TransparencyBy = byValue Then
         SetLayeredWindowAttributes lhWnd, 100, TransVal, LWA_ALPHA
    End If
    
End Sub
Private Sub Form_Load()
SetProcessWorkingSetSize GetCurrentProcess(), -1&, -1&

        WindowTransparency fMain.hwnd, byValue, , 0
        
    StartSet
    Tx.Interval = 10
End Sub
Public Sub TextPrint(ByRef Fm, ByVal x As Long, ByVal Y As Long, ByVal TextIn As String, ByVal Color As Long, ByVal FontSize As Integer)
Dim FS As Integer
            If FontSize Then FS = Fm.FontSize: Fm.FontSize = FontSize:
            If Color Then Fm.ForeColor = Color
            TextOut Fm.hdc, x, Y, TextIn, LenB(StrConv(TextIn, vbFromUnicode))
            If FontSize Then Fm.FontSize = FS
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
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
On Error Resume Next
    If Button = 1 Then
        ReleaseCapture
        SendMessage hwnd, &HA1, 2, ByVal 0&
    End If
Select Case State
    Case 0
        If x > 190 And x < 400 And Y > 315 And Y < 360 Then State = 1
        If Y > 350 And x < 80 Then ShowMSG
        If x > 490 And Y > 350 Then ExitTemp: End
    Case 1
        If Y > 210 And Y < 235 Then InsOp(0) = ChangeOP(InsOp(0))
        If Y > 240 And Y < 265 Then InsOp(1) = ChangeOP(InsOp(1))
        If Y > 270 And Y < 295 Then InsOp(2) = ChangeOP(InsOp(2))
        If Y > 300 And Y < 325 Then InsOp(3) = ChangeOP(InsOp(3))
        If Y > 350 And x < 80 Then State = 0
        If Y > 350 And x > 520 Then State = 2
    Case 2
        If x > 540 And x < 570 And Y > 165 And Y < 185 Then OpenDialog
        If Y > 350 And x < 80 Then State = 1
        If Y > 350 And x > 520 Then State = 3
    Case 3
        If Y > 152 And Y < 177 Then InsOp(4) = ChangeOP(InsOp(4))
        If Y > 182 And Y < 207 Then InsOp(5) = ChangeOP(InsOp(5))
        If Y > 212 And Y < 237 Then InsOp(6) = ChangeOP(InsOp(6))
        If Y > 242 And Y < 267 Then InsOp(7) = ChangeOP(InsOp(7))
        If Y > 350 And x < 80 Then State = 2
        If Y > 350 And x > 520 Then
            Install_
            State = 4
            Tx_Timer
        End If
    Case 4
        If Y > 350 And x > 520 Then End
End Select
GoTo ef
Tx:
    'MsgBox "������Ұ� �����մϴ�. .ins�� .inf ������ �ٽ��ѹ� Ȯ���� �ּ���"
ef:
End Sub
Private Sub ExitTemp()
    Kill "c:\temp\version\Cris.inc"
    Kill "c:\temp\version\Cris.PDM"
    Kill "c:\temp\version\Word.Dat"
    RmDir "c:\temp\version"
    Kill "c:\temp\cris.ins"
    RmDir "c:\temp"
End Sub
Private Sub ShowMSG()
If ShowM Then ShowM = False: Exit Sub
If Not ShowM Then ShowM = True: Exit Sub
End Sub
Private Sub Install_()
On Error Resume Next
                SaveSetting "Cris", "App", "Install", False
    MkDir N_Locate & "\Cris"
    UnzipModule.Unzip "c:\temp\Cris.ins", N_Locate & "\Cris"
    If InsOp(4) Then _
        FileCopy N_Locate & "\Cris\Cris.exe", "C:\Users\May\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Cris.exe"
    If InsOp(5) Then _
        MkDir "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Cris": _
        FileCopy N_Locate & "\Cris\Cris.exe", "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Cris\Cris.exe": _
        FileCopy N_Locate & "\Cris\�о����.rtf", "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Cris\�о����.rtf"
    
    If InsOp(7) Then _
        MkDir N_Locate & "\Cris\SendMessage": _
        SaveSetting "Cris", "App", "SendMessage", True
    
    
    RmDir "c:\temp\version"
    Kill "c:\temp\cris.ins"
    RmDir "c:\temp"
    
                SaveSetting "Cris", "App", "Locate", N_Locate & "\Cris"
                SaveSetting "Cris", "App", "Install", True
    If InsOp(6) Then _
        Shell N_Locate & "\Cris\Cris.exe"
End Sub
Private Function ChangeOP(ByVal Index As Boolean)
    If Index Then ChangeOP = False
    If Not Index Then ChangeOP = True
End Function
Private Sub Tx_Timer()
Dim i As Integer
RandomColor
    fMain.Cls
    If Falpha < 250 Then
        Falpha = Falpha + (255 - Falpha) / 25 + 1
        WindowTransparency fMain.hwnd, byValue, , Falpha
    Else
    End If
        Line (20, 100)-(580, 100), vbBlack
Select Case State
    Case 0
        
        TextPrint fMain, 70, -10, "Cris Installer", RGB(RedCntF, GreenCntF, BlueCntF), 64
        TextPrint fMain, 370, 100, "MaybeStudio Present", RGB(150, 100, 133), 16
    If Not ShowM Then
        TextPrint fMain, 80, 150, "�ý��� �䱸���", RGB(0, 0, 1), 15
        TextPrint fMain, 100, 190, "1.0Ghz �̻��� CPU", RGB(0, 0, 3), 12
        TextPrint fMain, 100, 210, "256MB �̻��� RAM", RGB(0, 0, 3), 12
        TextPrint fMain, 100, 230, "5MB�̻��� HDD �Ǵ� SSD", RGB(0, 0, 3), 12
        TextPrint fMain, 100, 250, "800��600�̻��� �ػ�", RGB(0, 0, 3), 12
        TextPrint fMain, 100, 270, "4:3 �̻��� ��Ⱦ��", RGB(0, 0, 3), 12
        
        TextPrint fMain, 360, 150, "�ý��� ������", RGB(0, 0, 1), 15
        TextPrint fMain, 390, 190, "����ھ� �̻� CPU", RGB(0, 0, 1), 12
        TextPrint fMain, 390, 210, "1GB�̻��� RAM", RGB(0, 0, 1), 12
        TextPrint fMain, 390, 230, "HDD �Ǵ� SSD", RGB(0, 0, 1), 12
        TextPrint fMain, 390, 250, "1920��1080 �ػ�", RGB(0, 0, 1), 12
        TextPrint fMain, 390, 270, "16:9 Wide", RGB(0, 0, 1), 12
    Else
        TextPrint fMain, 60, 130, "���� : " & Ver, RGB(0, 0, 1), 15
            For i = 0 To 4
        TextPrint fMain, 70, 170 + (30 * i), MSG(i), RGB(0, 0, 3), 12
            Next i
    End If
        TextPrint fMain, 10, 375, "ũ���� ���� : " & Ver, RGB(50, 60, 70), 10
        TextPrint fMain, 10, 360, "�ν��緯 ���� : " & App.Major & "." & App.Minor & "." & App.Revision, RGB(50, 60, 70), 10
        TextPrint fMain, 200, 300, "��ġ�ϱ�", RGB(50, 60, 70), 32
        TextPrint fMain, 500, 350, "������", RGB(200, 0, 10), 20
    Case 1
        TextPrint fMain, 160, 5, "Cris Install", RGB(RedCntF, GreenCntF, BlueCntF), 48
        
        TextPrint fMain, 20, 100, "��ġ�� �׸��� �����ϼ���.", RGB(50, 70, 90), 20
            TextPrint fMain, 60, 170, "Cris SE               (�ʼ�)", RGB(50, 70, 90), 20
            TextPrint fMain, 60, 200, "Cris Plus             (�߰� ���)", RGB(50, 70, 90), 20
            TextPrint fMain, 60, 230, "Cris Talk             (��ȭ�� ���)", RGB(50, 70, 90), 20
            TextPrint fMain, 60, 260, "Cris MoD            (��ȭü ����)", RGB(50, 70, 90), 20
            TextPrint fMain, 60, 290, "Cris MoD Maker   (�����ڿ�)", RGB(50, 70, 90), 20
            
            TextPrint fMain, 30, 168 + (30 * i), "��", RGB(50, 5, 50), 20
                For i = 0 To 3
                    N_string = "��"
                    If InsOp(i) Then N_string = "��"
                    TextPrint fMain, 30, 198 + (30 * i), N_string, RGB(50, 5, 50), 20
                Next i
                
        TextPrint fMain, 20, 360, "�ڷ�", RGB(200, 90, 90), 16
        TextPrint fMain, 540, 360, "����", RGB(90, 90, 200), 16
    Case 2
        TextPrint fMain, 160, 5, "Cris Install", RGB(RedCntF, GreenCntF, BlueCntF), 48
        
        TextPrint fMain, 20, 100, "��ġ�� ��ġ�� Ȯ�����ֽʽÿ�.", RGB(50, 50, 50), 20
            N_string = "\Cris": If Len(N_Locate) > 33 Then N_string = "...\Cris": _
            TextPrint fMain, 40, 180, N_Locate & "\Cris", RGB(50, 50, 50), 8
        TextPrint fMain, 40, 150, Left(N_Locate, 33) & N_string, RGB(50, 50, 50), 15
        TextPrint fMain, 550, 150, "...", RGB(50, 50, 50), 16
        
        TextPrint fMain, 30, 200, "�⺻���=C:\Users\" & UserName_ & "\AppData\Local\Cris", RGB(50, 50, 50), 12
        TextPrint fMain, 30, 230, "�⺻��θ� �������� �ʴ°� ���� ����", RGB(50, 50, 50), 16
        TextPrint fMain, 60, 270, "1.�⺻��ο� ��ġ�ϸ� �����м��� ������ �� �ֽ��ϴ�.", RGB(50, 50, 50), 10
        TextPrint fMain, 60, 290, "2.�⺻��ο� ��ġ���������� ���߿� ��ġ�� ã�� ����ϴ�.", RGB(50, 50, 50), 10
        TextPrint fMain, 60, 310, "3.�⺻��ο� ��ġ���������� �ٸ� ���α׷��� �����ϱ� ����ϴ�.", RGB(50, 50, 50), 10
        
        TextPrint fMain, 20, 360, "�ڷ�", RGB(200, 90, 90), 16
        TextPrint fMain, 540, 360, "����", RGB(90, 90, 200), 16
    Case 3
        TextPrint fMain, 160, 5, "Cris Install", RGB(RedCntF, GreenCntF, BlueCntF), 48
        TextPrint fMain, 30, 100, "�ɼ� ����", RGB(50, 50, 50), 20
        TextPrint fMain, 50, 150, "������ ���۽� ũ���� ����", RGB(50, 50, 50), 16
        TextPrint fMain, 50, 180, "���۸޴��� ũ���� ���� �����", RGB(50, 50, 50), 16
        TextPrint fMain, 50, 210, "��ġ�� ��ģ�� ũ������ �����մϴ�.", RGB(50, 50, 50), 16
        TextPrint fMain, 50, 240, "ũ���� ��������� �����ڿ��� �����ϴ�.", RGB(50, 50, 50), 16
        TextPrint fMain, 60, 275, "ũ�����ܿ� �ٸ� �ڷ�� �������� �ʽ��ϴ�.", RGB(50, 50, 50), 12
        TextPrint fMain, 60, 290, "�����ڿ��� �������� ������ �����ڴ� �� ���� ���񽺸� �����մϴ�.", RGB(50, 50, 50), 12
        TextPrint fMain, 60, 305, "�����ڿ��� �������� ��������� ������ �����ϴ�.", RGB(50, 50, 50), 12
        TextPrint fMain, 70, 325, "���ð�, ����, ��ɾ� ���� ��, ����̿��", RGB(50, 50, 50), 8
        TextPrint fMain, 70, 337, "����ڼ���, ����ڿɼ�, ����� ���, ����� �̸�", RGB(50, 50, 50), 8
        
        
                For i = 0 To 3
                    N_string = "��"
                    If InsOp(i + 4) Then N_string = "��"
                    TextPrint fMain, 20, 146 + (30 * i), N_string, RGB(50, 5, 50), 20
                Next i
        
        TextPrint fMain, 20, 360, "�ڷ�", RGB(200, 90, 90), 16
        TextPrint fMain, 540, 360, "����", RGB(90, 90, 200), 16
    Case 4
        TextPrint fMain, 160, 5, "Cris Install", RGB(RedCntF, GreenCntF, BlueCntF), 48
        TextPrint fMain, 370, 100, "MaybeStudio Present", RGB(150, 100, 133), 16
        TextPrint fMain, 30, 140, "ũ������ ��ġ�� �Ϸ�Ǿ����ϴ�.", RGB(50, 50, 50), 20
        TextPrint fMain, 40, 190, "������ �����Ͽ� ũ������ ���� ������ ������ ȹ���� �� �ֽ��ϴ�.", RGB(50, 50, 50), 12
        TextPrint fMain, 50, 210, "http://jiun0623.blog.me/", RGB(50, 50, 50), 16
        TextPrint fMain, 40, 250, "������ ���ǻ��� ������ ���� ���� ���Ϸ� ������ �� �ֽ��ϴ�.", RGB(50, 50, 50), 12
        TextPrint fMain, 50, 270, "jiun0623@naver.com �Ǵ� maytryark@gmail.com", RGB(50, 50, 50), 16
        TextPrint fMain, 40, 330, "ũ������ ���� ���۱��� Maybe Studio �� �ֽ��ϴ�.", RGB(50, 50, 50), 16
        
        TextPrint fMain, 540, 360, "��ħ", RGB(90, 90, 200), 16
End Select
    
End Sub
Private Sub StartSet()
On Error Resume Next

    Show fcopy
        Falpha = 1
        
        InsOp(0) = True
        InsOp(1) = True
        InsOp(2) = True
        InsOp(3) = False
        InsOp(4) = True
        InsOp(5) = True
        InsOp(6) = True
        InsOp(7) = True
        ShowM = False
        UserName_ = Environ("username")
        RedCnt = 3
        GreenCnt = 2
        BlueCnt = 1
        State = 0
    Unload fcopy
        
        N_Locate = "C:\Users\" & UserName_ & "\AppData\Local"
    FileCopy App.Path & "\Cris.inf", "c:\windows\Uz.dll"
    MkDir "c:\temp"
        OpenInstall
Open "c:\temp\version\version.txt" For Input As #1
Line Input #1, Ver
For i = 0 To 4
    Line Input #1, MSG(i)
Next i
Close #1
    Kill "c:\temp\version\version.txt"
    
End Sub
Private Sub OpenInstall()
On Error GoTo TCK
    FileCopy App.Path & "\CrisInstall", "c:\temp\CrisInstall"
    Kill "c:\temp\crisinstall"
    UnzipModule.Unzip App.Path & "\CrisInstall", "C:\Temp": Exit Sub
TCK: '�ν��������̾��ų� ���ϸ��̴ٸ�
    With CDT
        .DialogTitle = "�ν��� ������ ã���ּ���"
        .CancelError = False
        .Filter = "ũ���� �ν�������(*)|*"
        .ShowOpen
            If Len(.FileName) = 0 Then
                Exit Sub
            End If
    UnzipModule.Unzip .FileName, "C:\Temp": Exit Sub
    End With
End Sub
Private Sub OpenDialog()
        Dim lpIDList As Long
        Dim sBuffer As String
        Dim tBrowseInfo As BrowseInfo

         With tBrowseInfo
            .hWndOwner = Me.hwnd
            .ulFlags = BIF_RETURNONLYFSDIRS + BIF_DONTGOBELOWDOMAIN
            .lpszTitle = "��ġ�� ������ �����ϼ���."
            
         End With

         lpIDList = SHBrowseForFolder(tBrowseInfo)

         If (lpIDList) Then
            sBuffer = Space(MAX_PATH)
            SHGetPathFromIDList lpIDList, sBuffer
            sBuffer = Left(sBuffer, InStr(sBuffer, vbNullChar) - 1)
            N_Locate = sBuffer
            If Right(N_Locate, 1) = "\" Then N_Locate = Left(N_Locate, Len(N_Locate) - 1)
         Else
         End If
End Sub
'~~----------------------------------------UnzipCode~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

