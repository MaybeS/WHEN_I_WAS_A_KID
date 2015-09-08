Attribute VB_Name = "modProxyTester"
Dim WinHttp As New WinHttpRequest

Function ProxyTester(ByVal ProxyServer As String) As Boolean
On Error GoTo errTimeOut
    WinHttp.Open "GET", "http://www.naver.com", True
    WinHttp.SetProxy 2, ProxyServer
    WinHttp.SetTimeouts 1000, 1000, 1000, 1000
    WinHttp.Send
    WinHttp.WaitForResponse
    
    If InStr(WinHttp.ResponseText, "³×ÀÌ¹ö") Then
        ProxyTester = True
        Exit Function
    End If
    
    ProxyTester = False
       
errTimeOut:
        ProxyTester = False
End Function

