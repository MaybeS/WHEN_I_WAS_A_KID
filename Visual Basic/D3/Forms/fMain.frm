VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form fMain 
   Caption         =   "D3_Editor - "
   ClientHeight    =   9735
   ClientLeft      =   135
   ClientTop       =   420
   ClientWidth     =   16455
   DrawWidth       =   5
   LinkTopic       =   "Form1"
   ScaleHeight     =   9735
   ScaleWidth      =   16455
   StartUpPosition =   2  '화면 가운데
   Begin VB.PictureBox contains 
      BackColor       =   &H00E0E0E0&
      Height          =   1092
      Left            =   7920
      ScaleHeight     =   1035
      ScaleWidth      =   1155
      TabIndex        =   14
      Top             =   0
      Visible         =   0   'False
      Width           =   1212
      Begin MSComDlg.CommonDialog dial 
         Left            =   120
         Top             =   120
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
   End
   Begin VB.PictureBox BarX 
      Align           =   4  '오른쪽 맞춤
      Appearance      =   0  '평면
      BackColor       =   &H80000005&
      BorderStyle     =   0  '없음
      ForeColor       =   &H80000008&
      Height          =   9732
      Left            =   13200
      ScaleHeight     =   9735
      ScaleWidth      =   3255
      TabIndex        =   5
      Top             =   0
      Width           =   3252
      Begin D3_Editor.xFrame xF 
         Height          =   9732
         Index           =   0
         Left            =   60
         TabIndex        =   10
         Top             =   0
         Width           =   3192
         _extentx        =   5630
         _extenty        =   17166
         caption         =   "라이브러리"
         enabled         =   -1
         enablegradient  =   -1
         font            =   "fMain.frx":0000
         fontbold        =   0
         fontitalic      =   0
         fontsize        =   7.8
         fontstrikethru  =   0
         fontunderline   =   0
         gradientbottom  =   16761024
         gradienttop     =   16777088
         headergradientbottom=   12611136
         Begin VB.ListBox Plist 
            Height          =   6180
            ItemData        =   "fMain.frx":0024
            Left            =   120
            List            =   "fMain.frx":0026
            TabIndex        =   12
            Top             =   360
            Width           =   3012
         End
         Begin VB.TextBox actLabel 
            Alignment       =   2  '가운데 맞춤
            Appearance      =   0  '평면
            Height          =   264
            Left            =   120
            TabIndex        =   11
            Text            =   "선택된 객체 없음"
            Top             =   6840
            Visible         =   0   'False
            Width           =   3012
         End
         Begin VB.Label ObjHeight 
            Alignment       =   1  '오른쪽 맞춤
            BackStyle       =   0  '투명
            Caption         =   "0"
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "0.000"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1042
               SubFormatType   =   1
            EndProperty
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Left            =   2868
            TabIndex        =   28
            Top             =   7920
            Width           =   144
         End
         Begin VB.Label ObjSeta 
            Alignment       =   1  '오른쪽 맞춤
            BackStyle       =   0  '투명
            Caption         =   "0"
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "0.000"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1042
               SubFormatType   =   1
            EndProperty
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   0
            Left            =   2868
            TabIndex        =   27
            Top             =   8640
            Width           =   144
         End
         Begin VB.Label ObjSeta 
            Alignment       =   1  '오른쪽 맞춤
            BackStyle       =   0  '투명
            Caption         =   "0"
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "0.000"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1042
               SubFormatType   =   1
            EndProperty
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   2
            Left            =   2880
            TabIndex        =   26
            Top             =   9360
            Width           =   144
         End
         Begin VB.Label ObjSeta 
            Alignment       =   1  '오른쪽 맞춤
            BackStyle       =   0  '투명
            Caption         =   "0"
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "0.000"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1042
               SubFormatType   =   1
            EndProperty
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   1
            Left            =   2880
            TabIndex        =   25
            Top             =   9000
            Width           =   144
         End
         Begin VB.Label ObjWidth 
            Alignment       =   1  '오른쪽 맞춤
            BackStyle       =   0  '투명
            Caption         =   "0"
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "0.000"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1042
               SubFormatType   =   1
            EndProperty
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Left            =   2868
            TabIndex        =   24
            Top             =   8280
            Width           =   144
         End
         Begin VB.Label ObjY 
            Alignment       =   1  '오른쪽 맞춤
            BackStyle       =   0  '투명
            Caption         =   "0"
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "0.000"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1042
               SubFormatType   =   1
            EndProperty
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Left            =   2880
            TabIndex        =   23
            Top             =   7560
            Width           =   144
         End
         Begin VB.Label ObjX 
            Alignment       =   1  '오른쪽 맞춤
            BackStyle       =   0  '투명
            Caption         =   "0"
            BeginProperty DataFormat 
               Type            =   1
               Format          =   "0.000"
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1042
               SubFormatType   =   1
            EndProperty
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Left            =   2880
            TabIndex        =   22
            Top             =   7200
            Width           =   144
         End
         Begin VB.Line Ml 
            Index           =   1
            X1              =   120
            X2              =   3120
            Y1              =   8600
            Y2              =   8600
         End
         Begin VB.Line Ml 
            Index           =   0
            X1              =   120
            X2              =   3120
            Y1              =   7870
            Y2              =   7870
         End
         Begin VB.Label ObjWidthLabel 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   ".Width ="
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Left            =   120
            TabIndex        =   21
            Top             =   8280
            Width           =   984
         End
         Begin VB.Label ObjHeightLabel 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   ".Height ="
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Left            =   120
            TabIndex        =   20
            Top             =   7920
            Width           =   1044
         End
         Begin VB.Label SetaLabel 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   ".Seta(Z) ="
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   2
            Left            =   120
            TabIndex        =   19
            Top             =   9360
            Width           =   1080
         End
         Begin VB.Label SetaLabel 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   ".Seta(Y) ="
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   1
            Left            =   120
            TabIndex        =   18
            Top             =   9000
            Width           =   1104
         End
         Begin VB.Label SetaLabel 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   ".Seta(X) ="
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   0
            Left            =   120
            TabIndex        =   17
            Top             =   8640
            Width           =   1104
         End
         Begin VB.Label ObjYLabel 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   ".Y ="
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Left            =   120
            TabIndex        =   16
            Top             =   7560
            Width           =   456
         End
         Begin VB.Label ObjXLabel 
            AutoSize        =   -1  'True
            BackStyle       =   0  '투명
            Caption         =   ".X ="
            BeginProperty Font 
               Name            =   "나눔고딕"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Left            =   120
            TabIndex        =   15
            Top             =   7200
            Width           =   456
         End
         Begin VB.Label actText 
            Alignment       =   2  '가운데 맞춤
            Appearance      =   0  '평면
            BackColor       =   &H80000005&
            BorderStyle     =   1  '단일 고정
            Caption         =   "선택된 객체 없음"
            ForeColor       =   &H80000008&
            Height          =   252
            Left            =   120
            TabIndex        =   13
            Top             =   6840
            Width           =   3012
         End
      End
      Begin VB.Label Xwidth 
         Alignment       =   2  '가운데 맞춤
         Appearance      =   0  '평면
         BackColor       =   &H00000000&
         BorderStyle     =   1  '단일 고정
         ForeColor       =   &H80000008&
         Height          =   9732
         Left            =   0
         MousePointer    =   9  'W E 크기 조정
         TabIndex        =   9
         Top             =   0
         Width           =   60
      End
   End
   Begin VB.PictureBox BG 
      Appearance      =   0  '평면
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  '없음
      ForeColor       =   &H80000008&
      Height          =   9240
      Left            =   360
      ScaleHeight     =   616
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   841
      TabIndex        =   0
      Top             =   240
      Width           =   12612
      Begin VB.CommandButton Command1 
         Caption         =   "z"
         Height          =   255
         Index           =   5
         Left            =   2760
         TabIndex        =   8
         Top             =   480
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "y"
         Height          =   255
         Index           =   4
         Left            =   1440
         TabIndex        =   7
         Top             =   480
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "x"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   6
         Top             =   480
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "x"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   3
         Top             =   120
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "y"
         Height          =   255
         Index           =   1
         Left            =   1440
         TabIndex        =   2
         Top             =   120
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "z"
         Height          =   255
         Index           =   2
         Left            =   2760
         TabIndex        =   1
         Top             =   120
         Width           =   1215
      End
   End
   Begin VB.PictureBox picBox 
      Height          =   972
      Index           =   0
      Left            =   0
      ScaleHeight     =   61
      ScaleMode       =   3  '픽셀
      ScaleWidth      =   61
      TabIndex        =   4
      Top             =   0
      Width           =   972
   End
   Begin VB.Menu m_File 
      Caption         =   "파일"
      Begin VB.Menu F_open3D 
         Caption         =   "3D 이미지 불러오기"
      End
      Begin VB.Menu F_open2D 
         Caption         =   "2D 이미지 불러오기"
      End
      Begin VB.Menu Mline0 
         Caption         =   "-"
      End
      Begin VB.Menu F_new3D 
         Caption         =   "새로운 3D 문서"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline24 
         Caption         =   "-"
      End
      Begin VB.Menu F_Save 
         Caption         =   "저장"
      End
      Begin VB.Menu F_Saveas 
         Caption         =   "다른 이름으로 저장"
      End
      Begin VB.Menu Mline1 
         Caption         =   "-"
      End
      Begin VB.Menu F_recent 
         Caption         =   "최근 이미지"
         Enabled         =   0   'False
         Begin VB.Menu F_R_ 
            Caption         =   "최근 문서 없음"
            Enabled         =   0   'False
            Index           =   0
         End
         Begin VB.Menu F_R_ 
            Caption         =   ""
            Index           =   1
            Visible         =   0   'False
         End
         Begin VB.Menu F_R_ 
            Caption         =   ""
            Index           =   2
            Visible         =   0   'False
         End
         Begin VB.Menu F_R_ 
            Caption         =   ""
            Index           =   3
            Visible         =   0   'False
         End
         Begin VB.Menu F_R_ 
            Caption         =   ""
            Index           =   4
            Visible         =   0   'False
         End
      End
      Begin VB.Menu Mline2 
         Caption         =   "-"
      End
      Begin VB.Menu F_Trans 
         Caption         =   "변환"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline3 
         Caption         =   "-"
      End
      Begin VB.Menu F_Close 
         Caption         =   "현재 문서 닫기"
         Enabled         =   0   'False
      End
      Begin VB.Menu F_Exit 
         Caption         =   "끝내기"
      End
   End
   Begin VB.Menu m_con 
      Caption         =   "편집"
      Begin VB.Menu C_Undo 
         Caption         =   "실행 취소"
         Enabled         =   0   'False
      End
      Begin VB.Menu mlin6 
         Caption         =   "-"
      End
      Begin VB.Menu C_copy 
         Caption         =   "객체 복사"
         Enabled         =   0   'False
      End
      Begin VB.Menu C_Cis 
         Caption         =   "객체 잘라내기"
         Enabled         =   0   'False
      End
      Begin VB.Menu C_conColor 
         Caption         =   "이미지 색상변형"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline13 
         Caption         =   "-"
      End
      Begin VB.Menu C_Joi 
         Caption         =   "객체 묶기"
         Enabled         =   0   'False
      End
      Begin VB.Menu C_elu 
         Caption         =   "객체 분리"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline14 
         Caption         =   "-"
      End
      Begin VB.Menu C_AOcon 
         Caption         =   "모든 객체 좌표 수정"
         Enabled         =   0   'False
      End
      Begin VB.Menu C_AOjoi 
         Caption         =   "모든 객체 묶기"
         Enabled         =   0   'False
      End
      Begin VB.Menu C_AOelu 
         Caption         =   "모든 객체 분리"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline15 
         Caption         =   "-"
      End
      Begin VB.Menu C_new3Dworld 
         Caption         =   "현재문서를 3D로..."
      End
   End
   Begin VB.Menu m_object 
      Caption         =   "객체"
      Begin VB.Menu O_RotateS 
         Caption         =   "회전"
         Begin VB.Menu O_Rotate 
            Caption         =   "X축 회전"
            Checked         =   -1  'True
            Index           =   0
         End
         Begin VB.Menu O_Rotate 
            Caption         =   "Y축 회전"
            Checked         =   -1  'True
            Index           =   1
         End
         Begin VB.Menu O_Rotate 
            Caption         =   "Z축 회전"
            Checked         =   -1  'True
            Index           =   2
         End
         Begin VB.Menu O_ARotate 
            Caption         =   "모든 축 회전"
         End
         Begin VB.Menu O_RotateRate 
            Caption         =   "회전값 : 5"
         End
         Begin VB.Menu Mline12 
            Caption         =   "-"
         End
         Begin VB.Menu O_RotateZero 
            Caption         =   "0으로 돌리기"
         End
         Begin VB.Menu Mline9 
            Caption         =   "-"
         End
         Begin VB.Menu O_RotateStart 
            Caption         =   "회전 시작"
         End
         Begin VB.Menu Mline23 
            Caption         =   "-"
         End
         Begin VB.Menu O_RotateRnd 
            Caption         =   "임의 재생"
            Visible         =   0   'False
         End
      End
      Begin VB.Menu Mline10 
         Caption         =   "-"
      End
      Begin VB.Menu O_imageC 
         Caption         =   "이미지 편집"
         Enabled         =   0   'False
      End
      Begin VB.Menu O_imageCon 
         Caption         =   "이미지 설정"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline17 
         Caption         =   "-"
      End
      Begin VB.Menu O_joiImage 
         Caption         =   "묶인 이미지"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline11 
         Caption         =   "-"
      End
      Begin VB.Menu O_XYZcon 
         Caption         =   "좌표 수정"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu m_cam 
      Caption         =   "카메라"
      Begin VB.Menu C_newCam 
         Caption         =   "새 카메라"
         Enabled         =   0   'False
      End
      Begin VB.Menu C_configCam 
         Caption         =   "카메라 좌표 수정"
         Enabled         =   0   'False
      End
      Begin VB.Menu C_delCam 
         Caption         =   "카메라 위치삭제"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline8 
         Caption         =   "-"
      End
      Begin VB.Menu C_incCamE 
         Caption         =   "카메라 효과 주기"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu m_view 
      Caption         =   "보기"
      Begin VB.Menu V_C 
         Caption         =   "축"
         Begin VB.Menu V_Cx 
            Caption         =   "x축"
         End
         Begin VB.Menu V_Cy 
            Caption         =   "y축"
         End
         Begin VB.Menu V_Cz 
            Caption         =   "z축"
         End
         Begin VB.Menu Mline19 
            Caption         =   "-"
         End
         Begin VB.Menu V_Ca 
            Caption         =   "모두보기"
         End
      End
      Begin VB.Menu V_CamXY 
         Caption         =   "카메라 위치"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline6 
         Caption         =   "-"
      End
      Begin VB.Menu V_3DRader 
         Caption         =   "3차원 래더링"
         Enabled         =   0   'False
      End
      Begin VB.Menu V_anti 
         Caption         =   "안티앨리어스"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline7 
         Caption         =   "-"
      End
      Begin VB.Menu V_lib 
         Caption         =   "라이브러리"
         Checked         =   -1  'True
      End
      Begin VB.Menu V_Browser 
         Caption         =   "브라우저"
         Enabled         =   0   'False
      End
      Begin VB.Menu V_recent 
         Caption         =   "최근 작업한 내용"
         Enabled         =   0   'False
      End
      Begin VB.Menu Mline27 
         Caption         =   "-"
      End
      Begin VB.Menu V_Setting 
         Caption         =   "환경설정"
      End
   End
   Begin VB.Menu m_help 
      Caption         =   "도움말"
      Begin VB.Menu H_ 
         Caption         =   "D3 Editor 도움말"
         Index           =   0
      End
      Begin VB.Menu H_ 
         Caption         =   "D3 Editor 정보"
         Index           =   1
      End
      Begin VB.Menu H_ 
         Caption         =   "D3 Editor 업데이트"
         Enabled         =   0   'False
         Index           =   2
      End
      Begin VB.Menu Mline4 
         Caption         =   "-"
      End
      Begin VB.Menu H_S 
         Caption         =   "시스템 정보"
      End
      Begin VB.Menu Mline5 
         Caption         =   "-"
      End
      Begin VB.Menu H_H 
         Caption         =   "제품 만족도 설문지"
         Enabled         =   0   'False
      End
   End
End
Attribute VB_Name = "fMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private MouX As Long, MouXs As Long, MouXY As Boolean, MXY As POINTAPI    '마우스 좌표 XY
Private Sub actLabel_DblClick()
            If Mid(actLabel.Text, 1, 4) = "(3D)" Or Mid(actLabel.Text, 1, 4) = "(3d)" Then
                    MsgBox "(3D) 를 임의로 파일 이름에 집어넣을 수 없습니다.", vbCritical + vbOKOnly, "경고"
                If Len(actLabel.Text) = 4 Then
                    Exit Sub
                Else
                    actLabel.Text = Mid(actLabel.Text, 5)
                End If
            ElseIf Mid(actLabel.Text, 1, 1) = ">" Then
                    MsgBox "> 를 임의로 파일 이름에 집어넣을 수 없습니다.", vbCritical + vbOKOnly, "경고"
                If Len(actLabel.Text) = 1 Then
                    Exit Sub
                Else
                    actLabel.Text = Mid(actLabel.Text, 2)
                End If
            Else
            
            End If
        actLabel.Alignment = 2
        actText.Caption = actLabel.Tag & actLabel.Text
        actLabel.Visible = False
        Plist.List(ActIndex - 1) = actLabel.Tag & actLabel.Text
End Sub
Private Sub actLabel_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
            If Mid(actLabel.Text, 1, 4) = "(3D)" Or Mid(actLabel.Text, 1, 4) = "(3d)" Then
                    MsgBox "(3D) 를 임의로 파일 이름에 집어넣을 수 없습니다.", vbCritical + vbOKOnly, "경고"
                If Len(actLabel.Text) = 4 Then
                    Exit Sub
                Else
                    actLabel.Text = Mid(actLabel.Text, 5)
                End If
            ElseIf Mid(actLabel.Text, 1, 1) = ">" Then
                    MsgBox "> 를 임의로 파일 이름에 집어넣을 수 없습니다.", vbCritical + vbOKOnly, "경고"
                If Len(actLabel.Text) = 1 Then
                    Exit Sub
                Else
                    actLabel.Text = Mid(actLabel.Text, 2)
                End If
            Else
            
            End If
        actLabel.Alignment = 2
        actText.Caption = actLabel.Tag & actLabel.Text
        actLabel.Visible = False
        Plist.List(ActIndex - 1) = actLabel.Tag & actLabel.Text
    End If
End Sub
Private Sub actText_DblClick()
            If Mid(actText.Caption, 1, 4) = "(3D)" Then
                actLabel.Text = Mid(actText.Caption, 5)
                actLabel.Tag = "(3D)"
            ElseIf Mid(actText.Caption, 1, 1) = ">" Then
                actLabel.Text = Mid(actText.Caption, 2)
                actLabel.Tag = ">"
            Else
                actLabel.Text = actText.Caption
                actLabel.Tag = ""
            End If
        actLabel.Visible = True
        actLabel.Alignment = 0
        actLabel.SetFocus
        actLabel.SelStart = 0
        actLabel.SelLength = Len(actLabel.Text)
End Sub
Private Sub C_new3Dworld_Click()
Dim TCN As Integer
If Plist.ListCount = 0 Then
Else
    TCN = MsgBox("현재 모든 객체를 하나의 3D 문서로 만드시겠습니까?", vbYesNo + vbQuestion, "새로운 3D 생성")
        If TCN = 6 Then
            '여기에 코드가 들어갑니다.'
            
        Else
        End If
End If
End Sub
Private Sub Command1_Click(index As Integer)
    Select Case index
           Case 0
               SetaX(ActIndex) = SetaX(ActIndex) + SetaPlus
               Command1(index).Caption = SetaX(ActIndex)
           Case 1
               SetaY(ActIndex) = SetaY(ActIndex) + SetaPlus
               Command1(index).Caption = SetaY(ActIndex)
           Case 2
               SetaZ(ActIndex) = SetaZ(ActIndex) + SetaPlus
               Command1(index).Caption = SetaZ(ActIndex)
            Case 3
               SetaX(ActIndex) = SetaX(ActIndex) - SetaPlus
               Command1(index).Caption = SetaX(ActIndex)
            Case 4
               SetaY(ActIndex) = SetaY(ActIndex) - SetaPlus
               Command1(index).Caption = SetaY(ActIndex)
            Case 5
               SetaZ(ActIndex) = SetaZ(ActIndex) - SetaPlus
               Command1(index).Caption = SetaZ(ActIndex)
    End Select
    
    If SetaX(ActIndex) >= 360 Then
        SetaX(ActIndex) = SetaX(ActIndex) - 360
    ElseIf SetaX(ActIndex) <= -360 Then
        SetaX(ActIndex) = SetaX(ActIndex) + 360
    End If
    If SetaY(ActIndex) >= 360 Then
        SetaY(ActIndex) = SetaY(ActIndex) - 360
    ElseIf SetaY(ActIndex) <= -360 Then
        SetaY(ActIndex) = SetaY(ActIndex) + 360
    End If
    If SetaZ(ActIndex) >= 360 Then
        SetaZ(ActIndex) = SetaZ(ActIndex) - 360
    ElseIf SetaZ(ActIndex) <= -360 Then
        SetaZ(ActIndex) = SetaZ(ActIndex) + 360
    End If
End Sub
Private Sub F_Exit_Click()
    Call Form_Unload(99)
End Sub
Public Sub OpenImage(ByVal URL As String, ByVal Name As String)
Dim opFile As String
        Load fMain.picBox(Plist.ListCount + 1)
            Plist.AddItem (Name)
        ActIndex = Plist.ListCount
                With fMain.picBox(ActIndex)
                    .Visible = True
                    .AutoSize = True
                    .ScaleMode = 3
                    .AutoRedraw = True
                    .Picture = LoadPicture(URL)
                    .Tag = opFile
                    
                    PointXYZ(ActIndex, 2, 0) = -(.Width / 4)
                    PointXYZ(ActIndex, 2, 1) = (.Height / 4)
                    PointXYZ(ActIndex, 2, 2) = 0
                    PointXYZ(ActIndex, 3, 0) = (.Width / 4)
                    PointXYZ(ActIndex, 3, 1) = (.Height / 4)
                    PointXYZ(ActIndex, 3, 2) = 0
                    PointXYZ(ActIndex, 0, 0) = -(.Width / 4)
                    PointXYZ(ActIndex, 0, 1) = -(.Height / 4)
                    PointXYZ(ActIndex, 0, 2) = 0
                    PointXYZ(ActIndex, 1, 0) = (.Width / 4)
                    PointXYZ(ActIndex, 1, 1) = -(.Height / 4)
                    PointXYZ(ActIndex, 1, 2) = 0
                End With
                    
            fMain.actText.Caption = fMain.Plist.List(ActIndex - 1)
            fMain.actLabel.Text = fMain.Plist.List(ActIndex - 1)
End Sub
Private Sub F_open2D_Click()
Dim opFile As String
    With dial
        .DialogTitle = "불러올 이미지 찾기"
        .CancelError = False
        .Filter = "이미지파일(*.jpg,*.bmp,*.gif)|*.jpg;*.bmp;*.gif"
        .ShowOpen
            If Len(.FileName) = 0 Then
                Exit Sub
            End If
       opFile = .FileName
    End With
        Call OpenImage(opFile, opFile)
        Call mMain.SetaSetting(ActIndex)
End Sub
Private Sub F_open3D_Click()
Dim opFile As String
    With dial
        .DialogTitle = "불러올 이미지 찾기"
        .CancelError = False
        .Filter = "3차원 정보파일(*.3Dini,*.3Di)|*.3Dini;*.3Di"
        .ShowOpen
            If Len(.FileName) = 0 Then
                Exit Sub
            End If
       opFile = .FileName
    End With
Dim LocalURL As String, LocalURLFile As String, Dumps As String
Dim Num As String, NameSpaceK As String, SetaInput As String, i As Integer
        Close #1
        Open (opFile) For Input As #1
        Line Input #1, LocalURLFile
        Line Input #1, Dumps
        Line Input #1, LocalURL
        Line Input #1, Dumps
        Line Input #1, Num

        Load fMain.picBox(Plist.ListCount + 1)
        Plist.AddItem ("(3D)" & LocalURLFile)
        Listmap(Plist.ListCount) = val(Num)
        
            For i = 1 To val(Num)
                Line Input #1, NameSpaceK
                    Call OpenImage(LocalURL & "\" & Mid(NameSpaceK, 2), NameSpaceK)
                Line Input #1, SetaInput
                    SetaX(ActIndex) = val(SetaInput)
                Line Input #1, SetaInput
                    SetaY(ActIndex) = val(SetaInput)
                Line Input #1, SetaInput
                    SetaZ(ActIndex) = val(SetaInput)
            Next i
End Sub

Private Sub Form_Load()
    fStart.Visible = False
    Call mMain.Setting
    Call mMain.MainLoop
End Sub
Public Sub Form_Resize()
                Call ResizeForm
Dim i As Integer
If fMain.Height = 384 Then
ElseIf fMain.Height < 4300 Then
        fMain.Height = 4300
        fMain.Xwidth.Height = fMain.Height - 100
Else
        BG.Height = fMain.Height - 650
        fMain.Xwidth.Height = fMain.Height - 100
        xF(0).Height = fMain.Height
        actLabel.Top = fMain.Height - 3732
        actText.Top = fMain.Height - 3732
        Plist.Height = fMain.Height - 4224
        
        ObjHeightLabel.Top = fMain.Height - (10572 - 7920)
        ObjWidthLabel.Top = fMain.Height - (10572 - 8280)
        ObjHeight.Top = ObjHeightLabel.Top
        ObjWidth.Top = ObjWidthLabel.Top
        ObjXLabel.Top = fMain.Height - (10572 - 7200)
        ObjYLabel.Top = fMain.Height - (10572 - 7560)
        ObjX.Top = ObjXLabel.Top
        ObjY.Top = ObjYLabel.Top
        Ml(0).Y1 = fMain.Height - (10572 - 7870)
        Ml(0).Y2 = Ml(0).Y1
        Ml(1).Y1 = fMain.Height - (10572 - 8600)
        Ml(1).Y2 = Ml(1).Y1
        
        For i = 0 To 2
            SetaLabel(i).Top = fMain.Height - 1212 - 360 * i
            ObjSeta(i).Top = fMain.Height - 1212 - 360 * i
        Next i
End If
If fMain.Width = 1920 Then
ElseIf fMain.Width - fMain.BarX.Width < 500 Then
        fMain.Width = 500 + fMain.BarX.Width * Int(fMain.BarX.Visible) * -1
Else
        BG.Width = fMain.Width - fMain.BarX.Width * Int(fMain.BarX.Visible) * -1 - 80
End If
    fMain.Caption = fMain.Tag & "   World.W:" & BG.Width & ".H" & BG.Height

        FHeight = fMain.BG.Height / 12
        FWidth = fMain.BG.Width / 12

End Sub
Private Sub Form_Unload(Cancel As Integer)
    SaveSettings
End
End Sub
Private Sub H__Click(index As Integer)
    Call ViewPop(index)
End Sub
Private Sub H_S_Click()
    Call ViewSys
End Sub
Private Sub O_ARotate_Click()
Dim i As Integer
    For i = 0 To 2
        O_Rotate(i).Checked = True
    Next i
End Sub
Private Sub O_Rotate_Click(index As Integer)
                If O_Rotate(index).Checked = True Then
                    O_Rotate(index).Checked = False
                Else
                    O_Rotate(index).Checked = True
                End If
End Sub
Private Sub O_RotateRate_Click()
On Error Resume Next
    SetaPlus = InputBox("회전값을 입력 ( >1pic )", "회전값")
    O_RotateRate.Caption = "회전값 : " & SetaPlus
    SetaPlus = SetaPlus
End Sub
Private Sub O_RotateRnd_Click()
    If O_RotateRnd.Checked = False Then
        O_RotateRnd.Checked = True
        RotateRN = True
    Else
        O_RotateRnd.Checked = False
        RotateRN = False
    End If
End Sub
Private Sub O_RotateStart_Click()
    If O_RotateStart.Checked = False Then
        O_RotateRnd.Visible = True
        O_RotateStart.Checked = True
        RotateR = True
        RotateCNT = 0
    Else
        O_RotateStart.Checked = False
        RotateR = False
        O_RotateRnd.Visible = False
    End If
End Sub
Private Sub Plist_Click()
        actLabel.Alignment = 2
        actLabel.Visible = False
        
        ActIndex = Plist.ListIndex + 1
        actLabel.Text = Plist.List(Plist.ListIndex)
        actText.Caption = Plist.List(Plist.ListIndex)
End Sub
Private Sub Plist_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If ActIndex <> 0 Then
    If Button = 2 Then
        PopupMenu fStart.Plist
    End If
End If
End Sub
Public Sub V_lib_Click()
    If V_lib.Checked = True Then
        V_lib.Checked = False
        BarX.Visible = False
    Else
        V_lib.Checked = True
        BarX.Visible = True
    End If
Call Form_Resize
End Sub

Private Sub V_Setting_Click()
        Call ViewPop(4)
End Sub
Private Sub Xwidth_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
        MouXY = True
            GetCursorPos MXY
            MouX = MXY.X - (fMain.Left / 12)
            BarXW = fMain.BarX.Width
End Sub
Private Sub Xwidth_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If MouXY Then                                                   '마우스 좌표
        GetCursorPos MXY
        MouXs = MXY.X - (fMain.Left / 12)
        
        With fMain
                .Plist.Width = fMain.BarX.Width - 150 - fMain.xF(0).Left
                .actLabel.Width = fMain.BarX.Width - 150 - fMain.xF(0).Left
                .actText.Width = fMain.BarX.Width - 150 - fMain.xF(0).Left
                .xF(0).Width = fMain.BarX.Width - 60
        End With
                
                FWidth = fMain.BG.Width / 12
                
            If BarXW + 12 * (MouX - MouXs) < 1500 Then
                fMain.BarX.Width = 1500
                BG.Width = fMain.Width - fMain.BarX.Width
                Exit Sub
            Else
                fMain.BarX.Width = BarXW + 12 * (MouX - MouXs)
            End If
            If fMain.Width - fMain.BarX.Width < 2000 Then
                fMain.BarX.Width = fMain.Width - 2000
                BG.Width = fMain.Width - fMain.BarX.Width
                Exit Sub
            Else
                BG.Width = fMain.Width - fMain.BarX.Width
            End If
    End If
End Sub
Private Sub Xwidth_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
        MouXY = False
End Sub
