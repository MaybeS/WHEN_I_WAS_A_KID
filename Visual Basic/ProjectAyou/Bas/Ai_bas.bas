Attribute VB_Name = "Ai_bas"
Option Explicit
Private Type AyouMindType
    Quest As Long
    
    Lucky As Double
    
    Happy As Double
    Angry As Double
    Sad As Double
    Scare As Double
    Warry As Double
    Surp As Double

    '기쁨,노여움,슬픔,두려움,근심,놀람
End Type
Private Type PersonalType
    Name As String
    Nick As String
    Height As Integer
    Weight As Integer
    Age As Integer
    Gender As Boolean
    Location As String
    Mind As AyouMindType
End Type

Public AyouSpeak(1000) As String, AyouSpeakCnt As Integer
Public UserX As PersonalType, AyouX As PersonalType
Public Function AyouAI_Input(ByVal Text As String)
On Error Resume Next
Dim i As Integer, j As Integer, k As Integer, Target() As String

Target() = Split(Text, "/")

If Left(Text, 1) = "/" Then
    Select Case LCase(Target(1))
        Case "master"
            'get master
            MessageTalk ChatLY, "[system] get master", False
            
        Case "exit"
            MessageTalk ChatLY, "[system] exit", False
            F_Sub.Button_Close_Click
        
        Case "ayou"
            Select Case LCase(Target(2))
                Case "speak"
                    MessageTalk ChatLY, Target(3), False
                
                Case "set"
                    Select Case LCase(Target(3))
                        Case "age"
                            AyouX.Age = Target(4)
                        Case "gender"
                            AyouX.Gender = Target(4)
                        Case "host"
                        
                        Case "height"
                        
                        Case "weight"
                        
                        Case "nick"
                        
                        Case "locate"
                        
                        Case Else
                            
                    End Select
                Case Else
                    
            End Select
        Case "setting"
            
        Case Else
            MessageTalk ChatLY, "알 수 없는 명령어입니다.", False
            
    End Select
Else

        MessageTalk ChatLY, F_Sub.UserText.Text, True
        AyouX.Mind.Quest = AyouX.Mind.Quest + 1
        
End If


End Function
Public Sub Ayou_Mind()
    
    
    
End Sub
Public Function Ayou_Speak()


End Function
Public Function AyouAI_Output(ByVal Text As String)

    MessageTalk ChatLY, Text, False

End Function

