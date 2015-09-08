Attribute VB_Name = "CrisAIBas"
Public Type AImind
    Sir As Boolean      '존댓말 유무를 반환합니다.
    Desire As Boolean   '비속어 유무를 반환합니다.
    De_Int As Byte      '비속어 정도를 반환합니다.
    Mood As Boolean     '크리스에게 기분을 가질지 유무를 반환합니다.
    Mo_Int As Integer   '기분의 정도를 반환합니다. 0-100
    Statck_Cris(25) As String '크리스의 스택을 반환
    Statck_User(25) As String '유저의   스택을 반환
    St_Int As Byte      '크리스의 기억력 정도를 반환합니다.
End Type
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'Cris AI Module
'               by MaybeStudio. Present
' since 2012
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Public Sub CrisAI()



End Sub
Public Function CrisAI_Input(ByVal Text As String)
Dim CrisTell As String, HellowCris, Rand As Integer
HellowCris = Array("안녕하세요?", "반가워요.")
CrisTell = ""


Hellow_:
Randomize
Rand = Int(Rnd * 2)
If InStr(Text, "안녕") Then CrisTell = CrisTell & HellowCris(Rand): GoTo How
If InStr(Text, "ㅎ2") Then CrisTell = CrisTell & HellowCris(Rand): GoTo How
If InStr(Text, "안뇽") Then CrisTell = CrisTell & HellowCris(Rand): GoTo How

How:

NoMatch:
If CrisTell = "" Then CrisTell = "다"
CrisAI_Output CrisTell

End Function
Public Function CrisAI_Output(ByVal Text As String)
    fTalk.MessageTalk ChatLY, Text, False


End Function
