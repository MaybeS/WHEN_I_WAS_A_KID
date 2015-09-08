Attribute VB_Name = "bSet"
Option Explicit
Public KeySet(255) As Boolean, i As Integer, j As Integer, k As Integer
Public LogoCnt As Integer, Logo As Boolean, FlashLogo As Boolean, KeyPressCheck As Boolean
Public Type MiType
    X As Double
    Y As Double
    Xs As Long
    Ys As Long
    Pxy As String
    Qxy As Integer
End Type
Public Mi As MiType, EFX(12)
Public StartTime As Long
Public Sub SetValue()
        FlashLogo = True
        Logo = True
    Mi.X = (fMain.ScaleWidth / 2)
    Mi.Y = (fMain.ScaleHeight) - 75
        Mi.Xs = 10
        Mi.Ys = 10
    Mi.Pxy = "x"
    EFX(1) = "+1"
    EFX(2) = "+2"
    EFX(3) = "+3"
    EFX(4) = "-1"
    EFX(5) = "-2"
    EFX(6) = "-3"
    EFX(7) = "¡¿0"
    EFX(8) = "¡¾"
    EFX(9) = "¡òdx"
    EFX(10) = "¡òdy"
    EFX(11) = "d/dx"
    EFX(12) = "d/dy"
End Sub
