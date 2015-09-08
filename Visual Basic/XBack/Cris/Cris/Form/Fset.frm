VERSION 5.00
Begin VB.Form Fset 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  '단일 고정
   Caption         =   "설정"
   ClientHeight    =   7500
   ClientLeft      =   3030
   ClientTop       =   1710
   ClientWidth     =   4500
   DrawWidth       =   3
   BeginProperty Font 
      Name            =   "나눔고딕"
      Size            =   15.75
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Fset.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   500
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   300
   Begin VB.PictureBox Bar 
      Appearance      =   0  '평면
      BackColor       =   &H80000005&
      BorderStyle     =   0  '없음
      DrawWidth       =   2
      BeginProperty Font 
         Name            =   "굴림"
         Size            =   18
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   600
      Left            =   -15
      ScaleHeight     =   40
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   304
      TabIndex        =   0
      Top             =   0
      Width           =   4560
   End
   Begin VB.PictureBox Set_G 
      Appearance      =   0  '평면
      BackColor       =   &H80000005&
      DrawWidth       =   3
      BeginProperty Font 
         Name            =   "나눔고딕"
         Size            =   18
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   6585
      Left            =   -15
      ScaleHeight     =   437
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   302
      TabIndex        =   1
      Top             =   600
      Width           =   4560
      Begin VB.TextBox InputText 
         Appearance      =   0  '평면
         BeginProperty Font 
            Name            =   "굴림"
            Size            =   18
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   540
         Left            =   3480
         TabIndex        =   4
         Text            =   "Text1"
         Top             =   3360
         Visible         =   0   'False
         Width           =   975
      End
      Begin CrisProject.iOption Nuser 
         Height          =   375
         Left            =   3360
         TabIndex        =   2
         Top             =   720
         Width           =   1125
         _ExtentX        =   1984
         _ExtentY        =   661
      End
      Begin CrisProject.iOption TimeOp 
         Height          =   375
         Left            =   3360
         TabIndex        =   6
         Top             =   1200
         Width           =   1125
         _ExtentX        =   1984
         _ExtentY        =   661
      End
      Begin CrisProject.iOption TimeSp 
         Height          =   375
         Left            =   3360
         TabIndex        =   8
         Top             =   1680
         Width           =   1125
         _ExtentX        =   1984
         _ExtentY        =   661
      End
      Begin VB.Label Label1 
         BackStyle       =   0  '투명
         Caption         =   $"Fset.frx":850E
         BeginProperty Font 
            Name            =   "나눔고딕"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   840
         Left            =   120
         TabIndex        =   9
         Top             =   5640
         Width           =   4290
      End
      Begin VB.Label TimsSL 
         AutoSize        =   -1  'True
         BackStyle       =   0  '투명
         Caption         =   "초단위 표시"
         Height          =   360
         Left            =   120
         TabIndex        =   7
         Top             =   1680
         Width           =   1590
      End
      Begin VB.Label TimerXL 
         AutoSize        =   -1  'True
         BackStyle       =   0  '투명
         Caption         =   "24시간제"
         Height          =   360
         Left            =   120
         TabIndex        =   5
         Top             =   1200
         Width           =   1290
      End
      Begin VB.Label UserL 
         AutoSize        =   -1  'True
         BackStyle       =   0  '투명
         Caption         =   "방문객"
         Height          =   360
         Left            =   120
         TabIndex        =   3
         Tag             =   "사용자이름을 설정"
         ToolTipText     =   "더블 클릭해서 편집하실 수 있습니다."
         Top             =   720
         Width           =   900
      End
   End
   Begin VB.Menu PopText 
      Caption         =   "텍스트"
      Visible         =   0   'False
      Begin VB.Menu PT_Cut 
         Caption         =   "잘라내기"
      End
      Begin VB.Menu PT_Copy 
         Caption         =   "복사하기"
      End
      Begin VB.Menu PT_Paste 
         Caption         =   "붙여넣기"
      End
      Begin VB.Menu PT_Delete 
         Caption         =   "삭제하기"
      End
      Begin VB.Menu Line 
         Caption         =   "-"
      End
      Begin VB.Menu PT_All 
         Caption         =   "모두선택"
      End
   End
End
Attribute VB_Name = "Fset"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Const WM_NCLBUTTONDOWN As Long = &HA1
Private Const HTCAPTION As Long = 2
Dim LabelX
Private Sub Bar_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Y < 30 Then
        If X > 273 Then Me.Visible = False: Exit Sub
        If X > 218 Then Save_Me: Exit Sub
        If Button = vbLeftButton Then
                ReleaseCapture
                SendMessage hwnd, WM_NCLBUTTONDOWN, HTCAPTION, ByVal 0&
        End If
End If
End Sub
Private Sub Form_Load()
If Me.Visible Then _
        Me.Show: _
        Me.Height = TwiV(500): _
        Me.Width = TwiV(300): _
        SetForm
End Sub
Public Sub SetForm()

        Bar.Line (0, 30)-(50, 30), RGB(128, 128, 255)
        Bar.Line (50, 30)-(60, 20), RGB(128, 128, 255)
        Bar.Line (60, 20)-(110, 20), RGB(128, 128, 255)
        Bar.Line (110, 20)-(120, 30), RGB(128, 128, 255)
        Bar.Line (120, 30)-(500, 30), RGB(128, 128, 255)
        
        Bar.DrawWidth = 2
        Bar.Line (272, 3)-(272, 25), RGB(125, 125, 125)
        
        TextPrint Fset.Bar, 5, 3, "설정", vbBlack, 0
        TextPrint Fset.Bar, 222, 3, "Save", RGB(190, 128, 255), 16
        TextPrint Fset.Bar, 280, 3, "X", RGB(255, 128, 190), 16
        TextPrint Fset.Bar, 65, 21, "Setting", RGB(180, 120, 180), 8
        
        TabEffect 0
        
End Sub
Private Sub TabEffect(ByVal Index As Integer)
Dim MenuGuid
MenuGuid = Array("일반", "모양", "알림", "모드")
        Fset.Set_G.DrawWidth = 2
        TextPrint Fset.Set_G, 20, 10, "일반", RGB(90, 90, 150), 18
        TextPrint Fset.Set_G, 91, 12, "모양", RGB(150, 90, 150), 15
        TextPrint Fset.Set_G, 160, 12, "알림", RGB(150, 90, 150), 15
        TextPrint Fset.Set_G, 229, 12, "모드", RGB(150, 90, 150), 15
        
        Fset.Set_G.Line (5, 43)-(295, 43), RGB(100, 100, 100)
        
End Sub
Private Sub Save_Me()
    SaveSetting App.ProductName, "Set", "24Time", APM
    SaveSetting App.ProductName, "Set", "SecondON", SecondON
    SaveSetting App.ProductName, "User", "ON", Nuser.Value
    SaveSetting App.ProductName, "User", "Name", UserL.Caption
End Sub
Private Sub MatchTexts(ByRef L As Label)
With InputText
        .Top = L.Top - 2
        .Left = L.Left - 2
        .Height = L.Height
        .Width = 200
        .Text = L.Caption
        .Visible = True
        .Tag = L.Name
        .SelStart = 0
        .SelLength = Len(L.Caption)
End With
        LabelX = L
End Sub
Private Sub DMatchTexts(L As Label)
If L = "" Then Exit Sub
        L.Caption = InputText.Text
        InputText.Visible = False
        LabelX = ""
End Sub
Private Sub InputText_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        DMatchTexts UserL
    End If
End Sub
Private Sub Nuser_ValueChange()
If Not S_State Then
        If Nuser.Value Then
                N_String = UserL.Tag
                UserL.Tag = UserL.Caption
                UserL.Caption = N_String
                MatchTexts UserL
                InputText.SetFocus
        Else
                If InputText.Tag = UserL.Name Then DMatchTexts UserL
                N_String = UserL.Caption
                UserL.Caption = UserL.Tag
                UserL.Tag = N_String
        End If
End If
End Sub
Private Sub PT_All_Click()
        Notifi.Tbox.SelStart = 0
        Notifi.Tbox.SelLength = Len(Notifi.Tbox.Text)
End Sub
Private Sub PT_Copy_Click()
        If LenB(Mid$(Notifi.Tbox.Text, Notifi.Tbox.SelStart + 1, Notifi.Tbox.SelLength)) Then _
        Clipboard.SetText Mid$(Notifi.Tbox.Text, Notifi.Tbox.SelStart + 1, Notifi.Tbox.SelLength)
End Sub
Private Sub PT_Cut_Click()
        If LenB(Mid$(Notifi.Tbox.Text, Notifi.Tbox.SelStart + 1, Notifi.Tbox.SelLength)) Then _
        Clipboard.SetText Mid$(Notifi.Tbox.Text, Notifi.Tbox.SelStart + 1, Notifi.Tbox.SelLength)
        Notifi.Tbox.Text = Left$(Notifi.Tbox.Text, Notifi.Tbox.SelStart) & Right$(Notifi.Tbox.Text, Len(Notifi.Tbox.Text) - Notifi.Tbox.SelStart - Notifi.Tbox.SelLength)
End Sub
Private Sub PT_Delete_Click()
        Notifi.Tbox.Text = Left$(Notifi.Tbox.Text, Notifi.Tbox.SelStart) & Right$(Notifi.Tbox.Text, Len(Notifi.Tbox.Text) - Notifi.Tbox.SelStart - Notifi.Tbox.SelLength)
End Sub
Private Sub PT_Paste_Click()
        Notifi.Tbox.Text = Left$(Notifi.Tbox.Text, Notifi.Tbox.SelStart) & Clipboard.GetText & Right$(Notifi.Tbox.Text, Len(Notifi.Tbox.Text) - Notifi.Tbox.SelStart)
End Sub
Private Sub TimeOp_ValueChange()
    If TimeOp.Value Then APM = False
    If Not TimeOp.Value Then APM = True
End Sub
Private Sub TimeSp_ValueChange()
    If TimeSp.Value Then SecondON = True
    If Not TimeSp.Value Then SecondON = False
End Sub
