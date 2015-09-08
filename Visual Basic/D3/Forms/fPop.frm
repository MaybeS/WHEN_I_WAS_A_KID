VERSION 5.00
Begin VB.Form fPop 
   Appearance      =   0  '평면
   BackColor       =   &H80000005&
   BorderStyle     =   0  '없음
   ClientHeight    =   9708
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   19476
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9708
   ScaleWidth      =   19476
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '화면 가운데
   Tag             =   "0"
   Begin D3_Editor.xFrame xF 
      Height          =   4695
      Index           =   2
      Left            =   0
      TabIndex        =   2
      Top             =   4800
      Width           =   6375
      _ExtentX        =   11240
      _ExtentY        =   8276
      Button          =   -1  'True
      Caption         =   "D3 Editor 업데이트"
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "굴림"
         Size            =   8.4
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontSize        =   8.4
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      HeaderGradientBottom=   12611136
      Begin VB.Label L7 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "D3 Editor x32(x86) OpenSource Beta Edition"
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   120
         TabIndex        =   16
         Top             =   360
         Width           =   6132
      End
   End
   Begin D3_Editor.xFrame xF 
      Height          =   4752
      Index           =   1
      Left            =   6480
      TabIndex        =   1
      Top             =   0
      Width           =   6372
      _ExtentX        =   11240
      _ExtentY        =   8382
      Button          =   -1  'True
      Caption         =   "D3 Editor 정보"
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "굴림"
         Size            =   8.4
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontSize        =   8.4
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      HeaderGradientBottom=   12611136
      Begin VB.Label L1 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "D3 Editor x32(x86) OpenSource Beta Edition"
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   6135
      End
      Begin VB.Label L3 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   $"fPop.frx":0000
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   975
         Left            =   120
         TabIndex        =   8
         Top             =   3600
         Width           =   6135
      End
      Begin VB.Label L2 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   $"fPop.frx":00AB
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   3015
         Left            =   120
         TabIndex        =   9
         Top             =   600
         Width           =   6135
      End
   End
   Begin D3_Editor.xFrame xF 
      Height          =   4695
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6375
      _ExtentX        =   11240
      _ExtentY        =   8276
      Button          =   -1  'True
      Caption         =   "D3 Editor 도움말"
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "굴림"
         Size            =   8.4
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontSize        =   8.4
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      HeaderGradientBottom=   12611136
      Begin VB.ComboBox com 
         Height          =   300
         ItemData        =   "fPop.frx":01EE
         Left            =   120
         List            =   "fPop.frx":01F5
         TabIndex        =   4
         Text            =   "도움말 항목을 선택하세요."
         Top             =   360
         Width           =   3255
      End
      Begin VB.ListBox Lis 
         Height          =   3828
         ItemData        =   "fPop.frx":01FF
         Left            =   120
         List            =   "fPop.frx":0201
         TabIndex        =   3
         Top             =   720
         Width           =   3255
      End
      Begin VB.Label Ln 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "도움말 파일 로드 (*.MSH)"
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3480
         TabIndex        =   6
         Top             =   360
         Width           =   2775
      End
      Begin VB.Label Lm 
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "Label1"
         ForeColor       =   &H80000008&
         Height          =   3855
         Left            =   3480
         TabIndex        =   5
         Top             =   720
         Width           =   2775
      End
   End
   Begin D3_Editor.xFrame xF 
      Height          =   4695
      Index           =   3
      Left            =   6480
      TabIndex        =   10
      Top             =   4800
      Width           =   6375
      _ExtentX        =   11240
      _ExtentY        =   8276
      Caption         =   "D3 Editor 등록"
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "굴림"
         Size            =   8.4
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontSize        =   8.4
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      HeaderGradientBottom=   12611136
      Begin VB.TextBox inputs 
         Alignment       =   2  '가운데 맞춤
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   720
         TabIndex        =   12
         Tag             =   "1"
         Text            =   "사용자"
         Top             =   3120
         Width           =   4215
      End
      Begin VB.Label Bt 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "등록"
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   375
         Left            =   5520
         TabIndex        =   15
         Top             =   3120
         Width           =   615
      End
      Begin VB.Label L6 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   $"fPop.frx":0203
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   975
         Left            =   120
         TabIndex        =   14
         Top             =   3600
         Width           =   6135
      End
      Begin VB.Label L4 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   $"fPop.frx":02AE
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   2295
         Left            =   120
         TabIndex        =   13
         Top             =   720
         Width           =   6135
      End
      Begin VB.Label L5 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "D3 Editor x32(x86) OpenSource Beta Edition"
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Width           =   6135
      End
   End
   Begin D3_Editor.xFrame xF 
      Height          =   4692
      Index           =   4
      Left            =   12960
      TabIndex        =   17
      Top             =   0
      Width           =   6372
      _ExtentX        =   11240
      _ExtentY        =   8276
      Button          =   -1  'True
      Caption         =   "D3 Editor 설정"
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "굴림"
         Size            =   8.4
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontSize        =   8.4
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      HeaderGradientBottom=   12611136
      Begin VB.CheckBox ChGrid 
         Caption         =   "격자 있음"
         Height          =   180
         Left            =   120
         TabIndex        =   32
         Top             =   480
         Width           =   1092
      End
      Begin VB.ComboBox BGColor 
         Height          =   276
         ItemData        =   "fPop.frx":03CF
         Left            =   120
         List            =   "fPop.frx":03E8
         TabIndex        =   31
         Text            =   "색상"
         Top             =   3840
         Width           =   3012
      End
      Begin VB.TextBox rgbinput 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         Height          =   264
         Index           =   5
         Left            =   1560
         TabIndex        =   30
         Text            =   "255"
         Top             =   4200
         Visible         =   0   'False
         Width           =   612
      End
      Begin VB.TextBox rgbinput 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         Height          =   264
         Index           =   4
         Left            =   840
         TabIndex        =   29
         Text            =   "255"
         Top             =   4200
         Visible         =   0   'False
         Width           =   612
      End
      Begin VB.TextBox rgbinput 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         Height          =   264
         Index           =   3
         Left            =   120
         TabIndex        =   28
         Text            =   "255"
         Top             =   4200
         Visible         =   0   'False
         Width           =   612
      End
      Begin VB.CheckBox View3DGrid 
         Caption         =   "3차원 격자로 보기"
         Enabled         =   0   'False
         Height          =   180
         Left            =   120
         TabIndex        =   26
         Top             =   2880
         Width           =   1812
      End
      Begin VB.CommandButton comm 
         Appearance      =   0  '평면
         Caption         =   "적용"
         Height          =   252
         Left            =   2520
         MaskColor       =   &H00FFFFFF&
         Style           =   1  '그래픽
         TabIndex        =   25
         Top             =   360
         Width           =   612
      End
      Begin VB.TextBox rgbinput 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         Height          =   264
         Index           =   2
         Left            =   1560
         TabIndex        =   24
         Text            =   "255"
         Top             =   2400
         Visible         =   0   'False
         Width           =   612
      End
      Begin VB.TextBox rgbinput 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         Height          =   264
         Index           =   1
         Left            =   840
         TabIndex        =   23
         Text            =   "255"
         Top             =   2400
         Visible         =   0   'False
         Width           =   612
      End
      Begin VB.TextBox rgbinput 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         Height          =   264
         Index           =   0
         Left            =   120
         TabIndex        =   22
         Text            =   "255"
         Top             =   2400
         Visible         =   0   'False
         Width           =   612
      End
      Begin VB.ComboBox GridColor 
         Height          =   276
         ItemData        =   "fPop.frx":0429
         Left            =   120
         List            =   "fPop.frx":0442
         TabIndex        =   21
         Text            =   "색상"
         Top             =   2040
         Width           =   3012
      End
      Begin VB.TextBox GridText 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         Height          =   264
         Left            =   120
         TabIndex        =   19
         Text            =   "100"
         Top             =   1200
         Width           =   3012
      End
      Begin VB.Line Line6 
         BorderColor     =   &H00FFC0C0&
         X1              =   120
         X2              =   3120
         Y1              =   3240
         Y2              =   3240
      End
      Begin VB.Line Line5 
         BorderColor     =   &H00FFC0C0&
         X1              =   120
         X2              =   3120
         Y1              =   2760
         Y2              =   2760
      End
      Begin VB.Line Line4 
         BorderColor     =   &H00FFC0C0&
         X1              =   120
         X2              =   3120
         Y1              =   1560
         Y2              =   1560
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00FFC0C0&
         X1              =   120
         X2              =   3120
         Y1              =   720
         Y2              =   720
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFC0C0&
         X1              =   120
         X2              =   3120
         Y1              =   3120
         Y2              =   3120
      End
      Begin VB.Shape RGBShape2 
         BackColor       =   &H00FFFFFF&
         BackStyle       =   1  '투명하지 않음
         BorderStyle     =   0  '투명
         Height          =   252
         Left            =   2280
         Top             =   4200
         Visible         =   0   'False
         Width           =   852
      End
      Begin VB.Label L10 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "배경색을 선택하세요."
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   252
         Left            =   120
         TabIndex        =   27
         Top             =   3480
         Width           =   3012
      End
      Begin VB.Shape RGBShape 
         BackColor       =   &H00FFFFFF&
         BackStyle       =   1  '투명하지 않음
         BorderStyle     =   0  '투명
         Height          =   252
         Left            =   2280
         Top             =   2400
         Visible         =   0   'False
         Width           =   852
      End
      Begin VB.Label L9 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "격자색을 선택하세요."
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   252
         Left            =   120
         TabIndex        =   20
         Top             =   1680
         Width           =   3012
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00FFC0C0&
         X1              =   3240
         X2              =   3240
         Y1              =   360
         Y2              =   4560
      End
      Begin VB.Label L8 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H80000005&
         BorderStyle     =   1  '단일 고정
         Caption         =   "격자간격을 입력하세요. (10~500)"
         BeginProperty Font 
            Name            =   "맑은 고딕"
            Size            =   9
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   252
         Left            =   120
         TabIndex        =   18
         Top             =   840
         Width           =   3012
      End
   End
End
Attribute VB_Name = "fPop"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Bt_Click()
    If Bt.Caption = "등록" Then
        If Trim(inputs.Text) = "" Then
        Else
            SaveSetting App.ProductName, "App", "User", inputs.Text
                D_User = inputs.Text
            Bt.Caption = "확인"
            inputs.Text = CreatKey(8)
            inputs.Text = inputs.Text & "-" & CreatKey(3)
            SaveSetting App.ProductName, "App", "Key", inputs.Text
                D_Key = inputs.Text
        End If
    ElseIf Bt.Caption = "확인" Then
        Unload fStart
        fMain.Show
        Unload fPop
    End If
    
End Sub
Private Sub ChGrid_Click()
    If ChGrid.Value = 0 Then
        VisibleCheck (False)
    ElseIf ChGrid.Value = 1 Then
        VisibleCheck (True)
    Else
    End If
End Sub
Public Sub VisibleCheck(ByVal index As Boolean)

L8.Enabled = index
L9.Enabled = index
GridText.Enabled = index
GridColor.Enabled = index
rgbinput(0).Enabled = index
rgbinput(1).Enabled = index
rgbinput(2).Enabled = index
View3DGrid.Enabled = index

End Sub
Private Sub comm_Click()
Dim i As Integer
        For i = 0 To 5
            rgbinput(i).Visible = False
        Next i
            RGBShape2.Visible = False

Select Case GridColor.Text
    Case "빨간색"
        GridRGB = RGB(255, 0, 0)
    Case "파란색"
        GridRGB = RGB(0, 0, 255)
    Case "초록색"
        GridRGB = RGB(0, 255, 0)
    Case "노란색"
        GridRGB = RGB(255, 255, 0)
    Case "하얀색"
        GridRGB = RGB(255, 255, 255)
    Case "검은색"
        GridRGB = RGB(0, 0, 0)
    Case "사용자(RGB)"
        For i = 0 To 2
            rgbinput(i).Visible = True
        Next i
            RGBShape.Visible = True
End Select

Select Case BGColor.Text
    Case "빨간색"
        BGRGB = RGB(255, 0, 0)
    Case "파란색"
        BGRGB = RGB(0, 0, 255)
    Case "초록색"
        BGRGB = RGB(0, 255, 0)
    Case "노란색"
        BGRGB = RGB(255, 255, 0)
    Case "하얀색"
        BGRGB = RGB(255, 255, 255)
    Case "검은색"
        BGRGB = RGB(0, 0, 0)
    Case "사용자(RGB)"
        For i = 3 To 5
            rgbinput(i).Visible = True
        Next i
            RGBShape2.Visible = True
End Select
    fMain.BG.BackColor = BGRGB
End Sub
Private Sub Form_Load()
    fPop.ZOrder 0
   Me.Height = xF(0).Height
   Me.Width = xF(0).Width
L2.Caption = "Maybe Studio 3D 이미지 개발용 도구" & vbNewLine & vbNewLine & "이미지 확장자 : *.2Di, *.bmp, *.jpg, *.gif" & vbNewLine & "삼차원 확장자 : *.3Di, *.3Dini" _
              & vbNewLine & vbNewLine & "이 제품은 다음 사용자에게 허가됨" & vbNewLine & "[사용자 : " & D_User & "]" & vbNewLine & "[일련 번호 : " & D_Key & "]" & vbNewLine & "Visual Basic 6.0 사용됨" _
              & vbNewLine & vbNewLine & "제작 : MayTryArk(jiun0623@naver.com)" & vbNewLine & "오류는 오류코드와 함께 jiun0623@naver.com 으로 보내주십시오"
End Sub
Private Sub GridColor_Validate(Cancel As Boolean)
Call GridColorChange
End Sub
Private Sub GridColor_Change()
Call GridColorChange
End Sub
Private Sub GridColor_GotFocus()
Call GridColorChange
End Sub
Private Sub GridColor_LostFocus()
Call GridColorChange
End Sub
Private Sub GridColor_Scroll()
Call GridColorChange
End Sub
Private Sub GridColorChange()
Dim i As Integer
        For i = 0 To 2
            rgbinput(i).Visible = False
        Next i
            RGBShape.Visible = False

Select Case GridColor.Text
    Case "빨간색"
        GridRGB = RGB(255, 0, 0)
    Case "파란색"
        GridRGB = RGB(0, 0, 255)
    Case "초록색"
        GridRGB = RGB(0, 255, 0)
    Case "노란색"
        GridRGB = RGB(255, 255, 0)
    Case "하얀색"
        GridRGB = RGB(255, 255, 255)
    Case "검은색"
        GridRGB = RGB(0, 0, 0)
    Case "사용자(RGB)"
        For i = 0 To 2
            rgbinput(i).Visible = True
        Next i
            RGBShape.Visible = True
End Select
End Sub
Private Sub BGColor_Change()
Call BGColorChange
End Sub
Private Sub BGColor_Click()
Call BGColorChange
End Sub
Private Sub BGColor_GotFocus()
Call BGColorChange
End Sub
Private Sub BGColor_LostFocus()
Call BGColorChange
End Sub
Private Sub BGColor_Scroll()
Call BGColorChange
End Sub
Private Sub BGColorChange()
Dim i As Integer
        For i = 3 To 5
            rgbinput(i).Visible = False
        Next i
            RGBShape2.Visible = False

Select Case BGColor.Text
    Case "빨간색"
        BGRGB = RGB(255, 0, 0)
    Case "파란색"
        BGRGB = RGB(0, 0, 255)
    Case "초록색"
        BGRGB = RGB(0, 255, 0)
    Case "노란색"
        BGRGB = RGB(255, 255, 0)
    Case "하얀색"
        BGRGB = RGB(255, 255, 255)
    Case "검은색"
        BGRGB = RGB(0, 0, 0)
    Case "사용자(RGB)"
        For i = 3 To 5
            rgbinput(i).Visible = True
        Next i
            RGBShape2.Visible = True
End Select
End Sub
Private Sub GridText_Change()
    If Len(GridText.Text) <> 0 Then
    GridStep = fPop.GridText.Text
    End If
End Sub
Private Sub inputs_GotFocus()
    If inputs.Tag = "1" And Bt.Caption = "등록" Then
        inputs.Tag = "0"
        inputs.Text = ""
    End If
End Sub
Private Sub rgbinput_Change(index As Integer)
If index < 3 Then
RGBShape.BackColor = RGB(val(rgbinput(0).Text), val(rgbinput(1).Text), val(rgbinput(2).Text))
GridRGB = RGB(val(rgbinput(0).Text), val(rgbinput(1).Text), val(rgbinput(2).Text))
Else
RGBShape2.BackColor = RGB(val(rgbinput(3).Text), val(rgbinput(4).Text), val(rgbinput(5).Text))
BGRGB = RGB(val(rgbinput(3).Text), val(rgbinput(4).Text), val(rgbinput(5).Text))
End If
End Sub
Private Sub xF_Click(index As Integer)
Dim i As Integer
    For i = 0 To 4
        If xF(i).Expanded = False Then
            fPop.Visible = False
        End If
    Next i
End Sub
