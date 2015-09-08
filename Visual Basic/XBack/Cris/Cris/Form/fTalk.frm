VERSION 5.00
Begin VB.Form fTalk 
   Appearance      =   0  '평면
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  '단일 고정
   Caption         =   "CrisTalk +"
   ClientHeight    =   7500
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4500
   BeginProperty Font 
      Name            =   "나눔고딕"
      Size            =   9.75
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "fTalk.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   500
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   300
   Begin VB.PictureBox Picture1 
      Align           =   2  '아래 맞춤
      Appearance      =   0  '평면
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  '없음
      ForeColor       =   &H80000008&
      Height          =   525
      Left            =   0
      ScaleHeight     =   525
      ScaleWidth      =   4500
      TabIndex        =   1
      Top             =   6975
      Width           =   4500
      Begin VB.TextBox UserText 
         Appearance      =   0  '평면
         BeginProperty Font 
            Name            =   "나눔고딕"
            Size            =   14.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   500
         TabIndex        =   2
         Top             =   60
         Width           =   3975
      End
      Begin VB.Label AddL 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BackStyle       =   0  '투명
         BorderStyle     =   1  '단일 고정
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "나눔고딕 ExtraBold"
            Size            =   15.75
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   405
         Left            =   75
         TabIndex        =   3
         Top             =   60
         Width           =   375
      End
   End
   Begin VB.PictureBox TopBar 
      Align           =   1  '위 맞춤
      Appearance      =   0  '평면
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   0
      ScaleHeight     =   345
      ScaleWidth      =   4470
      TabIndex        =   0
      Top             =   0
      Width           =   4500
   End
End
Attribute VB_Name = "fTalk"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub AddL_Click()
        MessageTalk ChatLY, "안녕하세요? 크리스라고해요", False
End Sub
Private Sub Form_Load()
If Me.Visible Then _
        Me.Show: _
        Me.Height = TwiV(500): _
        Me.Width = TwiV(300)

End Sub
Public Sub MessageTalk(ByVal Y As Integer, ByVal Text As String, ByVal Who As Boolean)
Dim TextLine As Long, TextLen As Long, StrLen As Long, Whois As Integer

If MessageCNT > 250 Then
    SaveLog
    PushMessageArray
    MessageCNT = 250
End If
If MessageTextCnt > 500 Then
    SaveLog
    PushTextArray
    MessageTextCnt = 500
End If
            
TextLine = 0
Whois = ((TrueV(Int(Who)) + 1) Mod 2)
MessageX(MessageCNT).Text = Left$(Who, 1) & UserText.Text
            
CheckStrAgain:
    TextLen = GetStringLen(Text, 10)
        If TextLen > 255 Then
            StrLen = StringCut(Text, 250, 10)
                MessageXtext(MessageTextCnt).Text = Left$(Text, StrLen)
                MessageXtext(MessageTextCnt).X = 35 - 15 * Whois
                MessageXtext(MessageTextCnt).Y = Y + TextLine * 20
                MessageXtext(MessageTextCnt).Index = MessageCNT
                MessageTextCnt = MessageTextCnt + 1
            Text = Right$(Text, Len(Text) - StrLen)
            TextLine = TextLine + 1
            GoTo CheckStrAgain:
        Else
            MessageXtext(MessageTextCnt).Text = Text
            MessageXtext(MessageTextCnt).X = 285 - TextLen * ((Whois + 1) Mod 2) - 265 * Whois
            MessageXtext(MessageTextCnt).Y = Y + TextLine * 20
            MessageXtext(MessageTextCnt).Index = MessageCNT
            MessageTextCnt = MessageTextCnt + 1
        End If
    If TextLine Then
        MessageX(MessageCNT).X = 28 - 12 * Whois
        MessageX(MessageCNT).Y = Y - 7
        MessageX(MessageCNT).Width = 275
        MessageX(MessageCNT).Height = (TextLine + 1) * 20 + 23
        MessageX(MessageCNT).Who = Who
            ChatLY = ChatLY + (TextLine + 1) * 20 + 23
    Else
        MessageX(MessageCNT).X = 278 - TextLen * ((Whois + 1) Mod 2) - 262 * Whois
        MessageX(MessageCNT).Y = Y - 7
        MessageX(MessageCNT).Width = (TextLen + 25)
        MessageX(MessageCNT).Height = 43
        MessageX(MessageCNT).Who = Who
            ChatLY = ChatLY + 40
    End If
    
    MessageCNT = MessageCNT + 1

    If ChatLY > 450 Or ChatY < 0 Then ChatY = ChatLY - 450
End Sub
Private Sub Form_Unload(Cancel As Integer)
    Me.Visible = False
End Sub
Private Sub UserText_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And LenB(Trim(UserText.Text)) > 0 Then
        MessageTalk ChatLY, UserText.Text, True
        CrisAI_Input UserText.Text
        UserText.Text = ""
    End If
End Sub
