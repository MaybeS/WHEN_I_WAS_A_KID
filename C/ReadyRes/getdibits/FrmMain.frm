VERSION 5.00
Begin VB.Form FrmMain 
   BorderStyle     =   1  '단일 고정
   Caption         =   "GetDIBits 예제 (이미지 뽀샤시)"
   ClientHeight    =   4320
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7395
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4320
   ScaleWidth      =   7395
   StartUpPosition =   2  '화면 가운데
   Begin VB.CommandButton Command1 
      Caption         =   "뽀샤시(?) 가동!"
      Height          =   855
      Left            =   120
      TabIndex        =   2
      Top             =   3240
      Width           =   7150
   End
   Begin VB.PictureBox Picture2 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   2925
      Left            =   3840
      ScaleHeight     =   2865
      ScaleWidth      =   3360
      TabIndex        =   1
      Top             =   120
      Width           =   3420
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   2925
      Left            =   120
      Picture         =   "FrmMain.frx":0000
      ScaleHeight     =   2865
      ScaleWidth      =   3360
      TabIndex        =   0
      Top             =   120
      Width           =   3420
   End
End
Attribute VB_Name = "FrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function GetDIBits Lib "gdi32" (ByVal aHDC As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long
Private Declare Function SetDIBits Lib "gdi32" (ByVal hdc As Long, ByVal hBitmap As Long, ByVal nStartScan As Long, ByVal nNumScans As Long, lpBits As Any, lpBI As BITMAPINFO, ByVal wUsage As Long) As Long

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


Private Sub Command1_Click()
    Dim Bitmap() As Byte

    Dim Bitmap_Info As BITMAPINFO
    Dim Width As Long, Height As Long

    Dim BytesPerScanLine As Long

    Dim i As Long, j As Long
    Dim R As Single, G As Single, B As Single

    ' -- 크기를 구해온다.
    Width = Picture1.ScaleWidth
    Height = Picture1.ScaleHeight

    ' -- 구조체 설정
    With Bitmap_Info.bmiHeader
        .biSize = Len(Bitmap_Info.bmiHeader)
        .biWidth = Width
        .biHeight = -Height
        .biPlanes = 1
        .biBitCount = 32
        .biCompression = DIB_RGB_COLORS
        .biSizeImage = ((((.biWidth * .biBitCount) + 32 - 1) \ 32) * 4) * .biHeight
    End With

    ' -- 배열 설정
    ReDim Bitmap(32 / 8 - 1, Width - 1, Height - 1)

    ' -- GetDIBits
    Call GetDIBits(Picture1.hdc, Picture1.Image, 0, Height, Bitmap(0, 0, 0), Bitmap_Info, DIB_RGB_COLORS)

    For i = 0 To Width \ 15
        For j = 0 To Height \ 15
            ' -- RGB를 구한후
            B = Bitmap(0, i, j) + 50
            G = Bitmap(1, i, j) + 50
            R = Bitmap(2, i, j) + 50

            If B > 255 Then B = 255
            If G > 255 Then G = 255
            If R > 255 Then R = 255

            Bitmap(0, i, j) = B
            Bitmap(1, i, j) = G
            Bitmap(2, i, j) = R
        Next
    Next

    ' -- SetDIBits
    Call SetDIBits(Picture2.hdc, Picture2.Image, 0, Height, Bitmap(0, 0, 0), Bitmap_Info, DIB_RGB_COLORS)
End Sub
