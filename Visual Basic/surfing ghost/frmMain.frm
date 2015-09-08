VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  '단일 고정
   Caption         =   "서핑고스트(SurfingGhost)"
   ClientHeight    =   2295
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3990
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2295
   ScaleWidth      =   3990
   StartUpPosition =   2  '화면 가운데
   Begin VB.CommandButton cmdProxyOff 
      Caption         =   "해제"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3240
      TabIndex        =   4
      Top             =   1800
      Width           =   615
   End
   Begin VB.CommandButton cmdProxyOn 
      Caption         =   "적용"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2640
      TabIndex        =   3
      Top             =   1800
      Width           =   615
   End
   Begin VB.Frame Frame1 
      Caption         =   "프록시 찾기"
      Height          =   1575
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   3735
      Begin VB.CommandButton cmdSearch 
         Caption         =   "검색"
         Height          =   375
         Left            =   3000
         TabIndex        =   2
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cbCountry 
         Height          =   300
         Left            =   1440
         Style           =   2  '드롭다운 목록
         TabIndex        =   0
         Top             =   300
         Width           =   2175
      End
      Begin VB.ComboBox cbProxyServer 
         Height          =   300
         Left            =   1440
         Style           =   2  '드롭다운 목록
         TabIndex        =   1
         Top             =   660
         Width           =   2175
      End
      Begin VB.Label lblStatus 
         AutoSize        =   -1  'True
         BackStyle       =   0  '투명
         Height          =   180
         Left            =   120
         TabIndex        =   8
         Top             =   1320
         Width           =   60
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  '투명
         Caption         =   "우회할 프록시 :"
         Height          =   180
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   1260
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  '투명
         Caption         =   "국적선택 :"
         Height          =   180
         Left            =   540
         TabIndex        =   6
         Top             =   360
         Width           =   840
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long         ' Note that if you declare the lpData parameter as String, you must pass it By Value.
Const HKEY_CURRENT_USER = &H80000001
Const REG_SZ = 1                         ' Unicode nul terminated string
Const REG_DWORD = 4                      ' 32-bit number

Private Declare Function InternetSetOption Lib "wininet.dll" Alias "InternetSetOptionA" (ByVal hInternet As Long, ByVal lOption As Long, ByRef sBuffer As Any, ByVal lBufferLength As Long) As Integer
Const INTERNET_OPTION_SETTINGS_CHANGED As Long = 39
Const INTERNET_OPTION_REFRESH As Long = 37

Dim WinHttp As New WinHttpRequest
Dim Value() As String

Function ProxySetting(ByVal ProxyServer As String, ByVal ProxyEnable As Boolean)
    Dim ret As Long
    
    RegCreateKey HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Internet Settings", ret
    RegSetValueEx ret, "ProxyServer", 0, REG_SZ, ByVal ProxyServer, Len(ProxyServer)
    
    If ProxyEnable = True Then
        RegSetValueEx ret, "ProxyEnable", 0, REG_DWORD, Abs(CLng(ProxyEnable)), 0
    Else
        RegSetValueEx ret, "ProxyEnable", 0, REG_DWORD, Abs(CLng(ProxyEnable)), 5
    End If

    Call InternetSetOption(0, INTERNET_OPTION_SETTINGS_CHANGED, 0, 0)
    Call InternetSetOption(0, INTERNET_OPTION_REFRESH, 0, 0)
End Function

Private Sub cmdProxyOff_Click()
    cbCountry.Enabled = Not cbCountry.Enabled
    cbProxyServer.Enabled = Not cbProxyServer.Enabled
    cmdSearch.Enabled = Not cmdSearch.Enabled

    cmdProxyOn.Enabled = Not cmdProxyOn.Enabled
    cmdProxyOff.Enabled = Not cmdProxyOff.Enabled
    Call ProxySetting("127.0.0.1:80", False)
End Sub

Private Sub cmdProxyOn_Click()
    cbCountry.Enabled = Not cbCountry.Enabled
    cbProxyServer.Enabled = Not cbProxyServer.Enabled
    cmdSearch.Enabled = Not cmdSearch.Enabled

    cmdProxyOn.Enabled = Not cmdProxyOn.Enabled
    cmdProxyOff.Enabled = Not cmdProxyOff.Enabled
    Call ProxySetting(cbProxyServer, True)
End Sub

Private Sub cmdSearch_Click()
    Dim Temp() As String
    Dim ProxyServer As String
    
    cbProxyServer.Clear
    cbCountry.Enabled = Not cbCountry.Enabled
    cbProxyServer.Enabled = Not cbProxyServer.Enabled
    cmdSearch.Enabled = Not cmdSearch.Enabled
    lblStatus.Caption = "프록시 서버를 찾고있습니다."

    WinHttp.Open "GET", "http://www.xroxy.com/proxylist.php?country=" & Value(cbCountry.ListIndex + 1), True
    WinHttp.Send
    WinHttp.WaitForResponse
    
    Temp = Split(WinHttp.ResponseText, "host=")

    For i = 1 To UBound(Temp)
        ProxyServer = Split(Temp(i), "&")(0) & ":" & Split(Split(Temp(i), "&port=")(1), "&")(0)

        If ProxyTester(ProxyServer) = True Then
            cbProxyServer.AddItem ProxyServer
        End If
    Next i
    
    If cbProxyServer.ListCount = 0 Then
        MsgBox "프록시 서버가 발견되지않았습니다." & vbCrLf & "다른 국적을 선택해주세요.", vbExclamation
    Else
        MsgBox cbProxyServer.ListCount & "개의 프록시서버가 발견되었습니다.", vbInformation
        cmdProxyOn.Enabled = Not cmdProxyOn.Enabled
    End If
    
    lblStatus.Caption = vbNullString
    cbCountry.Enabled = Not cbCountry.Enabled
    cbProxyServer.Enabled = Not cbProxyServer.Enabled
    cmdSearch.Enabled = Not cmdSearch.Enabled
End Sub

Private Sub Form_Load()
    Dim Temp As String
    Dim Country() As String

    WinHttp.Open "GET", "http://www.xroxy.com/proxylist.php", True
    WinHttp.Send
    WinHttp.WaitForResponse
    
    Temp = Split(Split(WinHttp.ResponseText, "<option selected='selected' value=''>Any country</option>")(1), "</select>")(0)
    Country = Split(Temp, "<option value='")
    
    ReDim Value(UBound(Country)) As String
    
    For i = 1 To UBound(Country)
        Value(i) = Split(Country(i), "'>")(0)
        cbCountry.AddItem Split(Split(Country(i), "'>")(1), "</option>")(0)
    Next i
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Call ProxySetting("127.0.0.1:80", False)
    End
End Sub
