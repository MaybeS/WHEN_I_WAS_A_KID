Attribute VB_Name = "bMain"
Option Explicit
Public Declare Function GetTickCount Lib "kernel32" () As Long
Dim GTCValue As Long
Dim fps As Integer, BNow As String
Public Sub MainLoop()

    Do
            GTCValue = GetTickCount + 1                   '
        Do                                                           '
            DoEvents                                              'DoEvents �� �ߵ� �Լ�
        Loop Until GTCValue < GetTickCount             '
            
            Call bBlt.MainBlt
            Call bMain.FPScheck
            Call fMain.CheckKeyPress
            
    If Not FlashLogo Then
    
        
    
    End If
    
    Loop
    
End Sub
Public Sub FPScheck()
    If Format(Now, "SS") <> BNow Then
        BNow = Format(Now, "SS")
        fMain.Caption = "0���ΰ��±�  " & fps & "fps"
        fps = 0
    Else
        fps = fps + 1
    End If
End Sub
Public Sub Enb()
    'port 1
    'port 2
    'port 3
    'port 4
        
End Sub
