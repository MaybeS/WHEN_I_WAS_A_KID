VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form F_Main 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  '����
   ClientHeight    =   4500
   ClientLeft      =   -30
   ClientTop       =   -360
   ClientWidth     =   9000
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "���� ���"
      Size            =   12
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "F_main.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   300
   ScaleMode       =   3  '�ȼ�
   ScaleWidth      =   600
   StartUpPosition =   1  '������ ���
   Begin MSComDlg.CommonDialog Cdlg 
      Left            =   120
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.ListBox List_ID 
      Height          =   375
      Left            =   2160
      TabIndex        =   7
      Top             =   2400
      Visible         =   0   'False
      Width           =   1695
   End
   Begin ProjectAyou.MayImage Image_Ico 
      Height          =   750
      Left            =   2160
      TabIndex        =   6
      Tag             =   "50�ȼ� �̹����� ����˴ϴ�."
      Top             =   2880
      Width           =   1080
      _ExtentX        =   1905
      _ExtentY        =   1323
      Border          =   3
      BorderAngle     =   10
      Picture         =   "F_main.frx":7939
      Arrow           =   1
      BackColor       =   16777215
   End
   Begin ProjectAyou.MayButton Button_Close 
      Height          =   300
      Left            =   8160
      TabIndex        =   2
      Top             =   -15
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   529
      Caption         =   "X"
      Border          =   2
      BackColor       =   8421631
      BorderAngle     =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "���� ���"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ProjectAyou.MayButton Button_Ok 
      Height          =   735
      Left            =   5160
      TabIndex        =   1
      Top             =   2880
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   1296
      Caption         =   "Ȯ��"
      Border          =   4
      BackColor       =   12632256
      Alpha           =   25
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "���� ���"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ProjectAyou.MayText Text_ID 
      Height          =   525
      Left            =   3120
      TabIndex        =   0
      Top             =   3000
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   926
      Border          =   3
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "���� ���"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      AutoSize        =   -1  'True
      MinSize         =   2175
      MaxSize         =   6500
      BorderAngle     =   0
   End
   Begin ProjectAyou.MayButton Button_Min 
      Height          =   300
      Left            =   7485
      TabIndex        =   3
      Top             =   -15
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   529
      Caption         =   "-"
      Border          =   2
      BackColor       =   16744576
      BorderAngle     =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "���� ���"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ProjectAyou.MayText TextPW 
      Height          =   525
      Left            =   3120
      TabIndex        =   8
      Top             =   3600
      Visible         =   0   'False
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   926
      PassWord        =   -1  'True
      Border          =   3
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "���� ���"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      AutoSize        =   -1  'True
      MinSize         =   2175
      MaxSize         =   6600
      BorderAngle     =   0
   End
   Begin VB.Label Label_Cris 
      AutoSize        =   -1  'True
      BackStyle       =   0  '����
      Caption         =   "you"
      BeginProperty Font 
         Name            =   "���� ���"
         Size            =   65.25
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   1740
      Index           =   3
      Left            =   4080
      TabIndex        =   11
      Top             =   1320
      Width           =   2310
   End
   Begin VB.Label Label_Cris 
      AutoSize        =   -1  'True
      BackStyle       =   0  '����
      Caption         =   "for"
      BeginProperty Font 
         Name            =   "���� ���"
         Size            =   36
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   975
      Index           =   2
      Left            =   3915
      TabIndex        =   10
      Top             =   1080
      Width           =   1005
   End
   Begin VB.Label Label_Cris 
      AutoSize        =   -1  'True
      BackStyle       =   0  '����
      Caption         =   "I"
      BeginProperty Font 
         Name            =   "���� ���"
         Size            =   72
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   1920
      Index           =   1
      Left            =   3480
      TabIndex        =   9
      Top             =   1080
      Width           =   450
   End
   Begin VB.Label Label_Cris 
      AutoSize        =   -1  'True
      BackStyle       =   0  '����
      Caption         =   "A"
      BeginProperty Font 
         Name            =   "���� ���"
         Size            =   72
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   1920
      Index           =   0
      Left            =   2520
      TabIndex        =   5
      Top             =   1080
      Width           =   1020
   End
   Begin VB.Label Text_null 
      AutoSize        =   -1  'True
      BackStyle       =   0  '����
      BorderStyle     =   1  '���� ����
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   4080
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.Menu mn_Tray 
      Caption         =   "SetTray"
      Visible         =   0   'False
      Begin VB.Menu mn_Cris 
         Caption         =   "Cris"
         Enabled         =   0   'False
      End
      Begin VB.Menu mn_Line0 
         Caption         =   "-"
      End
      Begin VB.Menu mn_LogOut 
         Caption         =   "�α׾ƿ�"
      End
      Begin VB.Menu mn_Setting 
         Caption         =   "ȯ�漳��"
      End
      Begin VB.Menu mn_Line1 
         Caption         =   "-"
      End
      Begin VB.Menu mn_exit 
         Caption         =   "������"
      End
   End
   Begin VB.Menu mn_Send 
      Caption         =   "Send"
      Visible         =   0   'False
      Begin VB.Menu Send_ToText 
         Caption         =   "�ؽ�Ʈ ���Ϸ� ��������"
      End
      Begin VB.Menu mn_Line2 
         Caption         =   "-"
      End
      Begin VB.Menu Send_ToTwitter 
         Caption         =   "Ʈ���Ϳ� �ø���"
      End
      Begin VB.Menu Send_Tofacebook 
         Caption         =   "���̽��Ͽ� �ø���"
      End
      Begin VB.Menu Send_toOthers 
         Caption         =   "�ٸ� SNS�� �ø���"
      End
   End
End
Attribute VB_Name = "F_Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Type BITMAPINFOHEADER
        biSize As Long
        biWidth As Long
        biHeight As Long
        biPlanes As Integer
        biBitCount As Integer
        biCompression As Long
        biSizeImage As Long
        biXPelsPerMeter As Long
        biYPelsPerMeter As Long
        biClrUsed As Long
        biClrImportant As Long
End Type
Private Type RGBQUAD
        rgbBlue As Byte
        rgbGreen As Byte
        rgbRed As Byte
        rgbReserved As Byte
End Type
Private Type BITMAPINFO
        bmiHeader As BITMAPINFOHEADER
        bmiColors() As RGBQUAD
End Type
Private Const DIB_RGB_COLORS = 0

Private Declare Function SetProcessWorkingSetSize Lib "kernel32" (ByVal hProcess As Long, ByVal dwMinimumWorkingSetSize As Long, ByVal dwMaximumWorkingSetSize As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Sub Button_Close_Click()

    SaveSet
    SaveLog
    SaveSetting "Ayou", "Ayou", "Run", "Close"
    Unload F_Main
    Unload F_Ayou
    Unload F_Memo
    Unload F_Noti
    Unload F_Sub
    
    End
    
End Sub
Private Sub Button_Min_Click()
    Me.WindowState = 1
End Sub
Private Sub Button_Ok_Click()

    If LenB(Trim(Text_ID.Text)) > 0 Then
    
        AyouLogIn
            
        For i = 0 To IDcnt
            
            If IDArray(i).ID = Text_ID.Text Then GoTo AID
            
        Next i
        
            SaveSetting "Ayou", "ID", "Cnt", GetSetting("Ayou", "ID", "Cnt", 0) + 1
            SaveSetting "Ayou", "ID", GetSetting("Ayou", "ID", "Cnt", 0) - 1, Text_ID.Text
            
AID:
        'ShowTip "Ayou", "�ȳ��ϼ���", 1
    End If
End Sub
Public Sub AyouLogIn()

        mn_Cris.Caption = Left(Text_ID.Text, StringCut(Text_ID.Text, 150, 0))
            If StringCut(Text_ID.Text, 150, 0) < Len(Text_ID.Text) Then mn_Cris.Caption = mn_Cris.Caption & "..."
            UserInfo.Name = Text_ID.Text
        CreatTray Me, "Ayou", "Ayou", GetLanInf("Text.4"), 1
        F_Main.Visible = False
        F_Ayou.Visible = False
        SetAyou
        
End Sub
Private Sub Form_Load()
Dim i As Integer

SetProcessWorkingSetSize GetCurrentProcess(), -1&, -1&
    '���μ��� �޸� �뷮 ����
    
B_bas.DrawLoad
    'ó�� �̹��� �׸���

List_ID.Clear: List_ID.Height = 25: List_ID.Top = 165
IDcnt = GetID
List_ID.AddItem "���� �����", List_ID.ListCount
    'ID List�� �ҷ����� ä��ϴ�.

LoadAyouSet
    '���� �ҷ�����
    
If GetSetting("Ayou", "App", "Install", False) = False Then MsgBox GetLanInf("Text.1"), vbCritical, "Ayou": End
    '��ġ ���θ� Ȯ��
    
If GetSetting("Ayou", "Ayou", "Run", "Close") = "Running" Then MsgBox GetLanInf("Text.2") & "�������� ����", vbInformation, "Ayou"
    '�������� ���� Ȯ��

If App.PrevInstance Then MsgBox GetLanInf("Text.3"), vbCritical + vbOKOnly, "Ayou": End
    '�ߺ� ������ �����մϴ�.

WindowTransparency F_Main.hWnd, byValue, , 225
    '�ش� ���� ������ 255-200 ���� �����մϴ�.
    
Text_ID_Change
    'Text_ID_Change�� ������� ��ġ�� ����ġ ��ŵ�ϴ�.
        
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        ReleaseCapture
        SendMessage hWnd, &HA1, 2, ByVal 0&
    End If
        '�ش����� �巡�׷� ������ �� �ְ��մϴ�.
End Sub
Private Sub Image_Ico_Click()

    If List_ID.Visible Then List_ID.Visible = False Else List_ID.Visible = True
    
End Sub
Private Sub Label_Ayou_MouseDown(index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    If Button = 1 Then
        ReleaseCapture
        SendMessage hWnd, &HA1, 2, ByVal 0&
    End If
        '�ش����� �巡�׷� ������ �� �ְ��մϴ�.
End Sub
Private Sub Label_Cris_MouseMove(index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    If Button = 1 Then
        ReleaseCapture
        SendMessage hWnd, &HA1, 2, ByVal 0&
    End If
        '�ش����� �巡�׷� ������ �� �ְ��մϴ�.
End Sub
Private Sub List_ID_Click()

    If List_ID.ListIndex = IDcnt Then
    
        Text_ID.Text = ""
        Text_ID.SetFocus
        
    Else
    
        Text_ID.Text = List_ID.List(List_ID.ListIndex)
        
    End If
    
End Sub
Private Sub mn_exit_Click()

    Button_Close_Click
    
End Sub
Private Sub mn_LogOut_Click()
On Error Resume Next

    UnloadTray
    Me.Refresh
    
    F_Ayou.Visible = False
    F_Sub.Visible = False
        AyouState.SubShow = False
    F_Memo.Visible = False
        AyouState.MemoVisible = False
    F_Noti.Visible = False
        cirsstate.NotiVisible = False
    
    Form_Load
    Me.Visible = True
        '�α׾ƿ��Ǿ�����
End Sub
Private Sub mn_Setting_Click()

    NHex = 2
    F_Ayou.HexRgn_Click 3
    
End Sub
Private Sub Send_ToText_Click()
Dim Xnr() As String

    SetWindowPos F_Sub.hWnd, -1, 0, 0, 0, 0, 1
    
    Cdlg.DialogTitle = "�ؽ�Ʈ ���Ϸ� ����"
    Cdlg.Filter = "�ؽ�Ʈ ����(*.txt) | *.txt"
    Cdlg.ShowSave
        
    Xnr = Split(Cdlg.FileName, "\")
    
    If Cdlg.FileName = "" Then Exit Sub
    
    If Dir(Cdlg.FileName) = "" Then
        
        SaveFileEX Cdlg.FileName, F_Sub.Text_Memo.Text
        
    Else
    
        If MsgBox("�̹� " & Xnr(UBound(Xnr)) & "�� �����մϴ� ����﷡��?", vbQuestion + vbYesNo, "Ayou") = 6 Then
        
            SaveFileEX Cdlg.FileName, F_Sub.Text_Memo.Text
        
        Else
            
            Exit Sub
        
        End If
        
    End If

    SetWindowPos F_Sub.hWnd, -1, 0, 0, 0, 0, &H2 Or &H1
    
End Sub
Private Sub Text_ID_Change()

    Text_ID.Left = 313 - ((Text_ID.Width + Button_Ok.Width - 10) / 2)
    Button_Ok.Left = Text_ID.Left + Text_ID.Width - 25
    Image_Ico.Left = Text_ID.Left - Image_Ico.Width + 7
    List_ID.Left = Image_Ico.Left
        '�ؽ�Ʈ���̰� ������������� ��ġ�� �������մϴ�.
        
End Sub
Private Sub Text_ID_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 13 Then Button_Ok_Click
    'EnterŰ�� ���������� OK��ư�� �����Ͱ� ����ȿ���� �����մϴ�.
    
End Sub
