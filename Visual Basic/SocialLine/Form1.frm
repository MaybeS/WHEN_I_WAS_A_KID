VERSION 5.00
Begin VB.Form fMain 
   BorderStyle     =   1  '단일 고정
   Caption         =   "Social Line"
   ClientHeight    =   11190
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   15420
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   11190
   ScaleWidth      =   15420
   StartUpPosition =   3  'Windows 기본값
   Begin VB.TextBox Text1 
      Height          =   1095
      Left            =   4920
      TabIndex        =   13
      Text            =   "Text1"
      Top             =   2760
      Width           =   3735
   End
   Begin VB.PictureBox Box 
      Align           =   4  '오른쪽 맞춤
      Appearance      =   0  '평면
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   11190
      Index           =   0
      Left            =   11565
      ScaleHeight     =   11160
      ScaleWidth      =   3825
      TabIndex        =   0
      Top             =   0
      Width           =   3855
      Begin VB.PictureBox Box 
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   2130
         Index           =   2
         Left            =   0
         ScaleHeight     =   2100
         ScaleWidth      =   3825
         TabIndex        =   7
         Top             =   -320
         Width           =   3855
         Begin VB.Label Labe 
            Alignment       =   2  '가운데 맞춤
            Appearance      =   0  '평면
            BackColor       =   &H80000005&
            BorderStyle     =   1  '단일 고정
            Caption         =   "(나) 새로고침"
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   375
            Index           =   4
            Left            =   480
            TabIndex        =   12
            Top             =   1560
            Width           =   2895
         End
         Begin VB.Label Labe 
            Alignment       =   2  '가운데 맞춤
            Appearance      =   0  '평면
            BackColor       =   &H80000005&
            Caption         =   "친구 :"
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   375
            Index           =   3
            Left            =   360
            TabIndex        =   10
            Top             =   960
            Width           =   975
         End
         Begin VB.Label Labe 
            Alignment       =   2  '가운데 맞춤
            Appearance      =   0  '평면
            BackColor       =   &H80000005&
            Caption         =   "로딩중..."
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   375
            Index           =   2
            Left            =   1200
            TabIndex        =   9
            Top             =   960
            Width           =   2295
         End
         Begin VB.Label Labe 
            Alignment       =   2  '가운데 맞춤
            Appearance      =   0  '평면
            BackColor       =   &H80000005&
            BorderStyle     =   1  '단일 고정
            Caption         =   "Name"
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   375
            Index           =   1
            Left            =   120
            TabIndex        =   8
            Top             =   360
            Width           =   3615
         End
      End
      Begin VB.PictureBox Box 
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   9375
         Index           =   1
         Left            =   -8
         ScaleHeight     =   9345
         ScaleWidth      =   3825
         TabIndex        =   3
         Top             =   1800
         Width           =   3855
         Begin VB.ListBox Lfriend 
            Appearance      =   0  '평면
            Height          =   9060
            Left            =   -8
            Style           =   1  '확인란
            TabIndex        =   4
            Top             =   360
            Width           =   3855
         End
         Begin VB.Label Labe 
            Alignment       =   2  '가운데 맞춤
            Appearance      =   0  '평면
            BackColor       =   &H80000005&
            BorderStyle     =   1  '단일 고정
            Caption         =   "List"
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   375
            Index           =   0
            Left            =   -15
            TabIndex        =   5
            Top             =   -8
            Width           =   3855
         End
      End
      Begin VB.TextBox Text_pw 
         Appearance      =   0  '평면
         BeginProperty Font 
            Name            =   "나눔고딕"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         IMEMode         =   3  '사용 못함
         Left            =   120
         PasswordChar    =   "*"
         TabIndex        =   2
         Tag             =   "Password"
         Text            =   "Password"
         Top             =   600
         Width           =   3615
      End
      Begin VB.TextBox Text_ID 
         Appearance      =   0  '평면
         BeginProperty Font 
            Name            =   "나눔고딕"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Tag             =   "email@some.where"
         Text            =   "email@some.where"
         Top             =   120
         Width           =   3615
      End
      Begin VB.CheckBox Chk_login 
         BackColor       =   &H00FFFFFF&
         Caption         =   "로그인 유지"
         BeginProperty Font 
            Name            =   "나눔고딕"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2160
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   11
         Top             =   1200
         Width           =   1575
      End
      Begin VB.Label Button_Login 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "Login"
         BeginProperty Font 
            Name            =   "나눔고딕"
            Size            =   14.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   240
         TabIndex        =   6
         Top             =   1200
         Width           =   1815
      End
   End
End
Attribute VB_Name = "fMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FaceBookCookie As String
Private Sub Button_Login_Click()
Dim StringX As String
Dim ArrayX() As String
Dim Cook As String
Button_Login.ForeColor = &HC0C0C0
DoEvents

With WinhttpX
    .Open "GET", "https://www.facebook.com/", False
    .Send
    Cook = Split(Split(w.GetAllResponseHeaders(), "Set-Cookie: ")(1), " ")(0)
    .Open "POST", "https://www.facebook.com/login.php?login_attempt=1"
    .SetRequestHeader "Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
    .SetRequestHeader "Referer", "https://www.facebook.com/"
    .SetRequestHeader "Content-Type", "application/x-www-form-urlencoded"
    .SetRequestHeader "User-Agent", "Mozilla/5.0 (Windows NT 6.2; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0"
    .SetRequestHeader "Cookie", Cook
    .Send "lsd=AVrpld2j&email=" & Text_ID.Text & "&pass=" & Text_pw.Text & "&default_persistent=0&timezone=-540&lgnrnd=115906_YNTr&lgnjs=1381863561&locale=ko_KR"
    If InStr(.ResponseText, "https:\/\/fbstatic-a.akamaihd.net\/fbsbx\/fbsbx.php?1") Then

        'Login
        
            fMain.Box(2).Top = -320
                'Show UserProfile
            
            If Chk_login.Value = 1 Then
            
                SaveSetting "SocialLine", "Login", "Save", "1"
                SaveSetting "SocialLine", "Login", "ID", Text_ID.Text
                SaveSetting "SocialLine", "Login", "PW", Text_pw.Text
                    'SaveLoginSet
                    
            Else
            
                SaveSetting "socialLine", "Login", "Save", "0"
                SaveSetting "SocialLine", "Login", "ID", ""
                SaveSetting "SocialLine", "Login", "PW", ""
                    'deleteLoginSet
                
            End If
                
            .Open "GET", "https://www.facebook.com/", False
            .Send
            .WaitForResponse (1)
            
                My.Name = Split(Split(.ResponseText, "headerTinymanName")(1), "</span>")(0)
                My.Name = Right$(My.Name, Len(My.Name) - 2)
                fMain.Labe(1).Caption = My.Name
                DoEvents
                
            .Open "GET", "https://www.facebook.com/profile.php?sk=friends", False
            .Send
            .WaitForResponse (1)
            
                StringX = Split(Split(.ResponseText, "pagelet_timeline_medley_friends")(1), "</span>")(0)
                My.FriendCnt = Val(Right$(StringX, Len(StringX) - 23))
                fMain.Labe(2).Caption = My.FriendCnt
                DoEvents
                
                ArrayX = Split(Split(Split(Split(Split(.ResponseText, "InitialChatFriendsList")(1), "DateFormatConfig")(0), "]}")(0), ":[")(1) & ",""", """,""")
                
                 For i = 0 To UBound(ArrayX)
                
                    If Len(ArrayX(i)) < 2 Then Exit For
                    
                    If Right$(ArrayX(i), 1) = "2" Then
                    
                        ArrayX(i) = Left$(ArrayX(i), Len(ArrayX(i)) - 2)
                        
                        .Open "GET", "https://m.facebook.com/" & ArrayX(i)
                        .Send
                        .WaitForResponse (1)
                            
                            If ArrayX(i) = "100003686106451" Then
                                a = a
                            End If
                            
                        FFriend(i) = Split(Split(.ResponseText, "<title>")(1), "</title>")(0)
                        FFriendURL(i) = ArrayX(i)
            'Open "C:\temp.log" For Output As #1
            'Print #1, FFriend(i)
            'Close #1
            
                        fMain.Lfriend.AddItem FFriend(i)
                            
                    End If
                    
                Next i

                
        
     Else
     
        'fail
        
     End If
                    
End With

Button_Login.ForeColor = vbBlack

End Sub
Private Sub Form_Load()

SetProcessWorkingSetSize GetCurrentProcess(), -1&, -1&
    'processSet
    
Me.Show
Box(2).Top = -5000
    'FormSet
    
WinhttpX.Open "GET", "https://www.facebook.com/", False
WinhttpX.Send
FaceBookCookie = Split(Split(WinhttpX.GetAllResponseHeaders(), "Set-Cookie: ")(1), " ")(0)
    'get
    
DoEvents

If GetSetting("SocialLine", "Login", "Save", 0) = "1" Then _
    Text_ID.Text = GetSetting("SocialLine", "Login", "ID", Text_ID.Tag): _
    Text_pw.Text = GetSetting("SocialLine", "Login", "PW", Text_pw.Tag): _
    Chk_login.Value = 1

End Sub
Private Sub Lfriend_Click()
    Text1.Text = FFriendURL(Lfriend.ListIndex)
End Sub
Private Sub Text_ID_GotFocus()

    If Text_ID.Text = Text_ID.Tag Then Text_ID.Text = ""
        
End Sub
Private Sub Text_ID_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 13 Then Button_Login_Click
    
End Sub
Private Sub Text_ID_LostFocus()

    If Text_ID.Text = "" Then Text_ID.Text = Text_ID.Tag

End Sub
Private Sub Text_pw_GotFocus()
    
    If Text_pw.Text = Text_pw.Tag Then Text_pw.Text = ""
    
End Sub
Private Sub Text_pw_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 13 Then Button_Login_Click

End Sub
Private Sub Text_pw_LostFocus()

    If Text_pw.Text = "" Then Text_pw.Text = Text_pw.Tag

End Sub

