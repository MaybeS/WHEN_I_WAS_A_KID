Attribute VB_Name = "basB"
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Private Const SRCAND = &H8800C6
Private Const SRCPAINT = &HEE0086
Private Const SRCCOPY As Long = &HCC0020
Public Sub MainBlt()
fMain.Cls

Select Case PageX
    Case 0  '�غ�ȭ��
            WaitImage (3)
            BitBlt fMain.hdc, -150, 250, 1008, 295, fMain.LogoPic(3).hdc, 0, 0, SRCAND
    Case 1  '�غ�ȭ��
            WaitImage (3)
            BitBlt fMain.hdc, -150, 250, 1008, 295, fMain.LogoPic(3).hdc, 0, 0, SRCAND
    Case 2  '�غ�ȭ��
            WaitImage (3)
            BitBlt fMain.hdc, -150, 250, 1008, 295, fMain.LogoPic(3).hdc, 0, 0, SRCAND
    Case 3  '�ΰ��� Present �κ��� �ִϸ��̼� ó��
    
            WaitImage (3)
            Call MayBlt(-140, 250, GetSil(AnimatedLogo, 0), GetSil(AnimatedLogo, 1), GetSil(AnimatedLogo, 2), _
                                                     GetSil(AnimatedLogo, 3), GetSil(AnimatedLogo, 4), 5, False, fMain.LogoPic(3), DefaultIndex)
    
    Case 4  '�ƹ�Ű�� �����ÿ� �� �ִϸ��̼� ó��
    
            WaitImage (3)
            Call MayBlt(261, 450, GetSil(AnimatedKeyPress, 0), GetSil(AnimatedKeyPress, 1), GetSil(AnimatedKeyPress, 2), _
                                                    GetSil(AnimatedKeyPress, 3), GetSil(AnimatedKeyPress, 4), 7, False, fMain.LogoPic(4), DefaultIndex)
    
    Case 5  '����ȭ���Դϴ�. - ����ȭ��
    
            WaitImage (2)
            FlowerShow (True)
            MenuAni (1)
            BackMenuAni (-1)
            PanelShow (0)
            TextOut fMain.hdc, 0, 0, "ȯ���մϴ�.", LenB(StrConv("ȯ���մϴ�.", vbFromUnicode))
        
    Case 6 'Start ȭ��
    
            WaitImage (2)
            Fcnt = -1
            FlowerShow (False)
            MenuAni (-1)
            BackMenuAni (1)
            PanelShow (0)
            
    Case 7 '����ȭ��
    
            WaitImage (2)
            FlowerShow (False)
            MenuAni (-1)
            BackMenuAni (1)
            PanelShow (0)
            
    Case 8 '����ȭ��
    
            WaitImage (2)
            FlowerShow (False)
            MenuAni (-1)
            BackMenuAni (1)
            PanelShow (0)
            
    Case 9
    Case 10
End Select
    

End Sub
Public Sub PanelShow(ByVal Age As Integer)
                                            BitBlt fMain.hdc, 800 - 62, 0, 63, 63, fMain.PanelBox(1).hdc, 0, 0, SRCPAINT
                                            BitBlt fMain.hdc, 800 - 62, 0, 63, 63, fMain.PanelBox(0).hdc, 0, 0, SRCAND
End Sub
Public Sub BackMenuAni(ByVal Visible As Integer)

                                    If Menu(4, 0) > -80 Then
                                            BitBlt fMain.hdc, Menu(3, 0) + Menu(3, 2), Menu(3, 1), 65, 53, fMain.LogoPic(12).hdc, 0, 0, SRCPAINT
                                            BitBlt fMain.hdc, Menu(3, 0) + Menu(3, 2), Menu(3, 1), 65, 53, fMain.LogoPic(11).hdc, 1, 0, SRCAND
                                    End If
                                    If Menu(3, 0) < 10 And ((Visible - 1) = 0) Then
                                            Menu(3, 0) = Menu(3, 0) + 1 + (10 - (Menu(3, 0)) / 100)
                                    ElseIf Menu(3, 0) > -100 And ((Visible + 1) = 0) Then
                                            Menu(3, 0) = Menu(3, 0) - 1 - ((Menu(3, 0) + 100) / 100)
                                    End If
End Sub
Public Sub MenuAni(ByVal Visible As Integer)

                        For i = 0 To 2
                                    If Menu(i, 0) < 800 Then
                                            BitBlt fMain.hdc, Menu(i, 0) + Menu(i, 2), Menu(i, 1), 222, 56, fMain.LogoPic(6 + i * 2).hdc, 0, 0, SRCPAINT
                                            BitBlt fMain.hdc, Menu(i, 0) + Menu(i, 2), Menu(i, 1), 222, 56, fMain.LogoPic(5 + i * 2).hdc, 1, 0, SRCAND
                                    End If
                                    If Menu(i, 0) > 570 And ((Visible - 1) = 0) Then
                                            Menu(i, 0) = Menu(i, 0) - 3 - ((Menu(i, 0) - 570) / 20)
                                    ElseIf Menu(i, 0) < 800 And ((Visible + 1) = 0) Then
                                            Menu(i, 0) = Menu(i, 0) + 3 + ((800 - Menu(i, 0)) / 20)
                                    End If
                        Next i
End Sub
Public Sub FlowerShow(ByVal Start As Boolean)

If Start Then
        Fcnt = 1
Else
        Fcnt = -1
End If
            Call MayBlt(0, 200, GetSil(AnimatedFlower, 0), GetSil(AnimatedFlower, 1), GetSil(AnimatedFlower, 2), _
                                               GetSil(AnimatedFlower, 3), GetSil(AnimatedFlower, 4), 6, True, fMain.PanelBox(2), FlowerIndex)

End Sub
Public Sub WaitImage(ByVal Index As Integer)
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
'����̹����� �ѷ��ݴϴ�. index�� �ܰ踦 ������ �� �ֽ��ϴ�.
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
            BitBlt fMain.hdc, 0, 0, 800, 600, fMain.LogoPic(0).hdc, 0, 0, SRCAND
If Index = 0 Then Exit Sub
        For i = 0 To 25
                Call MayBlt(StarX(i, 0), StarX(i, 1), 65, 65, 5, 1, 5, 5, True, fMain.ObjectBox(1), DefaultIndex)
        Next i
If Index = 1 Then Exit Sub
            BitBlt fMain.hdc, 30, 0, 550, 175, fMain.LogoPic(2).hdc, 0, 175, SRCPAINT
            BitBlt fMain.hdc, 30, 0, 550, 175, fMain.LogoPic(2).hdc, 0, 0, SRCAND
If Index = 2 Then Exit Sub
            BitBlt fMain.hdc, 25, 350, 750, 110, fMain.LogoPic(1).hdc, 0, 110, SRCPAINT
            BitBlt fMain.hdc, 25, 350, 750, 110, fMain.LogoPic(1).hdc, 0, 0, SRCAND
If Index = 3 Then Exit Sub
End Sub
Public Sub MayBlt(ByVal x As Integer, ByVal y As Integer, ByVal picW As Integer, ByVal picH As Integer, _
                                 ByVal PicX As Integer, ByVal PicY As Integer, ByVal picN As Integer, ByVal FPSX As Integer, _
                                 ByVal Back As Boolean, ByRef PicBox As PictureBox, ByVal Index As Integer)
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
'�̸� ������ �ִϸ���Ʈ �̹����� �ִϸ��̼����� ��������ִ� �Լ�
'�Է�(��ġx,��ġy,�ʺ�,����,�ִϸ���Ʈ�̹����� �����̹�����,�ִϸ���Ʈ�̹����� �����̹�����,�� �̹����� ��
'tx�� ������ ������ DefaultIndex�� ����Ͽ� �̹����� �ε巴�� ��������ִµ� ī��Ʈ���̴�.
'DefaultIndex�� ������ Do-Loop���ȿ��� ���������� ��� �����ϸ�ȴ�.(�����ϸ� �Ųٷ� ����ȴ�.)
'������ �̸� MayBltBox�� �̹����� �־���Ѵ�. ���� ������ �Ϲ��� �ڵ����� ������� �����̴�.
'-----------------------------------------------Maybe Studio Presented------------------------------------------------------------
Dim TX As Integer
TX = (((Index \ FPSX) Mod picN))

    If Back Then
        BitBlt fMain.hdc, x, y, picW, picH, PicBox.hdc, (picW * ((TX Mod PicX))), (picH * (PicY + (TX \ PicX))), SRCPAINT
    End If
        BitBlt fMain.hdc, x, y, picW, picH, PicBox.hdc, (picW * ((TX Mod PicX))), (picH * (TX \ PicX)), SRCAND

If TX >= 19 And PageX < 4 Then
    PageX = 4
End If
End Sub
Public Sub MayBackBlt()

End Sub
Public Function GetSil(ByVal Text As String, ByVal Index As Integer)
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
            If CntDot = Index + 1 Then Exit For
    End If
Next i

GetSil = Mid(Text, LastDot + 1, NowDot - LastDot - 1)

End Function
