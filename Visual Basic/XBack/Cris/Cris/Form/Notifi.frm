VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Notifi 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  '¾øÀ½
   ClientHeight    =   4290
   ClientLeft      =   4305
   ClientTop       =   1005
   ClientWidth     =   7665
   BeginProperty Font 
      Name            =   "³ª´®°íµñ"
      Size            =   9.75
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Notifi.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   286
   ScaleMode       =   3  'ÇÈ¼¿
   ScaleWidth      =   511
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox RaySpace 
      Appearance      =   0  'Æò¸é
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      FillColor       =   &H00FFFFFF&
      ForeColor       =   &H00FFFFFF&
      Height          =   1095
      Left            =   840
      ScaleHeight     =   71
      ScaleMode       =   3  'ÇÈ¼¿
      ScaleWidth      =   59
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   720
      Width           =   915
      Begin MSForms.TextBox SBox 
         Height          =   255
         Left            =   120
         TabIndex        =   4
         TabStop         =   0   'False
         Tag             =   "°Ë»ö..."
         Top             =   120
         Width           =   255
         VariousPropertyBits=   747653139
         ForeColor       =   16777215
         BorderStyle     =   1
         ScrollBars      =   2
         Size            =   "450;450"
         SpecialEffect   =   0
         FontName        =   "³ª´®°íµñ"
         FontHeight      =   240
         FontCharSet     =   129
         FontPitchAndFamily=   34
      End
   End
   Begin VB.PictureBox ButtonSpace 
      Appearance      =   0  'Æò¸é
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H80000008&
      Height          =   1080
      Left            =   240
      ScaleHeight     =   70
      ScaleMode       =   3  'ÇÈ¼¿
      ScaleWidth      =   30
      TabIndex        =   0
      Top             =   720
      Width           =   480
   End
   Begin MSForms.TextBox TTitle 
      Height          =   735
      Left            =   5280
      TabIndex        =   1
      Tag             =   "»õ·Î¿î ¸Þ¸ðÀÇ Á¦¸ñÀ» ÀÔ·ÂÇØ¿ä."
      Top             =   960
      Width           =   2175
      VariousPropertyBits=   747653139
      ForeColor       =   4210816
      BorderStyle     =   1
      ScrollBars      =   2
      Size            =   "3836;1296"
      SpecialEffect   =   0
      FontName        =   "³ª´®°íµñ"
      FontHeight      =   240
      FontCharSet     =   129
      FontPitchAndFamily=   34
   End
   Begin MSForms.TextBox Tbox 
      Height          =   735
      Left            =   5280
      TabIndex        =   2
      Tag             =   "»õ·Î¿î ¸Þ¸ðÀÇ ³»¿ëÀ» ÀÔ·ÂÇØ¿ä."
      Top             =   1800
      Width           =   2175
      VariousPropertyBits=   -1399830509
      ForeColor       =   4210816
      BorderStyle     =   1
      ScrollBars      =   2
      Size            =   "3836;1296"
      SpecialEffect   =   0
      FontName        =   "³ª´®°íµñ"
      FontHeight      =   240
      FontCharSet     =   129
      FontPitchAndFamily=   34
   End
End
Attribute VB_Name = "Notifi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ButtonSpace_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Y < 64 Then
        T_State = 0: bBas.NotifiBlt
    ElseIf Y > 120 And Y < 184 Then
        T_State = 1: bBas.NotifiBlt
    ElseIf Y > 240 And Y < 304 Then
        T_State = 2: bBas.NotifiBlt
    ElseIf Y > 360 And Y < 424 Then
        T_State = 3: bBas.NotifiBlt
    End If
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If 30 < Y And Y < 60 Then
        If 265 < X And X < 295 Then _
            NotifiBlt
        If ScreenHeight - 80 < X And X < ScreenHeight - 50 Then _
            NotifiBlt
        If ScreenHeight - 45 < X And X < ScreenHeight - 15 Then 'Del
        End If
    End If
End Sub
Private Sub RaySpace_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Select Case T_State
        Case 0
        Case 1
        Case 2
        Case 3
            For i = 0 To MemoXCnt
                If Y > 48 + i * 30 And Y < 72 + i * 30 Then IndexMatch = i: LoadMemo i
            Next i
End Select
End Sub
Private Sub TTitle_KeyDown(KeyCode As MSForms.ReturnInteger, Shift As Integer)
    If Not TboxKeyUp Then TboxKeyUp = GetTickCount
End Sub
Private Sub Tbox_KeyDown(KeyCode As MSForms.ReturnInteger, Shift As Integer)
    If Not TboxKeyUp Then TboxKeyUp = GetTickCount
End Sub
Private Sub TTitle_KeyUp(KeyCode As MSForms.ReturnInteger, Shift As Integer)
If TboxKeyUp Then
    If GetTickCount < TboxKeyUp + 1000 Then
            TboxKeyUp = GetTickCount
    End If
End If
End Sub
Private Sub Tbox_KeyUp(KeyCode As MSForms.ReturnInteger, Shift As Integer)
If TboxKeyUp Then
    If GetTickCount < TboxKeyUp + 1000 Then
            TboxKeyUp = GetTickCount
    End If
End If
End Sub
Private Sub TTitle_Change()
Select Case T_State
        Case 0
        Case 1
        Case 2
        Case 3
            MemoX(IndexMatch).Title = TTitle.Text
End Select
    RayBlt
End Sub
Private Sub TTitle_GotFocus()
    If TTitle.Text = TTitle.Tag And Not S_State Then _
        TTitle.SelStart = 0: TTitle.SelLength = Len(TTitle.Text)
End Sub
Private Sub Tbox_GotFocus()
    If Tbox.Text = Tbox.Tag And Not S_State Then Tbox.SelStart = 0: Tbox.SelLength = Len(Tbox.Text)
End Sub
Private Sub SBox_GotFocus()
    If SBox.Text = SBox.Tag And Not S_State Then SBox.SelStart = 0: SBox.SelLength = Len(SBox.Text)
End Sub
Private Sub TTitle_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    GetCursorPos CurS
End Sub
Private Sub Tbox_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    GetCursorPos CurS
End Sub
Private Sub RaySpace_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    GetCursorPos CurS
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    GetCursorPos CurS
End Sub
Private Sub ButtonSpace_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    GetCursorPos CurS
End Sub
Private Sub Tbox_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then PopupMenu Fset.PopText, 1: Exit Sub
End Sub

