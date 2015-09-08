Public Class fMain
    Dim Att As Integer
    Dim Memorr As String
    Private Sub Num0_Click(sender As System.Object, e As System.EventArgs) Handles Num0.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "0" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub Num1_Click(sender As System.Object, e As System.EventArgs) Handles Num1.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "1" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub Num2_Click(sender As System.Object, e As System.EventArgs) Handles Num2.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "2" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub Num3_Click(sender As System.Object, e As System.EventArgs) Handles Num3.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "3" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub Num4_Click(sender As System.Object, e As System.EventArgs) Handles Num4.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "4" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub Num5_Click(sender As System.Object, e As System.EventArgs) Handles Num5.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "5" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub Num6_Click(sender As Object, e As System.EventArgs) Handles Num6.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "6" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub Num7_Click(sender As Object, e As System.EventArgs) Handles Num7.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "7" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub Num8_Click(sender As Object, e As System.EventArgs) Handles Num8.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "8" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub Num9_Click(sender As Object, e As System.EventArgs) Handles Num9.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "9" & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
        Btext.SelectionStart = Att + 1
    End Sub
    Private Sub BackSp_Click(sender As System.Object, e As System.EventArgs) Handles BackSp.Click
        On Error Resume Next
        Dim BPL As Integer
        If Len(Btext.Text) < 1 Then
        Else
            Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart - 1) & Mid(Btext.Text, Btext.SelectionStart + Btext.SelectionLength + 1)
            Btext.SelectionStart = Len(Btext.Text)
        End If
    End Sub
    Private Sub B_C_Click(sender As System.Object, e As System.EventArgs) Handles B_C.Click
        Btext.Text = ""
        Btext.SelectionStart = 2
    End Sub
    Private Sub Btext_KeyDown(sender As Object, e As System.Windows.Forms.KeyEventArgs) Handles Btext.KeyDown

    End Sub
    Private Sub Btext_KeyPress(sender As Object, e As System.Windows.Forms.KeyPressEventArgs) Handles Btext.KeyPress

    End Sub
    Private Sub Btext_TextChanged(sender As System.Object, e As System.EventArgs) Handles Btext.TextChanged
        Select Case Len(Btext.Text)
            Case 0
                Btext.Text = "0"
                Btext.SelectionStart = 2
            Case Else
                If Mid(Btext.Text, 1, 1) = "." Then
                    Att = Btext.SelectionStart
                    Btext.Text = "0" & Btext.Text
                    Btext.SelectionStart = Att + 1
                ElseIf Mid(Btext.Text, 1, 1) = "0" Then
                    If Len(Btext.Text) > 1 Then
                        If Mid(Btext.Text, 2, 1) = "." Then
                        Else
                            Att = Btext.SelectionStart
                            Btext.Text = Mid(Btext.Text, 2)
                            Btext.SelectionStart = Att + 1
                        End If
                    End If
                End If
        End Select
    End Sub
    Private Sub B_CE_Click(sender As System.Object, e As System.EventArgs) Handles B_CE.Click
        Btext.Text = ""
        AText.Text = ""
        Asc.Text = ""
        Btext.SelectionStart = 2
    End Sub
    Private Sub NumDot_Click(sender As System.Object, e As System.EventArgs) Handles NumDot.Click
        Att = Btext.SelectionStart
        Btext.Text = Mid(Btext.Text, 1, Btext.SelectionStart) & "." & Mid(Btext.Text, Btext.SelectionStart + 1)
        Btext.SelectionStart = Att + 1
        NumDot.Enabled = False
    End Sub
    Private Sub fMain_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Btext.SelectionStart = 2
        Btext.Focus()
        List1.Items.Add("A")
        List1.Items.Add("B")
        List1.Items.Add("C")
        List1.Items.Add("D")

    End Sub
    Private Function CheckDot()
        Dim i As Integer
        For i = 1 To Len(Btext.Text)
            If Mid(Btext.Text, i, 1) = "." Then
                CheckDot = True
                Exit Function
            End If
        Next
        CheckDot = False
        Exit Function
    End Function
    Private Sub Cals()
        Select Case Asc.Text
            Case "+"
                AText.Text = Val(AText.Text) + Val(Btext.Text)
            Case "-"
                AText.Text = Val(AText.Text) - Val(Btext.Text)
            Case "×"
                AText.Text = Val(AText.Text) * Val(Btext.Text)
            Case "÷"
                AText.Text = Val(AText.Text) / Val(Btext.Text)
            Case "%"
                'AText.Text = Val(AText.Text) + Val(Btext.Text)
            Case "√"
                'AText.Text = Val(AText.Text) + Val(Btext.Text)
        End Select
        Btext.Text = "0"
        NumDot.Enabled = True
    End Sub
    Private Sub C_e_Click(sender As System.Object, e As System.EventArgs) Handles C_e.Click
        Dim AtextX As Integer
        Select Case Asc.Text
            Case "+"
                AtextX = AText.Text
                AText.Text = Val(AText.Text) & "+" & Val(Btext.Text)
                Btext.Text = Val(AText.Text) + Val(Btext.Text)
            Case "-"
                AText.Text = Val(AText.Text) & "-" & Val(Btext.Text)
                Btext.Text = Val(AText.Text) - Val(Btext.Text)
            Case "×"
                AText.Text = Val(AText.Text) & "*" & Val(Btext.Text)
                Btext.Text = Val(AText.Text) * Val(Btext.Text)
            Case "÷"
                AText.Text = Val(AText.Text) & "/" & Val(Btext.Text)
                Btext.Text = Val(AText.Text) / Val(Btext.Text)
            Case "%"
                'AText.Text = Val(AText.Text) + Val(Btext.Text)
            Case "√"
                'AText.Text = Val(AText.Text) + Val(Btext.Text)
        End Select
        Asc.Text = "="
    End Sub
    Private Sub C_p_Click(sender As System.Object, e As System.EventArgs) Handles C_p.Click
        If AText.Text = "" Then
            AText.Text = Btext.Text
            Asc.Text = "+"
            Btext.Text = ""
            NumDot.Enabled = True
        Else
            Call Cals()
            Asc.Text = "+"
        End If
        Btext.Focus()
    End Sub
    Private Sub C_m_Click(sender As System.Object, e As System.EventArgs) Handles C_m.Click
        If AText.Text = "" Then
            AText.Text = Btext.Text
            Asc.Text = "-"
            Btext.Text = ""
            NumDot.Enabled = True
        Else
            Call Cals()
            Asc.Text = "-"
        End If
        Btext.Focus()
    End Sub
    Private Sub C_x_Click(sender As System.Object, e As System.EventArgs) Handles C_x.Click
        If AText.Text = "" Then
            AText.Text = Btext.Text
            Asc.Text = "×"
            Btext.Text = ""
            NumDot.Enabled = True
        Else
            Call Cals()
            Asc.Text = "×"
        End If
        Btext.Focus()
    End Sub
    Private Sub C_s_Click(sender As System.Object, e As System.EventArgs) Handles C_s.Click
        If AText.Text = "" Then
            AText.Text = Btext.Text
            Asc.Text = "÷"
            Btext.Text = ""
            NumDot.Enabled = True
        Else
            Call Cals()
            Asc.Text = "÷"
        End If
        Btext.Focus()
    End Sub
    Private Sub C_r_Click(sender As System.Object, e As System.EventArgs) Handles C_r.Click
        If AText.Text = "" Then
            AText.Text = "√(" & Btext.Text & ")"
            Btext.Text = Val(Btext.Text) ^ (1 / 2)
            Asc.Text = "="
            NumDot.Enabled = True
        Else
            Btext.Text = Val(AText.Text) ^ (1 / 2)
            AText.Text = "√(" & AText.Text & ")"
            Asc.Text = "="
            NumDot.Enabled = True
        End If
        Btext.Focus()
    End Sub
    Private Sub C_sX_Click(sender As System.Object, e As System.EventArgs) Handles C_sX.Click
        If AText.Text = "" Then
            AText.Text = "1/(" & Btext.Text & ")"
            Btext.Text = 1 / Val(Btext.Text)
            Asc.Text = "="
            NumDot.Enabled = True
        Else
            Btext.Text = 1 / Val(AText.Text)
            AText.Text = "1/(" & AText.Text & ")"
            Asc.Text = "="
            NumDot.Enabled = True
        End If
        Btext.Focus()
    End Sub
    Private Sub B_Mc_Click(sender As System.Object, e As System.EventArgs) Handles B_Mc.Click
        Memorr = ""
        MemoR.Visible = False
    End Sub
    Private Sub B_Ms_Click(sender As System.Object, e As System.EventArgs) Handles B_Ms.Click
        Memorr = Btext.Text
        MemoR.Visible = True
    End Sub
    Private Sub B_Mr_Click(sender As System.Object, e As System.EventArgs) Handles B_Mr.Click
        Btext.Text = Memorr
    End Sub
    Private Sub B_Mp_Click(sender As System.Object, e As System.EventArgs) Handles B_Mp.Click
        Memorr = Val(Memorr) + Val(Btext.Text)
        MemoR.Visible = True
    End Sub
    Private Sub B_Mm_Click(sender As System.Object, e As System.EventArgs) Handles B_Mm.Click
        Memorr = Val(Memorr) - Val(Btext.Text)
        MemoR.Visible = True
    End Sub

    Private Sub C_pm_Click(sender As System.Object, e As System.EventArgs) Handles C_pm.Click

    End Sub
    Private Sub uut_Click(sender As System.Object, e As System.EventArgs) Handles uut.Click
        Dim i As Integer
        For i = 1 To List1.SelectedItems.Count
            List2.Items.Add(List1.SelectedItem)
            List1.Items.Remove(List1.SelectedItem)
        Next
    End Sub
End Class
