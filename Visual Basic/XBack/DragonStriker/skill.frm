VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form skill 
   BorderStyle     =   4  '���� ���� â
   Caption         =   "Skill [Ver 0.6631]"
   ClientHeight    =   4095
   ClientLeft      =   45
   ClientTop       =   6330
   ClientWidth     =   3075
   ControlBox      =   0   'False
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "skill.frx":0000
   MousePointer    =   99  '����� ����
   ScaleHeight     =   4095
   ScaleWidth      =   3075
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      BackColor       =   &H000000FF&
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2800
      MaskColor       =   &H00FFFFFF&
      Style           =   1  '�׷���
      TabIndex        =   0
      Top             =   0
      Width           =   255
   End
   Begin VB.Timer ��ųǥ�� 
      Interval        =   1
      Left            =   2160
      Top             =   0
   End
   Begin VB.Timer �ǰ�� 
      Interval        =   1
      Left            =   1800
      Top             =   0
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   3615
      Left            =   0
      TabIndex        =   3
      Top             =   480
      Width           =   3075
      _ExtentX        =   5424
      _ExtentY        =   6376
      _Version        =   393216
      Tabs            =   5
      TabsPerRow      =   5
      TabHeight       =   520
      TabCaption(0)   =   "0��"
      TabPicture(0)   =   "skill.frx":030A
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "�ʺ���"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "1��"
      TabPicture(1)   =   "skill.frx":0326
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "����1��(2)"
      Tab(1).Control(1)=   "����1��(1)"
      Tab(1).Control(2)=   "ttt2"
      Tab(1).ControlCount=   3
      TabCaption(2)   =   "2��"
      TabPicture(2)   =   "skill.frx":0342
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "ttt3"
      Tab(2).ControlCount=   1
      TabCaption(3)   =   "3��"
      TabPicture(3)   =   "skill.frx":035E
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "ttt4"
      Tab(3).ControlCount=   1
      TabCaption(4)   =   "�ñ�"
      TabPicture(4)   =   "skill.frx":037A
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "Label9"
      Tab(4).ControlCount=   1
      Begin VB.Frame ����1�� 
         Height          =   3135
         Index           =   2
         Left            =   -74880
         TabIndex        =   23
         Top             =   3720
         Width           =   2775
         Begin VB.CommandButton Com1 
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   6
            Left            =   2280
            TabIndex        =   42
            Top             =   2685
            Width           =   300
         End
         Begin VB.CommandButton Com1 
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   5
            Left            =   2280
            TabIndex        =   41
            Top             =   1845
            Width           =   300
         End
         Begin VB.CommandButton Com1 
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   4
            Left            =   2280
            TabIndex        =   40
            Top             =   1005
            Width           =   300
         End
         Begin VB.Label skw1 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ų����(Ŭ��)"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   6
            Left            =   720
            TabIndex        =   54
            Top             =   2685
            Width           =   1815
         End
         Begin VB.Label skna 
            Alignment       =   2  '��� ����
            Caption         =   "���� ���ο�"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   9
            Left            =   1440
            TabIndex        =   53
            ToolTipText     =   "��Ƽ��"
            Top             =   2400
            Width           =   1215
         End
         Begin VB.Label sk1 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   6
            Left            =   960
            TabIndex        =   52
            Top             =   2400
            Width           =   375
         End
         Begin VB.Label Label8 
            Caption         =   "Lv"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   51
            Top             =   2400
            Width           =   255
         End
         Begin VB.Label skw1 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ų����(Ŭ��)"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   5
            Left            =   720
            TabIndex        =   50
            Top             =   1845
            Width           =   1815
         End
         Begin VB.Label skna 
            Alignment       =   2  '��� ����
            Caption         =   "������"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   8
            Left            =   1440
            TabIndex        =   49
            Tag             =   "������"
            ToolTipText     =   "��ú�"
            Top             =   1560
            Width           =   1215
         End
         Begin VB.Label sk1 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   5
            Left            =   960
            TabIndex        =   48
            Top             =   1560
            Width           =   375
         End
         Begin VB.Label Label7 
            Caption         =   "Lv"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   47
            Top             =   1560
            Width           =   255
         End
         Begin VB.Label skw1 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ų����(Ŭ��)"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   4
            Left            =   720
            TabIndex        =   46
            Top             =   1005
            Width           =   1815
         End
         Begin VB.Label sk1 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   4
            Left            =   960
            TabIndex        =   45
            Top             =   720
            Width           =   375
         End
         Begin VB.Label Label5 
            Caption         =   "Lv"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   44
            Top             =   720
            Width           =   255
         End
         Begin VB.Label skna 
            Alignment       =   2  '��� ����
            Caption         =   "���õ� Ȱ���"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   7
            Left            =   1440
            TabIndex        =   43
            Tag             =   "���õ� Ȱ���"
            ToolTipText     =   "��ú�"
            Top             =   720
            Width           =   1215
         End
         Begin VB.Image skm1 
            BorderStyle     =   1  '���� ����
            Height          =   585
            Index           =   6
            Left            =   120
            Picture         =   "skill.frx":0396
            Stretch         =   -1  'True
            ToolTipText     =   "��Ƽ��"
            Top             =   2400
            Width           =   570
         End
         Begin VB.Image skm1 
            BorderStyle     =   1  '���� ����
            Height          =   585
            Index           =   5
            Left            =   120
            Picture         =   "skill.frx":0FDA
            Stretch         =   -1  'True
            ToolTipText     =   "��ú�"
            Top             =   1560
            Width           =   570
         End
         Begin VB.Line Line11 
            X1              =   120
            X2              =   2640
            Y1              =   2205
            Y2              =   2205
         End
         Begin VB.Line Line10 
            X1              =   120
            X2              =   2640
            Y1              =   1395
            Y2              =   1395
         End
         Begin VB.Line Line9 
            X1              =   120
            X2              =   2640
            Y1              =   600
            Y2              =   600
         End
         Begin VB.Image skm1 
            BorderStyle     =   1  '���� ����
            Height          =   570
            Index           =   4
            Left            =   120
            Picture         =   "skill.frx":19E6
            Stretch         =   -1  'True
            ToolTipText     =   "��ú�"
            Top             =   720
            Width           =   555
         End
         Begin VB.Label ���̵� 
            Alignment       =   2  '��� ����
            BackColor       =   &H00FFC0C0&
            Caption         =   "�ü� ���̵�"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   0
            Left            =   480
            TabIndex        =   24
            Top             =   240
            Width           =   2175
         End
         Begin VB.Line Line5 
            X1              =   120
            X2              =   2640
            Y1              =   600
            Y2              =   600
         End
         Begin VB.Image imo 
            BorderStyle     =   1  '���� ����
            Height          =   375
            Index           =   5
            Left            =   120
            Picture         =   "skill.frx":2A6A
            Stretch         =   -1  'True
            Top             =   240
            Width           =   375
         End
      End
      Begin VB.Frame ����1�� 
         Height          =   3135
         Index           =   1
         Left            =   -74880
         TabIndex        =   21
         Top             =   360
         Width           =   2775
         Begin VB.CommandButton Com1 
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   3
            Left            =   2280
            TabIndex        =   27
            Top             =   2685
            Width           =   300
         End
         Begin VB.CommandButton Com1 
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   2
            Left            =   2280
            TabIndex        =   26
            Top             =   1845
            Width           =   300
         End
         Begin VB.CommandButton Com1 
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   1
            Left            =   2280
            TabIndex        =   25
            Top             =   1005
            Width           =   300
         End
         Begin VB.Label skw1 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ų����(Ŭ��)"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   3
            Left            =   720
            TabIndex        =   39
            Top             =   2685
            Width           =   1815
         End
         Begin VB.Label skna 
            Alignment       =   2  '��� ����
            Caption         =   "�˱�"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   6
            Left            =   1440
            TabIndex        =   38
            ToolTipText     =   "��Ƽ��"
            Top             =   2400
            Width           =   1215
         End
         Begin VB.Label sk1 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   3
            Left            =   960
            TabIndex        =   37
            Top             =   2400
            Width           =   375
         End
         Begin VB.Label Label4 
            Caption         =   "Lv"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   36
            Top             =   2400
            Width           =   255
         End
         Begin VB.Label skw1 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ų����(Ŭ��)"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   2
            Left            =   720
            TabIndex        =   35
            Top             =   1845
            Width           =   1815
         End
         Begin VB.Label skna 
            Alignment       =   2  '��� ����
            Caption         =   "��Ʈ����ũ"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   5
            Left            =   1440
            TabIndex        =   34
            ToolTipText     =   "��Ƽ��"
            Top             =   1560
            Width           =   1215
         End
         Begin VB.Label sk1 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   2
            Left            =   960
            TabIndex        =   33
            Top             =   1560
            Width           =   375
         End
         Begin VB.Label Label2 
            Caption         =   "Lv"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   32
            Top             =   1560
            Width           =   255
         End
         Begin VB.Label skw1 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ų����(Ŭ��)"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   1
            Left            =   720
            TabIndex        =   31
            Top             =   1005
            Width           =   1815
         End
         Begin VB.Label sk1 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   1
            Left            =   960
            TabIndex        =   30
            Top             =   720
            Width           =   375
         End
         Begin VB.Label Label1 
            Caption         =   "Lv"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   29
            Top             =   720
            Width           =   255
         End
         Begin VB.Label skna 
            Alignment       =   2  '��� ����
            Caption         =   "���� ��Ʈ"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   4
            Left            =   1440
            TabIndex        =   28
            Tag             =   "���� ��Ʈ"
            ToolTipText     =   "��ú�"
            Top             =   720
            Width           =   1215
         End
         Begin VB.Image skm1 
            BorderStyle     =   1  '���� ����
            Height          =   585
            Index           =   3
            Left            =   120
            Picture         =   "skill.frx":E9EC
            Stretch         =   -1  'True
            ToolTipText     =   "��Ƽ��"
            Top             =   2400
            Width           =   570
         End
         Begin VB.Image skm1 
            BorderStyle     =   1  '���� ����
            Height          =   585
            Index           =   2
            Left            =   120
            Picture         =   "skill.frx":F140
            Stretch         =   -1  'True
            ToolTipText     =   "��Ƽ��"
            Top             =   1560
            Width           =   570
         End
         Begin VB.Line Line8 
            X1              =   120
            X2              =   2640
            Y1              =   2205
            Y2              =   2205
         End
         Begin VB.Line Line7 
            X1              =   120
            X2              =   2640
            Y1              =   1395
            Y2              =   1395
         End
         Begin VB.Line Line6 
            X1              =   120
            X2              =   2640
            Y1              =   600
            Y2              =   600
         End
         Begin VB.Image skm1 
            BorderStyle     =   1  '���� ����
            Height          =   570
            Index           =   1
            Left            =   120
            Picture         =   "skill.frx":101C4
            Stretch         =   -1  'True
            ToolTipText     =   "��ú�"
            Top             =   720
            Width           =   555
         End
         Begin VB.Image imo 
            BorderStyle     =   1  '���� ����
            Height          =   375
            Index           =   1
            Left            =   120
            Picture         =   "skill.frx":10918
            Stretch         =   -1  'True
            Top             =   240
            Width           =   375
         End
         Begin VB.Line Line4 
            X1              =   120
            X2              =   2640
            Y1              =   600
            Y2              =   600
         End
         Begin VB.Label ���̵� 
            Alignment       =   2  '��� ����
            BackColor       =   &H00FFC0C0&
            Caption         =   "���� ���̵�"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   2
            Left            =   480
            TabIndex        =   22
            Top             =   240
            Width           =   2175
         End
      End
      Begin VB.Frame �ʺ��� 
         Caption         =   "�ʺ���"
         Height          =   3135
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   2775
         Begin VB.CommandButton sb1 
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Left            =   2280
            TabIndex        =   7
            Top             =   1000
            Width           =   300
         End
         Begin VB.CommandButton sb2 
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Left            =   2280
            TabIndex        =   6
            Top             =   1840
            Width           =   300
         End
         Begin VB.CommandButton sb3 
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Left            =   2280
            TabIndex        =   5
            Top             =   2680
            Width           =   300
         End
         Begin VB.Image skm 
            BorderStyle     =   1  '���� ����
            Height          =   570
            Index           =   1
            Left            =   120
            Picture         =   "skill.frx":1C89A
            Stretch         =   -1  'True
            ToolTipText     =   "��Ƽ��"
            Top             =   720
            Width           =   555
         End
         Begin VB.Label ���̵� 
            Alignment       =   2  '��� ����
            BackColor       =   &H00FFC0C0&
            Caption         =   "�ʺ��� ���̵�"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   12
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   1
            Left            =   480
            TabIndex        =   20
            Top             =   240
            Width           =   2175
         End
         Begin VB.Line Line1 
            X1              =   120
            X2              =   2640
            Y1              =   600
            Y2              =   600
         End
         Begin VB.Line Line2 
            X1              =   120
            X2              =   2640
            Y1              =   1400
            Y2              =   1400
         End
         Begin VB.Line Line3 
            X1              =   120
            X2              =   2640
            Y1              =   2200
            Y2              =   2200
         End
         Begin VB.Image skm 
            BorderStyle     =   1  '���� ����
            Height          =   585
            Index           =   2
            Left            =   120
            Picture         =   "skill.frx":1D3A4
            Stretch         =   -1  'True
            ToolTipText     =   "��ú�"
            Top             =   1560
            Width           =   570
         End
         Begin VB.Image imo 
            BorderStyle     =   1  '���� ����
            Height          =   375
            Index           =   0
            Left            =   120
            Picture         =   "skill.frx":1DEAE
            Stretch         =   -1  'True
            Top             =   240
            Width           =   375
         End
         Begin VB.Image skm 
            BorderStyle     =   1  '���� ����
            Height          =   585
            Index           =   3
            Left            =   120
            Picture         =   "skill.frx":29E30
            Stretch         =   -1  'True
            ToolTipText     =   "��Ƽ��"
            Top             =   2400
            Width           =   570
         End
         Begin VB.Label skna 
            Alignment       =   2  '��� ����
            Caption         =   "���ǵ��"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   1
            Left            =   1440
            TabIndex        =   19
            Tag             =   "���ǵ��"
            ToolTipText     =   "��ú�"
            Top             =   720
            Width           =   1215
         End
         Begin VB.Label Label3 
            Caption         =   "Lv"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   18
            Top             =   720
            Width           =   255
         End
         Begin VB.Label sk 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   1
            Left            =   960
            TabIndex        =   17
            Top             =   720
            Width           =   375
         End
         Begin VB.Label skw 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ų����(Ŭ��)"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   1
            Left            =   720
            TabIndex        =   16
            Top             =   1000
            Width           =   1815
         End
         Begin VB.Label Label6 
            Caption         =   "Lv"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   15
            Top             =   1560
            Width           =   255
         End
         Begin VB.Label sk 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   2
            Left            =   960
            TabIndex        =   14
            Top             =   1560
            Width           =   375
         End
         Begin VB.Label skna 
            Alignment       =   2  '��� ����
            Caption         =   "ũ��Ƽ����ġ"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   2
            Left            =   1440
            TabIndex        =   13
            Tag             =   "ũ��Ƽ����ġ"
            ToolTipText     =   "��ú�"
            Top             =   1560
            Width           =   1215
         End
         Begin VB.Label skw 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ų����(Ŭ��)"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   2
            Left            =   720
            TabIndex        =   12
            Top             =   1840
            Width           =   1815
         End
         Begin VB.Label Label10 
            Caption         =   "Lv"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   11
            Top             =   2400
            Width           =   255
         End
         Begin VB.Label sk 
            Alignment       =   1  '������ ����
            BorderStyle     =   1  '���� ����
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9.75
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   3
            Left            =   960
            TabIndex        =   10
            Top             =   2400
            Width           =   375
         End
         Begin VB.Label skna 
            Alignment       =   2  '��� ����
            Caption         =   "ȸ�������͸�"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   8.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   3
            Left            =   1440
            TabIndex        =   9
            Tag             =   "ȸ�������͸�"
            ToolTipText     =   "��ú�"
            Top             =   2400
            Width           =   1215
         End
         Begin VB.Label skw 
            Alignment       =   2  '��� ����
            BorderStyle     =   1  '���� ����
            Caption         =   "��ų����(Ŭ��)"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   9
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   3
            Left            =   720
            TabIndex        =   8
            Top             =   2680
            Width           =   1815
         End
      End
      Begin VB.Label Label9 
         Alignment       =   2  '��� ����
         Caption         =   "���� 100�� ����   ������ ���ϴ�."
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   15.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   -74880
         TabIndex        =   58
         Top             =   1440
         Width           =   2775
      End
      Begin VB.Label ttt4 
         Alignment       =   2  '��� ����
         Caption         =   "���� 3�������� ���� �����̽��ϴ�."
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   15.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   -74880
         TabIndex        =   57
         Top             =   1440
         Width           =   2775
      End
      Begin VB.Label ttt3 
         Alignment       =   2  '��� ����
         Caption         =   "���� 2�������� ���� �����̽��ϴ�."
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   15.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   -74880
         TabIndex        =   56
         Top             =   1440
         Width           =   2775
      End
      Begin VB.Label ttt2 
         Alignment       =   2  '��� ����
         Caption         =   "���� 1�������� ���� �����̽��ϴ�."
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   15.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   -74880
         TabIndex        =   55
         Top             =   1440
         Width           =   2775
      End
   End
   Begin VB.Label kp 
      BorderStyle     =   1  '���� ����
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   1200
      TabIndex        =   2
      Top             =   120
      Width           =   495
   End
   Begin VB.Label Label14 
      Caption         =   "Skill Point"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "skill"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim tabping
Dim ke(100)
Private Sub ��ųǥ��_Timer()

If Val(sk(1).Caption) > 0 Then
skm(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\skill\���ǵ��.spu.bmp")
End If
If Val(sk(2).Caption) > 0 Then
skm(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\skill\ũ��Ƽ����ġ.spu.bmp")
End If
If Val(sk(3).Caption) > 0 Then
skm(3).Picture = LoadPicture("C:\Program Files\DragonStriker\root\skill\ȸ��.spu.bmp")
End If
If Val(sk1(1).Caption) > 0 Then
skm1(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\skill\������Ʈ.spu.bmp")
End If
If Val(sk1(2).Caption) > 0 Then
skm1(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\skill\��ǳ��������.spu.bmp")
End If
If Val(sk1(3).Caption) > 0 Then
skm1(3).Picture = LoadPicture("C:\Program Files\DragonStriker\root\skill\�˱�.spu.bmp")
End If
If Val(sk1(4).Caption) > 0 Then
skm1(4).Picture = LoadPicture("C:\Program Files\DragonStriker\root\skill\���õ� Ȱ���.spu.bmp")
End If
If Val(sk1(5).Caption) > 0 Then
skm1(5).Picture = LoadPicture("C:\Program Files\DragonStriker\root\skill\����.spu.bmp")
End If
If Val(sk1(6).Caption) > 0 Then
skm1(6).Picture = LoadPicture("C:\Program Files\DragonStriker\root\skill\����.spu.bmp")
End If

End Sub
Private Sub �ǰ��_Timer()

If tabping = 1 Then
    If SSTab1.Tab = 0 Then
    
    ElseIf SSTab1.Tab = 1 Then
        If map.job.Caption <> "�ʺ���" Then
            ����1��(1).Top = -5000: ����1��(2).Top = -5000
            ����1��(Val(map.jobit.Caption)).Top = 360
        Else
            gh = MsgBox("���� 1�������� ������ ���߽��ϴ�.���� 10�� �ڵ����� ���������� ������ ���Ե˴ϴ�.", vbCritical, "��ų����FF201.6")
            SSTab1.Tab = 0
        End If
    ElseIf SSTab1.Tab = 2 Then
            gh = MsgBox("���� 2�������� ������ ���߽��ϴ�.", vbCritical, "��ų����FF201.6")
            SSTab1.Tab = 0
    ElseIf SSTab1.Tab = 3 Then
            gh = MsgBox("���� 3�������� ������ ���߽��ϴ�.", vbCritical, "��ų����FF201.6")
            SSTab1.Tab = 0
    ElseIf SSTab1.Tab = 4 Then
            gh = MsgBox("���� 100�� ���� ���߽��ϴ�.", vbCritical, "��ų����FF201.6")
            SSTab1.Tab = 0
    End If
tabping = 0
End If

End Sub
Private Sub Com1_Click(Index As Integer)

If Val(kp.Caption) > 0 And sk1(Index).Caption < 20 Then

    sk1(Index).Caption = sk1(Index).Caption + 1
    kp.Caption = kp.Caption - 1
    
End If

End Sub
Private Sub Command1_Click()
skill.Visible = False
End Sub
Private Sub Form_Load()
o = 64
For i = (1 + o) To (100 + o)

Next i
End Sub

Private Sub sb1_Click()
If kp.Caption >= 1 And sk(1).Caption < 5 Then

sk(1).Caption = sk(1).Caption + 1
kp.Caption = kp.Caption - 1

End If
End Sub
Private Sub sb2_Click()
If kp.Caption >= 1 And sk(2).Caption < 5 Then

sk(2).Caption = sk(2).Caption + 1
kp.Caption = kp.Caption - 1

End If
End Sub
Private Sub sb3_Click()
If kp.Caption >= 1 And sk(3).Caption < 5 Then

sk(3).Caption = sk(3).Caption + 1
kp.Caption = kp.Caption - 1

End If
End Sub
Private Sub Timer1_Timer()
kp.Caption = kp
End Sub
Private Sub skw_Click(Index As Integer)
If sk(Index) > 0 Then
    If Index = 1 Then
    tu = MsgBox("�̵��ӵ��� 4% ��ŭ ���������ݴϴ�.  ���罺ų���� : " & sk(1) & "     ���� �̵��ӵ� : " & (90 + (sk(1) * 4)), , "��ų����")
    ElseIf Index = 2 Then
    tu = MsgBox((sk(2) * 5 + 15) & "%Ȯ�� �� ���ݷ���" & (sk(2) * 20 + 100) & "% �� ������ ����", , "��ų����")
    ElseIf Index = 3 Then
    tu = MsgBox("ü�� ���ð� (8 - " & (sk(3) / 10) & ")��   ü�� �� + " & (sk(3) * 3), , "��ų����")
    End If
End If
End Sub
Private Sub skw1_Click(Index As Integer)
If sk1(Index) > 0 Then
    If Index = 1 Then
    tu = MsgBox("���ݷ� " & (sk1(1) * 2) & ", ���� " & (sk1(1) * 0.5) & "�� �������� �ݴϴ�.", , "��ų����")
    ElseIf Index = 2 Then
    tu = MsgBox("������ ���ݷ���" & (sk1(2) * 6) + 140 & "% �� �������� �ݴϴ�. [Mp" & ((sk1(2) * 2) + 20) & "]", , "��ų����")
    ElseIf Index = 3 Then
    tu = MsgBox("�տ��ִ� �ټ��� ������ ���ݷ��� " & (sk1(3) * 5 + 40) & "%�� �������� �ݴϴ�. [Mp" & ((sk1(3) * 1.5) + 30) & "  HP" & (Int((sk1(3) * 0.5) + 0.5) + 10) & "]", , "��ų����")
    ElseIf Index = 4 Then
    tu = MsgBox("���ݷ� +" & sk1(4) * 1 & "   ũ��Ƽ����ġ�� ũ��Ƽ�ùߵ�Ȯ�� +" & sk1(4) * 2 & "%    ũ��Ƽ�� ��ġ�� ����� +" & sk1(4) * 4 & "%  �� �ο��Ѵ�", , "��ų����")
    ElseIf Index = 5 Then
    tu = MsgBox("ȭ���� �Ÿ� +" & (sk1(5) * 20 + 200) & "�� ȭ��ӵ� +" & ((sk1(5) * 3) + 60) & "�� �ɷ��� ���´�.", , "��ų����")
    ElseIf Index = 6 Then
    tu = MsgBox("������ ���ݷ���" & (sk1(6) * 4) + 40 & "%�� �������� 2�� �ݴϴ�. [Mp" & ((sk1(6) * 3) + 10) & "]", , "��ų����")
    End If
End If
End Sub
Private Sub SSTab1_DblClick()
tabping = 1
End Sub
