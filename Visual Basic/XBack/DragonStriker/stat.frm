VERSION 5.00
Begin VB.Form stat 
   BorderStyle     =   4  '���� ���� â
   Caption         =   "Stat [Ver 3.91201]"
   ClientHeight    =   3780
   ClientLeft      =   3330
   ClientTop       =   6240
   ClientWidth     =   6405
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "stat.frx":0000
   MousePointer    =   99  '����� ����
   ScaleHeight     =   3780
   ScaleWidth      =   6405
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame5 
      Caption         =   "���λ���"
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
      Left            =   3360
      TabIndex        =   41
      Top             =   0
      Width           =   2655
   End
   Begin VB.CommandButton Command9 
      BackColor       =   &H0080FF80&
      Caption         =   "<"
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
      Left            =   3000
      Style           =   1  '�׷���
      TabIndex        =   40
      Top             =   0
      Width           =   255
   End
   Begin VB.Frame Frame4 
      Height          =   3495
      Left            =   3360
      TabIndex        =   25
      Top             =   240
      Width           =   3015
      Begin VB.Timer ��Ÿ�� 
         Interval        =   1
         Left            =   2160
         Top             =   2400
      End
      Begin VB.Timer hpmptimer 
         Interval        =   1
         Left            =   2160
         Top             =   2880
      End
      Begin VB.Label �������÷��� 
         Height          =   255
         Left            =   2160
         TabIndex        =   49
         Top             =   2160
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label Label11 
         Alignment       =   2  '��� ����
         BackStyle       =   0  '����
         BorderStyle     =   1  '���� ����
         Caption         =   "������ڸ"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   17.25
            Charset         =   129
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1575
         Left            =   2160
         TabIndex        =   48
         Top             =   1800
         Width           =   735
      End
      Begin VB.Line Line10 
         X1              =   2040
         X2              =   2040
         Y1              =   1800
         Y2              =   3360
      End
      Begin VB.Line Line9 
         X1              =   1000
         X2              =   1000
         Y1              =   2640
         Y2              =   3240
      End
      Begin VB.Line Line8 
         X1              =   1000
         X2              =   1000
         Y1              =   1800
         Y2              =   2400
      End
      Begin VB.Line Line7 
         X1              =   1000
         X2              =   1000
         Y1              =   200
         Y2              =   1500
      End
      Begin VB.Label �� 
         Alignment       =   1  '������ ����
         BorderStyle     =   1  '���� ����
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   45
         ToolTipText     =   "���⿡ ���� ���� �Դϴ�."
         Top             =   2160
         Width           =   735
      End
      Begin VB.Label �� 
         Alignment       =   1  '������ ����
         BorderStyle     =   1  '���� ����
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   44
         ToolTipText     =   "���⿡ ���� ���ݷ� �Դϴ�."
         Top             =   1800
         Width           =   735
      End
      Begin VB.Label Label10 
         Caption         =   "����"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   43
         ToolTipText     =   "�����ۿ� ���� ����"
         Top             =   2200
         Width           =   375
      End
      Begin VB.Label Label9 
         Caption         =   "���ݷ�"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   42
         ToolTipText     =   "�����ۿ� ���� ���ݷ�"
         Top             =   1850
         Width           =   495
      End
      Begin VB.Line Line6 
         X1              =   120
         X2              =   1920
         Y1              =   2505
         Y2              =   2505
      End
      Begin VB.Label Label28 
         Caption         =   "%"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   11.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1800
         TabIndex        =   39
         Top             =   3000
         Width           =   255
      End
      Begin VB.Label ȸ�� 
         Alignment       =   1  '������ ����
         BorderStyle     =   1  '���� ����
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   38
         ToolTipText     =   "����[(DEX/5)+(LUK/10)+��������ȸ����]"
         Top             =   3000
         Width           =   615
      End
      Begin VB.Label Label26 
         Caption         =   "ȸ����"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   37
         ToolTipText     =   "ȸ����"
         Top             =   3000
         Width           =   615
      End
      Begin VB.Label Label25 
         Caption         =   "%"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   11.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1800
         TabIndex        =   36
         Top             =   2640
         Width           =   255
      End
      Begin VB.Label �̼� 
         Alignment       =   1  '������ ����
         BorderStyle     =   1  '���� ����
         Caption         =   "90"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   35
         Top             =   2640
         Width           =   615
      End
      Begin VB.Line Line5 
         X1              =   120
         X2              =   2880
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Label Label23 
         Caption         =   "�̵��ӵ�"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   34
         ToolTipText     =   "�̵��ӵ�"
         Top             =   2640
         Width           =   735
      End
      Begin VB.Label ���� 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   33
         ToolTipText     =   "���������� �߰�ġ �Դϴ�."
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label ���� 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   32
         ToolTipText     =   "�������ݷ��� �߰�ġ �Դϴ�."
         Top             =   960
         Width           =   1695
      End
      Begin VB.Label ���� 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   1200
         TabIndex        =   31
         ToolTipText     =   "���������� �߰�ġ �Դϴ�."
         Top             =   600
         Width           =   1695
      End
      Begin VB.Label ���� 
         Alignment       =   2  '��� ����
         BorderStyle     =   1  '���� ����
         Caption         =   "3.5"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   9
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   30
         ToolTipText     =   "�������ݷ��� �߰�ġ �Դϴ�."
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label Label18 
         Caption         =   "��������"
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
         Left            =   120
         TabIndex        =   29
         ToolTipText     =   "���������ҽ�[�����Ǹ������ݷ�-(��������/5)-ȸ����(�����߰�)]�� ����˴ϴ�."
         Top             =   1320
         Width           =   855
      End
      Begin VB.Label Label17 
         Caption         =   "�������ݷ�"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   28
         ToolTipText     =   "���Ϳ��� ���� �ߴ� �������Դϴ�."
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label16 
         Caption         =   "��������"
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
         Left            =   120
         TabIndex        =   27
         ToolTipText     =   "���������ҽ�[�����ǹ������ݷ�-(��������/5)-ȸ����(�����߰�)]�� ����˴ϴ�."
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label15 
         Caption         =   "�������ݷ�"
         BeginProperty Font 
            Name            =   "������� Bold"
            Size            =   8.25
            Charset         =   129
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   26
         ToolTipText     =   "���Ϳ��� ���� �ߴ� �������Դϴ�."
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.Frame Frame2 
      Height          =   3495
      Left            =   0
      TabIndex        =   2
      Top             =   240
      Width           =   3255
      Begin VB.CommandButton Command2 
         BackColor       =   &H0080FF80&
         Caption         =   "<<"
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
         Left            =   2640
         Style           =   1  '�׷���
         TabIndex        =   6
         Top             =   3120
         Width           =   495
      End
      Begin VB.Frame Frame3 
         Height          =   3015
         Left            =   0
         TabIndex        =   3
         Top             =   0
         Width           =   3255
         Begin VB.Timer Timer1 
            Interval        =   1
            Left            =   0
            Top             =   120
         End
         Begin VB.CommandButton Command8 
            Caption         =   "��"
            Height          =   255
            Left            =   2760
            TabIndex        =   24
            Top             =   2520
            Width           =   255
         End
         Begin VB.CommandButton Command7 
            Caption         =   "��"
            Height          =   255
            Left            =   2760
            TabIndex        =   23
            Top             =   2040
            Width           =   255
         End
         Begin VB.CommandButton Command6 
            Caption         =   "��"
            Height          =   255
            Left            =   2760
            TabIndex        =   22
            Top             =   1560
            Width           =   255
         End
         Begin VB.CommandButton Command5 
            Caption         =   "��"
            Height          =   255
            Left            =   2760
            TabIndex        =   21
            Top             =   1080
            Width           =   255
         End
         Begin VB.CommandButton Command4 
            Caption         =   "��"
            Height          =   255
            Left            =   2760
            TabIndex        =   20
            Top             =   520
            Width           =   375
         End
         Begin VB.CommandButton Command3 
            Caption         =   "��"
            Height          =   255
            Left            =   2760
            TabIndex        =   19
            Top             =   180
            Width           =   375
         End
         Begin VB.Label mp 
            Alignment       =   1  '������ ����
            BackColor       =   &H00FF8080&
            BorderStyle     =   1  '���� ����
            Caption         =   "25"
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
            Left            =   1200
            TabIndex        =   18
            Top             =   480
            Width           =   1455
         End
         Begin VB.Line Line3 
            X1              =   1100
            X2              =   1100
            Y1              =   120
            Y2              =   840
         End
         Begin VB.Label hp 
            Alignment       =   1  '������ ����
            BackColor       =   &H008080FF&
            BorderStyle     =   1  '���� ����
            Caption         =   "50"
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
            Left            =   1200
            TabIndex        =   17
            Top             =   120
            Width           =   1455
         End
         Begin VB.Label luk 
            Alignment       =   1  '������ ����
            BackColor       =   &H00FFC0FF&
            BorderStyle     =   1  '���� ����
            Caption         =   "5"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1080
            TabIndex        =   16
            Top             =   2520
            Width           =   1335
         End
         Begin VB.Label dex 
            Alignment       =   1  '������ ����
            BackColor       =   &H00C0FFC0&
            BorderStyle     =   1  '���� ����
            Caption         =   "5"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1080
            TabIndex        =   15
            Top             =   2040
            Width           =   1335
         End
         Begin VB.Label inter 
            Alignment       =   1  '������ ����
            BackColor       =   &H00FFC0C0&
            BorderStyle     =   1  '���� ����
            Caption         =   "5"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1080
            TabIndex        =   14
            Top             =   1560
            Width           =   1335
         End
         Begin VB.Label str 
            Alignment       =   1  '������ ����
            BackColor       =   &H00C0C0FF&
            BorderStyle     =   1  '���� ����
            Caption         =   "5"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   14.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1080
            TabIndex        =   13
            Top             =   1080
            Width           =   1335
         End
         Begin VB.Line Line2 
            X1              =   810
            X2              =   810
            Y1              =   1080
            Y2              =   2880
         End
         Begin VB.Label Label8 
            Caption         =   "LUK"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   14.25
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            TabIndex        =   12
            Top             =   2520
            Width           =   615
         End
         Begin VB.Label Label7 
            Caption         =   "DEX"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   14.25
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            TabIndex        =   11
            Top             =   2040
            Width           =   615
         End
         Begin VB.Label Label6 
            Caption         =   "INT"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   14.25
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            TabIndex        =   10
            Top             =   1560
            Width           =   495
         End
         Begin VB.Label Label5 
            Caption         =   "STR"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   14.25
               Charset         =   129
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            TabIndex        =   9
            Top             =   1080
            Width           =   615
         End
         Begin VB.Line Line1 
            X1              =   120
            X2              =   3100
            Y1              =   900
            Y2              =   900
         End
         Begin VB.Label Label4 
            Caption         =   "Max Mp"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   11.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF8080&
            Height          =   255
            Left            =   120
            TabIndex        =   8
            Top             =   480
            Width           =   975
         End
         Begin VB.Label Label3 
            Caption         =   "Max Hp"
            BeginProperty Font 
               Name            =   "������� Bold"
               Size            =   11.25
               Charset         =   129
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H008080FF&
            Height          =   255
            Left            =   120
            TabIndex        =   7
            Top             =   120
            Width           =   975
         End
      End
      Begin VB.Label lv 
         Alignment       =   1  '������ ����
         BorderStyle     =   1  '���� ����
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
         Left            =   360
         TabIndex        =   47
         Top             =   3120
         Width           =   495
      End
      Begin VB.Label Label2 
         Caption         =   "Lv"
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
         Left            =   120
         TabIndex        =   46
         Top             =   3120
         Width           =   255
      End
      Begin VB.Label sp 
         Alignment       =   1  '������ ����
         BorderStyle     =   1  '���� ����
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
         Left            =   1800
         TabIndex        =   5
         Top             =   3120
         Width           =   735
      End
      Begin VB.Label Label1 
         Caption         =   "Point"
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
         Left            =   1080
         TabIndex        =   4
         Top             =   3120
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Stat"
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
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2895
   End
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
      Left            =   6120
      MaskColor       =   &H000000FF&
      Style           =   1  '�׷���
      TabIndex        =   0
      Top             =   0
      Width           =   255
   End
   Begin VB.Line Line4 
      X1              =   3300
      X2              =   3300
      Y1              =   105
      Y2              =   3720
   End
End
Attribute VB_Name = "stat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ��Ÿ��_Timer()
On Error GoTo SS
  If map.job.Caption = "�ʺ���" Then
  txww = (((Val(stat.str.Caption)) / 4) + (Val(map.lv.Caption) * 2)) - (((Val(stat.str.Caption)) / 5) + (Val(map.lv.Caption) * 1))
  dxww = (((Val(stat.str.Caption)) / 5) + (Val(map.lv.Caption) * 1))
  
    If Int(((Val(stat.str.Caption)) / 5) + (Val(map.lv.Caption) * 1)) > Int(((Val(stat.str.Caption)) / 4) + (Val(map.lv.Caption) * 2)) Then
    ����.Caption = Int(((Val(stat.str.Caption)) / 4) + (Val(map.lv.Caption) * 2)) & "~" & Int(((Val(stat.str.Caption)) / 5) + (Val(map.lv.Caption) * 1)) & �������÷���.Caption
    Else
    ����.Caption = Int(((Val(stat.str.Caption)) / 5) + (Val(map.lv.Caption) * 1)) & "~" & Int(((Val(stat.str.Caption)) / 4) + (Val(map.lv.Caption) * 2)) & �������÷���.Caption
    End If
  
  ElseIf map.job.Caption = "����" Then
  txww = ((((Val(stat.str.Caption)) * (Val(stat.dex.Caption))) / 8) + (Val(map.lv.Caption))) - (((Val(stat.str.Caption)) * ((Val(stat.dex.Caption)) / 3) / 4) + map.lv.Caption)
  dxww = (((Val(stat.str.Caption)) * ((Val(stat.dex.Caption)) / 3) / 4) + map.lv.Caption)
  
    If Int((((Val(stat.str.Caption)) * (Val(stat.dex.Caption))) / 8) + (Val(map.lv.Caption))) > Int(((Val(stat.str.Caption)) * ((Val(stat.dex.Caption)) / 3) / 4) + map.lv.Caption) Then
    ����.Caption = Int(((Val(stat.str.Caption)) * ((Val(stat.dex.Caption)) / 3) / 4) + map.lv.Caption) & "~" & Int((((Val(stat.str.Caption)) * (Val(stat.dex.Caption))) / 8) + (Val(map.lv.Caption))) & �������÷���.Caption
    Else
    ����.Caption = Int((((Val(stat.str.Caption)) * (Val(stat.dex.Caption))) / 8) + (Val(map.lv.Caption))) & "~" & Int(((Val(stat.str.Caption)) * ((Val(stat.dex.Caption)) / 3) / 4) + map.lv.Caption) & �������÷���.Caption
    End If
    
  ElseIf map.job.Caption = "�ü�" Then
  
  txww = ((((Val(stat.dex.Caption)) * (Val(stat.str.Caption))) / 8) + (Val(map.lv.Caption))) - (((Val(stat.dex.Caption)) * ((Val(stat.str.Caption)) / 3) / 4) + map.lv.Caption)
  dxww = (((Val(stat.dex.Caption)) * ((Val(stat.str.Caption)) / 3) / 4) + map.lv.Caption)
    
    If Int((((Val(stat.dex.Caption)) * (Val(stat.str.Caption))) / 8) + (Val(map.lv.Caption))) > Int(((Val(stat.dex.Caption)) * ((Val(stat.str.Caption)) / 3) / 4) + map.lv.Caption) Then
    ����.Caption = Int(((Val(stat.dex.Caption)) * ((Val(stat.str.Caption)) / 3) / 4) + map.lv.Caption) & "~" & Int((((Val(stat.dex.Caption)) * (Val(stat.str.Caption))) / 8) + (Val(map.lv.Caption))) & �������÷���.Caption
    Else
    ����.Caption = Int((((Val(stat.dex.Caption)) * (Val(stat.str.Caption))) / 8) + (Val(map.lv.Caption))) & "~" & Int(((Val(stat.dex.Caption)) * ((Val(stat.str.Caption)) / 3) / 4) + map.lv.Caption) & �������÷���.Caption
    End If
    
  End If
  ��.Caption = Int((Val(str.Caption) + (Val(dex.Caption) / 2) + (Val(luk.Caption) / 10)) + 0.5)
  ��.Caption = Int((Val(inter.Caption) * 2 + (Val(luk.Caption) / 6)) + 0.5)
  �̼�.Caption = 90 + (Val(skill.sk(1).Caption) * 4)

If Val(skill.sk1(1).Caption) > 0 Then
�������÷���.Caption = "+" & (Val(skill.sk1(3).Caption) * 1) + (Val(skill.sk1(1) * 2))
�������÷���.Tag = (Val(skill.sk1(3).Caption) * 1) + (Val(skill.sk1(1) * 2))
End If

ȸ��.Caption = 1 + (Val(skill.sk1(5).Caption) * 1)
SS:

End Sub
Private Sub Command1_Click()
stat.Visible = False
End Sub
Private Sub Command2_Click()
If Command2.Caption = ">>" Then
stat.Width = 6525
Command2.Caption = "<<"
Command1.Left = 6130
Command9.Left = 3000
ElseIf Command2.Caption = "<<" Then
stat.Width = 3405
Command2.Caption = ">>"
Command1.Left = 3000
Command9.Left = 6130
End If

End Sub
Private Sub Command3_Click()
If sp.Caption > 0 Then
hp.Caption = Val(hp.Caption) + 25
sp.Caption = Val(sp.Caption) - 1
map.hpm.Caption = map.hpm.Caption + 25
hpn = map.hpn.Caption
maxhp = hp.Caption
End If
End Sub
Private Sub Command4_Click()
If sp.Caption > 0 Then
mp.Caption = Val(mp.Caption) + 15
sp.Caption = Val(sp.Caption) - 1
map.mpm.Caption = map.mpm.Caption + 15
mpn = map.mpn.Caption
maxmp = mp.Caption
End If
End Sub
Private Sub Command5_Click()
If sp.Caption > 0 Then
str.Caption = Val(str.Caption) + 1
sp.Caption = Val(sp.Caption) - 1
stat.����.Caption = Val(stat.����.Caption) + 0.7
End If
    
End Sub

Private Sub Command6_Click()
If sp.Caption > 0 Then
inter.Caption = Val(inter.Caption) + 1
sp.Caption = Val(sp.Caption) - 1
stat.����.Caption = Val(stat.����.Caption) + 0.4
End If
End Sub

Private Sub Command7_Click()
If sp.Caption > 0 Then
dex.Caption = Val(dex.Caption) + 1
sp.Caption = Val(sp.Caption) - 1
stat.����.Caption = Val(stat.����.Caption) + 0.7
End If
End Sub
Private Sub Command8_Click()
If sp.Caption > 0 Then
luk.Caption = Val(luk.Caption) + 1
sp.Caption = Val(sp.Caption) - 1
stat.����.Caption = Val(stat.����.Caption) + 0.3
stat.����.Caption = Val(stat.����.Caption) + 0.3
End If
End Sub
Private Sub Command9_Click()
stat.Width = 3405
Command2.Caption = ">>"
Command1.Left = 3000
Command9.Left = 6130
End Sub
Private Sub hpmptimer_Timer()

hp.Caption = map.hpm.Caption
mp.Caption = map.mpm.Caption

End Sub
