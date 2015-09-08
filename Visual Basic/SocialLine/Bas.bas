Attribute VB_Name = "Bas"
' SocialLine .Bas
'       Preseted by Maybe (jiun0623@naver.com)
'
'
'
'
'
'
'
'
Public Declare Function SetProcessWorkingSetSize Lib "kernel32" (ByVal hProcess As Long, ByVal dwMinimumWorkingSetSize As Long, ByVal dwMaximumWorkingSetSize As Long) As Long
Public Declare Function GetCurrentProcess Lib "kernel32" () As Long

Public WinhttpX As New WinHttp.WinHttpRequest

Public Type UserType
    Name As String
    FriendCnt As Integer
    FriendStarCnt As Integer
End Type

Private Type SECURITY_ATTRIBUTES
     nLength As Long
     lpSecurityDescriptor As Long
     bInheritHandle As Long
End Type

Public FFriend(2500) As String
Public FFriendURL(2500) As String
Public My As UserType
    'TypeUser.
