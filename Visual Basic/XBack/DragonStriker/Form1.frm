VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form map 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  '���� ����
   Caption         =   "RPG_DragonStriker: Ver BETA TEST 0.1.420748"
   ClientHeight    =   5790
   ClientLeft      =   135
   ClientTop       =   690
   ClientWidth     =   14850
   ControlBox      =   0   'False
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "Form1.frx":11C2
   MousePointer    =   99  '����� ����
   ScaleHeight     =   5790
   ScaleWidth      =   14850
   Visible         =   0   'False
   WhatsThisHelp   =   -1  'True
   Begin VB.Timer Ti2 
      Interval        =   500
      Left            =   1800
      Tag             =   "0"
      Top             =   360
   End
   Begin VB.Timer Ti 
      Interval        =   1000
      Left            =   1440
      Top             =   360
   End
   Begin VB.Timer ������ǥ��2 
      Interval        =   170
      Left            =   2160
      Top             =   360
   End
   Begin VB.Timer �W���� 
      Interval        =   1
      Left            =   11280
      Top             =   4200
   End
   Begin VB.Timer ���ɸ� 
      Interval        =   1
      Left            =   7920
      Top             =   0
   End
   Begin VB.Timer npc��ġ 
      Interval        =   1
      Left            =   7560
      Top             =   0
   End
   Begin VB.Timer ����hp 
      Interval        =   1
      Left            =   7200
      Top             =   0
   End
   Begin VB.Frame �޴� 
      BackColor       =   &H00FFC0C0&
      Caption         =   "�޴�"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   2055
      Left            =   6600
      TabIndex        =   59
      Top             =   -5000
      Width           =   1935
      Begin VB.Label Label6 
         BackStyle       =   0  '����
         Caption         =   "��"
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
         Left            =   1560
         TabIndex        =   65
         Top             =   0
         Width           =   255
      End
      Begin VB.Label Label5 
         Alignment       =   2  '��� ����
         BackColor       =   &H00FF8080&
         Caption         =   "[�̿ϼ�]"
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
         TabIndex        =   64
         Top             =   1680
         Width           =   1695
      End
      Begin VB.Label Label4 
         Alignment       =   2  '��� ����
         BackColor       =   &H00FF8080&
         Caption         =   "[�̿ϼ�]"
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
         TabIndex        =   63
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label Label2 
         Alignment       =   2  '��� ����
         BackColor       =   &H00FF8080&
         Caption         =   "���� ����"
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
         TabIndex        =   62
         Top             =   960
         Width           =   1695
      End
      Begin VB.Label Ű���� 
         Alignment       =   2  '��� ����
         BackColor       =   &H00FF8080&
         Caption         =   "Ű����"
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
         TabIndex        =   61
         Top             =   600
         Width           =   1695
      End
      Begin VB.Label save 
         Alignment       =   2  '��� ����
         BackColor       =   &H00FF8080&
         Caption         =   "Save"
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
         TabIndex        =   60
         Top             =   240
         Width           =   1695
      End
   End
   Begin VB.Timer ������ġ 
      Interval        =   1
      Left            =   0
      Top             =   360
   End
   Begin VB.Timer ȭ�� 
      Interval        =   10
      Left            =   1080
      Top             =   360
   End
   Begin VB.Timer �������� 
      Interval        =   60000
      Left            =   720
      Top             =   360
   End
   Begin VB.Timer m�̵� 
      Interval        =   500
      Left            =   360
      Top             =   360
   End
   Begin VB.Timer mgen 
      Interval        =   5000
      Left            =   6840
      Top             =   0
   End
   Begin VB.Timer ���� 
      Interval        =   300
      Left            =   6480
      Top             =   0
   End
   Begin VB.Frame �����Գ��°� 
      Height          =   1695
      Left            =   11725
      TabIndex        =   42
      Top             =   3840
      Width           =   3135
      Begin VB.Label pdpd 
         BackStyle       =   0  '����
         Caption         =   "PaDw"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   2190
         TabIndex        =   50
         Top             =   1350
         Width           =   495
      End
      Begin VB.Label endend 
         BackStyle       =   0  '����
         Caption         =   "End"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   1250
         TabIndex        =   49
         Top             =   1350
         Width           =   495
      End
      Begin VB.Label deldel 
         BackStyle       =   0  '����
         Caption         =   "Del"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   270
         TabIndex        =   48
         Top             =   1350
         Width           =   375
      End
      Begin VB.Label pupu 
         BackStyle       =   0  '����
         Caption         =   "PaUP"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   2200
         TabIndex        =   47
         Top             =   650
         Width           =   495
      End
      Begin VB.Label homehome 
         BackStyle       =   0  '����
         Caption         =   "Home"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   1250
         TabIndex        =   46
         Top             =   650
         Width           =   495
      End
      Begin VB.Label insins 
         BackStyle       =   0  '����
         Caption         =   "Ins"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   270
         TabIndex        =   45
         Top             =   600
         Width           =   375
      End
      Begin VB.Image pd 
         BorderStyle     =   1  '���� ����
         Height          =   615
         Left            =   2160
         Picture         =   "Form1.frx":14CC
         Stretch         =   -1  'True
         Top             =   960
         Width           =   735
      End
      Begin VB.Image pu 
         BorderStyle     =   1  '���� ����
         Height          =   615
         Left            =   2160
         Picture         =   "Form1.frx":69E42
         Stretch         =   -1  'True
         Top             =   240
         Width           =   735
      End
      Begin VB.Image en 
         BorderStyle     =   1  '���� ����
         Height          =   615
         Left            =   1200
         Picture         =   "Form1.frx":D27B8
         Stretch         =   -1  'True
         Top             =   960
         Width           =   735
      End
      Begin VB.Image hom 
         BorderStyle     =   1  '���� ����
         Height          =   615
         Left            =   1200
         Picture         =   "Form1.frx":13B12E
         Stretch         =   -1  'True
         Top             =   240
         Width           =   735
      End
      Begin VB.Image del 
         BorderStyle     =   1  '���� ����
         Height          =   615
         Left            =   240
         Picture         =   "Form1.frx":1A3AA4
         Stretch         =   -1  'True
         Top             =   960
         Width           =   735
      End
      Begin VB.Image ins 
         BorderStyle     =   1  '���� ����
         Height          =   615
         Left            =   240
         Picture         =   "Form1.frx":20C41A
         Stretch         =   -1  'True
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.Timer �߿���׿ø��� 
      Interval        =   7500
      Left            =   6120
      Top             =   0
   End
   Begin VB.Timer exp�ۼ�Ʈ 
      Interval        =   1
      Left            =   5400
      Top             =   0
   End
   Begin VB.Timer expǥ�� 
      Interval        =   1
      Left            =   5040
      Top             =   0
   End
   Begin VB.Timer mpǥ�� 
      Interval        =   1
      Left            =   4320
      Top             =   0
   End
   Begin VB.Timer hpǥ�� 
      Interval        =   1
      Left            =   4680
      Top             =   0
   End
   Begin VB.Timer upefect 
      Interval        =   1
      Left            =   1800
      Top             =   0
   End
   Begin VB.Timer ĳ���Ͱ��´µ����� 
      Interval        =   170
      Left            =   2520
      Top             =   0
   End
   Begin VB.Timer ����ǥ�� 
      Interval        =   170
      Left            =   2160
      Top             =   0
   End
   Begin VB.Timer hp���׹��� 
      Interval        =   1
      Left            =   3960
      Top             =   0
   End
   Begin VB.Timer hp�� 
      Interval        =   8000
      Left            =   3600
      Top             =   0
   End
   Begin VB.Timer ����Ÿ�̸� 
      Interval        =   1
      Left            =   3240
      Top             =   0
   End
   Begin VB.Timer ��ȭ�������� 
      Interval        =   1
      Left            =   2880
      Top             =   0
   End
   Begin VB.Timer mon 
      Interval        =   1
      Left            =   1440
      Top             =   0
   End
   Begin VB.Timer ah 
      Interval        =   500
      Left            =   1080
      Top             =   0
   End
   Begin VB.Timer as 
      Interval        =   1000
      Left            =   720
      Top             =   0
   End
   Begin VB.CommandButton ���ϱ� 
      Caption         =   "���ϱ�"
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
      Left            =   9000
      TabIndex        =   25
      ToolTipText     =   "�� ��ư�� ������ ���� �Ҽ��ֽ��ϴ�. [ġƮŰ����]"
      Top             =   3960
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   120
      MouseIcon       =   "Form1.frx":274D90
      TabIndex        =   24
      Text            =   "��ȭ�� ������ �Է��ϼ���"
      Top             =   3960
      Visible         =   0   'False
      Width           =   8775
   End
   Begin VB.Timer �̵� 
      Interval        =   1
      Left            =   360
      Top             =   0
   End
   Begin VB.Timer npc 
      Interval        =   500
      Left            =   5760
      Top             =   0
   End
   Begin VB.Frame Frame2 
      Height          =   1215
      Left            =   50
      TabIndex        =   0
      Top             =   4320
      Width           =   14775
      Begin VB.Frame lvF 
         Height          =   495
         Left            =   120
         TabIndex        =   1
         Top             =   600
         Width           =   975
         Begin VB.Label lv 
            Alignment       =   2  '��� ����
            Caption         =   "1"
            BeginProperty Font 
               Name            =   "����"
               Size            =   9
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   2
            Top             =   170
            Width           =   735
         End
      End
      Begin WMPLibCtl.WindowsMediaPlayer wma1 
         Height          =   495
         Left            =   9960
         TabIndex        =   77
         Top             =   600
         Visible         =   0   'False
         Width           =   495
         URL             =   "C:\DragonStriker\root\sound\02BattleOfRose.wma"
         rate            =   1
         balance         =   0
         currentPosition =   0
         defaultFrame    =   ""
         playCount       =   1
         autoStart       =   -1  'True
         currentMarker   =   0
         invokeURLs      =   -1  'True
         baseURL         =   ""
         volume          =   50
         mute            =   0   'False
         uiMode          =   "full"
         stretchToFit    =   0   'False
         windowlessVideo =   0   'False
         enabled         =   -1  'True
         enableContextMenu=   -1  'True
         fullScreen      =   0   'False
         SAMIStyle       =   ""
         SAMILang        =   ""
         SAMIFilename    =   ""
         captioningID    =   ""
         enableErrorDialogs=   0   'False
         _cx             =   873
         _cy             =   873
      End
      Begin VB.Label ũ���� 
         BackStyle       =   0  '����
         BorderStyle     =   1  '���� ����
         Caption         =   "jiun0623^heonsheen CopyRight��2008     :::::::    J and H    ::::::::         Algo Korea"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   9960
         TabIndex        =   44
         Top             =   120
         Width           =   1695
      End
      Begin VB.Label expexp 
         Alignment       =   2  '��� ����
         BackStyle       =   0  '����
         Caption         =   "0 %"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   8040
         TabIndex        =   33
         Top             =   720
         Width           =   975
      End
      Begin VB.Shape exp�� 
         BorderWidth     =   2
         Height          =   375
         Left            =   7560
         Top             =   720
         Width           =   2000
      End
      Begin VB.Shape mp�� 
         BorderWidth     =   2
         Height          =   375
         Left            =   4560
         Top             =   720
         Width           =   1995
      End
      Begin VB.Shape hp�� 
         BorderWidth     =   2
         Height          =   375
         Left            =   1800
         Top             =   720
         Width           =   1995
      End
      Begin VB.Label ��� 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "���(E)"
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
         Left            =   4800
         TabIndex        =   22
         Top             =   120
         Width           =   735
      End
      Begin VB.Label ���� 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "����(S)"
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
         Left            =   3960
         TabIndex        =   21
         Tag             =   "0"
         Top             =   120
         Width           =   735
      End
      Begin VB.Label ��ų 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "��ų(K)"
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
         Left            =   3120
         TabIndex        =   20
         Tag             =   "0"
         Top             =   120
         Width           =   735
      End
      Begin VB.Label �κ��丮 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "�κ��丮(I)"
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
         Left            =   2040
         TabIndex        =   19
         Top             =   120
         Width           =   975
      End
      Begin VB.Label ��ǥ�� 
         Caption         =   "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��"
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
         Left            =   6600
         TabIndex        =   18
         Top             =   120
         Width           =   3255
      End
      Begin VB.Label ��ǥ�ó�Ÿ���� 
         Caption         =   "���� ��ġ : "
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
         Left            =   5760
         TabIndex        =   17
         Top             =   120
         Width           =   855
      End
      Begin VB.Shape hpc 
         BorderWidth     =   2
         FillColor       =   &H000000FF&
         FillStyle       =   0  '�ܻ�
         Height          =   375
         Left            =   1800
         Top             =   720
         Width           =   1995
      End
      Begin VB.Label hpm 
         Alignment       =   2  '��� ����
         Caption         =   "50"
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
         Left            =   3000
         TabIndex        =   16
         Top             =   480
         Width           =   735
      End
      Begin VB.Label hp������ 
         Caption         =   "/"
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
         Left            =   2760
         TabIndex        =   15
         Top             =   480
         Width           =   135
      End
      Begin VB.Label hpn 
         Alignment       =   2  '��� ����
         Caption         =   "50"
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
         Left            =   1920
         TabIndex        =   14
         Top             =   480
         Width           =   735
      End
      Begin VB.Label hp��Ÿ���� 
         Caption         =   "HP"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H008080FF&
         Height          =   375
         Left            =   1320
         TabIndex        =   13
         Top             =   720
         Width           =   375
      End
      Begin VB.Label mp��Ÿ���� 
         Caption         =   "MP"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF8080&
         Height          =   375
         Left            =   3960
         TabIndex        =   12
         Top             =   720
         Width           =   525
      End
      Begin VB.Shape mpc 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         FillColor       =   &H00FF0000&
         FillStyle       =   0  '�ܻ�
         Height          =   375
         Left            =   4560
         Top             =   720
         Width           =   1995
      End
      Begin VB.Label mpn 
         Alignment       =   2  '��� ����
         Caption         =   "25"
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
         Left            =   4680
         TabIndex        =   11
         Top             =   480
         Width           =   615
      End
      Begin VB.Label mp������ 
         Caption         =   "/"
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
         Left            =   5400
         TabIndex        =   10
         Top             =   480
         Width           =   135
      End
      Begin VB.Label mpm 
         Alignment       =   2  '��� ����
         Caption         =   "25"
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
         Left            =   5640
         TabIndex        =   9
         Top             =   480
         Width           =   735
      End
      Begin VB.Shape exp 
         FillColor       =   &H0000FFFF&
         FillStyle       =   0  '�ܻ�
         Height          =   375
         Left            =   7560
         Top             =   720
         Width           =   15
      End
      Begin VB.Label exp��Ÿ���� 
         Caption         =   "EXP"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   12
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0080FFFF&
         Height          =   375
         Left            =   6840
         TabIndex        =   8
         Top             =   720
         Width           =   615
      End
      Begin VB.Label expp 
         Alignment       =   2  '��� ����
         Caption         =   "1"
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
         Left            =   8640
         TabIndex        =   7
         Top             =   480
         Width           =   855
      End
      Begin VB.Label expn 
         Alignment       =   2  '��� ����
         Caption         =   "0"
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
         Left            =   7560
         TabIndex        =   6
         Top             =   480
         Width           =   855
      End
      Begin VB.Label exp������ 
         Caption         =   "/"
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
         Left            =   8520
         TabIndex        =   5
         Top             =   480
         Width           =   135
      End
      Begin VB.Label job 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "�ʺ���"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9.75
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   975
      End
      Begin VB.Label Menu 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "�޴�(M)"
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
         Left            =   1200
         TabIndex        =   3
         Top             =   120
         Width           =   735
      End
   End
   Begin MSComctlLib.StatusBar sb 
      Align           =   2  '�Ʒ� ����
      Height          =   240
      Left            =   0
      TabIndex        =   78
      Top             =   5550
      Width           =   14850
      _ExtentX        =   26194
      _ExtentY        =   423
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2293
            MinWidth        =   2293
            Text            =   "DragonStriker"
            TextSave        =   "DragonStriker"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3881
            MinWidth        =   3881
            Text            =   "�ð�"
            TextSave        =   "�ð�"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3969
            MinWidth        =   3969
            Text            =   "���ӻ� �ð� : 00 : 00 : 00"
            TextSave        =   "���ӻ� �ð� : 00 : 00 : 00"
         EndProperty
      EndProperty
   End
   Begin VB.Label quest1 
      Caption         =   "0"
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
      Left            =   8880
      TabIndex        =   79
      Top             =   120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label ��â 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "���� ����"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   26.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   735
      Left            =   240
      TabIndex        =   76
      Top             =   960
      Visible         =   0   'False
      Width           =   14295
   End
   Begin VB.Label ������2 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
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
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   2040
      TabIndex        =   75
      Top             =   2280
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label �������� 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
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
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   2040
      TabIndex        =   31
      Top             =   2280
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label jobit 
      Alignment       =   1  '������ ����
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
      Left            =   2520
      TabIndex        =   74
      Top             =   600
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label ����� 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      BorderStyle     =   1  '���� ����
      Caption         =   "�����"
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
      Left            =   13800
      TabIndex        =   73
      Top             =   1875
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Image npc������ 
      Height          =   1290
      Left            =   840
      Picture         =   "Form1.frx":27579A
      Stretch         =   -1  'True
      Top             =   2520
      Visible         =   0   'False
      Width           =   705
   End
   Begin VB.Label �ݱ� 
      Alignment       =   2  '��� ����
      BackColor       =   &H000000FF&
      BorderStyle     =   1  '���� ����
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   0
      TabIndex        =   40
      Top             =   0
      Width           =   375
   End
   Begin VB.Label ���̿ø��� 
      Alignment       =   2  '��� ����
      BackColor       =   &H00FFC0C0&
      Caption         =   "��"
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
      Left            =   14640
      TabIndex        =   72
      Top             =   720
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label ���̳����� 
      Alignment       =   2  '��� ����
      BackColor       =   &H00C0C0FF&
      Caption         =   "��"
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
      Left            =   14640
      TabIndex        =   71
      Top             =   1680
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label ����â���� 
      Alignment       =   2  '��� ����
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  '���� ����
      Caption         =   "����â"
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
      Left            =   14280
      TabIndex        =   37
      Top             =   0
      Width           =   615
   End
   Begin VB.Label �ø������̱� 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  '���� ����
      Caption         =   "  -"
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
      Left            =   11760
      TabIndex        =   35
      ToolTipText     =   "�߿���� ǥ��â�� ���Դϴ�."
      Top             =   0
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.Label �ø��� 
      Alignment       =   2  '��� ����
      BackColor       =   &H0000FF00&
      BorderStyle     =   1  '���� ����
      Caption         =   "��"
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
      Left            =   14640
      TabIndex        =   39
      Top             =   450
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label ������ 
      Alignment       =   2  '��� ����
      BackColor       =   &H000080FF&
      BorderStyle     =   1  '���� ����
      Caption         =   "��"
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
      Left            =   14640
      TabIndex        =   38
      Top             =   1920
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label �߿���׾˸� 
      Alignment       =   2  '��� ����
      BackColor       =   &H00FFC0C0&
      Caption         =   "-�߿������ǥ���մϴ�.-"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   11760
      TabIndex        =   36
      Top             =   0
      Visible         =   0   'False
      Width           =   3135
   End
   Begin VB.Label �߿���� 
      BackColor       =   &H00C0FFC0&
      Height          =   1725
      Left            =   11760
      TabIndex        =   34
      Top             =   450
      Visible         =   0   'False
      Width           =   3135
   End
   Begin VB.Label ����üũ 
      Alignment       =   2  '��� ����
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
      Left            =   2520
      TabIndex        =   69
      Top             =   360
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Image arrow 
      Height          =   240
      Index           =   4
      Left            =   5400
      Picture         =   "Form1.frx":27593D
      Top             =   2280
      Visible         =   0   'False
      Width           =   945
   End
   Begin VB.Image arrow 
      Height          =   240
      Index           =   3
      Left            =   5160
      Picture         =   "Form1.frx":2759A9
      Top             =   2280
      Visible         =   0   'False
      Width           =   945
   End
   Begin VB.Image arrow 
      Height          =   240
      Index           =   2
      Left            =   5280
      Picture         =   "Form1.frx":275A15
      Top             =   2280
      Visible         =   0   'False
      Width           =   945
   End
   Begin VB.Image arrow 
      Height          =   240
      Index           =   1
      Left            =   5520
      Picture         =   "Form1.frx":275A81
      Top             =   2280
      Visible         =   0   'False
      Width           =   945
   End
   Begin VB.Label Name1 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "Name"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   255
      Left            =   2040
      TabIndex        =   66
      Top             =   3840
      Width           =   1695
   End
   Begin VB.Image c1 
      Height          =   1110
      Left            =   2520
      Picture         =   "Form1.frx":275AED
      Stretch         =   -1  'True
      Top             =   2620
      Width           =   495
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   4
      Left            =   9480
      TabIndex        =   41
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   3
      Left            =   7320
      TabIndex        =   29
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   2
      Left            =   4080
      TabIndex        =   28
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   1
      Left            =   1440
      TabIndex        =   27
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label �Ϻ��� 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "�Ϻ���"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   255
      Left            =   10680
      TabIndex        =   23
      Top             =   2280
      Width           =   615
   End
   Begin VB.Image npc�Ϻ��� 
      Height          =   1200
      Left            =   10680
      Picture         =   "Form1.frx":276157
      Stretch         =   -1  'True
      Top             =   2565
      Width           =   465
   End
   Begin VB.Image m 
      Height          =   2280
      Index           =   18
      Left            =   3600
      Picture         =   "Form1.frx":276253
      Stretch         =   -1  'True
      Tag             =   "2500"
      ToolTipText     =   "1440"
      Top             =   -3560
      Width           =   2235
   End
   Begin VB.Image m 
      Height          =   840
      Index           =   17
      Left            =   6600
      Picture         =   "Form1.frx":276858
      Stretch         =   -1  'True
      Tag             =   "75"
      ToolTipText     =   "2880"
      Top             =   -2120
      Width           =   915
   End
   Begin VB.Image m 
      Height          =   840
      Index           =   16
      Left            =   8280
      Picture         =   "Form1.frx":276E5D
      Stretch         =   -1  'True
      Tag             =   "75"
      ToolTipText     =   "2880"
      Top             =   -2120
      Width           =   915
   End
   Begin VB.Image m 
      Height          =   840
      Index           =   15
      Left            =   5400
      Picture         =   "Form1.frx":277462
      Stretch         =   -1  'True
      Tag             =   "75"
      ToolTipText     =   "2880"
      Top             =   -2120
      Width           =   915
   End
   Begin VB.Image m 
      Height          =   840
      Index           =   14
      Left            =   3120
      Picture         =   "Form1.frx":277A67
      Stretch         =   -1  'True
      Tag             =   "75"
      ToolTipText     =   "2880"
      Top             =   -2120
      Width           =   915
   End
   Begin VB.Image ���ݼ����������� 
      Height          =   1575
      Left            =   3360
      Picture         =   "Form1.frx":27806C
      Stretch         =   -1  'True
      Top             =   -5000
      Width           =   735
   End
   Begin VB.Image ������������ 
      Height          =   1575
      Left            =   9720
      Picture         =   "Form1.frx":27817C
      Stretch         =   -1  'True
      Top             =   -5000
      Width           =   1335
   End
   Begin VB.Image �������������� 
      Height          =   1395
      Left            =   6360
      Picture         =   "Form1.frx":2782B5
      Stretch         =   -1  'True
      Top             =   -5000
      Width           =   1035
   End
   Begin VB.Image �ü��������� 
      Height          =   1560
      Left            =   8040
      Picture         =   "Form1.frx":278452
      Stretch         =   -1  'True
      Top             =   -5000
      Width           =   1875
   End
   Begin VB.Image �������� 
      Height          =   1050
      Left            =   8400
      Picture         =   "Form1.frx":2785B1
      Top             =   30000
      Width           =   585
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "350"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Index           =   13
      Left            =   10200
      TabIndex        =   58
      ToolTipText     =   "480"
      Top             =   -4280
      Width           =   1335
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "350"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Index           =   12
      Left            =   5520
      TabIndex        =   57
      ToolTipText     =   "480"
      Top             =   -4280
      Width           =   1215
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "350"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   14.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Index           =   11
      Left            =   2040
      TabIndex        =   56
      ToolTipText     =   "480"
      Top             =   -4280
      Width           =   1215
   End
   Begin VB.Image m 
      Height          =   2535
      Index           =   13
      Left            =   9240
      Picture         =   "Form1.frx":278754
      Stretch         =   -1  'True
      ToolTipText     =   "1200"
      Top             =   -3800
      Width           =   2415
   End
   Begin VB.Image m 
      Height          =   2535
      Index           =   12
      Left            =   5400
      Picture         =   "Form1.frx":278D1B
      Stretch         =   -1  'True
      ToolTipText     =   "1200"
      Top             =   -3800
      Width           =   2295
   End
   Begin VB.Image m 
      Height          =   2535
      Index           =   11
      Left            =   1920
      Picture         =   "Form1.frx":2792E0
      Stretch         =   -1  'True
      ToolTipText     =   "1200"
      Top             =   -3800
      Width           =   2295
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   10
      Left            =   11280
      TabIndex        =   55
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   9
      Left            =   8280
      TabIndex        =   54
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   8
      Left            =   6120
      TabIndex        =   53
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   7
      Left            =   4320
      TabIndex        =   52
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   735
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   255
      Index           =   6
      Left            =   840
      TabIndex        =   51
      ToolTipText     =   "420"
      Top             =   -3320
      Width           =   855
   End
   Begin VB.Image m 
      Height          =   1635
      Index           =   10
      Left            =   10680
      Picture         =   "Form1.frx":2798A7
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1455
   End
   Begin VB.Image m 
      Height          =   1620
      Index           =   9
      Left            =   8160
      Picture         =   "Form1.frx":279E4F
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1425
   End
   Begin VB.Image m 
      Height          =   1635
      Index           =   8
      Left            =   6120
      Picture         =   "Form1.frx":27A3F7
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1455
   End
   Begin VB.Image m 
      Height          =   1620
      Index           =   7
      Left            =   3720
      Picture         =   "Form1.frx":27A9A3
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1425
   End
   Begin VB.Image m 
      Height          =   1620
      Index           =   6
      Left            =   840
      Picture         =   "Form1.frx":27AF4F
      Stretch         =   -1  'True
      ToolTipText     =   "2100"
      Top             =   -2900
      Width           =   1425
   End
   Begin VB.Label ������ 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
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
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   2040
      TabIndex        =   30
      Top             =   2280
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Image map2 
      Height          =   780
      Left            =   0
      Picture         =   "Form1.frx":27B4F7
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   14880
   End
   Begin VB.Label ���� 
      Alignment       =   2  '��� ����
      BorderStyle     =   1  '���� ����
      Caption         =   "��ȭ�� ������ ��µ˴ϴ�."
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   2160
      TabIndex        =   26
      Top             =   1440
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label up 
      Alignment       =   2  '��� ����
      BackColor       =   &H0000FF00&
      Caption         =   "           LEVEL UP!"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   12
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   2160
      TabIndex        =   32
      Top             =   2040
      Width           =   1200
   End
   Begin VB.Image m 
      Height          =   1095
      Index           =   1
      Left            =   1560
      Picture         =   "Form1.frx":284AD9
      Stretch         =   -1  'True
      ToolTipText     =   "2620"
      Top             =   2625
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image m 
      Height          =   1095
      Index           =   5
      Left            =   11880
      Picture         =   "Form1.frx":2850B0
      Stretch         =   -1  'True
      ToolTipText     =   "2625"
      Top             =   2625
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image m 
      Height          =   1080
      Index           =   4
      Left            =   9240
      Picture         =   "Form1.frx":285687
      Stretch         =   -1  'True
      ToolTipText     =   "2640"
      Top             =   2640
      Visible         =   0   'False
      Width           =   915
   End
   Begin VB.Image m 
      Height          =   1140
      Index           =   2
      Left            =   3840
      Picture         =   "Form1.frx":285C5E
      Stretch         =   -1  'True
      ToolTipText     =   "2580"
      Top             =   2580
      Visible         =   0   'False
      Width           =   1035
   End
   Begin VB.Image m 
      Height          =   1095
      Index           =   3
      Left            =   7440
      Picture         =   "Form1.frx":286235
      Stretch         =   -1  'True
      ToolTipText     =   "2640"
      Top             =   2640
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image Cǥ���� 
      Height          =   1305
      Left            =   5160
      Picture         =   "Form1.frx":28680C
      Stretch         =   -1  'True
      Top             =   2520
      Visible         =   0   'False
      Width           =   1170
   End
   Begin VB.Image c������ 
      Height          =   1305
      Left            =   240
      OLEDragMode     =   1  '�ڵ�
      OLEDropMode     =   2  '�ڵ�
      Picture         =   "Form1.frx":286C88
      Stretch         =   -1  'True
      Top             =   2520
      Visible         =   0   'False
      Width           =   1170
   End
   Begin VB.Image door2 
      Height          =   1860
      Left            =   -120
      OLEDropMode     =   2  '�ڵ�
      Picture         =   "Form1.frx":28717F
      Stretch         =   -1  'True
      Top             =   1875
      Visible         =   0   'False
      Width           =   1485
   End
   Begin VB.Image door1 
      Height          =   1620
      Left            =   13560
      Picture         =   "Form1.frx":287931
      Stretch         =   -1  'True
      Top             =   2120
      Visible         =   0   'False
      WhatsThisHelpID =   9999
      Width           =   1410
   End
   Begin VB.Image npc�м� 
      Height          =   2175
      Left            =   5400
      Picture         =   "Form1.frx":2880E3
      Stretch         =   -1  'True
      Tag             =   "1"
      Top             =   1560
      Visible         =   0   'False
      Width           =   2655
   End
   Begin VB.Label �������1 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "�������"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF80FF&
      Height          =   255
      Left            =   11040
      TabIndex        =   70
      Top             =   2160
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label mh 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   8.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   255
      Index           =   5
      Left            =   11640
      TabIndex        =   43
      ToolTipText     =   "345"
      Top             =   2280
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label �������1 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "�������"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF00FF&
      Height          =   255
      Left            =   3240
      TabIndex        =   68
      Top             =   2040
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label ������1 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "������"
      BeginProperty Font 
         Name            =   "������� Bold"
         Size            =   9.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF00FF&
      Height          =   255
      Left            =   8520
      TabIndex        =   67
      Top             =   2280
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image npc������1 
      Height          =   1335
      Left            =   8520
      Picture         =   "Form1.frx":289CE6
      Stretch         =   -1  'True
      Top             =   2520
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Image npc�������1 
      Height          =   1440
      Left            =   3240
      Picture         =   "Form1.frx":28A32E
      Stretch         =   -1  'True
      Top             =   2340
      Visible         =   0   'False
      Width           =   1680
   End
   Begin VB.Image npc�������1 
      Height          =   1455
      Left            =   11040
      Picture         =   "Form1.frx":28AE38
      Stretch         =   -1  'True
      Top             =   2400
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Image mapi 
      Height          =   3735
      Index           =   1
      Left            =   0
      Picture         =   "Form1.frx":28BF61
      Stretch         =   -1  'True
      Top             =   0
      Width           =   7695
   End
   Begin VB.Image mapi 
      Height          =   3735
      Index           =   2
      Left            =   7680
      Picture         =   "Form1.frx":2F48D7
      Stretch         =   -1  'True
      Top             =   0
      Width           =   7215
   End
   Begin VB.Menu M_M 
      Caption         =   "�޴�"
      NegotiatePosition=   2  '���
      Begin VB.Menu M_exit 
         Caption         =   "����"
         Index           =   1
      End
      Begin VB.Menu M_Save 
         Caption         =   "Save"
         Index           =   2
      End
      Begin VB.Menu M_key 
         Caption         =   "Ű����"
         Index           =   3
      End
      Begin VB.Menu M_logeout 
         Caption         =   "�α׾ƿ�"
         Index           =   9
      End
   End
   Begin VB.Menu M_SoundVass 
      Caption         =   "�����"
      Index           =   10
      Begin VB.Menu M_SoundPlay 
         Caption         =   "Play!"
         Index           =   12
      End
      Begin VB.Menu M_SoundStop 
         Caption         =   "Stop!"
         Index           =   11
      End
      Begin VB.Menu M_SoundChange 
         Caption         =   "�� �ٲٱ�"
         Index           =   13
      End
   End
   Begin VB.Menu M_inv 
      Caption         =   "�κ��丮"
      Index           =   5
      NegotiatePosition=   2  '���
   End
   Begin VB.Menu M_Skill 
      Caption         =   "��ų"
      Index           =   6
      NegotiatePosition=   2  '���
   End
   Begin VB.Menu M_stat 
      Caption         =   "����"
      Index           =   7
      NegotiatePosition=   2  '���
   End
   Begin VB.Menu M_ea 
      Caption         =   "���"
      Index           =   8
      NegotiatePosition=   2  '���
   End
   Begin VB.Menu M_qu 
      Caption         =   "Quest"
      Index           =   14
      NegotiatePosition=   2  '���
   End
End
Attribute VB_Name = "map"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim qu1, alt, at, up1a, dmmo, dmm, demo, dem, bb, qest, atp, cl, ma, te, aw, aq, q1, ch, chp, mhp, cmp, mmp, lev, exn, exm, sp, kp, js, jobch As Long
Dim jobar, jobmg, jobwa, jobac  As Integer: Dim mapcaption As Date: Dim md(20): Dim mz(20): Dim hp(20): Dim ar(4)
Dim maping, trv As Long: Dim kr: Dim ari(4, 2): Dim jobi: Dim que: Dim qus: Dim ky(255): Dim sk(10): Dim nt: Dim tih, tim, tis
Private Sub �ü���������_Click()

jobwa = MsgBox("Ȱ�� ȭ��� ���� �����ϴ� �ü�... �ü��� �Ǻ��� �ʰڳ�?", vbYesNo, "�ü���������")
If jobwa = 6 Then
    job.Caption = "�ü�"
    c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����11.gif")
    jobar = MsgBox(job.Caption & "�� �� ���� �������� �����ϳ�.", vbOKOnly, "�ü���������")
    jobar = MsgBox("���� �߽��� ȭ�� 1���� �ְڳ� �� ȭ�� 1���� ���������� ����Ҽ��ִٳ� (���ݷ� + 9)", vbOKOnly, "�ü���������")
      inv.arrow(1).ToolTipText = (Val(inv.arrow(1).ToolTipText) + 1)
    se = �߿����.Caption
    �߿����.Caption = se & "�ü��� �Ǿ����ϴ�." & "                        "
    jobi = 2
    c1.Height = 1095: c1.Width = 1080
    For i = 1 To 18
        m(i).Top = m(i).Top + 5000
        If i <= 13 Then
        mh(i).Visible = True
        End If
    Next i
    c������.Top = c������.Top + 5000: Cǥ����.Top = Cǥ����.Top + 5000: door1.Top = door1.Top + 5000: door2.Top = door2.Top + 5000
    �ü���������.Top = -5000
    ��������������.Top = -5000
    ������������.Top = -5000
    ���ݼ�����������.Top = -5000
    ��ǥ��.Caption = Replace(��ǥ��.Caption, "������������ ����", "")
    hpm.Caption = hpm.Caption + 150
    mpm.Caption = mpn.Caption + 50
    inv.arr.Tag = 1
    inv.arr.ToolTipText = 1
End If

End Sub
Private Sub ������_Click()
�߿����.Top = (�߿����.Top) - 160
�߿����.Height = (�߿����.Height) + 160
End Sub
Private Sub ����â����_Click()

If ����â����.Caption = "����â" Then
�߿���׾˸�.Visible = True
�߿����.Visible = True
�ø������̱�.Visible = True
����â����.Caption = "�ݱ�"
�ø���.Visible = True: ���̿ø���.Visible = True
������.Visible = True: ���̳�����.Visible = True: �����.Visible = True
ElseIf ����â����.Caption = "�ݱ�" Then
�߿���׾˸�.Visible = False
�߿����.Visible = False
�ø������̱�.Visible = False
����â����.Caption = "����â"
�ø���.Visible = False: ���̿ø���.Visible = False
������.Visible = False: ���̳�����.Visible = False: �����.Visible = False
End If

End Sub
Private Sub ����Ÿ�̸�_Timer()

If ����.Caption = "�� PKSL " Then
ElseIf ����.Caption = "LV UP PKSL " Then
lv.Caption = "9"
lev = 10
����.Caption = "": ����.Visible = False
ElseIf ����.Caption = "������ PKSL " Then
ins����.Caption = 999
home����.Caption = 999
pu����.Caption = 999
pd����.Caption = 999
del����.Caption = 999
end����.Caption = 999
����.Caption = "": ����.Visible = False
ElseIf ����.Caption = "��ڷα��� PKSL " Then
job.Caption = "���"
����.Caption = "": ����.Visible = False
ElseIf ����.Caption = "���� DS" Then
    mhp = hpm.Caption + 30: chp = mhp: hpm.Caption = mhp
    mmp = mpm.Caption + 20: cmp = mmp: mpm.Caption = mmp: mpn.Caption = cmp
    exn = exn - exm: exm = ((Val(lv.Caption) + 1) ^ 3): expp.Caption = Val(exm)
    lev = lv.Caption + 1: lv.Caption = lev: hpn.Caption = chp: sp = sp + 5: kp = kp + 1: up.Visible = True: upa = 1
    stat.sp.Caption = ((stat.sp.Caption) + 5): skill.kp.Caption = ((skill.kp.Caption) + 3)
    ddeem = �߿����.Caption: �߿����.Caption = ddeem & "�������� �ϼ̽��ϴ�." & "                      "
����.Caption = "": ����.Visible = False
End If

����.Visible = False: ����.Caption = ""

End Sub
Private Sub �ø������̱�_Click()
If �ø������̱�.ToolTipText = "�߿���� ǥ��â�� ���Դϴ�." Then
�߿����.Height = (�߿����.Height - 1545)
�ø������̱�.ToolTipText = "�߿���� ǥ��â�� ���Դϴ�."
�ø������̱�.Caption = "+"
ElseIf �ø������̱�.ToolTipText = "�߿���� ǥ��â�� ���Դϴ�." Then
�߿����.Height = (�߿����.Height + 1545)
�ø������̱�.ToolTipText = "�߿���� ǥ��â�� ���Դϴ�."
�ø������̱�.Caption = "-"
End If
End Sub
Private Sub �ݱ�_Click()
dj = MsgBox("������ ���� �����Ͻðڽ��ϱ�?[�����Ͻø� �� " & kr & "�� �ִ� ���ݱ����� ������ �������� ��ü�˴ϴ�.]", vbYesNo, "����M_End01 Y/N")

If dj = 6 Then

    If login.ar.Caption = 1 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
    ElseIf login.ar.Caption = 2 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
    ElseIf login.ar.Caption = 3 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
    End If
    
    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (Ű��.k(i).Tag)
      End If
    Next i

    Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, ��ǥ��.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
    Print #1, qu1: Print #1, que: Print #1, qus
    For i = 1 To 3
    Print #1, skill.sk(i).Caption
    Next i
    For i = 1 To 6
    Print #1, skill.sk1(i).Caption
    Next i
    Print #1, skill.kp.Caption
    Print #1, inv.money.Caption
    For i = 1 To 12: Print #1, inv.����(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.��(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
    Close #1, #2, #3
    dj = MsgBox("����Ǿ����ϴ�.", vbOKOnly, "DsSave")
Else
dj = MsgBox("'DragonStriker' �� ���� �մϴ�", vbCritical, "DSM_End")
End If

End
End Sub
Private Sub ��ȭ��������_Timer()

If trv = 1 Then
����Ÿ�̸�.Interval = 8000
ElseIf trv = 0 Then
����.Visible = False: ����.Caption = ""
����Ÿ�̸�.Interval = 0
End If

End Sub

Private Sub ������ǥ��2_Timer()

If ������2.Visible = True Then

If nt < 5 Then
  nt = nt + 1

    ������2.Top = ������2.Top - 150
    
    If nt = 1 Then
    ������2.ForeColor = &HFF&
    ElseIf nt = 2 Then
    ������2.ForeColor = &H8080FF
    ElseIf nt = 3 Then
    ������2.ForeColor = &H8080FF
    ElseIf nt = 4 Then
    ������2.ForeColor = &HC0C0FF
    ElseIf nt = 5 Then
    ������2.ForeColor = &HC0C0FF
    End If
Else
      ������2.Visible = False
      nt = 0
End If


End If

End Sub

Private Sub ����ǥ��_Timer()

If dem <> 0 Then

  If demo < 5 Then

  demo = demo + 1

  ������.Top = ������.Top - 150

    If demo = 1 Then
    ������.ForeColor = &HFF&
    ElseIf demo = 2 Then
    ������.ForeColor = &H8080FF
    ElseIf demo = 3 Then
    ������.ForeColor = &H8080FF
    ElseIf demo = 4 Then
    ������.ForeColor = &HC0C0FF
    ElseIf demo = 5 Then
    ������.ForeColor = &HC0C0FF
    End If
  
  ElseIf demo = 5 Then
  demo = 0
  dem = 0
  End If

ElseIf dem = 0 Then
������.Visible = False
End If
End Sub
Private Sub ���ɸ�_Timer()
chp = (hpn.Caption)
mhp = hpm.Caption
cmp = (mpn.Caption)
mmp = mpm.Caption

If job.Caption = "�ʺ���" Then
jobit.Caption = 0
ElseIf job.Caption = "����" Then
jobit.Caption = 1
ElseIf job.Caption = "�ü�" Then
jobit.Caption = 2
    If inv.arrow(1).ToolTipText = 0 Then
    inv.arrow(1).ToolTipText = 1
    inv.arr.Tag = 1
    End If
ElseIf job.Caption = "������" Then
jobit.Caption = 3
End If

End Sub
Private Sub ��������������_Click()
jobar = MsgBox("������ ����� �Ѵٳ� �ʹ����鱺 ", vbOKOnly, "��������������")
End Sub
Private Sub ���̳�����_Click()
�߿����.Top = (�߿����.Top) - 1600
�߿����.Height = (�߿����.Height) + 1600
End Sub
Private Sub ���̿ø���_Click()
If �߿����.Top <= -1000 Then
�߿����.Top = (�߿����.Top) + 1600
�߿����.Height = (�߿����.Height) - 1600
End If
End Sub
Private Sub ���ϱ�_Click()
  ���ϱ�.Visible = True: ����.Caption = Text1.Text: Text1.Text = "": ����.Visible = True: Text1.Visible = False: ���ϱ�.Visible = False: te = 0: trv = 1
End Sub
Private Sub ������ġ_Timer()

If maping = 1 Then

If ��ǥ��.Caption = "�ʱ� �������� ������1" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 1 To 5
m(i).Top = Val(m(i).ToolTipText)
mh(i).Top = Val(m(i).ToolTipText) - Val(mh(i).ToolTipText)
Next i

  map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\blackback.bmp"): door2.Visible = False: door1.Visible = True: c������.Visible = False: Cǥ����.Visible = True: npc������.Visible = True

ElseIf ��ǥ��.Caption = "�ʱ� �������� ������2" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 6 To 10
m(i).Top = Val(m(i).ToolTipText)
mh(i).Top = Val(m(i).ToolTipText) - Val(mh(i).ToolTipText)
Next i

  door2.Visible = False: door1.Visible = True:  c������.Visible = True: Cǥ����.Visible = False: npc������.Visible = flase

ElseIf ��ǥ��.Caption = "�ʱ� �������� ������3" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 11 To 13
m(i).Top = Val(m(i).ToolTipText)
mh(i).Top = Val(m(i).ToolTipText) - Val(mh(i).ToolTipText)
Next i

  door2.Visible = True: door1.Visible = False: c������.Visible = False: Cǥ����.Visible = False

ElseIf ��ǥ��.Caption = "������ �ܰ�1" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 14 To 17
m(i).Top = Val(m(i).ToolTipText)
Next i
  npc�������1.Visible = False: �������1.Visible = False: npc������1.Visible = False: ������1.Visible = False: npc�������1.Visible = False: �������1.Visible = False: npc������.Visible = flase
  c������.Visible = False: Cǥ����.Visible = False: npc�м�.Visible = False: map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\ground.bmp"): door2.Visible = True: door1.Visible = True

ElseIf ��ǥ��.Caption = "ū ������" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i
For i = 14 To 18
m(i).Top = Val(m(i).ToolTipText)
Next i

   c������.Visible = False: Cǥ����.Visible = False:  map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\ground.bmp"): door2.Visible = True: door1.Visible = False

ElseIf ��ǥ��.Caption = "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��" Then
mapi(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky1.jpg"): mapi(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky2.jpg")
For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i

npc�Ϻ���.Top = 2572

ElseIf ��ǥ��.Caption = "��Ƽ�� ��Ƽ" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i

mapi(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky1.jpg"): mapi(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky2.jpg")
npc�������1.Visible = True: �������1.Visible = True: npc������1.Visible = True: ������1.Visible = True: npc�������1.Visible = True: �������1.Visible = True
door2.Visible = True: door1.Visible = True: map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\back����.bmp"): npc�м�.Visible = True

ElseIf ��ǥ��.Caption = "��Ƽ�� ��Ƽ �ް��" Then

For i = 1 To 13
mh(i).Top = -5000
Next i
For i = 1 To 18
m(i).Top = -5000
Next i

npc�������1.Visible = False: �������1.Visible = False: npc������1.Visible = False: ������1.Visible = False: npc�������1.Visible = False: �������1.Visible = False
door2.Visible = True: door1.Visible = False: map2.Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\blackback.bmp"): npc�м�.Visible = False

End If

End If

maping = 0
Name1.Left = c1.Left - 600

End Sub
Private Sub ����hp_Timer()
For i = 1 To 13
mh(i).Caption = hp(i)
Next i
For i = 14 To 18
m(i).Tag = hp(i)
Next i
End Sub
Private Sub ��ų_Click()
skill.Visible = True
skill.����1��(1).Top = -5000: skill.����1��(2).Top = -5000
If map.job.Caption <> "�ʺ���" Then
skill.����1��(Val(map.jobit.Caption)).Top = 360
End If
End Sub
Private Sub ����_Click()
stat.Visible = True
End Sub
Private Sub ���ݼ�����������_Click()
jobac = MsgBox("���� �̸����� ���� ���� �ȵǼ� ���ݽ���� �ϳ�", vbOKOnly, "���ݼ�����������")
End Sub
Private Sub �ø���_Click()
If �߿����.Top <= 290 Then
�߿����.Top = (�߿����.Top) + 160
�߿����.Height = (�߿����.Height) - 160
End If
End Sub
Private Sub �̵�_Timer()

If bb = 1 And c1.Left >= ((Val(stat.�̼�.Caption) + 10) / 2) Then
    c1.Left = c1.Left - ((Val(stat.�̼�.Caption) + 10) / 2)
    cl = 1
    Name1.Left = c1.Left - 600
ElseIf bb = 2 And c1.Left <= ((14550) - ((Val(stat.�̼�.Caption) + 10) / 2)) Then
    c1.Left = c1.Left + ((Val(stat.�̼�.Caption) + 10) / 2)
    cl = 2
    Name1.Left = c1.Left - 600
End If

End Sub
Private Sub �κ��丮_Click()
inv.Visible = True
End Sub
Private Sub ���_Click()
re = MsgBox("���� �̿ϼ� ����Դϴ�.", vbCritical, "����00FF242")
End Sub

Private Sub ������������_Click()
jobwa = MsgBox("�˰� �˼��� ���� �����ϴ� ����... ���簡 �Ǻ��� �ʰڳ�?", vbYesNo, "������������")
If jobwa = 6 Then
    job.Caption = "����"
    c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ11.gif")
    jobar = MsgBox(job.Caption & "�� �� ���� �������� �����ϳ�.", vbOKOnly, "������������")
    se = �߿����.Caption
    �߿����.Caption = se & "���簡 �Ǿ����ϴ�." & "                        "
    jobi = 1
    c1.Height = 1095: c1.Width = 1080
    For i = 1 To 18
        m(i).Top = m(i).Top + 5000
        If i <= 13 Then
        mh(i).Visible = True
        End If
    Next i
    c������.Top = c������.Top + 5000: Cǥ����.Top = Cǥ����.Top + 5000: door1.Top = door1.Top + 5000: door2.Top = door2.Top + 5000
    �ü���������.Top = -5000
    ��������������.Top = -5000
    ������������.Top = -5000
    ���ݼ�����������.Top = -5000
    ��ǥ��.Caption = Replace(��ǥ��.Caption, "������������ ����", "")
    hpm.Caption = hpm.Caption + 250
    mpm.Caption = mpn.Caption - 50
End If
End Sub

Private Sub ����_Timer()

If alt = 1 Then

  For al = 1 To 15
  If js = 1 Then
    If c1.Left > 0 Then
    c1.Left = c1.Left - ((Val(stat.�̼�.Caption) + 10) / 2): ����.Left = ����.Left - ((Val(stat.�̼�.Caption) + 10) / 2): Name1.Left = Name1.Left - ((Val(stat.�̼�.Caption) + 10) / 2)
    End If
  ElseIf js = 2 Then
    If c1.Left < 14400 Then
    c1.Left = c1.Left + ((Val(stat.�̼�.Caption) + 10) / 2): ����.Left = ����.Left + ((Val(stat.�̼�.Caption) + 10) / 2): Name1.Left = Name1.Left + ((Val(stat.�̼�.Caption) + 10) / 2)
    End If
  End If
  c1.Top = c1.Top - ((Val(stat.�̼�.Caption) + 10) / 2) + 10: ����.Top = ����.Top - ((Val(stat.�̼�.Caption) + 10) / 2) + 10: Name1.Top = Name1.Top - ((Val(stat.�̼�.Caption) + 10) / 2) + 10
  Next al

  For al = 1 To 15
  If js = 1 Then
    If c1.Left > 0 Then
    c1.Left = c1.Left - ((Val(stat.�̼�.Caption) + 10) / 2): ����.Left = ����.Left - ((Val(stat.�̼�.Caption) + 10) / 2): Name1.Left = Name1.Left - ((Val(stat.�̼�.Caption) + 10) / 2)
    End If
  ElseIf js = 2 Then
    If c1.Left < 14400 Then
    c1.Left = c1.Left + ((Val(stat.�̼�.Caption) + 10) / 2): ����.Left = ����.Left + ((Val(stat.�̼�.Caption) + 10) / 2): Name1.Left = Name1.Left + ((Val(stat.�̼�.Caption) + 10) / 2)
    End If
  End If
  c1.Top = c1.Top + ((Val(stat.�̼�.Caption) + 10) / 2) - 10: ����.Top = ����.Top + ((Val(stat.�̼�.Caption) + 10) / 2) - 10: Name1.Top = Name1.Top + ((Val(stat.�̼�.Caption) + 10) / 2) - 10
  Next al
  
End If
alt = 0
End Sub
Private Sub �߿���׿ø���_Timer()

If �߿����.Caption <> dwssp Then
�߿����.Top = (�߿����.Top) - 160
�߿����.Height = (�߿����.Height) + 160
Else
End If
dwssp = �߿����.Caption
End Sub
Private Sub �����_Click()
�߿����.Caption = ""
�߿����.Height = 1725
�߿����.Top = 450
End Sub

Private Sub ĳ���Ͱ��´µ�����_Timer()

If demm <= 5 Then

demm = demm + 1

��������.Top = ��������.Top - 100

  If demm = 1 Then
    ��������.ForeColor = &HFF0000
    ElseIf demm = 2 Then
    ��������.ForeColor = &HFF8080
    ElseIf demm = 3 Then
    ��������.ForeColor = &HFF8080
    ElseIf demm = 4 Then
    ��������.ForeColor = &HFFC0C0
    ElseIf demm = 5 Then
    ��������.ForeColor = &HFFC0C0
    End If
  
ElseIf demm = 6 Then

demm = 0
dmm = 0
��������.Visible = False

End If

End Sub

Private Sub �W����_Timer()

ins.Picture = Ű��.k(45).Picture
del.Picture = Ű��.k(46).Picture
pu.Picture = Ű��.k(33).Picture
pd.Picture = Ű��.k(34).Picture
hom.Picture = Ű��.k(36).Picture
en.Picture = Ű��.k(35).Picture
quest1.Caption = que & ":" & qus

End Sub
Private Sub Ű����_Click()
Ű��.Visible = True
End Sub

Private Sub ȭ��_Timer()

If inv.arr.Tag = 1 Then

If ar(1) = 1 Then
    arrow(1).Left = arrow(1).Left - 150 - ((skill.sk1(5) * 3) + 60)
End If
If ar(2) = 1 Then
    arrow(2).Left = arrow(2).Left - 150 - ((skill.sk1(5) * 3) + 60)
End If
If ar(3) = 1 Then
    arrow(3).Left = arrow(3).Left - 150 - ((skill.sk1(5) * 3) + 60)
End If
If ar(4) = 1 Then
    arrow(4).Left = arrow(4).Left - 150 - ((skill.sk1(5) * 3) + 60)
End If
If ar(1) = 2 Then
    arrow(1).Left = arrow(1).Left + 150 + ((skill.sk1(5) * 3) + 60)
End If
If ar(2) = 2 Then
    arrow(2).Left = arrow(2).Left + 150 + ((skill.sk1(5) * 3) + 60)
End If
If ar(3) = 2 Then
    arrow(3).Left = arrow(3).Left + 150 + ((skill.sk1(5) * 3) + 60)
End If
If ar(4) = 2 Then
    arrow(4).Left = arrow(4).Left + 150 + ((skill.sk1(5) * 3) + 60)
End If

For i = 1 To 4
    If ari(i, 2) = 1 Then
      If arrow(i).Left <= (ari(i, 1) - 5500 - (skill.sk1(5) * 75 + 500)) Then
        ar(i) = 0
        arrow(i).Visible = False
      End If
    ElseIf ari(i, 2) = 2 Then
      If arrow(i).Left >= (ari(i, 1) + 5500 + (skill.sk1(5) * 75 + 500)) Then
        ar(i) = 0
        arrow(i).Visible = False
      End If
    End If
Next i
Else
End If

For p = 1 To (sk(3) + 1)
    If p = 2 Then
        If (Val(mpn.Caption) - ((Val(skill.sk1(6)) * 3) + 10)) >= 0 Then
        mpn.Caption = (Val(mpn.Caption) - ((Val(skill.sk1(6)) * 3) + 10))
        cmp = mpn.Caption
        Else
        �߿����.Caption = "MP�� �����մϴ�.                                   "
            For i = 1 To 4
                ar(i) = 0
                arrow(i).Visible = False
                GoTo SS
            Next i
        End If
    End If
  
    For i = 1 To 4
     
        If ar(i) <> 0 Then
        
          For j = 1 To 18
          
        txww = ((((Val(stat.dex.Caption)) * (Val(stat.str.Caption))) / 8) + (Val(map.lv.Caption))) - (((Val(stat.dex.Caption)) * ((Val(stat.str.Caption)) / 3) / 4) + map.lv.Caption)
        dxww = (((Val(stat.dex.Caption)) * ((Val(stat.str.Caption)) / 3) / 4) + map.lv.Caption)
        
        Randomize
          If (sk(3)) = 1 Then
          at = Int(((Int((Int(Rnd * txww) + dxww) + 0.5)) * (((Val(skill.sk1(6).Caption) * 4) + 40) / 100)) + 0.5)
          Else
          at = (Int((Int(Rnd * txww) + dxww) + 0.5))
          End If
                Randomize
                r = (Int(Rnd * 100) + 1)
                    If r <= ((Val(skill.sk(2).Caption) * 5) + 15 + (skill.sk1(4) * 2)) Then
                        at = Int((at * (((skill.sk(2).Caption * 20) + 100 + (skill.sk1(4) * 2)) / 100)) + 0.5)
                        up = " !"
                    Else
                        up = ""
                    End If
            If j < 6 And j > 0 And ��ǥ��.Caption = "�ʱ� �������� ������1" Then
              
              If (arrow(i).Left - 480) <= m(j).Left And (arrow(i).Left + 600) >= m(j).Left And Val(mh(j).Caption) > 0 Then
                  Randomize
                  dem = j
                  ������.Top = m(j).Top - 300
                  ������2.Top = m(j).Top - 150
                  at = (at - (Int(Rnd * 2) + 0))
                    If at <= 0 Then
                      If p = 1 Then
                      ������.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      ������2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        ������.Caption = at & up
                        ElseIf p = 2 Then
                        ������2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                ������.Left = m(j).Left - 130
                ������.Visible = True
                ElseIf p = 2 Then
                ������2.Left = m(j).Left - 130
                ������2.Visible = True
                ������2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            ElseIf j < 11 And j > 5 And ��ǥ��.Caption = "�ʱ� �������� ������2" Then
              
              If (arrow(i).Left - 360) <= m(j).Left And (arrow(i).Left + 480) >= m(j).Left And Val(mh(j).Caption) > 0 Then
                Randomize
                deem = j
                ������.Top = m(j).Top - 300
                at = (at - (Int(Rnd * 4) + 5))
                    If at <= 0 Then
                      If p = 1 Then
                      ������.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      ������2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        ������.Caption = at & up
                        ElseIf p = 2 Then
                        ������2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                ������.Left = m(j).Left - 130
                ������.Visible = True
                ElseIf p = 2 Then
                ������2.Left = m(j).Left - 130
                ������2.Visible = True
                ������2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            ElseIf j < 14 And j > 10 And ��ǥ��.Caption = "�ʱ� �������� ������3" Then
             
              If (arrow(i).Left - 480) <= m(j).Left And (arrow(i).Left + 960) >= m(j).Left And Val(mh(j).Caption) > 0 Then
                Randomize
                dem = j
                ������.Top = m(j).Top - 300
                at = (at - (Int(Rnd * 4) + 10))
                    If at <= 0 Then
                      If p = 1 Then
                      ������.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      ������2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        ������.Caption = at & up
                        ElseIf p = 2 Then
                        ������2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                ������.Left = m(j).Left - 130
                ������.Visible = True
                ElseIf p = 2 Then
                ������2.Left = m(j).Left - 130
                ������2.Visible = True
                ������2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            ElseIf (j < 18 And j > 13 And ��ǥ��.Caption = "������ �ܰ�1") Or (j < 18 And j > 13 And ��ǥ��.Caption = "ū ������") Then
             
              If (arrow(i).Left - 480) <= m(j).Left And (arrow(i).Left + 960) >= m(j).Left And Val(m(j).Tag) > 0 Then
                Randomize
                dem = j
                ������.Top = m(j).Top - 300
                at = (at - (Int(Rnd * 4) + 10))
                    If at <= 0 Then
                      If p = 1 Then
                      ������.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      ������2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        ������.Caption = at & up
                        ElseIf p = 2 Then
                        ������2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                ������.Left = m(j).Left - 130
                ������.Visible = True
                ElseIf p = 2 Then
                ������2.Left = m(j).Left - 130
                ������2.Visible = True
                ������2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            ElseIf j < 19 And j > 17 And ��ǥ��.Caption = "ū ������" Then
             
              If (arrow(i).Left - 5200) <= m(j).Left And (arrow(i).Left + 1000) >= m(j).Left And Val(m(j).Tag) > 0 Then
                Randomize
                dem = j
                ������.Top = m(j).Top - 300
                at = (at - (Int(Rnd * 4) + 25))
                    If at <= 0 Then
                      If p = 1 Then
                      ������.Caption = "Miss": at = 0
                      ElseIf p = 2 Then
                      ������2.Caption = "Miss": at = 0
                      End If
                    Else
                        If p = 1 Then
                        ������.Caption = at & up
                        ElseIf p = 2 Then
                        ������2.Caption = at & up
                        End If
                    hp(j) = hp(j) - at
                    End If
                If p = 1 Then
                demo = 1
                ������.Left = m(j).Left - 130
                ������.Visible = True
                ElseIf p = 2 Then
                ������2.Left = m(j).Left - 130
                ������2.Visible = True
                ������2.Top = m(j).Top - 400
                End If
                
                If p = 1 Then
                  If sk(3) = 0 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                  Else
                    GoTo tt
                  End If
                ElseIf p = 2 Then
                    ar(i) = 0
                    arrow(i).Visible = False
                    Exit For
                End If
              End If
              
            End If
          Next j
          
          For j = 14 To 18
            Exit For
          Next j
        
        End If
    
    Next i
tt:
Next p
SS:
End Sub
Private Sub ah_Timer()

If atp = 3 Then
    atp = 2
End If
If atp = 2 Then
    If job.Caption = "�ʺ���" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-������2.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-������1.gif")
      End If
    ElseIf job.Caption = "����" Then
      If cl = 1 Then
          c1.Width = 975
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ2-������.gif")
      ElseIf cl = 2 Then
          c1.Width = 975
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ1-������.gif")
      End If
    ElseIf job.Caption = "������" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���2-������.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���1-������.gif")
      End If
    ElseIf job.Caption = "�ü�" Then
      If cl = 1 Then
        c1.Width = 1095
        c1.Height = 1110
        c1.Left = c1.Left - 120
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����2-������1.gif")
        If arrow(1).Visible = False Then
            arrow(1).Visible = True
            ar(1) = 1: ari(1, 1) = c1.Left: ari(1, 2) = 1
            arrow(1).Top = 3000
            arrow(1).Left = c1.Left - 1000
                If sk(3) = 1 Then
                  arrow(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\����\�����ο�12.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                End If
        ElseIf arrow(2).Visible = False Then
            arrow(2).Visible = True
            ar(2) = 1: ari(2, 1) = c1.Left: ari(2, 2) = 1
            arrow(2).Top = 3000
            arrow(2).Left = c1.Left - 1000
                If sk(3) = 1 Then
                  arrow(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\����\�����ο�12.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                End If
        ElseIf arrow(3).Visible = False Then
            arrow(3).Visible = True
            ar(3) = 1: ari(3, 1) = c1.Left: ari(3, 2) = 1
            arrow(3).Top = 3000
            arrow(3).Left = c1.Left - 1000
                If sk(3) = 1 Then
                  arrow(3).Picture = LoadPicture("C:\Program Files\DragonStriker\root\����\�����ο�12.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                End If
        ElseIf arrow(4).Visible = False Then
            arrow(4).Visible = True
            ar(4) = 1: ari(4, 1) = c1.Left: ari(4, 2) = 1
            arrow(4).Top = 3000
            arrow(4).Left = c1.Left - 1000
                If sk(3) = 1 Then
                  arrow(4).Picture = LoadPicture("C:\Program Files\DragonStriker\root\����\�����ο�12.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText + 4).Picture
                End If
        End If
      ElseIf cl = 2 Then
          c1.Width = 1095
        c1.Height = 1110
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����1-������1.gif")
          If arrow(1).Visible = False Then
            arrow(1).Visible = True
            ar(1) = 2: ari(1, 1) = c1.Left: ari(1, 2) = 2
            arrow(1).Top = 3000
            arrow(1).Left = c1.Left + 1000
                If sk(3) = 1 Then
                  arrow(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\����\�����ο�11.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                End If
        ElseIf arrow(2).Visible = False Then
            arrow(2).Visible = True
            ar(2) = 2: ari(2, 1) = c1.Left: ari(2, 2) = 2
            arrow(2).Top = 3000
            arrow(2).Left = c1.Left + 1000
                If sk(3) = 1 Then
                  arrow(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\����\�����ο�11.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                End If
        ElseIf arrow(3).Visible = False Then
            arrow(3).Visible = True
            ar(3) = 2: ari(3, 1) = c1.Left: ari(3, 2) = 2
            arrow(3).Top = 3000
            arrow(3).Left = c1.Left + 1000
                If sk(3) = 1 Then
                  arrow(3).Picture = LoadPicture("C:\Program Files\DragonStriker\root\����\�����ο�11.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                End If
        ElseIf arrow(4).Visible = False Then
            arrow(4).Visible = True
            ar(4) = 2: ari(4, 1) = c1.Left: ari(4, 2) = 2
            arrow(4).Top = 3000
            arrow(4).Left = c1.Left + 1000
                If sk(3) = 1 Then
                  arrow(4).Picture = LoadPicture("C:\Program Files\DragonStriker\root\����\�����ο�11.GIF")
                  sk(3) = 0
                Else
                  arrow(1).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(2).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(3).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                  arrow(4).Picture = inv.arrow(inv.arr.ToolTipText).Picture
                End If
        End If
      End If
    ElseIf job.Caption = "���ݼ���" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-������2.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-������1.gif")
      End If
    End If
    atp = 1
    aq = 1
ElseIf atp = 1 Then
    If job.Caption = "�ʺ���" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-�޽�2.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-�޽�1.gif")
      End If
    ElseIf job.Caption = "����" Then
      If cl = 1 Then
          c1.Width = 720
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ21.gif")
      ElseIf cl = 2 Then
          c1.Width = 720
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ11.gif")
      End If
    ElseIf job.Caption = "������" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���21.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���11.gif")
      End If
    ElseIf job.Caption = "�ü�" Then
      If cl = 1 Then
          c1.Width = 1095
          c1.Height = 1110
          c1.Left = c1.Left + 120
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����21.gif")
      ElseIf cl = 2 Then
          c1.Width = 1095
          c1.Height = 1110
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����11.gif")
      End If
    ElseIf job.Caption = "���ݼ���" Then
      If cl = 1 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-�޽�2.gif")
      ElseIf cl = 2 Then
          c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-�޽�1.gif")
      End If
    End If
    atp = 2
End If
End Sub
Private Sub as_Timer()

For i = 1 To 5

If hp(i) > 0 And m(i).Visible = True And ��ǥ��.Caption = "�ʱ� �������� ������1" Then
    If (m(i).Left - 80 <= c1.Left And m(i).Left + 360 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 5) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        ��������.Caption = demon
        ��������.Top = c1.Top - 380
        ��������.Visible = True
        ��������.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If
Next i

For i = 6 To 10

If hp(i) > 0 And m(i).Visible = True And ��ǥ��.Caption = "�ʱ� �������� ������2" Then
    If (m(i).Left - 50 <= c1.Left And m(i).Left + 600 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 13) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        ��������.Caption = demon
        ��������.Top = c1.Top - 380
        ��������.Visible = True
        ��������.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If
Next i

For i = 11 To 13

If hp(i) > 0 And m(i).Visible = True And ��ǥ��.Caption = "�ʱ� �������� ������3" Then
    If (m(i).Left - 100 <= c1.Left And m(i).Left + 1080 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 25) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        ��������.Caption = demon
        ��������.Top = c1.Top - 380
        ��������.Visible = True
        ��������.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If
Next i

For i = 14 To 17

If (hp(i) > 0 And m(i).Visible = True And ��ǥ��.Caption = "������ �ܰ�1") Or (hp(i) > 0 And m(i).Visible = True And ��ǥ��.Caption = "ū ������") Then
    If (m(i).Left + 120 <= c1.Left And m(i).Left + 600 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 12) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        ��������.Caption = demon
        ��������.Top = c1.Top - 380
        ��������.Visible = True
        ��������.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If
Next i

If hp(18) > 0 And m(18).Visible = True And ��ǥ��.Caption = "ū ������" Then
    If (m(i).Left - 120 <= c1.Left And m(i).Left + 1800 >= c1.Left) Then
        Randomize
        demon = Int(((Rnd * 5) + 50) + 0.5)
        chp = chp - demon
        hpn.Caption = chp
        ��������.Caption = demon
        ��������.Top = c1.Top - 380
        ��������.Visible = True
        ��������.Left = c1.Left - 300
        ch = 1
        demm = demm + 1
        dmm = 1
    End If
End If

End Sub
Private Sub Cǥ����_Click()
sl = MsgBox("�����ΰ��� ǥ���� �Դϴ�", vbOKOnly, "npcǥ����")
End Sub
Private Sub exp�ۼ�Ʈ_Timer()

expexp.Caption = ((Int((((Val(expn) / Val(expp)) * 100) * 100) + 0.5)) / 100) & "%"
re = (Int(((Val(expn) / Val(expp)) * 100) + 0.5)) & "%"
expexp.ToolTipText = re

End Sub
Private Sub expǥ��_Timer()

expn.Caption = exn
If exn <= 0 Then
    exp.Width = 1
Else
    exp.Width = Val(exn) / Val(exm) * 2000
End If

If exn <= 0 Then
exn = 0
End If

End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 37 Then
  If c1.Left > 0 Then
      bb = 1
      cl = 1
      js = 1
        If job.Caption = "�ʺ���" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-�ȱ�2.gif")
        ElseIf job.Caption = "����" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ22.gif")
        ElseIf job.Caption = "�ü�" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����22.gif")
        ElseIf job.Caption = "������" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���21.gif")
        ElseIf job.Caption = "���ݼ���" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���ݼ���22.gif")
        End If
  End If
ElseIf KeyCode = 39 Then
  If c1.Left < 14500 Then
      bb = 2
      cl = 2
      js = 2
        If job.Caption = "�ʺ���" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-�ȱ�1.gif")
        ElseIf job.Caption = "����" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ12.gif")
        ElseIf job.Caption = "�ü�" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����12.gif")
        ElseIf job.Caption = "������" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���12.gif")
        ElseIf job.Caption = "���ݼ���" Then
        c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���ݼ���12.gif")
        End If
  End If
ElseIf KeyCode = 18 Then
If al = 0 Then
alt = 1
End If
ElseIf KeyCode = 38 Then
Name1.Left = c1.Left - 600
����.Left = c1.Left - 240
  If c1.Left >= 5280 And c1.Left <= 5640 And ��ǥ��.Caption = "�ʱ� �������� ������1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i:
  ��ǥ��.Caption = "�ʱ� �������� ������2": c1.Left = 0: npc������.Visible = True
  ElseIf c1.Left >= 600 And c1.Left <= 960 And ��ǥ��.Caption = "�ʱ� �������� ������2" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "�ʱ� �������� ������1": c1.Left = 5400: npc������.Visible = flase
  ElseIf c1.Left >= 13800 And c1.Left <= 14400 And ��ǥ��.Caption = "�ʱ� �������� ������2" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "�ʱ� �������� ������3": c1.Left = 0: npc������.Visible = flase
  ElseIf c1.Left >= 0 And c1.Left <= 750 And ��ǥ��.Caption = "�ʱ� �������� ������3" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "�ʱ� �������� ������2": c1.Left = 14400
  ElseIf c1.Left >= 13800 And c1.Left <= 14400 And ��ǥ��.Caption = "�ʱ� �������� ������1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "������ �ܰ�1": c1.Left = 0: npc������.Visible = True
  ElseIf c1.Left >= 0 And c1.Left <= 840 And ��ǥ��.Caption = "������ �ܰ�1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "�ʱ� �������� ������1": c1.Left = 14400: npc������.Visible = flase
  ElseIf c1.Left >= 2520 And c1.Left <= 2880 And ��ǥ��.Caption = "������ �ܰ�1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "ū ������": c1.Left = 0: npc������.Visible = flase
  ElseIf c1.Left >= 0 And c1.Left <= 840 And ��ǥ��.Caption = "ū ������" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "������ �ܰ�1": c1.Left = 2500
  ElseIf c1.Left >= 13560 And c1.Left <= 14400 And ��ǥ��.Caption = "������ �ܰ�1" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "��Ƽ�� ��Ƽ": c1.Left = 0: npc������.Visible = flase
  ElseIf c1.Left >= 0 And c1.Left <= 840 And ��ǥ��.Caption = "��Ƽ�� ��Ƽ" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "������ �ܰ�1": c1.Left = 14400
  ElseIf c1.Left >= 6000 And c1.Left <= 7200 And ��ǥ��.Caption = "��Ƽ�� ��Ƽ" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "��Ƽ�� ��Ƽ �ް��": c1.Left = 250
  ElseIf c1.Left >= 0 And c1.Left <= 840 And ��ǥ��.Caption = "��Ƽ�� ��Ƽ �ް��" Then
  For i = 1 To 4: ar(i) = 0: arrow(i).Visible = False: Next i
  ��ǥ��.Caption = "��Ƽ�� ��Ƽ": c1.Left = 6700
  End If
maping = 1
ElseIf (KeyCode = 17 And atp = 0) Or (KeyCode = 25 And atp = 0) Then
  atp = 2
ElseIf KeyCode = 13 Then
  If te = 0 Then
  Text1.Visible = True: ���ϱ�.Visible = True: te = 1
  ElseIf te = 1 Then
  ���ϱ�.Caption = Text1.Text: ����.Visible = True: Text1.Visible = False: ���ϱ�.Visible = True: te = 0
  End If

Else
  If (KeyCode >= 33 And KeyCode <= 36) Or (KeyCode >= 45 And KeyCode <= 46) Or (KeyCode >= 97 And KeyCode <= 105) Or (KeyCode >= 65 And KeyCode <= 90) Then
   If Ű��.k(KeyCode).Tag = "�κ�" Then
        If inv.Visible = True Then
          inv.Visible = False
        ElseIf inv.Visible = False Then
          inv.Visible = True
        End If
    ElseIf Ű��.k(KeyCode).Tag = "���" Then
      dj = MsgBox("�����̿ϼ��Դϴ�.", vbCritical, "�̿ϼ��ڵ�FG210!")
    ElseIf Ű��.k(KeyCode).Tag = "��ų" Then
      If skill.Visible = True Then
            skill.Visible = True
            skill.����1��(1).Top = -5000: skill.����1��(2).Top = -5000
            If map.job.Caption <> "�ʺ���" Then
                skill.����1��(Val(map.jobit.Caption)).Top = 360
            End If
        ElseIf skill.Visible = False Then
            skill.Visible = True
            skill.����1��(1).Top = -5000: skill.����1��(2).Top = -5000
            If map.job.Caption <> "�ʺ���" Then
                skill.����1��(Val(map.jobit.Caption)).Top = 360
            End If
        End If
    ElseIf Ű��.k(KeyCode).Tag = "�޴�" Then
      If �޴�.Top = 840 Then
        �޴�.Top = -5000
      ElseIf �޴�.Top = -5000 Then
        �޴�.Top = 840
      End If
    ElseIf Ű��.k(KeyCode).Tag = "����" Then
      If stat.Visible = True Then
        stat.Visible = False
      ElseIf stat.Visible = False Then
        stat.Visible = True
      End If
    ElseIf Ű��.k(KeyCode).Tag = "��Ʈ����ũ" Then
      atp = 2: sk(1) = 1
    ElseIf Ű��.k(KeyCode).Tag = "�˱�" Then
      atp = 2: sk(2) = 1
    ElseIf Ű��.k(KeyCode).Tag = "���� ���ο�" Then
      atp = 2: sk(3) = 1
    Else
      For i = 1 To 12
        If Ű��.k(KeyCode).Tag = ������.����(i).Tag Then
        
            If Val(inv.����(i).ToolTipText) > 0 Then
            
            yu = Mid(inv.����(i).Tag, 3, 1)
            se = Mid(inv.����(i).Tag, 4)
                            
                If yu = "m" Then
                
                    If (Val(map.mpn.Caption) + Val(se)) > Val(map.mpm.Caption) Then
                    map.mpn.Caption = Val(map.mpn.Caption) + Val(se)
                    cmp = map.mpn.Caption
                    Else
                    map.mpn.Caption = Val(map.mpm.Caption) + Val(se)
                    cmp = map.mpn.Caption
                    End If
                
                ElseIf yu = "h" Then
                
                    If Val(map.hpn.Caption) + Val(se) > Val(map.hpm.Caption) Then
                    map.hpn.Caption = Val(map.hpn.Caption) + Val(se)
                    chp = map.hpn.Caption
                    Else
                    map.hpn.Caption = Val(map.hpn.Caption) + Val(se)
                    chp = map.hpn.Caption
                    End If
                
                End If
            
            inv.����(i).ToolTipText = (Val(inv.����(i).ToolTipText) - 1)
            End If
        End If
      Next i
    End If
    
    
  End If
End If
End Sub
Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)

atp = 0

If bb = 1 Or cl = 1 Then
  If job.Caption = "�ʺ���" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-�޽�2.gif")
  ElseIf job.Caption = "����" Then
  c1.Width = 720
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ21.gif")
  ElseIf job.Caption = "������" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���21.gif")
  ElseIf job.Caption = "�ü�" Then
  c1.Width = 1095
  c1.Height = 1110
  c1.Left = c1.Left - 120
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����21.gif")
  ElseIf job.Caption = "���ݼ���" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ21.gif")
  End If
ElseIf bb = 2 Or cl = 2 Then
  If job.Caption = "�ʺ���" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\c-�޽�1.gif")
  ElseIf job.Caption = "����" Then
  c1.Width = 720
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ11.gif")
  ElseIf job.Caption = "������" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\���11.gif")
  ElseIf job.Caption = "�ü�" Then
  c1.Width = 1095
  c1.Height = 1110
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����11.gif")
  ElseIf job.Caption = "���ݼ���" Then
  c1.Picture = LoadPicture("C:\Program Files\DragonStriker\root\c\����Ʈ11.gif")
  End If
End If
bb = 0
js = 0


End Sub
Private Sub Form_Load()

tih = 0: tim = 0: tis = 0
upa = 0: bb = 0: atp = 0: cl = 1: ma = 1: te = 0: aw = 0: dem = 0: demo = 0: dmm = 0: demm = 0: alt = 0: al = 0
For i = 1 To 5: hp(i) = 20: Next i: For i = 6 To 10: hp(i) = 100: Next i
For i = 11 To 13: hp(i) = 350: Next i: For i = 14 To 17: hp(i) = 200: Next i
hp(18) = 1000: maping = 1: trv = 0
If job.Caption = "�ʺ���" Then
txww = ((Val(lv.Caption) * 1) + (Val(stat.str.Caption) * 2)) - ((Val(lv.Caption) * 1) + (Val(stat.str.Caption) * 1))
Randomize
at = Int(Rnd * txww) + ((Val(lv.Caption) * 1) + (Val(stat.str.Caption) * 1))
End If
chp = 50: mhp = 50: cmp = 25: mmp = 25: exn = 0: exm = 1: lev = 1: sp = 0: kp = 0
For i = 1 To 18: md(i) = 0: Next i
For i = 14 To 17: m(i).Tag = 75: Next i
For i = 14 To 17: hp(i) = 75: Next i
For i = 18 To 18: hp(i) = 2500: Next i
For i = 18 To 18: m(i).Tag = 2500: Next i
maping = 1

Close #1, #2, #3

Open "C:\Program Files\DragonStriker\ip1.dll" For Input As #1
Open "C:\Program Files\DragonStriker\ip2.dll" For Input As #2
Open "C:\Program Files\DragonStriker\ip3.dll" For Input As #3
Input #1, a1: Input #2, a2: Input #3, a3

If login.ar.Caption = 1 Then
map.Caption = "DragonStriker Beta 0.1.420748       " & a1 & "(��)�� �α��� �ϼ̽��ϴ�.": Name1.Caption = a1: kr = a1
ElseIf login.ar.Caption = 2 Then
map.Caption = "DragonStriker Beta 0.1.420748       " & a2 & "(��)�� �α��� �ϼ̽��ϴ�.": Name1.Caption = a2: kr = a2
ElseIf login.ar.Caption = 3 Then
map.Caption = "DragonStriker Beta 0.1.420748      " & a3 & "(��)�� �α��� �ϼ̽��ϴ�.": Name1.Caption = a3: kr = a3
End If

Close #1, #2, #3

If login.ar.Caption = 1 Then
  Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Input As #1
ElseIf login.ar.Caption = 2 Then
  Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Input As #1
ElseIf login.ar.Caption = 3 Then
  Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Input As #1
End If
    Input #1, tih
    Input #1, tim
    Input #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Input #1, rtw: Ű��.k(i).Tag = rtw
      End If
    Next i
    
    
Input #1, rtw: lv.Caption = rtw: Input #1, rtw: job.Caption = rtw: Input #1, rtw: expn.Caption = rtw: Input #1, rtw: hpn.Caption = rtw: chp = rtw: Input #1, rtw: hpm.Caption = rtw: Input #1, rtw: mpn.Caption = rtw: cmp = rtw: Input #1, rtw: mpm.Caption = rtw: Input #1, rtw: ��ǥ��.Caption = rtw: Input #1, rtw: stat.str.Caption = rtw: Input #1, rtw: stat.dex.Caption = rtw: Input #1, rtw: stat.inter.Caption = rtw: Input #1, rtw: stat.luk.Caption = rtw: Input #1, rtw: stat.sp.Caption = rtw
Input #1, rtw: qu1 = rtw: Input #1, rtw: que = rtw: Input #1, rtw: qus = rtw

For i = 1 To 3
Input #1, rtw: skill.sk(i).Caption = rtw
Next i
For i = 1 To 6
Input #1, rtw: skill.sk1(i).Caption = rtw
Next i
Input #1, rtw: skill.kp.Caption = rtw: expp.Caption = (lv.Caption ^ 3): exm = Val(lv.Caption) ^ 3: exn = Val(expn.Caption)
Input #1, rtw: inv.money.Caption = rtw
 For i = 1 To 12: Input #1, rtw: inv.����(i).ToolTipText = rtw: Next i: For i = 1 To 11: Input #1, rtw: inv.��(i).ToolTipText = rtw: Next i: For i = 1 To 4: Input #1, rtw: inv.arrow(i).ToolTipText = rtw: Next i
 Close #1, #2, #3

If ��ǥ��.Caption <> "�˰����� �Ϻ��̿��� ��ġ�� ������ �м��� ��" Then
npc�Ϻ���.Top = -5000: �Ϻ���.Top = -5000
mapi(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky1.jpg")
mapi(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky2.jpg")
End If

If ��ǥ��.Caption = "�ʱ� �������� ������1" Then
npc������.Visible = True
End If

For i = 1 To 13
m(i).Visible = True
mh(i).Visible = True
Next i
For i = 14 To 18
m(i).Visible = True
mz(i) = 0
Next i
For i = 1 To 10
sk(i) = 0
Next i
End Sub
Private Sub hp���׹���_Timer()

If Val(hpn.Caption) > Val(hpm.Caption) Then
hpn.Caption = hpm.Caption
chp = (hpn.Caption)
mhp = hpm.Caption
End If

If Val(mpn.Caption) > Val(mpm.Caption) Then
mpn.Caption = mpm.Caption
cmp = (mpn.Caption)
mmp = mpm.Caption
End If

If Val(hpn.Caption) < 0 Then
hpn.Caption = 0: chp = 0
End If

End Sub
Private Sub hp��_Timer()

If hpn.Caption + 5 + (Val(skill.sk(3).Caption) * 2) <= hpm.Caption Then
hpn.Caption = hpn.Caption + 5 + (Val(skill.sk(3).Caption) * 2)
chp = chp + 5 + (Val(skill.sk(3).Caption) * 2)
ElseIf hpn.Caption + 5 + (Val(skill.sk(3).Caption) * 2) > hpm.Caption Then
hpn.Caption = hpm.Caption
chp = hpm.Caption
End If
If mpn.Caption + 5 <= mpm.Caption Then
mpn.Caption = mpn.Caption + 5
cmp = cmp + 5
ElseIf mpn.Caption + 5 > mpm.Caption Then
mpn.Caption = mpm.Caption
cmp = mpm.Caption
End If

hp��.Interval = 8000 - (Val(skill.sk(3).Caption) * 100)

End Sub
Private Sub hpǥ��_Timer()

hpn.Caption = chp
If (hpn.Caption > 0) Then
hpc.Width = (hpn.Caption / hpm.Caption) * 2000
End If

End Sub
Private Sub Label2_Click()
���������.Visible = True
End Sub
Private Sub Label6_Click()
�޴�.Top = -5000
End Sub
Private Sub M_ea_Click(Index As Integer)
���.Visible = True
End Sub
Private Sub M_exit_Click(Index As Integer)
dj = MsgBox("������ ���� �����Ͻðڽ��ϱ�?[�����Ͻø� �� " & kr & "�� �ִ� ���ݱ����� ������ �������� ��ü�˴ϴ�.]", vbYesNo, "����M_End01 Y/N")

If dj = 6 Then

    If login.ar.Caption = 1 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
    ElseIf login.ar.Caption = 2 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
    ElseIf login.ar.Caption = 3 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
    End If
    
    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (Ű��.k(i).Tag)
      End If
    Next i

    Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, ��ǥ��.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
    Print #1, qu1: Print #1, que: Print #1, qus
    For i = 1 To 3
    Print #1, skill.sk(i).Caption
    Next i
    For i = 1 To 6
    Print #1, skill.sk1(i).Caption
    Next i
    Print #1, skill.kp.Caption
    Print #1, inv.money.Caption
    For i = 1 To 12: Print #1, inv.����(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.��(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
    Close #1, #2, #3
    dj = MsgBox("����Ǿ����ϴ�.", vbOKOnly, "DsSave")
Else
dj = MsgBox("'DragonStriker' �� ���� �մϴ�", vbCritical, "DSM_End")
End If

End
End Sub
Private Sub M_inv_Click(Index As Integer)
inv.Visible = True
End Sub
Private Sub M_key_Click(Index As Integer)
Ű��.Visible = True
End Sub
Private Sub M_logeout_Click(Index As Integer)

dj = MsgBox("������ �Ͻð� �α׾ƿ� �Ͻðڽ��ϱ�?[�����Ͻø� �� " & kr & "�� �ִ� ���ݱ����� ������ �������� ��ü�˴ϴ�.]", vbYesNo, "����FF2Y/N")

If dj = 6 Then

    If login.ar.Caption = 1 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
    ElseIf login.ar.Caption = 2 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
    ElseIf login.ar.Caption = 3 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
    End If

    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (Ű��.k(i).Tag)
      End If
    Next i

    Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, ��ǥ��.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
    Print #1, qu1: Print #1, que: Print #1, qus
    For i = 1 To 3
    Print #1, skill.sk(i).Caption
    Next i
    For i = 1 To 6
    Print #1, skill.sk1(i).Caption
    Next i
    Print #1, skill.kp.Caption
    Print #1, inv.money.Caption
    For i = 1 To 12: Print #1, inv.����(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.��(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
    Close #1, #2, #3
    dj = MsgBox("����Ǿ����ϴ�. �α׾ƿ� �մϴ�.", vbOKOnly, "DsSave")
Else
dj = MsgBox("������ ����߽��ϴ�. �α׾ƿ� �մϴ�.", vbCritical, "DSsave")
End If

Unload map
login.Visible = True
login.fl.Top = 1320
login.����.Top = 5000
login.ĳ������.Top = 5000
login.Command1.Caption = "Ȯ��"
login.Command2.Caption = "���������"
login.Text1.Text = ""
login.Text2.Text = ""
wma1.Close
End Sub

Private Sub M_qu_Click(Index As Integer)
quest.Visible = True
End Sub
Private Sub M_Save_Click(Index As Integer)

dj = MsgBox("�����Ͻðڽ��ϱ�?[�����Ͻø� �� " & kr & "�� �ִ� ���ݱ����� ������ �������� ��ü�˴ϴ�.]", vbYesNo, "����FF2Y/N")

If dj = 6 Then

    If login.ar.Caption = 1 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
    ElseIf login.ar.Caption = 2 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
    ElseIf login.ar.Caption = 3 Then
    Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
    End If

    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (Ű��.k(i).Tag)
      End If
    Next i

    Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, ��ǥ��.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
    Print #1, qu1: Print #1, que: Print #1, qus
    For i = 1 To 3
    Print #1, skill.sk(i).Caption
    Next i
    For i = 1 To 6
    Print #1, skill.sk1(i).Caption
    Next i
    Print #1, skill.kp.Caption
    Print #1, inv.money.Caption
    For i = 1 To 12: Print #1, inv.����(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.��(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
    Close #1, #2, #3
    dj = MsgBox("����Ǿ����ϴ�.", vbOKOnly, "DsSave")
Else
dj = MsgBox("������ ����߽��ϴ�.", vbCritical, "DSsave")
End If

End Sub
Private Sub M_Skill_Click(Index As Integer)
skill.Visible = True
End Sub
Private Sub M_SoundChange_Click(Index As Integer)
kp = MsgBox("���� �������δ� ���������ʴ� ����Դϴ�. 0.2.5 �̻��� ������ �����մϴ�.", vbCritical, "Error Code 1107")
End Sub
Private Sub M_SoundPlay_Click(Index As Integer)
wma1.URL = "C:\Program Files\DragonStriker\root\sound\02BattleOfRose.wma"
wma1.newMedia ("C:\Program Files\DragonStriker\root\sound\02BattleOfRose.wma")
End Sub
Private Sub M_SoundStop_Click(Index As Integer)
wma1.Close
End Sub
Private Sub M_stat_Click(Index As Integer)
stat.Visible = True
End Sub
Private Sub m�̵�_Timer()

For i = 14 To 18

Randomize
r = Int(Rnd * 3)

    If r = 0 Then
        m(i).Left = m(i).Left
    ElseIf r = 1 And m(i).Left > 0 Then
        Randomize
        m(i).Left = m(i).Left - ((Int(Rnd * 4) + 2) * 100)
        m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\����01.gif")
    ElseIf r = 2 And m(i).Left < 14040 Then
        Randomize
        m(i).Left = m(i).Left + ((Int(Rnd * 4) + 2) * 100)
        m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\����02.gif")
    End If

Next i

End Sub
Private Sub Menu_Click()
�޴�.Top = 840
End Sub
Private Sub mgen_Timer()

For i = 1 To 18

If md(i) = 1 Then
    r = 0
    If i >= 1 And i <= 5 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m11.gif")
            mh(i).Visible = True
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m12.gif")
            mh(i).Visible = True
        End If
        hp(i) = 20: md(i) = 0: mh(i).Visible = True: mh(i).Caption = 20: mz(i) = 0: m(i).Visible = True

    ElseIf i >= 6 And i <= 10 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m21.gif")
            mh(i).Visible = True
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m22.gif")
            mh(i).Visible = True
        End If
        hp(i) = 100: md(i) = 0: mh(i).Visible = True: mh(i).Caption = 100: mz(i) = 0: m(i).Visible = True
    ElseIf i >= 11 And i <= 13 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m31.gif")
            mh(i).Visible = True
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\m32.gif")
            mh(i).Visible = True
        End If
        hp(i) = 350: md(i) = 0: mh(i).Visible = True: mh(i).Caption = 350: mz(i) = 0: m(i).Visible = True
    ElseIf i >= 14 And i <= 17 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\����01.gif")
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\����02.gif")
        End If
        hp(i) = 75: md(i) = 0: mz(i) = 0: m(i).Tag = 75: m(i).Visible = True
    ElseIf i = 18 Then
    Randomize
    r = Int(Rnd * 2)
        If r = 0 Then
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\����01.gif")
        Else
            m(i).Visible = True
            m(i).Picture = LoadPicture("C:\Program Files\DragonStriker\root\monster\����02.gif")
        End If
        hp(i) = 2500: md(i) = 0: mz(i) = 0: m(i).Tag = 2500: m(i).Visible = True
    End If
m(i).Visible = True
End If
Next i
End Sub

Private Sub mon_Timer()

If aq = 1 Then

For i = 1 To 18

If (m(i).Left - 500 < c1.Left And m(i).Left + 1500 > c1.Left + 500) Then

  If job.Caption = "�ʺ���" Then
  txww = (((Val(stat.str.Caption)) / 4) + (Val(map.lv.Caption) * 2)) - (((Val(stat.str.Caption)) / 5) + (Val(map.lv.Caption) * 1))
  dxww = (((Val(stat.str.Caption)) / 5) + (Val(map.lv.Caption) * 1))
  ElseIf job.Caption = "����" Then
  txww = ((((Val(stat.str.Caption)) * (Val(stat.dex.Caption))) / 8) + (Val(map.lv.Caption))) - (((Val(stat.str.Caption)) * ((Val(stat.dex.Caption)) / 3) / 4) + map.lv.Caption)
  dxww = (((Val(stat.str.Caption)) * ((Val(stat.dex.Caption)) / 3) / 4) + map.lv.Caption)
  ElseIf job.Caption = "������" Then
  ElseIf job.Caption = "�ü�" Then
  Exit For
  ElseIf job.Caption = "���" Then
  txww = 0
  End If
  at = 0
    Randomize
    at = at + Int((Int(Rnd * txww) + dxww) + 0.5) + (Val(stat.�������÷���.Tag))
    
Randomize
r = (Int(Rnd * 100) + 1)
    If r <= ((Val(skill.sk(2).Caption) * 5) + 15 + (skill.sk1(4) * 2)) Then
        at = Int((at * (((skill.sk(2).Caption * 20) + 100 + (skill.sk1(4) * 4)) / 100)) + 0.5)
        up = " !"
        Else
        up = ""
    End If
   
    If i <= 5 And ��ǥ��.Caption = "�ʱ� �������� ������1" Then
        If Val(mh(i).Caption) > 0 Then
        Randomize
        dem = i
        ������.Top = m(i).Top - 300
          at = (at - (Int(Rnd * 2) + 0))
          If at <= 0 Then
          ������.Caption = "Miss": at = 0
          Else
          ������.Caption = at & up
          hp(i) = hp(i) - at
          End If
          
        demo = 1
        ������.Left = m(i).Left - 130
        ������.Visible = True
        Exit For
        End If
    ElseIf i > 5 And i <= 10 And ��ǥ��.Caption = "�ʱ� �������� ������2" Then
        If Val(mh(i).Caption) > 0 Then
        Randomize
        dem = i
        ������.Top = m(i).Top - 300
        at = (at - (Int(Rnd * 4) + 5))
          If at <= 0 Then
          ������.Caption = "Miss": at = 0
          Else
          ������.Caption = at & up
          hp(i) = hp(i) - at
          End If
          
        demo = 1
        ������.Left = m(i).Left - 130
        ������.Visible = True
        Exit For
        End If
    ElseIf i > 10 And i <= 13 And ��ǥ��.Caption = "�ʱ� �������� ������3" Then
     If Val(mh(i).Caption) > 0 Then
     Randomize
     dem = i
     ������.Top = m(i).Top - 300
       at = (at - (Int(Rnd * 4) + 10))
       If at <= 0 Then
       ������.Caption = "Miss": at = 0
       Else
       ������.Caption = at & up
       hp(i) = hp(i) - at
       End If
       
     demo = 1
     ������.Left = m(i).Left - 130
     ������.Visible = True
        Exit For
    End If
    ElseIf (i >= 14 And i <= 17) Then
    
        If ��ǥ��.Caption = "������ �ܰ�1" Then
            If ((hp(i)) > 0 And Val(m(i).Tag) > 0 And md(i) = 0) Then
            Randomize
            dem = i
            ������.Top = m(i).Top - 300
              at = (at - (Int(Rnd * 4) + 4))
              If at <= 0 Then
              ������.Caption = "Miss": at = 0
              Else
              ������.Caption = at & up
              hp(i) = hp(i) - at
              End If
              
            demo = 1
            ������.Left = m(i).Left - 130
            ������.Visible = True
            Exit For
          End If
          
        ElseIf ��ǥ��.Caption = "ū ������" Then
            If ((hp(i)) > 0 And Val(m(i).Tag) > 0 And md(i) = 0) Then
            Randomize
            dem = i
            ������.Top = m(i).Top - 300
              at = (at - (Int(Rnd * 4) + 4))
              If at <= 0 Then
              ������.Caption = "Miss": at = 0
              Else
              ������.Caption = at & up
              hp(i) = hp(i) - at
              End If
              
            demo = 1
            ������.Left = m(i).Left - 130
            ������.Visible = True
            Exit For
          End If
        End If
        
    ElseIf i >= 18 And i <= 18 And ��ǥ��.Caption = "ū ������" And md(i) = 0 Then
        If Val(m(i).Tag) > 0 Then
        Randomize
        dem = i
        ������.Top = m(i).Top - 420
          at = (at - (Int(Rnd * 8) + 16))
          If at <= 0 Then
          ������.Caption = "Miss": at = 0
          Else
          ������.Caption = at & up
          hp(i) = hp(i) - at
          End If
          
        demo = 1
        ������.Left = m(i).Left - 130
        ������.Visible = True
        Exit For
        End If
     End If
End If

aq = 0
Next i

End If




For i = 1 To 5

  If (hp(i) <= 0 And md(i) = 0 And mz(i) = 0) And ��ǥ��.Caption = "�ʱ� �������� ������1" Then
      mh(i).Visible = False
      exn = exn + 6
      mz(i) = 1
      md(i) = 1
      ddeem = �߿����.Caption
      �߿����.Caption = ddeem & "����ġ�� ������ϴ�.(+6)" & "               "
         If que = 2 Then
         qus = qus + 1
         End If
      Randomize
r = (Int(Rnd * 100) + 1)
If r >= 40 Then
inv.money.Caption = Val(inv.money.Caption) + Int((r * 2) / 10)
ddeem = �߿����.Caption
�߿����.Caption = ddeem & "Gold�� ������ϴ�. (" & Int((r * 2) / 10) & ")" & "                    "
End If
  End If
  


Next i
For i = 6 To 10

  If (hp(i) <= 0 And md(i) = 0 And mz(i) = 0) And ��ǥ��.Caption = "�ʱ� �������� ������2" Then
      mh(i).Visible = False
      exn = exn + 18
      mz(i) = 1
      md(i) = 1
      ddeem = �߿����.Caption
      �߿����.Caption = ddeem & "����ġ�� ������ϴ�.(+18)" & "              "
        If que = 4 Then
        qus = qus + 1
        End If
      Randomize
r = (Int(Rnd * 100) + 1)
If r >= 35 Then
inv.money.Caption = Val(inv.money.Caption) + Int((r * 2) / 8)
ddeem = �߿����.Caption
�߿����.Caption = ddeem & "Gold�� ������ϴ�. (" & Int((r * 2) / 8) & ")" & "                    "
End If
  End If


Next i
For i = 11 To 13

  If (hp(i) <= 0 And md(i) = 0 And mz(i) = 0) And ��ǥ��.Caption = "�ʱ� �������� ������3" Then
      mh(i).Visible = False
      exn = exn + 45
      mz(i) = 1
      md(i) = 1
      ddeem = �߿����.Caption
      �߿����.Caption = ddeem & "����ġ�� ������ϴ�.(+45)" & "              "
        If que = 6 Then
        qus = qus + 1
        End If
      Randomize
r = (Int(Rnd * 100) + 1)
If r >= 31 Then
inv.money.Caption = Val(inv.money.Caption) + Int((r * 3) / 7)
ddeem = �߿����.Caption
�߿����.Caption = ddeem & "Gold�� ������ϴ�. (" & Int((r * 3) / 7) & ")" & "                    "
End If
  End If


Next i
For i = 14 To 17

  If ((hp(i) <= 0 And md(i) = 0 And mz(i) = 0)) Then
   If ��ǥ��.Caption = "ū ������" Then
   
      exn = exn + 25
      mz(i) = 1
      md(i) = 1
      ddeem = �߿����.Caption
      �߿����.Caption = ddeem & "����ġ�� ������ϴ�.(+25)" & "              "
        If que = 8 Then
        qus = qus + 1
        End If
      Randomize
      r = (Int(Rnd * 100) + 1)
        If r >= 37 Then
        inv.money.Caption = Val(inv.money.Caption) + Int((r * (3.8)) / 8)
        ddeem = �߿����.Caption
        �߿����.Caption = ddeem & "Gold�� ������ϴ�. (" & Int((r * (3.8)) / 8) & ")" & "                    "
        End If
        
   ElseIf ��ǥ��.Caption = "������ �ܰ�1" Then
   
      exn = exn + 25
      mz(i) = 1
      md(i) = 1
      ddeem = �߿����.Caption
      �߿����.Caption = ddeem & "����ġ�� ������ϴ�.(+25)" & "              "
        If que = 8 Then
        qus = qus + 1
        End If
      Randomize
      r = (Int(Rnd * 100) + 1)
        If r >= 37 Then
        inv.money.Caption = Val(inv.money.Caption) + Int((r * (3.8)) / 8)
        ddeem = �߿����.Caption
        �߿����.Caption = ddeem & "Gold�� ������ϴ�. (" & Int((r * (3.8)) / 8) & ")" & "                    "
        End If
        
    End If
  End If


Next i
For i = 18 To 18

  If (hp(i) <= 0 And md(i) = 0 And mz(i) = 0) And ��ǥ��.Caption = "ū ������" Then
      exn = exn + 450
      mz(i) = 1
      md(i) = 1
      ddeem = �߿����.Caption
      �߿����.Caption = ddeem & "����ġ�� ������ϴ�.(+450)" & "              "
      Randomize
r = (Int(Rnd * 100) + 1)
If r >= 25 Then
inv.money.Caption = Val(inv.money.Caption) + Int((r * 20) / 2)
ddeem = �߿����.Caption
�߿����.Caption = ddeem & "Gold�� ������ϴ�. (" & Int((r * 20) / 2) & ")" & "                    "
End If
  End If


Next i
For i = 1 To 13

If hp(i) <= 0 Then
    m(i).Visible = False
    mh(i).Caption = ""
    mh(i).Caption = False
End If

Next i

For i = 14 To 18
  If hp(i) <= 0 Then
    m(i).Visible = False
  End If
Next i

If q1 = 1 Then

For i = 1 To 13
mh(i).Caption = hp(i)
Next i
For i = 14 To 18
hp(i) = m(i).Tag
Next i

End If


If chp / mhp * 2000 <= 0 Then
opeariton = MsgBox("����ϼ̽��ϴ�. Ȯ���� �����ø� ����� �������� ��Ȱ�մϴ�.", vbOKOnly, "����޼���")
    ddeem = �߿����.Caption
    �߿����.Caption = ddeem & "����ġ�� �����̽��ϴ�.(-" & (lv.Caption * 3) & ")" & "            "
    exn = exn - (lv.Caption * 3)
hpn.Caption = 50
chp = 50
End If

����.Left = c1.Left - 480

If (exn >= exm) Then
    mhp = hpm.Caption + 20: chp = mhp: hpm.Caption = mhp
    mmp = mpm.Caption + 15: cmp = mmp: mpm.Caption = mmp: mpn.Caption = cmp
    exn = exn - exm: exm = ((Val(lv.Caption) + 1) ^ 3): expp.Caption = Val(exm)
    lev = lv.Caption + 1: lv.Caption = lev: hpn.Caption = chp: sp = sp + 5: kp = kp + 1: up.Visible = True: upa = 1
    stat.sp.Caption = ((stat.sp.Caption) + 5): skill.kp.Caption = ((skill.kp.Caption) + 3)
    ddeem = �߿����.Caption: �߿����.Caption = ddeem & "�������� �ϼ̽��ϴ�." & "                      "
    

If map.job.Caption = "�ʺ���" Then
txww = ((Val(stat.str.Caption) * 3) - (Val(lv.Caption) * 10)) - (((Val(stat.str.Caption) * 2) + 1) - (Val(lv.Caption) * 10))
ase = (((Val(stat.str.Caption) * (2.5)) + 1) - (Val(lv.Caption) * 10))
ElseIf map.job.Caption = "���" Then
ase = 999999
If ase <= 0 Then
ase = 1
End If
stat.����.Caption = ase
End If

stat.lv.Caption = stat.lv.Caption + 1

If lev > 9 And job.Caption = "�ʺ���" Then
    ��������.Top = 2640
    jobch = MsgBox("�� ���� ���� 10�� �Ǵٴ�...", vbOKOnly, "��������"): jobch = MsgBox("�׷��� ���� ���� ������ ���� ������ �� �ְڳ�. ���ͳ� �ȵ��ͳ�?", vbYesNo, "��������")
    If jobch = 6 Then
      jobch = MsgBox("���� ����� ������ �ºθ� �����ϴ� �����̶��", vbOKOnly, "��������"): jobch = MsgBox("������ �������� STR�� DEX�� �Ϻΰ� ��������", vbOKOnly, "��������"): jobch = MsgBox("����� ���ݼӵ����� �������� �߽��ϴ� ��������", vbOKOnly, "��������"): jobch = MsgBox("�׸��� ����� ���� �Ѹ����� ������ ������ ���ϴ� �� ��������;", vbOKOnly, "��������"): jobch = MsgBox("�ü��� Ȱ�� ȭ������ �ºθ� �����ϴ� �����̶��", vbOKOnly, "��������"): jobch = MsgBox("�ü��� �������� DEX�� STR�� �Ϻκ��� ��������", vbOKOnly, "��������"): jobch = MsgBox("���ݼӵ��� ���Ѵٸ� �ü��� �����ϴ°� ������; �ϴܼ������ϰ�.", vbOKOnly, "��������")
      jobch = MsgBox("�׸��� ������ ���� ���� �����ϴµ��� �ü��� �����̳�", vbOKOnly, "��������"): jobch = MsgBox("������� ���״�� �������� �ºθ� �����ϴ� �����̾�", vbOKOnly, "��������"): jobch = MsgBox("�������� ������ INT �� LUK�� �����ϳ�", vbOKOnly, "��������"): jobch = MsgBox("ȭ���ϰ� ���� ��ų�� ��ü������ ���Ѵٸ� ������� ������ ���Գ�; ������ִ�", vbOKOnly, "��������"): jobch = MsgBox("�׸��� ���������� ���ݼ��簡 �ֳ�", vbOKOnly, "��������"): jobch = MsgBox("���ݼ���� �� �˷����� ���� �����̳�...", vbOKOnly, "��������"): jobch = MsgBox("������ ���� �� �Ӽ����� �����ϰ� �ָ����� �ܰŸ� ������ �Ѵٴ°� ������ ������ �ǰ� �ֳ�", vbOKOnly, "��������")
    End If
      jobch = MsgBox("�� �׷��� ���� ������������ ������ �̵����� �ְڳ�", vbOKOnly, "��������"): ��ǥ��.Caption = "������������ ����" & ��ǥ��.Caption: ��������.Top = -5000
    For i = 1 To 18
        m(i).Top = m(i).Top - 5000
        If i <= 13 Then
        mh(i).Visible = False
        End If
    Next i
    c������.Top = c������.Top - 5000: Cǥ����.Top = Cǥ����.Top - 5000: door1.Top = door1.Top - 5000: door2.Top = door2.Top - 5000
    �ü���������.Top = 2160: ��������������.Top = 2160: ������������.Top = 2160: ���ݼ�����������.Top = 2160
End If
End If

End Sub
Private Sub mpǥ��_Timer()
mpn.Caption = cmp
mpc.Width = (mpn.Caption / mpm.Caption) * 2000
End Sub
Private Sub npc_Timer()

If �Ϻ���.ForeColor <> &HFFFF& Then
�Ϻ���.ForeColor = &HFFFF&
ElseIf �Ϻ���.ForeColor = &HFFFF& Then
�Ϻ���.ForeColor = &HC00000
End If

End Sub
Private Sub npc�������1_Click()
����üũ.Caption = "����"
������.Caption = map.����üũ.Caption & "���ΰ��� ��ȭ"
������.����.Top = -5000: ������.����.Top = 120: ������.��.Top = -5000
������.Visible = True: ������.ind.Caption = 1
End Sub
Private Sub npc�������1_Click()
����üũ.Caption = "����"
������.Caption = map.����üũ.Caption & "���ΰ��� ��ȭ"
������.����.Top = 120: ������.����.Top = -5000: ������.��.Top = -5000
������.Visible = True: ������.ind.Caption = 1
End Sub
Private Sub npc������1_Click()
����üũ.Caption = "��"
������.Caption = map.����üũ.Caption & "���ΰ��� ��ȭ"
������.����.Top = -5000: ������.����.Top = -5000: ������.��.Top = 120
������.Visible = True: ������.ind.Caption = 1
End Sub
Private Sub npc�м�_Click()

op = MsgBox("���� ���Ǹ��� �ִ� �����Դϴ�. ������ ������ �ƹ��͵� �����ϴ�.", vbQuestion, "npc��ȭ")

End Sub
Private Sub npc������_Click()

If que = 0 Then

  tw = MsgBox("�ȳ� ���� ���������̾�. �ϴ� DragonStriker�� ���� ������ �ٲ�.", vbOKOnly, "��������")
  tw = MsgBox("DragonStriker �� jiun0623 �� heonsheen �� ���� vb rpg �����̾�. ", vbOKOnly, "��������"): tw = MsgBox("�� ������ ��,�� �� �����ϼ� �ְ� �� �� ���� �̵��Ҽ� �־�.", vbOKOnly, "��������"): tw = MsgBox("������ Beta �����̶� ������ ��������� �ʾ�.", vbOKOnly, "��������"): tw = MsgBox("���ʹ� �� 5������ �ְ� ���������� '����' ��ŭ�� ���� ������ �ְ� ������ ��ŭ�� ����ġ�� �������־�.", vbOKOnly, "��������"): tw = MsgBox("��� ������ ���ٺ��� ��Ƽ�� ��Ƽ�� ���� �װ����� ����� ������ ��������� ����� ���� ������ �ȵ�, ������ ��밡���� �κ��丮 â�� ��� ���ϴ� ������ Ŭ���� �ѹ� �ϸ� ������ ����", vbOKOnly, "��������")
  tw = MsgBox("i�� �������� �κ��丮â�� �����ְ�, m�� ������ �޴��� �߰� , s �� ������ ����â�� ������ , k�� ������ ��ųâ�� ����", vbOKOnly, "��������"): tw = MsgBox("������ �޴����� Save �� Ŭ���ϸ� ��. �ҷ������ �α��� �ҋ� �ڵ����� �ҷ����ܴ�. ", vbOKOnly, "��������"): tw = MsgBox("������ ���� 2������ ����� �ü�, ���� 10�̵Ǹ� ���� ���������� ������ �����ٲ�. �ϴ� �� �Ʒ��� �غ��� ������? �ϰ������[�ٽ�Ŭ��]", vbOKOnly, "��������")
  que = 1
  
ElseIf que = 1 Then

  tw = MsgBox("�� �Ʒ��� �ϰ������ �ϰ� ���ϰ������ ���ϴ°ž� ; �Ҳ��� ���� �Ʒ��� ��������. �ϴ� �����ִ� �������� 5������ ��ƿ� �������̴ϱ� ���� ����� ��������, Tip[ũ��Ƽ����ġ�� ������ ���� ������ �ֽ��ϴ�]", vbOKOnly, "��������")
  que = 2
  
ElseIf que = 2 Then

  If qus >= 5 Then
  tw = MsgBox("�� ���߱��� ���� �������� , �� �Ʒ��Ϸ��� �ٽ�Ŭ����", vbOKOnly, "��������")
  tw = MsgBox("����ġ�� ������ϴ�(+25) Gold�� ������ϴ�(+250) ��������������ϴ�(�������ֽ� 10��)", vbOKOnly, "��������")
  exn = exn + 25: inv.money.Caption = (Val(inv.money.Caption) + 250): inv.����(1).ToolTipText = (Val(inv.����(1).ToolTipText) + 10)
  que = 3: qus = 0
  Else
  tw = MsgBox("���� " & 5 - qus & "������ ���Ҿ�", vbCritical, "��������")
  End If
  
ElseIf que = 3 Then

  tw = MsgBox("�̹��� ��������2�� 7������ ��ƿ� �������̴ϱ� ���� ����� ��������, Tip[ǥ���ǿ� ���罺Ʈ��Ʈ�� �ֽ��ϴ�.]", vbOKOnly, "��������")
  que = 4
  
ElseIf que = 4 Then

  If qus >= 7 Then
  tw = MsgBox("�� ���߱��� ���� �������� , �� �Ʒ��Ϸ��� �ٽ�Ŭ����", vbOKOnly, "��������")
  tw = MsgBox("����ġ�� ������ϴ�(+100) Gold�� ������ϴ�(+500) ��������������ϴ�(�����ֽ� 10��)", vbOKOnly, "��������")
  exn = exn + 100: inv.money.Caption = (Val(inv.money.Caption) + 500): inv.����(2).ToolTipText = (Val(inv.����(2).ToolTipText) + 10)
  que = 5: qus = 0
  Else
  tw = MsgBox("���� " & 7 - qus & "������ ���Ҿ�", vbCritical, "��������")
  End If
  
ElseIf que = 5 Then

  tw = MsgBox("�̹��� ��������3�� 5������ ��ƿ� ������ ���Ƽ� �� ���鲨��, Tip[�̰� ���� ���������ʽ��ϴ�. �밡�� �ټ���]", vbOKOnly, "��������")
  que = 6

ElseIf que = 6 Then

  If qus >= 5 Then
  tw = MsgBox("�� ���߱��� ���� �������� , �� �Ʒ��Ϸ��� �ٽ�Ŭ����", vbOKOnly, "��������")
  tw = MsgBox("����ġ�� ������ϴ�(+250) Gold�� ������ϴ�(+750) ��������������ϴ�(�������ֽ� 20��)", vbOKOnly, "��������")
  exn = exn + 250: inv.money.Caption = (Val(inv.money.Caption) + 750): inv.����(1).ToolTipText = (Val(inv.����(1).ToolTipText) + 20)
  que = 7: qus = 0
  Else
  tw = MsgBox("���� " & 5 - qus & "������ ���Ҿ�", vbCritical, "��������")
  End If
  
ElseIf que = 7 Then

  tw = MsgBox("���������� �������� 10������ ��ƿ�, Tip[������ ����°� �����մϴ�. �κ��丮 â�� ��ä�� ����ϼ���.]", vbOKOnly, "��������")
  que = 8

ElseIf que = 8 Then

  If qus >= 10 Then
  tw = MsgBox("�� ���߱��� ���� �������� ���� �ʴ� �� ������ ���谡 �� �Ǿ���", vbOKOnly, "��������")
  tw = MsgBox("����ġ�� ������ϴ�(+300) Gold�� ������ϴ�(+1000) ��������������ϴ�(�������ֽ� 40��)", vbOKOnly, "��������")
  exn = exn + 300: inv.money.Caption = (Val(inv.money.Caption) + 1000): inv.����(1).ToolTipText = (Val(inv.����(1).ToolTipText) + 40)
  que = 9: qus = 0
  Else
  tw = MsgBox("���� " & 10 - qus & "������ ���Ҿ�", vbCritical, "��������")
  End If

ElseIf que > 8 Then
  
  tw = MsgBox("�� ������ �����ٵ� ...", vbCritical, "��������")

End If

End Sub

Private Sub npc�Ϻ���_Click()
gkqls = MsgBox("�ȳ� ���� �Ϻ��� ��� �� ���������� ������ ������?", vbQuestion, "�Ϻ���")
gkqls = MsgBox("���ݺ��ʹ� ���͵��� ���ò��� ������ Ctrl �̾�", vbOKOnly, "�Ϻ���")
exn = exn + 1
    ddeem = �߿����.Caption
    �߿����.Caption = ddeem & "����ġ�� ������ϴ�.(+1)" & "                "
ma = 2
mapi(1).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky1.jpg")
mapi(2).Picture = LoadPicture("C:\Program Files\DragonStriker\root\map\1sky2.jpg")
npc�Ϻ���.Top = -5000: maping = 1
For i = 1 To 5: hp(i) = 20: mh(i).Visible = True: Next i: For i = 6 To 10: hp(i) = 100: Next i: For i = 11 To 13: hp(i) = 350: Next i
For i = 14 To 17: hp(i) = 200: Next i: For i = 18 To 18: hp(i) = 1000: Next i: q1 = 1: For i = 1 To 18: m(i).Visible = True: Next i

��ǥ��.Caption = "�ʱ� �������� ������1": door1.Visible = True: �Ϻ���.Visible = False: Cǥ����.Visible = True:
End Sub
Private Sub Save_Click()

dj = MsgBox("�����Ͻðڽ��ϱ�?[�����Ͻø� �� " & kr & "�� �ִ� ���ݱ����� ������ �������� ��ü�˴ϴ�.]", vbYesNo, "����FF2Y/N")

If dj = 6 Then

If login.ar.Caption = 1 Then
Open "C:\Program Files\DragonStriker\root\save\DsSave1.dll" For Output As #1
ElseIf login.ar.Caption = 2 Then
Open "C:\Program Files\DragonStriker\root\save\DsSave2.dll" For Output As #1
ElseIf login.ar.Caption = 3 Then
Open "C:\Program Files\DragonStriker\root\save\DsSave3.dll" For Output As #1
End If
    Print #1, tih
    Print #1, tim
    Print #1, tis
    For i = 33 To 105
      If (i >= 33 And i <= 36) Or (i >= 45 And i <= 46) Or (i >= 97 And i <= 105) Or (i >= 65 And i <= 90) Then
        Print #1, (Ű��.k(i).Tag)
      End If
    Next i

Print #1, Val(lv.Caption): Print #1, job.Caption: Print #1, Val(expn.Caption): Print #1, Val(hpn.Caption): Print #1, Val(hpm.Caption): Print #1, Val(mpn.Caption): Print #1, Val(mpm.Caption): Print #1, ��ǥ��.Caption: Print #1, Val(stat.str.Caption): Print #1, Val(stat.dex.Caption): Print #1, Val(stat.inter.Caption): Print #1, Val(stat.luk.Caption): Print #1, Val(stat.sp.Caption)
Print #1, qu1: Print #1, que: Print #1, qus
For i = 1 To 3
Print #1, skill.sk(i).Caption
Next i
For i = 1 To 6
Print #1, skill.sk1(i).Caption
Next i
Print #1, skill.kp.Caption
Print #1, inv.money.Caption
For i = 1 To 12: Print #1, inv.����(i).ToolTipText: Next i: For i = 1 To 11: Print #1, inv.��(i).ToolTipText: Next i: For i = 1 To 4: Print #1, inv.arrow(i).ToolTipText: Next i
Close #1, #2, #3
dj = MsgBox("����Ǿ����ϴ�.", vbOKOnly, "DsSave")
Else
dj = MsgBox("������ ����߽��ϴ�.", vbCritical, "DSsave")
End If

End Sub
Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then
  ���ϱ�.Visible = True: ����.Caption = Text1.Text: Text1.Text = "": ����.Visible = True: Text1.Visible = False: ���ϱ�.Visible = False: te = 0: trv = 1
End If
End Sub

Private Sub Ti_Timer()
sb.Panels(2).Text = "�����ð� : " & Time
End Sub
Private Sub Ti2_Timer()

tis = tis + 1

If tis = 60 Then
tim = tim + 1: tis = 0
End If

If tim = 60 Then
tih = tih + 1: tim = 0
End If

sb.Panels(3).Text = "���ӻ� �ð� : " & tih & " : " & tim & " : " & tis

If Ti2.Tag = 0 Then
sb.Panels(1).Text = "Dragonstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 1 Then
sb.Panels(1).Text = "dRagonstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 2 Then
sb.Panels(1).Text = "drAgonstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 3 Then
sb.Panels(1).Text = "draGonstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 4 Then
sb.Panels(1).Text = "dragOnstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 5 Then
sb.Panels(1).Text = "dragoNstriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 6 Then
sb.Panels(1).Text = "dragonStriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 7 Then
sb.Panels(1).Text = "dragonsTriker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 8 Then
sb.Panels(1).Text = "dragonstRiker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 9 Then
sb.Panels(1).Text = "dragonstIker": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 10 Then
sb.Panels(1).Text = "dragonstriKer": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 11 Then
sb.Panels(1).Text = "dragonstrikEr": Ti2.Tag = Ti2.Tag + 1
ElseIf Ti2.Tag = 12 Then
sb.Panels(1).Text = "dragonstrikeR": Ti2.Tag = 0
End If
End Sub
Private Sub upefect_Timer()
up.Left = c1.Left - 480
If upa = 1 Then
tr = Timer
Do: Loop Until Timer - tr >= 1000
upa = 0
Else
up.Visible = False
End If
upa = 0
End Sub
