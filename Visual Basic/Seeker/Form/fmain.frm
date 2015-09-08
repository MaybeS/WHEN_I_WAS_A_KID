VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form fmain 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00000000&
   BorderStyle     =   1  '단일 고정
   Caption         =   "Seeker - "
   ClientHeight    =   9756
   ClientLeft      =   48
   ClientTop       =   372
   ClientWidth     =   19200
   FillColor       =   &H00FFFFFF&
   ForeColor       =   &H00404040&
   Icon            =   "fmain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "fmain.frx":324A
   ScaleHeight     =   813
   ScaleMode       =   3  '픽셀
   ScaleWidth      =   1600
   StartUpPosition =   3  'Windows 기본값
   Begin RichTextLib.RichTextBox Consol 
      Height          =   2415
      Left            =   240
      TabIndex        =   40
      ToolTipText     =   $"fmain.frx":339C
      Top             =   7200
      Visible         =   0   'False
      Width           =   18735
      _ExtentX        =   33041
      _ExtentY        =   4255
      _Version        =   393217
      ScrollBars      =   2
      MousePointer    =   99
      Appearance      =   0
      TextRTF         =   $"fmain.frx":34E1
   End
   Begin VB.PictureBox EBox 
      Appearance      =   0  '평면
      BackColor       =   &H00C0FFC0&
      ForeColor       =   &H80000008&
      Height          =   3975
      Left            =   2760
      MouseIcon       =   "fmain.frx":357E
      ScaleHeight     =   3948
      ScaleWidth      =   5148
      TabIndex        =   0
      Top             =   840
      Visible         =   0   'False
      Width           =   5175
      Begin VB.PictureBox cha 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   7
         Left            =   4560
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   51
         Top             =   3240
         Width           =   525
      End
      Begin VB.PictureBox cha 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   6
         Left            =   4440
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   50
         Top             =   3120
         Width           =   525
      End
      Begin VB.PictureBox cha 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   5
         Left            =   3960
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   49
         Top             =   3240
         Width           =   525
      End
      Begin VB.PictureBox cha 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   4
         Left            =   3840
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   48
         Top             =   3120
         Width           =   525
      End
      Begin VB.PictureBox OpenFire 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   4200
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   47
         Tag             =   "0"
         Top             =   1200
         Width           =   525
      End
      Begin VB.PictureBox OpenFire 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   4080
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   46
         Tag             =   "0"
         Top             =   1080
         Width           =   525
      End
      Begin VB.PictureBox FireObj 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Left            =   4440
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   45
         Tag             =   "0"
         ToolTipText     =   "2/4/7"
         Top             =   2040
         Width           =   525
      End
      Begin MSComctlLib.ImageList ObjectList 
         Index           =   0
         Left            =   0
         Top             =   3000
         _ExtentX        =   995
         _ExtentY        =   995
         BackColor       =   -2147483643
         ImageWidth      =   400
         ImageHeight     =   320
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   1
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":36D0
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.PictureBox cha 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   3
         Left            =   3360
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   44
         Top             =   3240
         Width           =   525
      End
      Begin VB.PictureBox cha 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   2
         Left            =   3240
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   43
         Top             =   3120
         Width           =   525
      End
      Begin VB.PictureBox cha 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   2880
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   42
         Top             =   3240
         Width           =   525
      End
      Begin VB.PictureBox cha 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   2760
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   41
         Top             =   3120
         Width           =   525
      End
      Begin MSComctlLib.ImageList chaList 
         Left            =   0
         Top             =   2400
         _ExtentX        =   995
         _ExtentY        =   995
         BackColor       =   -2147483643
         ImageWidth      =   79
         ImageHeight     =   300
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   8
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":122E0
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":17148
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1BE4A
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":20CA7
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":25627
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":2D893
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":3C9EB
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":4C6C0
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.PictureBox Num 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   3
         Left            =   4320
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   39
         Top             =   480
         Width           =   525
      End
      Begin VB.PictureBox Num 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   2
         Left            =   4200
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   38
         Top             =   360
         Width           =   525
      End
      Begin VB.PictureBox Num 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   3720
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   37
         Top             =   480
         Width           =   525
      End
      Begin VB.PictureBox Num 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   3600
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   36
         Top             =   360
         Width           =   525
      End
      Begin VB.PictureBox UIi 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   6
         Left            =   1440
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   35
         Top             =   3480
         Width           =   525
      End
      Begin VB.PictureBox UIi 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   5
         Left            =   1320
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   34
         Top             =   3360
         Width           =   525
      End
      Begin VB.PictureBox UIi 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   4
         Left            =   1200
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   33
         Top             =   3240
         Width           =   525
      End
      Begin VB.PictureBox UIi 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   3
         Left            =   1080
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   32
         Top             =   3120
         Width           =   525
      End
      Begin VB.PictureBox UIi 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   2
         Left            =   960
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   31
         Top             =   3000
         Width           =   525
      End
      Begin VB.PictureBox UIi 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   840
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   29
         Top             =   2880
         Width           =   525
      End
      Begin VB.PictureBox UIi 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   720
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   30
         Top             =   2760
         Width           =   525
      End
      Begin MSComctlLib.ImageList UIlist 
         Left            =   0
         Top             =   1800
         _ExtentX        =   995
         _ExtentY        =   995
         BackColor       =   -2147483643
         ImageWidth      =   649
         ImageHeight     =   170
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   6
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":5B66D
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":5D719
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":5F180
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":5FBA7
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":60465
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":6794B
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.PictureBox Mou 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   3360
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   27
         Top             =   1200
         Width           =   525
      End
      Begin VB.PictureBox Mou 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   3240
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   28
         Top             =   1080
         Width           =   525
      End
      Begin MSComctlLib.ImageList mapList 
         Left            =   0
         Top             =   1200
         _ExtentX        =   995
         _ExtentY        =   995
         BackColor       =   -2147483643
         ImageWidth      =   1920
         ImageHeight     =   650
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   1
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":6B66E
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   795
         Index           =   13
         Left            =   1920
         ScaleHeight     =   744
         ScaleWidth      =   840
         TabIndex        =   25
         Top             =   1200
         Width           =   885
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   795
         Index           =   12
         Left            =   1800
         ScaleHeight     =   744
         ScaleWidth      =   840
         TabIndex        =   24
         Top             =   1080
         Width           =   885
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   11
         Left            =   3840
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   23
         Top             =   2160
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   10
         Left            =   3720
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   22
         Top             =   2040
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   9
         Left            =   3240
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   21
         Top             =   2160
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   8
         Left            =   3120
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   20
         Top             =   2040
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   7
         Left            =   2640
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   19
         Top             =   2160
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   6
         Left            =   2520
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   18
         Top             =   2040
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   5
         Left            =   2040
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   17
         Top             =   2160
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   4
         Left            =   1920
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   16
         Top             =   2040
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   3
         Left            =   1440
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   15
         Top             =   2160
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   2
         Left            =   1320
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   14
         Top             =   2040
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   840
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   13
         Top             =   2160
         Width           =   525
      End
      Begin VB.PictureBox Boxs 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   720
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   12
         Top             =   2040
         Width           =   525
      End
      Begin VB.PictureBox Tex 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   3120
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   9
         Top             =   480
         Width           =   525
      End
      Begin VB.PictureBox Tex 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   3000
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   8
         Top             =   360
         Width           =   525
      End
      Begin VB.PictureBox OBox 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   2520
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   11
         Top             =   480
         Width           =   525
      End
      Begin VB.PictureBox OBox 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   2400
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   10
         Top             =   360
         Width           =   525
      End
      Begin VB.PictureBox Texts 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   1920
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   7
         Top             =   480
         Width           =   525
      End
      Begin VB.PictureBox Texts 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   1800
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   6
         Top             =   360
         Width           =   525
      End
      Begin VB.PictureBox Rock 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   1320
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   5
         Top             =   480
         Width           =   525
      End
      Begin VB.PictureBox Rock 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   1200
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   4
         Top             =   360
         Width           =   525
      End
      Begin VB.PictureBox MenuBar 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   0
         Left            =   720
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   3
         Top             =   480
         Width           =   525
      End
      Begin VB.PictureBox MenuBar 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   555
         Index           =   1
         Left            =   600
         ScaleHeight     =   504
         ScaleWidth      =   480
         TabIndex        =   2
         Top             =   360
         Width           =   525
      End
      Begin VB.PictureBox BackBG 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         Height          =   780
         Left            =   720
         ScaleHeight     =   732
         ScaleWidth      =   852
         TabIndex        =   1
         Top             =   1080
         Width           =   900
      End
      Begin MSComctlLib.ImageList SFList 
         Left            =   0
         Top             =   0
         _ExtentX        =   995
         _ExtentY        =   995
         BackColor       =   16777215
         ImageWidth      =   1920
         ImageHeight     =   1200
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   17
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":792F4
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":A5F8B
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":B85B3
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":C2F74
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":D7037
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":E01E4
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":EB26E
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":F4849
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":F59BB
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":F5F5B
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":FB09C
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1000AB
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1053CE
               Key             =   ""
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":10A68A
               Key             =   ""
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":10B7D1
               Key             =   ""
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":10C97C
               Key             =   ""
            EndProperty
            BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":12601A
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList BoxList 
         Left            =   0
         Top             =   600
         _ExtentX        =   995
         _ExtentY        =   995
         BackColor       =   -2147483643
         ImageWidth      =   1300
         ImageHeight     =   25
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   16
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1270C0
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":12B13A
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":12D559
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":12F9C0
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":130EF1
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":13225F
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":132AEB
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1332C7
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1337BC
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1341BE
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1346EB
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1351EB
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":1356D2
               Key             =   ""
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":137386
               Key             =   ""
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":139035
               Key             =   ""
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "fmain.frx":13990E
               Key             =   ""
            EndProperty
         EndProperty
      End
   End
   Begin VB.Label mL 
      AutoSize        =   -1  'True
      BackStyle       =   0  '투명
      BeginProperty Font 
         Name            =   "맑은 고딕"
         Size            =   20.4
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1395
      Left            =   3600
      TabIndex        =   26
      Top             =   3000
      Width           =   2775
   End
End
Attribute VB_Name = "fmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Sub Consol_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 Then
        Consol.Text = Right(Consol.Text, Len(Consol.Text))
        Consol.SelStart = Len(Consol.Text)
        Call ConsolCheck
    End If
End Sub
Private Sub ConsolCheck()
On Error GoTo XX
    If Len(Consol.Text) > 4 Then
        If "exit" = LCase(Mid(Consol.Text, Len(Consol.Text) - 3, 4)) Then
            Consol.Text = ""
            Consol.Visible = False
            fmain.MousePointer = 0
                If Gaming = False Then
                    fmain.MouseIcon = fmain.Consol.MouseIcon
                Else
                    fmain.MouseIcon = fmain.EBox.MouseIcon
                End If
        End If
        If "mylv" = LCase(Mid(Consol.Text, Len(Consol.Text) - 3, 4)) Then
            Mi.NowLv = Mid(Consol.Text, Len(Consol.Text) - 5, 2)
        End If
        If "myfi" = LCase(Mid(Consol.Text, Len(Consol.Text) - 3, 4)) Then
            Mi.NowFi = Mid(Consol.Text, Len(Consol.Text) - 5, 2)
        End If
        If "mymaxfi" = LCase(Mid(Consol.Text, Len(Consol.Text) - 6, 7)) Then
            Mi.MaxFi = Mid(Consol.Text, Len(Consol.Text) - 8, 2)
        End If
        If "battleoff" = LCase(Mid(Consol.Text, Len(Consol.Text) - 8, 9)) Then
            Mi.Battlex = False
        End If
        If "battleon" = LCase(Mid(Consol.Text, Len(Consol.Text) - 7, 8)) Then
            Mi.Battlex = True
        End If
            
        Debug.Print Consol.Text
        
        
    End If
XX:
End Sub
Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
            fmain.MousePointer = 99
            MouXY = True
            Mi.Act = 0
End Sub
Private Sub Form_Load()
    
Unload fSplash          '로고가 출력되던 폼을 종료합니다.
SetOn                   '초기값을 설정합니다
OpenLoop                '메인 루프를 실행합니다.

End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Debug.Print KeyCode
ChkWalk = 0
        Select Case KeyCode
            Case 18
                If Gaming Then
                    fmain.MousePointer = 0
                    MouXY = False
                End If
            Case 65
                '"왼쪽"
                        Mi.X = Mi.X + 10
                        Mi.Act = 1
                        Mi.Standing = True
                        ChkWalk = 1
            Case 68
                '"오른쪽"
                        Mi.X = Mi.X - 10
                        Mi.Act = 1
                        Mi.Standing = False
                        ChkWalk = 2
            Case 83
                '"아래"
            Case 192
                fmain.MouseIcon = Consol.MouseIcon
                Consol.Visible = True
        End Select
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)           'XY마우스가 클릭됬을시 이벤트
Debug.Print X, Y

If BoxXY(0) Then
    If X > BoxXY(1) And X < BoxXY(1) + 65 Then
        If Y > BoxXY(2) And Y < BoxXY(2) + 60 Then
            BoxXY(6) = X - BoxXY(1)
            BoxXY(7) = Y - BoxXY(2)
            BoxXY(5) = 1
            Exit Sub
        End If
    End If
    If X > BoxXY(1) + BoxXY(3) - 125 And X < BoxXY(1) + BoxXY(3) - 100 Then
        If Y > BoxXY(2) + 10 And Y < BoxXY(2) + 35 Then
            BoxXY(5) = 0
            BoxXY(0) = 0
            fmain.mL.Visible = False
            Exit Sub
        End If
    End If
End If

If Gaming = True Then
        
Else
    If FKeep = 0 Or (FKeep = -1 And Kping) Then
        If X > OpenBarX(0) + 10 And X < OpenBarX(0) + 190 Then
            If Y > OpenBarY(0) + 10 And Y < OpenBarY(0) + 65 Then
                OpenBar(0) = 10
                M_Click (0)
            Exit Sub
            End If
        End If
        If X > OpenBarX(1) + 10 And X < OpenBarX(1) + 190 Then
            If Y > OpenBarY(1) + 10 And Y < OpenBarY(1) + 65 Then
                OpenBar(1) = 10
                M_Click (1)
            Exit Sub
            End If
        End If
        If X > OpenBarX(2) + 10 And X < OpenBarX(2) + 190 Then
            If Y > OpenBarY(2) + 10 And Y < OpenBarY(2) + 65 Then
                OpenBar(2) = 10
                M_Click (2)
            Exit Sub
            End If
        End If
        If X > OpenBarX(3) + 10 And X < OpenBarX(3) + 190 Then
            If Y > OpenBarY(3) + 10 And Y < OpenBarY(3) + 65 Then
                OpenBar(3) = 10
                M_Click (3)
            Exit Sub
            End If
        End If
        If X < 15 Then
            M_Click (2)
        End If
    ElseIf FKeep = 1 Then
        If X > OpenBarX(0) - 1340 And X < OpenBarX(0) - 1160 Then
            If Y > 560 And Y < 615 Then
                OpenBar(4) = 10
                SetOff
                M_Click (4)
            Exit Sub
            End If
        End If
        
        For i = 0 To 4
            If X > OpenBarX(0) * 3 - 3280 And X < OpenBarX(0) * 3 - 3180 Then
                If Y > 85 + (i * 85) - 15 And Y < 85 + (i * 85) + 40 Then
                        If i = 0 Then
                            OpBox(i) = (OpBox(i) Mod 4) + 1
                        ElseIf i = 1 Then
                            OpBox(i) = (OpBox(i) Mod 3) + 2
                        ElseIf i = 2 Then
                            OpBox(i) = ((OpBox(i) + 1) Mod 2)
                        Else
                            OpBox(i) = (OpBox(i) Mod 3) + 2
                        End If
                Exit Sub
                End If
            End If
        Next i
    End If
End If
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)           'XY마우스가 움직였을시 이벤트

If BoxXY(0) And BoxXY(5) Then
    BoxXY(1) = X - BoxXY(6)
    BoxXY(2) = Y - BoxXY(7)
    fmain.mL.Left = X - BoxXY(6) + 50
    fmain.mL.Top = Y - BoxXY(7) + 45
End If

If Gaming Then
    If MouXY Then                                                   '마우스 좌표
        GetCursorPos MXY
        MouX = MXY.X - (fmain.Left / 15) - 32
        MouY = MXY.Y - (fmain.Top / 15) - 53
    End If
    
        For i = 0 To 3                          'uibox 초기화
            UIBox(i) = 0
        Next i
    If X > 1150 And X < 1251 Then
        If Y > 555 And Y < 596 Then
            UIBox(0) = 1
        ElseIf Y > 605 And Y < 646 Then
            UIBox(1) = 1
        End If
    End If
    If X > 1030 And X < 1131 Then
        If Y > 555 And Y < 596 Then
            UIBox(2) = 1
        ElseIf Y > 605 And Y < 646 Then
            UIBox(3) = 1
        End If
    End If
    
Else
            fmain.MousePointer = 0
        For i = 0 To 4
            OpenBar(i) = 0
        Next i
    If FKeep = 0 Or (FKeep = -1 And Kping) Then
        If X > OpenBarX(0) + 10 And X < OpenBarX(0) + 190 Then
            If Y > OpenBarY(0) + 10 And Y < OpenBarY(0) + 65 Then
                OpenBar(0) = 5
            End If
        End If
        If X > OpenBarX(1) + 10 And X < OpenBarX(1) + 190 Then
            If Y > OpenBarY(1) + 10 And Y < OpenBarY(1) + 65 Then
                OpenBar(1) = 5
            End If
        End If
        If X > OpenBarX(2) + 10 And X < OpenBarX(2) + 190 Then
            If Y > OpenBarY(2) + 10 And Y < OpenBarY(2) + 65 Then
                OpenBar(2) = 5
            End If
        End If
        If X > OpenBarX(3) + 10 And X < OpenBarX(3) + 190 Then
            If Y > OpenBarY(3) + 10 And Y < OpenBarY(3) + 65 Then
                OpenBar(3) = 5
            End If
        End If
    ElseIf FKeep = 1 Then
        If X > OpenBarX(0) - 1340 And X < OpenBarX(0) - 1160 Then
            If Y > 560 And Y < 615 Then
                OpenBar(4) = 5
            End If
        End If
        For i = 0 To 4
            If X > OpenBarX(0) * 3 - 3280 And X < OpenBarX(0) * 3 - 3180 Then
                If Y > 85 + (i * 85) - 15 And Y < 85 + (i * 85) + 40 Then
                    OpBoxInt = i
                End If
            End If
        Next i
    End If
End If
End Sub
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
BoxXY(5) = 0
End Sub
Private Sub Form_Unload(Cancel As Integer)
SetOff
End
End Sub
