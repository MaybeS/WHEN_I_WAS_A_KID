Attribute VB_Name = "basB"
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Const SRCCOPY As Long = &HCC0020
Public Sub MainBlt()
fMain.Cls

Select Case PageX
    Case 0  '준비화면
            WaitImage (3)
            BitBlt fMain.hDC, -150, 250, 1008, 295, fMain.LogoPic(3).hDC, 0, 0, SRCAND
    Case 1  '준비화면
            WaitImage (3)
            BitBlt fMain.hDC, -150, 250, 1008, 295, fMain.LogoPic(3).hDC, 0, 0, SRCAND
    Case 2  '준비화면
            WaitImage (3)
            BitBlt fMain.hDC, -150, 250, 1008, 295, fMain.LogoPic(3).hDC, 0, 0, SRCAND
    Case 3  '로고의 Present 부분의 애니메이션 처리
    
            WaitImage (3)
            
                fMain.MayBltBox.Picture = fMain.LogoPic(3).Picture
            Call MayBlt(-140, 250, GetSil(AnimatedLogo, 0), GetSil(AnimatedLogo, 1), GetSil(AnimatedLogo, 2), GetSil(AnimatedLogo, 3), GetSil(AnimatedLogo, 4))
    
    Case 4  '아무키나 누르시오 의 애니메이션 처리
    
            WaitImage (3)
            
                fMain.MayBltBox.Picture = fMain.LogoPic(4).Picture
            Call MayBlt(261, 450, GetSil(AnimatedKeyPress, 0), GetSil(AnimatedKeyPress, 1), GetSil(AnimatedKeyPress, 2), GetSil(AnimatedKeyPress, 3), GetSil(AnimatedKeyPress, 4))
    
    Case 5  '시작화면입니다.
    
            WaitImage (2)
        
    Case 6
    Case 7
    Case 8
    Case 9
    Case 10
End Select
    

End Sub
Public Sub WaitImage(ByVal index As Integer)
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
'배경이미지를 뿌려줍니다. index로 단계를 설정할 수 있습니다.
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
            BitBlt fMain.hDC, 0, 0, 800, 600, fMain.LogoPic(0).hDC, 0, 0, SRCAND
If index = 0 Then Exit Sub
        For i = 0 To 25
            BitBlt fMain.hDC, StarX(i, 0), StarX(i, 1), 50, 50, fMain.ObjectBox(0).hDC, 0, 0, SRCAND
        Next i
If index = 1 Then Exit Sub
            BitBlt fMain.hDC, 50, 100, 400, 75, fMain.LogoPic(2).hDC, 0, 0, SRCAND
If index = 2 Then Exit Sub
            BitBlt fMain.hDC, 50, 300, 700, 120, fMain.LogoPic(1).hDC, 0, 0, SRCAND
If index = 3 Then Exit Sub
End Sub
Public Sub MayBlt(ByVal X As Integer, ByVal Y As Integer, ByVal picW As Integer, ByVal picH As Integer, ByVal PicX, ByVal PicY, ByVal picN As Integer)
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
'미리 설정된 애니메이트 이미지를 애니메이션으로 진행시켜주는 함수
'입력(위치x,위치y,너비,높이,애니메이트이미지의 가로이미지수,애니메이트이미지의 세로이미지수,총 이미지의 수
'tx는 임의의 설정값 DefaultIndex를 사용하여 이미지를 부드럽게 진행시켜주는데 카운트값이다.
'DefaultIndex의 조건은 Do-Loop문안에서 일정값으로 계속 증가하면된다.(감소하면 거꾸로 진행된다.)
'설정시 미리 MayBltBox에 이미지를 넣어야한다. 끝의 두줄은 일반적 코딩과는 상관없는 구문이다.
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
Tx = (DefaultIndex Mod (picN * ((26 - picN) / 2) + 1)) / ((26 - picN) / 2)
        BitBlt fMain.hDC, X, Y, picW, picH, fMain.MayBltBox.hDC, (picW * ((Tx Mod PicX))), (picH * (Tx \ PicX)), SRCAND
If Tx >= picN Then
    PageX = 4
End If
End Sub
Public Function GetSil(ByVal Text As String, ByVal index As Integer)
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
'문자열에서 .으로구분되는 단어를 나눠주는 함수
'예시 문자열이있다면 abc.def.xyz. GetSil(문자열,끈을 단어의 위치) 이렇게 사용한다
'GetSil("abc.def.xyz. , 2)를 한다면 xyz가 나온다
'설정시 주의: 마지막에도 .이 필요하다
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
Dim LastDot As Integer, NowDot As Integer, CntDot As Integer
LastDot = 0: NowDot = 0: CntDot = 0

For i = 1 To Len(Text)
    If Mid(Text, i, 1) = "." Then
        CntDot = CntDot + 1
        LastDot = NowDot
        NowDot = i
            If CntDot = index + 1 Then Exit For
    End If
Next i

GetSil = Mid(Text, LastDot + 1, NowDot - LastDot - 1)

End Function
