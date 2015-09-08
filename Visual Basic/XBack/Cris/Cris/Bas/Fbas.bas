Attribute VB_Name = "Fbas"
Public Sub Vav()


End Sub
Public Sub LoadMemo(ByVal Index As Integer)
With Notifi
    .Tbox.Text = MemoX(Index).Text
    .TTitle.Text = MemoX(Index).Title
End With
End Sub
Public Sub PushTextArray()
    For i = 499 To 0 Step -1
        MessageXtext(i + 1) = MessageXtext(i)
    Next i
End Sub
Public Sub PushMessageArray()
    For i = 249 To 0 Step -1
        MessageX(i + 1) = MessageX(i)
    Next i
End Sub
Public Function UTF(ByVal Str As String) As String
For i = 1 To Len(Str)
    If Len(Hex(Asc(Mid$(Str, i, 1)))) = 4 Then
        Change = Change & "%" & Mid$(Hex(Asc(Mid$(Str, i, 1))), 1, 2) & "%" & Mid$(Hex(Asc(Mid$(Str, i, 1))), 3, 2)
    Else
        Change = Change & "%" & Hex(Asc(Mid$(Str, i, 1)))
    End If
Next
End Function
Public Function ChangeBoolean(ByVal Boo As Boolean)
        If Boo Then ChangeBoolean = False: Exit Function
        If Not Boo Then ChangeBoolean = True: Exit Function
End Function
Public Function GetStringLen(ByVal Index As String, ByVal Size As Integer) As Integer
        If Size Then
            Noti.Vtext.FontSize = Size
        Else
            Noti.Vtext.FontSize = Noti.FontSize
        End If
        Noti.Vtext.Caption = Replace(Index, vbNewLine, "  ")
        GetStringLen = Noti.Vtext.Width
End Function
Public Function GetStringHeight(ByVal Index As String, ByVal Size As Integer) As Integer
        GetStringLen Index, Size
        GetStringHeight = Noti.Vtext.Height
End Function
Public Function StringCut(ByVal Str As String, ByVal Width As Integer, ByVal Size As Integer)
    For i = 0 To Len(Str)
        If GetStringLen(Str, Size) < Width Then: StringCut = Len(Str): Exit Function
        If GetStringLen(Left$(Str, i + 1), Size) > Width Then
            StringCut = i
            Exit Function
        End If
    Next i
End Function
Public Function TrueV(ByVal Index As Double)
    If Index < 0 Then Index = -Index
    TrueV = Index
End Function
Public Function PixV(ByVal Index As Long)
    PixV = (Index / Screen.TwipsPerPixelX)
End Function
Public Function TwiV(ByVal Index As Long)
    TwiV = (Index * Screen.TwipsPerPixelX)
End Function
Public Sub SaveLog()

End Sub
Public Sub SaveRemind()

End Sub
Public Sub SaveCalender()

End Sub
Public Sub SaveMemo()
    For i = 0 To MemoXCnt
        Open N_Locate & "\Resource\Note\" & i & ".memo" For Output As #1
            Print #1, MemoX(i).Title
            Print #1, MemoX(i).Date
            Print #1, MemoX(i).Lock
            Print #1, MemoX(i).Text
        Close #1
    Next i
End Sub
Public Sub SaveAll()

End Sub
