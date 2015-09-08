Attribute VB_Name = "U_bas"
Public Sub Event_Click(ByVal index As Integer)
Dim X As Integer, Y As Integer

    F_Sub.Left = (50 + CurX.X) * Screen.TwipsPerPixelX
    F_Sub.Top = (CurX.Y - 65) * Screen.TwipsPerPixelY
    
    Ayou_SubRgn
    
    AyouState.SubShow = True
    AyouState.SubFrameCnt = 15
    AyouState.Show = False
    AyouState.FrameCnt = AyouState.MaxFrameCnt
    
    If index = 1 Then
    
        AyouState.NotiVisible = True
        AyouState.NotiShow = True
        AyouState.NotiFrameCnt = 15
    
    End If
    
End Sub
Public Sub Event_MouseOver(ByVal index As Integer)

End Sub
Public Sub Event_MouseDown(ByVal index As Integer)

End Sub
Public Sub Ayou_HexRgn()
Dim RecA As Long, RecB As Long, RecC As Long
    RecC = CreateRectRgn(0, 0, 0, 0)

F_Ayou.Left = (CurX.X - (((3 ^ (1 / 2)) * AyouState.UI_Size) / 2) - AyouState.UI_Size * (2)) * Screen.TwipsPerPixelX
F_Ayou.Top = (CurX.Y - AyouState.UI_Size - AyouState.UI_Size * (3 ^ (1 / 2))) * Screen.TwipsPerPixelY

With AyouState
RecA = CreateHexRgn(.Rgn_Nex(4).X, .Rgn_Nex(4).Y, .UI_Size)
RecB = CreateHexRgn(.Rgn_Nex(0).X, .Rgn_Nex(0).Y, .UI_Size)

    CombineRgn RecC, RecA, RecB, 2
    CombineRgn RecC, RecC, CreateHexRgn(.Rgn_Nex(1).X, .Rgn_Nex(1).Y, .UI_Size), 2
    CombineRgn RecC, RecC, CreateHexRgn(.Rgn_Nex(5).X, .Rgn_Nex(5).Y, .UI_Size), 2
    CombineRgn RecC, RecC, CreateHexRgn(.Rgn_Nex(6).X, .Rgn_Nex(6).Y, .UI_Size), 2
    CombineRgn RecC, RecC, CreateHexRgn(.Rgn_Nex(3).X, .Rgn_Nex(3).Y, .UI_Size), 2
    CombineRgn RecC, RecC, CreateHexRgn(.Rgn_Nex(2).X, .Rgn_Nex(2).Y, .UI_Size), 2
    'Hexagon UI의 Region을 재설정합니다.
End With
    
    AyouBackBlt 0, 0, 0
    'UI에 색을  칠합니다.
    
    SetWindowRgn F_Ayou.hWnd, RecC, True
    '만들어진 Hexagon UI의 Region으로 폼모양을 제설정합니다.
    
    DeleteObject RecA
    DeleteObject RecB
    DeleteObject RecC
    'object 를 삭제해줍니다.

End Sub
Public Sub Ayou_SubRgn()
Dim i As Integer, RgnX As Long
F_Sub.Cls
F_Sub.TopBar.Cls

    RgnX = CreateSAORgn(50, 50 + AyouSet.SubForm(NHex).Width, AyouSet.SubForm(NHex).Height)
    SetWindowRgn F_Sub.hWnd, RgnX, True
    
    AyouSubBlt 50, AyouSet.SubForm(NHex).Width, AyouSet.SubForm(NHex).Height
    SubGradationAlt F_Sub.SubBox(NHex), 0, 0, AyouSet.SubForm(NHex).Height
    
    DeleteObject RgnX
    'object 를 삭제해줍니다.
    
    For i = 0 To 6
    
        F_Sub.SubBox(i).Visible = False
        
    Next i
    
    F_Sub.SubBox(NHex).Visible = True
    
    F_Sub.Width = (AyouSet.SubForm(NHex).Width + 60) * Screen.TwipsPerPixelX
    F_Sub.Height = (AyouSet.SubForm(NHex).Height) * Screen.TwipsPerPixelY

    F_Sub.TopBar.Width = F_Sub.SubBox(NHex).Width + 5
    F_Sub.Button_Close.Left = F_Sub.TopBar.Width - F_Sub.Button_Close.Width - 5
    
End Sub
Public Sub Ayou_NotiRgn()
Dim RgnX As Long
F_Noti.Cls

    RgnX = CreateLucidRgn(100, 260)
    SetWindowRgn F_Noti.hWnd, RgnX, True
    
    LucidBlt F_Noti.hdc, 100, 260
    SubGradationBlt F_Noti, 35, 0, 100
    
    DeleteObject RgnX
    'object 를 삭제해줍니다.

End Sub
Public Sub Ayou_MemoRgn()
Dim RgnX As Long
F_Memo.Cls
    
    RgnX = CreateLucidRgn(200, 260)
    SetWindowRgn F_Memo.hWnd, RgnX, True
    
    LucidBlt F_Memo.hdc, 300, 300
    SubGradationBlt F_Memo, 35, 0, 200
    
    DeleteObject RgnX
    'object 를 삭제해줍니다.

End Sub

'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Public Sub LoadMemo()

    'F_Sub.List_Memo.AddItem "빈 메모", F_Sub.List_Memo.ListCount
    F_Sub.Text_Memo.Text = "빈 메모"
        Memo(0).Main = ""
    F_Sub.List_Memo.ListIndex = 0
    
    '메모 txt - UTF 16
    '7z k lib

End Sub
Public Sub SendMemo(ByVal Locate As String)

    

End Sub
Public Sub ProcessMemo(ByVal index As Integer)
Dim i As Integer

    Select Case index
        Case 0 '잠금
            
            If MemoTopLock Then
                
                F_Sub.Ico(0).Picture = F_Sub.IcoPin(1).Picture
                MemoTopLock = ChangeBoolean(MemoTopLock)
            
            Else
            
                F_Sub.Ico(0).Picture = F_Sub.IcoPin(0).Picture
                MemoTopLock = ChangeBoolean(MemoTopLock)
            
            End If
            
        Case 1 '새 메모
            
            If Trim(F_Sub.Text_Memo.Text) = "" Then
            Else
            
                Memo(F_Sub.List_Memo.ListIndex).Main = F_Sub.Text_Memo.Text
                F_Sub.List_Memo.AddItem "빈 메모", F_Sub.List_Memo.ListCount
                F_Sub.List_Memo.ListIndex = F_Sub.List_Memo.ListCount - 1
                F_Sub.Text_Memo.Text = ""
                F_Sub.Ico(3).Picture = F_Sub.IcoStar(1).Picture
                F_Sub.Ico(5).Picture = F_Sub.Ico(6).Picture
                F_Sub.IcoMask(5).Picture = F_Sub.IcoMask(6).Picture
            
            End If
            
        Case 2 '보내기
            
            F_Main.PopupMenu F_Main.mn_Send
            
        Case 3 '중요표시
            
            If Memo(F_Sub.List_Memo.ListIndex).Star Then
            
                F_Sub.Ico(3).Picture = F_Sub.IcoStar(1).Picture
                Memo(F_Sub.List_Memo.ListIndex).Star = ChangeBoolean(Memo(F_Sub.List_Memo.ListIndex).Star)
                
            Else
            
                F_Sub.Ico(3).Picture = F_Sub.IcoStar(0).Picture
                Memo(F_Sub.List_Memo.ListIndex).Star = ChangeBoolean(Memo(F_Sub.List_Memo.ListIndex).Star)
                
            End If
            
            AyouSubBoxBlt
            
        Case 4 '삭제
        
            If F_Sub.List_Memo.ListCount = 1 Then
            
                Memo(F_Sub.List_Memo.ListIndex).Main = ""
                Memo(F_Sub.List_Memo.ListIndex).Lock = False
                Memo(F_Sub.List_Memo.ListIndex).Star = False
                
                F_Sub.Text_Memo.Text = ""
                
            Else
            
                For i = F_Sub.List_Memo.ListIndex + 1 To F_Sub.List_Memo.ListCount
                    
                    Memo(i - 1).Main = Memo(i).Main
                    Memo(i - 1).Lock = Memo(i).Lock
                    Memo(i - 1).Star = Memo(i).Star
                    
                Next i
                
                F_Sub.List_Memo.RemoveItem (F_Sub.List_Memo.ListCount - 1)
                F_Sub.List_Memo.ListIndex = F_Sub.List_Memo.ListCount - 1
                F_Sub.List_Memo_Click
                    
            End If
            
        Case 5 '잠금
        
            If Memo(F_Sub.List_Memo.ListIndex).Lock Then
            
                F_Sub.Ico(5).Picture = F_Sub.Ico(6).Picture
                F_Sub.IcoMask(5).Picture = F_Sub.IcoMask(6).Picture
                Memo(F_Sub.List_Memo.ListIndex).Lock = ChangeBoolean(Memo(F_Sub.List_Memo.ListIndex).Lock)
                
            Else
            
                F_Sub.Ico(5).Picture = F_Sub.Ico(7).Picture
                F_Sub.IcoMask(5).Picture = F_Sub.IcoMask(7).Picture
                Memo(F_Sub.List_Memo.ListIndex).Lock = ChangeBoolean(Memo(F_Sub.List_Memo.ListIndex).Lock)
                
            End If
            
            AyouSubBoxBlt
                
    End Select
    
End Sub
