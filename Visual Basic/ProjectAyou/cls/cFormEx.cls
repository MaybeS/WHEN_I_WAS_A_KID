VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cFormEx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Private Const SW_HIDE& = 0&
Private Const sw_SHOW& = 5&

Private Declare Function ShowWindow Lib "user32" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long


Private Declare Function IsWindowVisible Lib "user32" (ByVal hWnd As Long) As Long

''Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, Optional ByVal lpWindowName As String = vbNullString) As Long


Private Const GWL_HWNDPARENT& = (-8&)

Private Const GWL_STYLE& = (-16&)
Private Const WS_SYSMENU& = &H80000
Private Const WS_CAPTION& = &HC00000
Private Const WS_MAXIMIZEBOX& = &H10000
Private Const WS_MINIMIZEBOX& = &H20000

Private Const GWL_EXSTYLE& = (-20&)
Private Const WS_EX_TOPMOST& = &H8&
Private Const WS_EX_LAYERED& = &H80000

Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
                    
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long


Private Const GCL_STYLE& = (-26&)
Private Const CS_NOCLOSE& = &H200&
Private Const CS_DROPSHADOW& = &H20000

Private Declare Function GetClassLong Lib "user32" Alias "GetClassLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
                                           
Private Declare Function SetClassLong Lib "user32" Alias "SetClassLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long



Private Const LWA_ALPHA& = 2&
Private Declare Function SetLayeredWindowAttributes Lib "user32.dll" (ByVal hWnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long




Private Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long

Private Declare Function CreateRoundRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long




Private Declare Function ReleaseCapture Lib "user32" () As Long


Private Const WM_SETICON& = &H80&
Private Const WM_NCACTIVATE& = &H86&
Private Const WM_NCLBUTTONDOWN& = &HA1&

Private Const ICON_SMALL& = 0&
Private Const ICON_BIG& = 1&

Private Const HTCAPTION& = 2&

Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long



Private Declare Function GetSystemMenu Lib "user32" (ByVal hWnd As Long, ByVal bRevert As Long) As Long

Private Const MF_BYCOMMAND& = &H0&

Private Declare Function CheckMenuItem Lib "user32" (ByVal hMenu As Long, ByVal uIDCheckItem As Long, ByVal uCheck As Long) As Long



Private Const SC_MINIMIZE& = &HF020&
Private Const SC_MAXIMIZE& = &HF030&
Private Const SC_CLOSE& = &HF060&

Private Const xSC_CLOSE& = (-10&)
Private Const xSC_MAXIMIZE& = (-11&)
Private Const xSC_MINIMIZE& = (-12&)

Private Const MIIM_STATE& = &H1&
Private Const MIIM_ID& = &H2&
Private Const MFS_GRAYED& = &H3&

Private Type MENUITEMINFO
    cbSize As Long
    fMask As Long
    fType As Long
    fState As Long
    wID As Long
    hSubMenu As Long
    hbmpChecked As Long
    hbmpUnchecked As Long
    dwItemData As Long
    dwTypeData As String
    cch As Long
    hbmpItem As Long
End Type

Private Declare Function SetMenuItemInfo Lib "user32" Alias "SetMenuItemInfoA" (ByVal hMenu As Long, ByVal uItem As Long, ByVal fByPosition As Long, lpmii As MENUITEMINFO) As Long




Private Const SWP_NOSIZE& = &H1&
Private Const SWP_NOMOVE& = &H2&
Private Const SWP_NOACTIVATE& = &H10&

Private Const HWND_TOPMOST& = (-1&)
Private Const HWND_NOTOPMOST& = (-2&)

Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, Optional ByVal x As Long = 0&, Optional ByVal y As Long = 0&, Optional ByVal cx As Long = 0&, Optional ByVal cy As Long = 0&, Optional ByVal wFlags As Long = SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE) As Long



Private WithEvents m_Form As Form
Attribute m_Form.VB_VarHelpID = -1
Private WithEvents m_Form_MoveWhenDrag As Form
Attribute m_Form_MoveWhenDrag.VB_VarHelpID = -1

Private Enum Menu
    CloseMenu
    MaxMenu
    MinMenu
End Enum

Private Const ID& = 0&
Private Const State& = 1&

Private m_MenuID(2, 1) As Long

Private Const DummyID& = 1&

Private m_MenuIDTbl(2, 1) As Long

Private m_hWnd As Long
Private m_hMenu As Long
Private m_MII As MENUITEMINFO

Private m_Round As Boolean
Private m_RoundX As Long
Private m_RoundY As Long

Private m_Alpha As Byte

Public Enum fxSystemMenu
    fxButton = &H1&
    fxMenuItem = &H2&
    fxAll = &H3&
End Enum
Public Property Get Form() As Form
Attribute Form.VB_UserMemId = 0
    Set Form = m_Form
End Property
Public Property Let Form(frmOwner As Form)
    
    Set m_Form = frmOwner
    m_Form.ScaleMode = vbPixels
    
    m_hWnd = frmOwner.hWnd
    m_hMenu = GetSystemMenu(m_hWnd, 0&)
    
    With m_MII
        .cbSize = LenB(m_MII)
        .fMask = MIIM_STATE
    End With
    
    m_MenuID(CloseMenu, ID) = SC_CLOSE
    m_MenuID(MaxMenu, ID) = SC_MAXIMIZE
    m_MenuID(MinMenu, ID) = SC_MINIMIZE
    
    If Not m_Form.MaxButton Then _
        m_MenuID(MaxMenu, State) = MFS_GRAYED

    If Not m_Form.MinButton Then _
        m_MenuID(MinMenu, State) = MFS_GRAYED

    If IsWindowVisible(m_hWnd) Then
        
        If CheckMenuItem(m_hMenu, SC_CLOSE, MF_BYCOMMAND) Then
            
            m_MenuID(CloseMenu, ID) = xSC_CLOSE
            m_MenuID(CloseMenu, State) = MFS_GRAYED

        End If
        
        If CheckMenuItem(m_hMenu, SC_MAXIMIZE, MF_BYCOMMAND) Then
            
            m_MenuID(MaxMenu, ID) = xSC_MAXIMIZE
            m_MenuID(MaxMenu, State) = MFS_GRAYED
        
        End If
        
        If CheckMenuItem(m_hMenu, SC_MINIMIZE, MF_BYCOMMAND) Then
        
            m_MenuID(MinMenu, ID) = xSC_MINIMIZE
            m_MenuID(MinMenu, State) = MFS_GRAYED
        
        End If
    
    End If

End Property
Public Property Set Form(frmOwner As Form)

    Set m_Form = frmOwner
    m_Form.ScaleMode = vbPixels
    
    m_hWnd = frmOwner.hWnd
    m_hMenu = GetSystemMenu(m_hWnd, 0&)

End Property
Public Sub Round(x As Long, y As Long)
    
    If m_RoundX = x Then Exit Sub
    If m_RoundY = y Then Exit Sub
    
    m_RoundX = x
    m_RoundY = y

    ApplyRoundRgn
    
End Sub
Public Property Get RoundX() As Long
    RoundX = m_RoundX
End Property
Public Property Let RoundX(lngX As Long)
    
    If m_RoundX = lngX Then Exit Property
    
    m_RoundX = lngX
    ApplyRoundRgn
    
End Property
Public Property Get RoundY() As Long
    RoundY = m_RoundY
End Property
Public Property Let RoundY(lngY As Long)
    
    If m_RoundY = lngY Then Exit Property
    
    m_RoundY = lngY
    ApplyRoundRgn
    
End Property
Private Sub ApplyRoundRgn()
        
    If m_RoundX + m_RoundY = 0& Then

        SetWindowLong m_hWnd, GWL_STYLE, GetWindowLong(m_hWnd, GWL_STYLE) Or WS_CAPTION
        
        If m_Round Then
            Refresh_
            m_Round = False
        End If
        
    Else
    
        SetWindowLong m_hWnd, GWL_STYLE, GetWindowLong(m_hWnd, GWL_STYLE) And Not WS_CAPTION
        SetWindowRgn m_hWnd, CreateRoundRectRgn(0, 0, m_Form.ScaleWidth, m_Form.ScaleHeight, m_RoundX, m_RoundY), True
        
        If Not m_Round Then
            Refresh_
            m_Round = True
        End If
        
    End If
    
End Sub
Private Sub Refresh_()
    
    Dim sngHeight As Single

    With m_Form

        sngHeight = .Height
        .Height = 0&
        .Height = sngHeight

    End With
    
End Sub
Public Property Get DropShadow(Optional Refresh As Boolean) As Boolean
    
    DropShadow = GetClassLong(m_hWnd, GCL_STYLE) And CS_DROPSHADOW
    
End Property
Public Property Let DropShadow(Optional Refresh As Boolean = True, blnShadow As Boolean)
    
    If (GetClassLong(m_hWnd, GCL_STYLE) And CS_DROPSHADOW) = blnShadow Then Exit Property
    
    If blnShadow Then
        SetClassLong m_hWnd, GCL_STYLE, GetClassLong(m_hWnd, GCL_STYLE) Or CS_DROPSHADOW
    Else
        SetClassLong m_hWnd, GCL_STYLE, GetClassLong(m_hWnd, GCL_STYLE) And Not CS_DROPSHADOW
    End If
    
    If Refresh Then
    
        ShowWindow m_hWnd, SW_HIDE
        ShowWindow m_hWnd, sw_SHOW
        
    End If

End Property
Public Property Get Transparency() As Byte
    
    Transparency = m_Alpha
    
End Property
Public Property Let Transparency(bytAlpha As Byte)
    
    If m_Alpha = bytAlpha Then Exit Property
    
    SetWindowLong m_hWnd, GWL_EXSTYLE, GetWindowLong(m_hWnd, GWL_EXSTYLE) Or WS_EX_LAYERED
    SetLayeredWindowAttributes m_hWnd, RGB(0, 0, 0), bytAlpha, LWA_ALPHA
    
    m_Alpha = bytAlpha
    
End Property
Public Property Get MoveWhenDrag() As Boolean
    MoveWhenDrag = ObjPtr(m_Form_MoveWhenDrag)
End Property
Public Property Let MoveWhenDrag(blnMove As Boolean)

    If blnMove Then
        Set m_Form_MoveWhenDrag = m_Form
    Else
        Set m_Form_MoveWhenDrag = Nothing
    End If
    
End Property

Private Sub EnabledSystemMenuItem(Menu As Menu, Enable As Boolean)

    m_MII.fState = m_MenuID(Menu, State)
    
    Dim lngID As Long: lngID = m_MenuID(Menu, ID)
    
    If (m_MII.fState Or MFS_GRAYED) = m_MII.fState Then
        m_MII.wID = m_MenuIDTbl(Menu, ID)
    Else
        m_MII.wID = m_MenuIDTbl(Menu, DummyID)
    End If
    
    m_MII.fMask = MIIM_ID
    
    SetMenuItemInfo m_hMenu, lngID, 0&, m_MII
    
    m_MenuID(Menu, ID) = m_MII.wID
    
    If Enable Then
        m_MII.fState = 0&
    Else
        m_MII.fState = MFS_GRAYED
    End If
    
    m_MII.fMask = MIIM_STATE
    
    SetMenuItemInfo m_hMenu, m_MII.wID, 0&, m_MII
    
    m_MenuID(Menu, State) = m_MII.fState
    
End Sub
Public Property Get MaxButton(Optional fxSystemMenu As fxSystemMenu = fxAll) As Boolean
    
    Select Case fxSystemMenu
        
        Case fxButton
            MaxButton = GetWindowLong(m_hWnd, GWL_STYLE) And WS_MAXIMIZEBOX
        
        Case fxMenuItem
            MaxButton = Not m_MenuID(MaxMenu, State) And MFS_GRAYED
        
        Case fxAll
            MaxButton = (GetWindowLong(m_hWnd, GWL_STYLE) And WS_MAXIMIZEBOX) Or _
                        Not m_MenuID(MaxMenu, State) And MFS_GRAYED

    End Select
    
End Property
Public Property Let MaxButton(Optional fxSystemMenu As fxSystemMenu = fxAll, blnEnabled As Boolean)

    If fxSystemMenu And fxMenuItem Then
    
        If (m_MenuID(MaxMenu, State) And MFS_GRAYED) = MFS_GRAYED = blnEnabled Then _
            EnabledSystemMenuItem MaxMenu, blnEnabled
        
    End If
    
    If fxSystemMenu And fxButton Then
        
        If (GetWindowLong(m_hWnd, GWL_STYLE) And WS_MAXIMIZEBOX) And blnEnabled Then Exit Property
        
        If blnEnabled Then
            SetWindowLong m_hWnd, GWL_STYLE, GetWindowLong(m_hWnd, GWL_STYLE) Or WS_MAXIMIZEBOX
        Else
            SetWindowLong m_hWnd, GWL_STYLE, GetWindowLong(m_hWnd, GWL_STYLE) And Not WS_MAXIMIZEBOX
        End If
        
    End If
    
    SendMessage m_hWnd, WM_NCACTIVATE, -1&, 0&
    
End Property
Public Property Get MinButton(Optional fxSystemMenu As fxSystemMenu = fxAll) As Boolean
    
    Select Case fxSystemMenu
        
        Case fxButton
            MinButton = GetWindowLong(m_hWnd, GWL_STYLE) And WS_MINIMIZEBOX
        
        Case fxMenuItem
            MinButton = Not m_MenuID(MinMenu, State) And MFS_GRAYED
        
        Case fxAll
            MinButton = (GetWindowLong(m_hWnd, GWL_STYLE) And WS_MINIMIZEBOX) Or _
                        Not m_MenuID(MinMenu, State) And MFS_GRAYED

    End Select
    
End Property
Public Property Let MinButton(Optional fxSystemMenu As fxSystemMenu = fxAll, blnEnabled As Boolean)

    If fxSystemMenu And fxMenuItem Then
   
        If (m_MenuID(MinMenu, State) And MFS_GRAYED) = MFS_GRAYED = blnEnabled Then _
            EnabledSystemMenuItem MinMenu, blnEnabled
    
    End If
    
    If fxSystemMenu And fxButton Then

        If (GetWindowLong(m_hWnd, GWL_STYLE) And WS_MINIMIZEBOX) And blnEnabled Then Exit Property
        
        If blnEnabled Then
            SetWindowLong m_hWnd, GWL_STYLE, GetWindowLong(m_hWnd, GWL_STYLE) Or WS_MINIMIZEBOX
        Else
            SetWindowLong m_hWnd, GWL_STYLE, GetWindowLong(m_hWnd, GWL_STYLE) And Not WS_MINIMIZEBOX
        End If
    
    End If

    SendMessage m_hWnd, WM_NCACTIVATE, -1&, 0&
    
End Property
Public Property Get CloseButton(Optional fxSystemMenu As fxSystemMenu = fxAll) As Boolean
        
    Select Case fxSystemMenu
        
        Case fxButton
            CloseButton = Not GetClassLong(m_hWnd, GCL_STYLE) And CS_NOCLOSE
        
        Case fxMenuItem
            CloseButton = Not m_MenuID(CloseMenu, State) And MFS_GRAYED
        
        Case fxAll
            CloseButton = (Not GetClassLong(m_hWnd, GCL_STYLE) And CS_NOCLOSE) Or _
                          Not m_MenuID(CloseMenu, State) And MFS_GRAYED

    End Select

End Property

Public Property Let CloseButton(Optional fxSystemMenu As fxSystemMenu = fxAll, blnEnabled As Boolean)
        
    If fxSystemMenu And fxMenuItem Then
        
        If (m_MenuID(CloseMenu, State) And MFS_GRAYED) = MFS_GRAYED = blnEnabled Then _
            EnabledSystemMenuItem CloseMenu, blnEnabled

    End If
    
    If fxSystemMenu And fxButton Then
                
        If ((GetClassLong(m_hWnd, GCL_STYLE) And CS_NOCLOSE) = CS_NOCLOSE) Xor blnEnabled Then Exit Property
        
        If blnEnabled Then
            SetClassLong m_hWnd, GCL_STYLE, GetClassLong(m_hWnd, GCL_STYLE) And Not CS_NOCLOSE
        Else
            SetClassLong m_hWnd, GCL_STYLE, GetClassLong(m_hWnd, GCL_STYLE) Or CS_NOCLOSE
        End If
    
    End If
    
    SendMessage m_hWnd, WM_NCACTIVATE, -1&, 0&
    
End Property
Public Property Get ContolBox() As Boolean
    ContolBox = GetWindowLong(m_hWnd, GWL_STYLE) And WS_SYSMENU
End Property
Public Property Let ContolBox(blnEnable As Boolean)
    
    If (GetWindowLong(m_hWnd, GWL_STYLE) And WS_SYSMENU) = WS_SYSMENU = blnEnable Then Exit Property
    
    If blnEnable Then
        SetWindowLong m_hWnd, GWL_STYLE, GetWindowLong(m_hWnd, GWL_STYLE) Or WS_SYSMENU
    Else
        SetWindowLong m_hWnd, GWL_STYLE, GetWindowLong(m_hWnd, GWL_STYLE) And Not WS_SYSMENU
    End If
    
    Refresh_
    
End Property
Public Property Get TopMost() As Boolean
    TopMost = GetWindowLong(m_hWnd, GWL_EXSTYLE) And WS_EX_TOPMOST
End Property
Public Property Let TopMost(blnTopMost As Boolean)
    
    If (GetWindowLong(m_hWnd, GWL_EXSTYLE) And WS_EX_TOPMOST) = WS_EX_TOPMOST = blnTopMost Then Exit Property
    
    If blnTopMost Then
        SetWindowPos m_hWnd, HWND_TOPMOST
    Else
        SetWindowPos m_hWnd, HWND_NOTOPMOST
    End If
    
End Property
Private Function GetMainWindow(hWnd As Long) As Long

    Dim lngRet As Long
    lngRet = GetWindowLong(hWnd, GWL_HWNDPARENT)
    
    Do While lngRet
       GetMainWindow = lngRet
       lngRet = GetWindowLong(GetMainWindow, GWL_HWNDPARENT)
    Loop
    
End Function
Public Property Get Icon() As Long
    Icon = m_Form.Icon
End Property
Public Property Set Icon(hIcon As IPictureDisp)
    
    m_Form.Icon = hIcon
    
    SendMessage m_hWnd, WM_SETICON, ICON_SMALL, hIcon
    SendMessage GetMainWindow(m_hWnd), WM_SETICON, ICON_BIG, hIcon
    
    'Design Mode
    'SendMessage FindWindow("ThunderMain"), WM_SETICON, ICON_BIG, hIcon
    
    'Run Mode
    'SendMessage FindWindow("ThunderRT6Main"), WM_SETICON, ICON_BIG, hIcon
    
End Property
Public Property Let Icon(hIcon As Long)
    
    SendMessage m_hWnd, WM_SETICON, ICON_SMALL, hIcon
    
    SendMessage GetMainWindow(m_hWnd), WM_SETICON, ICON_BIG, hIcon
    
    'Design Mode
    'SendMessage FindWindow("ThunderMain"), WM_SETICON, ICON_BIG, hIcon
    
    'Run Mode
    'SendMessage FindWindow("ThunderRT6Main"), WM_SETICON, ICON_BIG, hIcon
    
End Property
Private Sub Class_Initialize()
    
    m_Alpha = 255
    
    m_MenuIDTbl(CloseMenu, ID) = SC_CLOSE
    m_MenuIDTbl(CloseMenu, DummyID) = xSC_CLOSE
    
    m_MenuIDTbl(MaxMenu, ID) = SC_MAXIMIZE
    m_MenuIDTbl(MaxMenu, DummyID) = xSC_MAXIMIZE
    
    m_MenuIDTbl(MinMenu, ID) = SC_MINIMIZE
    m_MenuIDTbl(MinMenu, DummyID) = xSC_MINIMIZE

End Sub
Private Sub m_Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    If KeyCode = vbKeyF4 Then _
        If Shift = vbAltMask Then Unload m_Form

End Sub
Private Sub m_Form_MoveWhenDrag_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    
    If Button = vbLeftButton Then
        
        ReleaseCapture
        SendMessage m_hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&

    End If
    
End Sub
