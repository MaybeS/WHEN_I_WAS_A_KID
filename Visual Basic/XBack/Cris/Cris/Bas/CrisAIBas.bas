Attribute VB_Name = "CrisAIBas"
Public Type AImind
    Sir As Boolean      '���� ������ ��ȯ�մϴ�.
    Desire As Boolean   '��Ӿ� ������ ��ȯ�մϴ�.
    De_Int As Byte      '��Ӿ� ������ ��ȯ�մϴ�.
    Mood As Boolean     'ũ�������� ����� ������ ������ ��ȯ�մϴ�.
    Mo_Int As Integer   '����� ������ ��ȯ�մϴ�. 0-100
    Statck_Cris(25) As String 'ũ������ ������ ��ȯ
    Statck_User(25) As String '������   ������ ��ȯ
    St_Int As Byte      'ũ������ ���� ������ ��ȯ�մϴ�.
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
HellowCris = Array("�ȳ��ϼ���?", "�ݰ�����.")
CrisTell = ""


Hellow_:
Randomize
Rand = Int(Rnd * 2)
If InStr(Text, "�ȳ�") Then CrisTell = CrisTell & HellowCris(Rand): GoTo How
If InStr(Text, "��2") Then CrisTell = CrisTell & HellowCris(Rand): GoTo How
If InStr(Text, "�ȴ�") Then CrisTell = CrisTell & HellowCris(Rand): GoTo How

How:

NoMatch:
If CrisTell = "" Then CrisTell = "��"
CrisAI_Output CrisTell

End Function
Public Function CrisAI_Output(ByVal Text As String)
    fTalk.MessageTalk ChatLY, Text, False


End Function
