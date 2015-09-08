Attribute VB_Name = "basB"
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Const SRCCOPY As Long = &HCC0020
Public Sub MainBlt()
fMain.Cls

Select Case PageX
    Case 0  '�غ�ȭ��
            WaitImage (3)
            BitBlt fMain.hDC, -150, 250, 1008, 295, fMain.LogoPic(3).hDC, 0, 0, SRCAND
    Case 1  '�غ�ȭ��
            WaitImage (3)
            BitBlt fMain.hDC, -150, 250, 1008, 295, fMain.LogoPic(3).hDC, 0, 0, SRCAND
    Case 2  '�غ�ȭ��
            WaitImage (3)
            BitBlt fMain.hDC, -150, 250, 1008, 295, fMain.LogoPic(3).hDC, 0, 0, SRCAND
    Case 3  '�ΰ��� Present �κ��� �ִϸ��̼� ó��
    
            WaitImage (3)
            
                fMain.MayBltBox.Picture = fMain.LogoPic(3).Picture
            Call MayBlt(-140, 250, GetSil(AnimatedLogo, 0), GetSil(AnimatedLogo, 1), GetSil(AnimatedLogo, 2), GetSil(AnimatedLogo, 3), GetSil(AnimatedLogo, 4))
    
    Case 4  '�ƹ�Ű�� �����ÿ� �� �ִϸ��̼� ó��
    
            WaitImage (3)
            
                fMain.MayBltBox.Picture = fMain.LogoPic(4).Picture
            Call MayBlt(261, 450, GetSil(AnimatedKeyPress, 0), GetSil(AnimatedKeyPress, 1), GetSil(AnimatedKeyPress, 2), GetSil(AnimatedKeyPress, 3), GetSil(AnimatedKeyPress, 4))
    
    Case 5  '����ȭ���Դϴ�.
    
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
'����̹����� �ѷ��ݴϴ�. index�� �ܰ踦 ������ �� �ֽ��ϴ�.
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
'�̸� ������ �ִϸ���Ʈ �̹����� �ִϸ��̼����� ��������ִ� �Լ�
'�Է�(��ġx,��ġy,�ʺ�,����,�ִϸ���Ʈ�̹����� �����̹�����,�ִϸ���Ʈ�̹����� �����̹�����,�� �̹����� ��
'tx�� ������ ������ DefaultIndex�� ����Ͽ� �̹����� �ε巴�� ��������ִµ� ī��Ʈ���̴�.
'DefaultIndex�� ������ Do-Loop���ȿ��� ���������� ��� �����ϸ�ȴ�.(�����ϸ� �Ųٷ� ����ȴ�.)
'������ �̸� MayBltBox�� �̹����� �־���Ѵ�. ���� ������ �Ϲ��� �ڵ����� ������� �����̴�.
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
Tx = (DefaultIndex Mod (picN * ((26 - picN) / 2) + 1)) / ((26 - picN) / 2)
        BitBlt fMain.hDC, X, Y, picW, picH, fMain.MayBltBox.hDC, (picW * ((Tx Mod PicX))), (picH * (Tx \ PicX)), SRCAND
If Tx >= picN Then
    PageX = 4
End If
End Sub
Public Function GetSil(ByVal Text As String, ByVal index As Integer)
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
'���ڿ����� .���α��еǴ� �ܾ �����ִ� �Լ�
'���� ���ڿ����ִٸ� abc.def.xyz. GetSil(���ڿ�,���� �ܾ��� ��ġ) �̷��� ����Ѵ�
'GetSil("abc.def.xyz. , 2)�� �Ѵٸ� xyz�� ���´�
'������ ����: ���������� .�� �ʿ��ϴ�
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
