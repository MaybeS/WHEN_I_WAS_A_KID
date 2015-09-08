Attribute VB_Name = "Gbas"
Public Sub Gstart()
    fmain.BackBG.Picture = fmain.mapList.ListImages(1).Picture
    OpenY = 0
    OpenX = 0
    MouXY = True
    fmain.MousePointer = 99
    fmain.MouseIcon = fmain.EBox.MouseIcon
End Sub
Public Sub Gmaping()
    Select Case GMap
            Case 0
                For i = 0 To 3
                    NewFireBG i, "È­·Î", 200 + (300 * i), 300
                Next i
            Case 1
            Case 2
            Case 3
            Case 4
            Case 5
    End Select
End Sub
Public Function CheckWalking()
    If ChkWalk = 0 Then
            CheckWalking = False
    Else
            CheckWalking = True
    End If
End Function
