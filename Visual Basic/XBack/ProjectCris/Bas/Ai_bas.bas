Attribute VB_Name = "Ai_bas"
Option Explicit
Private Type PersonalType
    Name As String
    Nick As String
    Height As Integer
    Weight As Integer
    Old As Integer
    Gender As Boolean
    Location As String
End Type
Private Type CrisMindType
    Quest As Long
    Kidy As Long
    Mind As Long
    Lucky As Long
End Type

Public UserX As PersonalType, CrisX As PersonalType
Public CrisMind As CrisMindType

Public Function CrisAI_Input(ByVal Text As String)
Dim i As Integer
Dim CrisTell As String, Rand As Integer
Dim HellowCris, HellowUser, QuestCris

HellowCris = Array("¾È³çÇÏ¼¼¿ä?", "¹Ý°¡¿ö¿ä.")
HellowUser = Array("¾È³ç", "¤¾2", "¾È´¨", "¤¾¤·")
QuestCris = Array("¹¹", "?", "¹¼")

CrisTell = ""


Hellow_:
    Randomize
        Rand = Int(Rnd * 100)

    For i = 0 To UBound(HellowUser)
        If InStr(Text, HellowUser(i)) Then CrisTell = CrisTell & HellowCris(Rand Mod 2): GoTo How
    Next i
How:
Quest:
    For i = 0 To UBound(QuestCris)
        If InStr(Text, QuestCris(i)) Then CrisMind.Quest = CrisMind.Quest + 1: GoTo ReQuest
    Next i
ReQuest:
NoMatch:
If CrisTell = "" Then CrisTell = ""
CrisAI_Output CrisTell

End Function
Public Function CrisAI_Output(ByVal Text As String)

    MessageTalk ChatLY, Text, False

End Function

