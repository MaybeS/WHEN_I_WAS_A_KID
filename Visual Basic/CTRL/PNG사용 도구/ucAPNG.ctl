VERSION 5.00
Begin VB.UserControl ucAPNG 
   BackStyle       =   0  'Transparent
   CanGetFocus     =   0   'False
   ClientHeight    =   1260
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1365
   ClipBehavior    =   0  'None
   ClipControls    =   0   'False
   DrawStyle       =   4  'Dash-Dot-Dot
   DrawWidth       =   2
   HasDC           =   0   'False
   HitBehavior     =   0  'None
   MaskColor       =   &H80000014&
   PaletteMode     =   4  'None
   PropertyPages   =   "ucAPNG.ctx":0000
   ScaleHeight     =   84
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   91
   ToolboxBitmap   =   "ucAPNG.ctx":000D
   Windowless      =   -1  'True
End
Attribute VB_Name = "ucAPNG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Credits/Acknowledgements - Thanx goes to:
'   Paul Caton for
'       His class on calling non VB-Friendly DLLs that use _cdecl calling convention
'           http://www.planetsourcecode.com/vb/scripts/ShowCode.asp?txtCodeId=70195&lngWId=1
'       His routines prevent needing to add VB timer controls and allows greater flexibility, no integer Interval limit
'   Carles P.V for his pvResize logic
'       Used when manually scaling images with NearestNeighbor or BiLinear interpolation
'   Alfred Koppold for his PNG, VB-only, decompression routines. Used when zLib & GDI+ not available
'       http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=56537&lngWId=1
'   John Kleinen for example of a method of calling OLE class functions via API (See cDIB.GetDroppedFileNames)
'       http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=49268&lngWId=1
'   www.zlib.net for their free zLIB.dll, the standard DLL for compressing/decompressing PNGs
'
'   to check for updates, visit: http://www.planetsourcecode.com/vb/scripts/ShowCode.asp?txtCodeId=71618&lngWId=1

'  -----======== PURPOSE: Display APNG v.09 (Animated PNG) files/streams ========-----
' ._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._._.

' APNG/PNG Parser (cAPNG)
' What is APNG?
' Some reading if you would like:
'       http://animatedpng.com/
'       https://wiki.mozilla.org/APNG_Specification
' Basically APNGs are to PNG what animated GIFs are to GIF. In fact, APNG pretty much
' replicated the logic of animated GIFs and applied it to the PNG format. Yes, APNG
' is a normal PNG file with additional 'chunks' added that provide frame
' descriptions, and additional frame images. PNG viewers that are not APNG-aware
' will display a single frame without even knowing they are doing it. APNG-aware
' viewers can display the animated PNG or a single frame.
' APNG is not officially recognized by PNG. This is probably because APNG competes
' with MNG (PNG's official animated PNG format). But MNG is a different file format
' than PNG and requires separate parsing routines. Whereas APNG uses PNG format,
' so a PNG viewer basically only needs to handle some additional 'chunks' to
' make itself APNG-aware.

' The PNG will be parsed using the following resources if they are available
' and in the following order, from fastest to slowest.
' 1) If GDI+ is available, the entire PNG will be processed via GDI+
' 2) If zLIB.DLL or zLIB1.DLL is available, the PNG will be decompressed via zLIB
' 3) If none of the above, the PNG will be decompressed with pure VB

' If GDI+ is not available, the APNG will not be animated, only one frame will be shown
' Why set this GDI+ restriction?
' 1. It's not because we can't parse APNGs without GDI+, we can do it with zLib and even without zLib or GDI+
'    I have already done this and the next paragraph is why I took the code out & set the restriction.
' 2. The reason? It is simply this: Without GDI+, manual creation of PNGs is relatively slow using pure VB.
'       APNGs may consist of dozens or even 100+ images. Manual processing that many for a single APNG
'       can be extremely slow (over a full minute in worse case scenarios). Additionally, without GDI+,
'       AlphaBlend can be used but has known issues rendering from DIB to DIB (crashes) when stretching.
'       Win95 systems are even worse off, AlphaBlend isn't compatible and manual pixel to pixel alphablending is needed
' 3. So, GDI+ which is available for all operating systems except Win95 is declared a requirement for animation
'    GDI+ is a free download from Microsoft, already installed on WinXP and higher
'       http://msdn.microsoft.com/library/default.asp?url=/library/en-us/gdicpp/GDIPlus/GDIPlus.asp
'   Note for Win95 users if any are left. I did place the Win98/ME version of GDI+ in the system folder and
'   it actually worked. I was able to call and use GDI+ on Win95.

' Although this control can support overlapped animations, it is highly suggested that
' you do not. The result will be excessive, nearly continuous repainting. Every time a
' control lower in the Zorder changes, it triggers paint events for each overlapped control.
' Such controls would be our usercontrol, image controls, labels, lines, and shape controls.
' Controls below this control are also affected. When windowless controls get refreshed,
' VB asks each control below it in the zOrder to refresh the part of itself that is overlapped
' by the top level controls currently being refreshed.

' Compile the control for best results/performance, ideally with all optimizations checked.
' When uncompiled, message boxes will make images disappear until message box is closed.

' Incompatibility issues
'   1.When a windowless usercontrol is placed on a picturebox that has custom painting
' (i.e., gradients), you may get a black line at the top of the picturebox. Unfortunately,
' this appears to be a problem with the picturebox and not this usercontrol. There is a
' workaround.  After custom painting your picturebox, execute this line:
' Me.MyPictureBox.Picture = Me.MyPictureBox.Image.
' By forcing the custom painting into its picture property, the black line disappears.

' = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
'                                       CHANGE HISTORY
' = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
' 1st draft released 7 Jan 09
'  2 Feb 09.
'   -- When PNG read from file during runtime, handle was not released when file as non-APNG PNG.
' 25 Jan 09. Modifications, patches
'   -- iparseAddressOf should have caused a GPF, though it didn't. That was strange; fixed anyway
'   -- Removed spt_Resize & combined with UserControl_Resize
' 10-11 Jan 09. Modifications, patches
'   -- Property page APNG now animates
'   -- Changed Frame Indexes to 1-bound vs 0-bound
'   -- Added AutoSize property, spt_Resize function
'   -- Added OLEDropMode property, OLEDragDrop & OLEDragOver events
'   -- Added ImageCentered property
'   -- Reworked spt_RenderFrame, added spt_CreateBuffers routine
'   -- Removed event FinshedLoadingAnimation and added FrameLoaded instead
'   -- Added Extraction routine to property page
'   -- Tweaked cDIB, added Rectangle function for 32bpp formats
'   -- Prevented timer thunks from being created when in design view
'   -- Attempting to load invalid image no longer resets control; current image is left unchanged
'   -- Added procedure attributes to all properties displayed in property browser
'   -- Minor streamlining modifications throughout; added many more comments in all classes
' 12 Jan 09. Minor modifications only
'   -- When using optional offsets, refreshing may not paint image at correct offsets; fixed
'   -- For single frame APNGs or PNGs, no longer caches image data in Frame structure; not needed, fixed
'   -- Minor streamlining modifications throughout; added more comments
' 14 Jan 09.
'   -- When GDI+ not available, mirroring scaled PNG failed; fixed
'   -- Allowed cHost to manage own DC when multiple frames exist (obsolete by 18 Jan change)
' 16 JAN 09.
'   -- Bug. Rendering with semi-transparency can sometimes render at twice the semi-transparency; fixed
' 17 JAN 09.
'   -- Still didn't get partial repainting correct. Now it is
'   -- All usercontrols, regardless how many, now share up to 2 global DCs; reduction in total GDI usage
'   -- Moved many usercontrol spt_xxxx functions to the bas module; renamed iparse_xxxx
'   -- The iparse_MangageGDIToken called now for only 1st loaded usercontrol; all others share the result
' 19 JAN 09
'   -- Made compatible for MS Access and possibly other non-VB hosts
'       Access is kind of strange: In form design, control is windowless, but when running it is windowed
'   -- Some changes required. Not all non-VB hosts support windowless controls and VB will default to
'       windowed if unsupported; therefore, many routines need to know if control is windowed or windowless
'   -- Since control can be windowed, following property names changed to better reflect windowed controls
'       :: SolidBkgColor property changed to BackColor
'       :: SolidBkgUsed property changed to BackStyle
'   -- Rendering routines modified to handle windowed control with DC or windowless without DC
'   -- GDI+ manager no longer run when control is compiled; GDI+ manager intended for uncompiled safety only
' = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

' Public Properties/Methods. See actual properties for more information
' -----------------------------------------------------------------------------------------------------------
' Action - starts,pauses,stops animation
' AutoSize - resizes the control to fit the image. When Stretch is ActualSize, this will also resize the control. Else no control resizing occurs
' BoundingHeight - ReadOnly. Source height of the entire PNG, all frames
' BoundingWidth - ReadOnly. Source width of the entire PNG, all frames
' Clear - unloads/destroys the APNG
' CurrentFrame - Returns the current frame rendered, 0 indicates no PNG loaded
' Enabled - whether or not control responds to mouse events
' FrameCount - Read Only. Number of frames within the APNG
' ImageCentered - centers scaled image within usercontrol's bounds
' *LoadPicture_DropedFiles = method to assing APNG if user drops files on your project. 1st file only will be processed
' *LoadPicture_File - method to assign APNG by passing a filename, unicode supported
' *LoadPicture_PastedFiles - method to assign APNG if your project accepts pasting actions. 1st file only will be processed
' LoadPicture_Resource - method to assign APNG stored in Custom section of your resource file.
' LoadPicture_Stream - method to assign APNG from an array (must be 1 dimensional array)
' Loops - determines how many loops to complete before animation terminates. Zero is infinite
' LoopsRemaining - Read Only. Number of loops remaining before animation terminates.
' MinFrameDelay - Minimal ms delay before next frame is displayed. Used when APNG frames encoded with zero milliseconds
' Mirrored - option to mirror animation either horizontally or vertically
' MouseIcon - option to set custom cursor when mouse is over the control
' MousePointer - variety of default cursors to use when mouse is over the control
' OffsetX - option to adjust left edge of rendered frame by +/- n pixels
' OffsetY - option to adjust top edge of rendered frame by +/- n pixels
' OLEDropMode. Enables the control to act as an OLE drop site
' Refresh - allows control to be refreshed during runtime
' SolidBkgColor - Optional solid color to render APNG over
' SolidBkgUsed - Determines if SolidBkgColor is ignored or not
' SteppedDelay - Overrides individual frame delays to the value passed
' Stretch - enables various scaling options
' (*) Unicode Path/File compatible functions

' Public events....
' --------------------------
' add any additional events you think you may need
Public Event Click()
Attribute Click.VB_Description = "Occurs when the user presses and then releases a mouse button over an object"
Attribute Click.VB_MemberFlags = "200"
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute MouseDown.VB_Description = "Occurs when the user presses the mouse button while an object has the focus"
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute MouseUp.VB_Description = "Occurs when the user releases the mouse button while an object has the focus"
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute MouseMove.VB_Description = "Occurs when the user moves the mouse"
Public Event OLEDragDrop(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute OLEDragDrop.VB_Description = "Occurs when data is dropped onto the control via an OLE drag/drop operation, and OLEDropMode is set to manual"
Public Event OLEDragOver(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
Attribute OLEDragOver.VB_Description = "Occurs when the mouse is moved over the control during an OLE drag/drop operation, if its OLEDropMode property is set to manual"
Public Event LoopsEnded() ' fired when a looping APNG terminates its loops naturally
Public Event FrameChanged(ByVal FrameIndex As Long, viaTimer As Boolean) ' fired each time a frame is rendered
Attribute FrameChanged.VB_Description = "Called whenever a frame is advanced or reset"
' note ^^ The viaTimer parameter is only True if active animation is running & the timer changed the frame
'         If changed/rendered frame any other way (i.e., moving to next frame via Action property, resetting, etc), viaTimer=False
Public Event FrameLoaded(FrameNumber As Long, FrameCount As Long, StartAnimation As Boolean)
Attribute FrameLoaded.VB_Description = "Called whenever a frame is processed before it is initially displayed"
' ^^ This occurs regardless of animation. When FrameNumber = FrameCount then the entire image has been processed
'    Animation will occur immediately unless StartAnimation is set to False when FrameNumber=FrameCount


' No APIs are declared public. This is to prevent possibly, differently
' declared APIs, or different versions of the same API, from conflicting
' with any APIs you declared in your project. Same rule for UDTs.
' Note: I did take some liberties in several API declarations throughout

' Used for compatibility of reading files with unicode paths/filenames
Private Declare Function ReadFile Lib "kernel32.dll" (ByVal hFile As Long, ByRef lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, ByRef lpNumberOfBytesRead As Long, ByRef lpOverlapped As Any) As Long
Private Declare Function SetFilePointer Lib "kernel32.dll" (ByVal hFile As Long, ByVal lDistanceToMove As Long, ByRef lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Private Declare Function GetFileSize Lib "kernel32.dll" (ByVal hFile As Long, ByRef lpFileSizeHigh As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Const INVALID_HANDLE_VALUE = -1&

' Memory mainpulation APIs
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (ByRef Ptr() As Any) As Long

' Timer & Drawing-related APIs
Private Declare Function SetTimer Lib "user32.dll" (ByVal hWnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Private Declare Function KillTimer Lib "user32.dll" (ByVal hWnd As Long, ByVal nIDEvent As Long) As Long
Private Declare Function Rectangle Lib "gdi32.dll" (ByVal hDC As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function BitBlt Lib "gdi32.dll" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function GetSysColor Lib "user32.dll" (ByVal nIndex As Long) As Long
Private Declare Function SetRect Lib "user32.dll" (ByRef lpRect As RECT, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function OffsetRect Lib "user32.dll" (ByRef lpRect As RECT, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function IntersectRect Lib "user32.dll" (ByRef lpDestRect As RECT, ByRef lpSrc1Rect As RECT, ByRef lpSrc2Rect As RECT) As Long
Private Declare Function GetClipBox Lib "gdi32.dll" (ByVal hDC As Long, ByRef lpRect As RECT) As Long
Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Private Const Ratio1to1 As Single = 1!

' Our Animated PNG & Frame information
Private Type FrameDescription
    FrameCx As Long         ' width                 (unsigned int)   Width of the following frame
    FrameCy As Long         ' height                (unsigned int)   Height of the following frame
    FrameX As Long          ' x_offset              (unsigned int)   X position at which to render the following frame
    FrameY As Long          ' y_offset              (unsigned int)   Y position at which to render the following frame
    FrameDelay As Long      ' millesecond delay; combined from following division
                            ' delay_num             (unsigned short) Frame delay fraction numerator
                            ' delay_den             (unsigned short) Frame delay fraction denominator
    FrameDisp_ROP As Long   ' combined value of the following two properties
                            ' dispose_op            (byte)           Type of frame area disposal to be done after rendering this frame
                            ' blend_op              (byte)           Type of frame area rendering for this frame
    ImageData() As Long     ' bits in array vs individual DIBs to ease system GDI resource usage
End Type
Private Type aniPNGData
    FrameCount As Long              ' nr of frames in the APNG
    LoopCount As Long               ' nr of loops before animation terminates. Zero=infinite
    Sequence As Long                ' Sequence numbers during parsing/current frame during animation
    Loaded As APNGLoadStatus        ' load state of animated PNG
    Frames() As FrameDescription    ' collection of frame data
End Type

' Custom Enumerations
Private Enum APNGToggles
    apngRenderInit = 1&         ' render frame as initial load (less memory consumption)
    apngRenderTimer = 2&        ' render frame, processing pre/post disposition instructions
    apngRenderMask = 3&         ' apngRenderInit Or apngRenderTimer
    apngAutoSize = 4&           ' AutoSize control
    apngSolidBkgUsed = 8&       ' solid bkg color in use
    apngCenterImage = 16&       ' center image in control
    apngWritableMask = 24&      ' apngCenterImage Or apngSolidBkgUsed
    apngIsWindowed = 32&        ' VB converted this windowless control to windowed
    apngIsHidden = 64&          ' control is either not visible or terminating
    apngUserMode = 128&         ' control is in run-time, else design-time
End Enum
Private Enum APNGDispROPCodes
    apngROP_Over = 0&           ' APNG_BLEND_OP_SOURCE
    apngROP_Blend = 1&          ' APNG_BLEND_OP_OVER
    apngDisp_NoAction = 0&      ' APNG_DISPOSE_OP_NONE
    apngDisp_Erase = 1&         ' APNG_DISPOSE_OP_BACKGROUND
    apngDisp_Revert = 2&        ' APNG_DISPOSE_OP_PREVIOUS
End Enum
Private Enum APNGLoadStatus
    apngLoaded = -1&            ' single/multi-frame APNG/PNG completely loaded
    apngError = 0&              ' APNG/PNG failed to load, corrupted data or invalid format
    apngLoading = 1&            ' multi-frame APNG is being loaded, not fully loaded yet
End Enum
Public Enum APNGScaleConstants     ' See Stretch property. Settings can force control to resize
    apngClip = 0&                  ' will never scale, nor stretch
    apngScaleAlways = 1&           ' will always scale up or down as needed
    apngStretch = 2&               ' will stretch to fit, not scaled, distorted
    apngShrinkScaleToFit = 3&      ' will only scale down if needed else scale is 1:1
    apngActualSize = 4&            ' self-explanatory
End Enum
Public Enum APNGAnimationActions   ' See Action property
    apngStop = 0&                  ' stop on current frame, reset current frame to first
    apngPlay = 1&                  ' start/restart from current frame
    apngPause = 2&                 ' stop on current frame, do not reset frame nr
    apngForward = 3&               ' show next frame only, then pause
    apngReset = 4&                 ' restart from 1st frame
End Enum
Public Enum APNGMirrorConstants
    apngNone = 0&                 ' no mirroring
    apngHorizontal = 1&           ' mirror horizontally
    apngVertical = 2&             ' mirror vertically
    apngHorAndVer = 3&            ' mirror on X & Y axis
End Enum
Public Enum APNGBackStyle
    apngTransparent = 0&
    apngSolid = 1&
End Enum
    
' All Class-Level variables are prefixed with c_
Private cHost As cDIB           ' primary canvas for APNG/PNG
Private cDChost As cDIB         ' offscreen scaled,mirrored image, if necessary
Private cBlendHost As cDIB      ' secondary canvas use to handle specific APNG disposal & ROP instructions, if necessary
Private cPNG As cAPNG           ' APNG parsing routines; released after parsing

' internal timer related variables
Private c_TimerID As Long       ' numerical Identifier of an active timer
Private c_TmrOwner As Long      ' hWnd to attach timer to
Private c_Ptr As Long           ' function pointer to TimerProc at end of this module
Private z_CbMem As Long         ' virtual memory location for timer thunk

Private c_Data() As Byte        ' during design time only, the PNG data read from the property bag
Private c_Buffer() As Long      ' when frame uses APNG_DISPOSE_OP_PREVIOUS, then cache of frame's bounds before rendering
Private c_OffSetX As Long       ' Optional: modifies the left edge where rendering will occur on control
Private c_OffSetY As Long       ' Optional: modifies the top edge where rendering will occur
Private c_ScaleX As Single      ' precalculated width ratio for stretching purposes
Private c_ScaleY As Single      ' precalculated height ratio for stretching purposes
Private c_Opacity As Long                   ' level of additional transparency (0 to 100); 0 indicates no added transparency
Private c_MinDelay As Long                  ' any delay less than this value will use this value
Private c_AniLoops As Long                  ' during animation: loops remaining
Private c_aniState As APNGAnimationActions  ' current animation state
Private c_ScaleMode As APNGScaleConstants   ' image scaling options
Private c_Mirror As APNGMirrorConstants     ' optional horizontal and/or vertical mirroring
Private c_StepDelay As Long                 ' optional overrride of per frame delay, 0 returns to actual delays
Private c_OLEDrop As OLEDropConstants       ' optional drop constants
Private c_Toggles As Long                   ' see APNGToggles enumeration above
Private c_aniPNG As aniPNGData              ' our animated PNG

Public Property Let Enabled(ByVal Enable As Boolean)
    ' Enables/disables the control. Disabled controls get no mouse/key/focus events
    ' IMPORTANT: To ensure this property tells VB to treat it as the
    ' control's enabled property, you must ensure the attributes are correct:
    ' IDE menu: Tools|Procedure Attributes
    ' Find Enabled in dropdown box, click "Advanced" button
    ' In "Procedure ID" dropdown, find & select Enabled, then click "Apply"
    UserControl.Enabled = Enable
    PropertyChanged "Enabled"
End Property
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events"
Attribute Enabled.VB_UserMemId = -514
    Enabled = UserControl.Enabled
End Property

Public Property Get BoundingWidth() As Long
Attribute BoundingWidth.VB_Description = "Original width of the overall animation"
    ' overall actual APNG width in Pixels only
    If c_aniPNG.FrameCount Then BoundingWidth = cHost.Width
End Property
Public Property Get BoundingHeight() As Long
Attribute BoundingHeight.VB_Description = "Original height of the overall animation"
    ' overall actual APNG height in Pixels only
    If c_aniPNG.FrameCount Then BoundingHeight = cHost.Height
End Property

Public Property Get CurrentFrame() As Long
Attribute CurrentFrame.VB_Description = "Returns the current frame"
    ' returns the current frame; 0 indicates no APNG loaded
    CurrentFrame = c_aniPNG.Sequence
End Property

Public Property Let FrameCount(ByVal nrFrames As Long)
Attribute FrameCount.VB_Description = "Number of frames within the animation"
    ' dummy. Property is Read Only. Allows property to be displayed in property sheet
End Property
Public Property Get FrameCount() As Long
    FrameCount = c_aniPNG.FrameCount
End Property

Public Property Let Loops(ByVal Count As Long)
Attribute Loops.VB_Description = "Number of loops to animate before animation stops. Zero is infinite"
    ' set Loops=0 for infinite looping
    ' to prevent animation during runtime, set Action=gfaPause or Action=gfaStop
    ' or respond to the FrameLoaded event and set its StartAnimation param to False
    If Not c_aniPNG.LoopCount = Count Then
        c_aniPNG.LoopCount = Abs(Count)
        PropertyChanged "Loops"
    End If
End Property
Public Property Get Loops() As Long
    Loops = c_aniPNG.LoopCount
End Property

Public Property Let MinFrameDelay(ByVal Delay As Long)
Attribute MinFrameDelay.VB_Description = "The minimum number of milliseconds a frame will remain before it is replaced."
    If Delay < 10 Then Delay = 10           ' ensure absolute minimum delay
    If Not Delay = c_MinDelay Then
        c_MinDelay = Delay
        PropertyChanged "Delay"
    End If
End Property
Public Property Get MinFrameDelay() As Long
    MinFrameDelay = c_MinDelay
End Property

Public Property Let Mirrored(ByVal MirrorStyle As APNGMirrorConstants)
Attribute Mirrored.VB_Description = "Mirrors images either horizontally or vertically"
    ' option to mirror the image
    If MirrorStyle < apngNone Or MirrorStyle > apngHorAndVer Then Exit Property
    If c_aniPNG.Loaded = 0& Then
        c_Mirror = MirrorStyle
        PropertyChanged "Mirrored"
        
    ElseIf Not MirrorStyle = c_Mirror Then
        If MirrorStyle = apngNone Then
            c_Mirror = apngNone
        Else
            c_Mirror = c_Mirror Xor MirrorStyle
        End If
        Call spt_CreateBuffers(0&, 0&)
        UserControl.Refresh
        PropertyChanged "Mirrored"
    End If

End Property
Public Property Get Mirrored() As APNGMirrorConstants
    Mirrored = c_Mirror
End Property

Public Property Get LoopsRemaining() As Long
Attribute LoopsRemaining.VB_Description = "Number of loops remaining before animation stops"
    ' return number of loops remaining, if more than 1 frame
    If c_aniPNG.Loaded = apngError Or c_aniPNG.FrameCount = 1& Then ' not loaded or single frame
        LoopsRemaining = 0&
    ElseIf c_aniPNG.LoopCount = 0& Then ' infinite
        LoopsRemaining = &H7FFFFFFF ' a really high number
    Else
        LoopsRemaining = c_AniLoops ' loops remaining
    End If
End Sub

Public Property Let ImageCentered(ByVal newValue As Boolean)
Attribute ImageCentered.VB_Description = "Centers non-Clipped images within the control"
    If Not newValue = CBool(c_Toggles And apngCenterImage) Then
        ' centers an image in the control
        c_Toggles = c_Toggles Xor apngCenterImage
        If newValue Then
            Call spt_ScaleToDestination(0&, 0&)
        Else
            c_OffSetX = 0&: c_OffSetY = c_OffSetX
        End If
        If ((c_Toggles And apngUserMode) = 0&) Or c_aniPNG.FrameCount = 1& Then
            c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderInit
            UserControl.Refresh
        End If
        PropertyChanged "ImageCentered"
    End If
End Property
Public Property Get ImageCentered() As Boolean
    ImageCentered = CBool(c_Toggles And apngCenterImage)
End Property

Public Property Let OffsetX(ByVal NewOffset As Long)
Attribute OffsetX.VB_Description = "Adjusts left edge of rendered frame by n pixels"
    ' option to adjust left edge used for rendering by +/- NewOffset pixels
    c_OffSetX = NewOffset
    c_Toggles = (c_Toggles And Not apngCenterImage)
    If ((c_Toggles And apngUserMode) = 0&) Or c_aniPNG.FrameCount = 1& Then
        c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderInit
        UserControl.Refresh
    End If
    PropertyChanged "OffsetX"
End Property
Public Property Get OffsetX() As Long
    OffsetX = c_OffSetX
End Property

Public Property Let OffsetY(ByVal NewOffset As Long)
Attribute OffsetY.VB_Description = "Adjusts top edge of rendered frame by n pixels"
    ' option to adjust top edge used for rendering by +/- NewOffset pixels
    c_OffSetY = NewOffset
    c_Toggles = (c_Toggles And Not apngCenterImage)
    If ((c_Toggles And apngUserMode) = 0&) Or c_aniPNG.FrameCount = 1& Then
        c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderInit
        UserControl.Refresh
    End If
    PropertyChanged "OffsetY"
End Property
Public Property Get OffsetY() As Long
    OffsetY = c_OffSetY
End Property

Public Property Let Transparency(ByVal newValue As Long)
Attribute Transparency.VB_Description = "Percentage of transparency to apply to the image. Zero is no additional transparency"
    ' option to add level of transparency (0 to 100) where 100 is fully transparent
    If newValue < 0& Then           ' ensure min/max value not exceeded
        newValue = 100&             ' internally c_Opacity is 100-Transparency
    ElseIf newValue > 100& Then
        newValue = 0&
    Else
        newValue = 100& - newValue
    End If
    If Not newValue = c_Opacity Then
        c_Opacity = newValue
        If Not c_aniState = apngPlay Then
            c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderInit
            UserControl.Refresh
        End If
        PropertyChanged "Transparency"
    End If
End Property
Public Property Get Transparency() As Long
    Transparency = 100& - c_Opacity
End Property

Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display graphics in an object"
    ' option to render frames over a solid background color
    BackColor = UserControl.BackColor
End Property
Public Property Let BackColor(ByVal Color As OLE_COLOR)
    If Not UserControl.BackColor = Color Then
        UserControl.BackColor = Color
        If (c_Toggles And (apngSolidBkgUsed Or apngIsWindowed)) Then
            Call spt_CreateBuffers(0&, 0&)
        ElseIf c_aniPNG.FrameCount Then
            c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderTimer
        End If
        UserControl.Refresh
        PropertyChanged "BackColor"
    End If
End Property
Public Property Get BackStyle() As APNGBackStyle
Attribute BackStyle.VB_Description = "Indicates whether the background is transparent or opaque"
    ' option to render frames over a solid background color
    ' if property=apngTransparent then BackColor ignored
    BackStyle = Abs((c_Toggles And apngSolidBkgUsed) = apngSolidBkgUsed)
End Property
Public Property Let BackStyle(ByVal newValue As APNGBackStyle)
    If newValue = apngTransparent Or newValue = apngSolid Then
        If Not Abs((c_Toggles And apngSolidBkgUsed) = apngSolidBkgUsed) = newValue Then
            c_Toggles = c_Toggles Xor apngSolidBkgUsed
            Call spt_CreateBuffers(0&, 0&)
            UserControl.Refresh
            PropertyChanged "BackStyle"
        End If
    End If
End Property

Public Property Let SteppedDelay(ByVal newDelay As Long)
Attribute SteppedDelay.VB_Description = "Forces all frames to be rendered by the value provided. Zero erases SteppedDelay"
    ' property allows you to separate all frames by a specific delay
    ' Setting the property to zero, releases stepped values and the
    ' frame's individual delay time resumes as normal.
    If newDelay < 1& Then c_StepDelay = 0& Else c_StepDelay = newDelay
    PropertyChanged "SteppedDelay"
End Property
Public Property Get SteppedDelay() As Long
    SteppedDelay = c_StepDelay
End Property

Public Property Let Stretch(ByVal newScale As APNGScaleConstants)
Attribute Stretch.VB_Description = "Returns/sets a value that determines whether a graphic resizes to fit the size of an Image control"
    ' scaling options
    If newScale < apngClip Or newScale > apngActualSize Then Exit Property
    If Not c_ScaleMode = newScale Then
        c_ScaleMode = newScale
        Call UserControl_Resize
        PropertyChanged "Stretch"
    End If
End Property
Public Property Get Stretch() As APNGScaleConstants
    Stretch = c_ScaleMode
End Property

Public Property Let AutoSize(ByVal newValue As Boolean)
Attribute AutoSize.VB_Description = "Resizes the control to the dimensions of the scaled image"
    ' If true, then resizes the control to fit the image
    ' Note: If Stretch=ActualSize then control will be resized also
    ' otherwise control is not resized when new images are applied
    ' Exception: During design-time, new images are always first
    '   displayed actual size, regardless of any scaling options
    If Not newValue = CBool(c_Toggles And apngAutoSize) Then
        c_Toggles = c_Toggles Xor apngAutoSize
        If newValue = True Then Call UserControl_Resize
        PropertyChanged "AutoSize"
    End If
End Property
Public Property Get AutoSize() As Boolean
    AutoSize = CBool(c_Toggles And apngAutoSize)
End Property

Public Property Let Action(ByVal Act As APNGAnimationActions)
    ' start, stop, pause animation
    ' This property should be hidden on the browser. Set in menu: Tools|Procedure Attributes
    If Not c_aniPNG.Loaded = apngLoaded Then Exit Property
    If ((c_Toggles And apngUserMode) = 0&) Then Exit Property
    If c_aniPNG.FrameCount = 1& Then Exit Property
    
    Select Case Act
    Case apngForward
        spt_ManageTimer False, False
        c_aniPNG.Sequence = c_aniPNG.Sequence + 1& ' wrap back to 1st frame if needed
        If c_aniPNG.Sequence > c_aniPNG.FrameCount Then c_aniPNG.Sequence = 1&
        c_aniState = apngPause
        c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderTimer
        UserControl.Refresh
        RaiseEvent FrameChanged(c_aniPNG.Sequence, False)
    Case apngPause
        If Not c_aniState = apngStop Then
            spt_ManageTimer False, False
            c_aniState = apngPause
        End If
    Case apngPlay
        spt_ManageTimer True, False
    Case apngReset           ' basically a Stop & then Play call
        spt_ManageTimer False, False
        c_AniLoops = c_aniPNG.LoopCount ' reset loops remaining
        c_aniPNG.Sequence = 1&
        c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderTimer
        UserControl.Refresh
        RaiseEvent FrameChanged(c_aniPNG.Sequence, False)
        spt_ManageTimer False, False
    Case apngStop
        spt_ManageTimer False, False
        c_AniLoops = c_aniPNG.LoopCount ' reset loops remaining
        c_aniPNG.Sequence = 1&          ' reset current frame
        c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderTimer
        UserControl.Refresh
        RaiseEvent FrameChanged(c_aniPNG.Sequence, False)
    End Select
End Property
Public Property Get Action() As APNGAnimationActions
Attribute Action.VB_Description = "Start, Stop and Pause animation"
Attribute Action.VB_MemberFlags = "400"
    Action = c_aniState
End Property

Public Property Let MouseIcon(MousePic As StdPicture)
Attribute MouseIcon.VB_Description = "Sets a custom mouse icon"
    Set MouseIcon = MousePic
End Property
Public Property Set MouseIcon(MousePic As StdPicture)
    ' same as VB's MouseIcon property
    On Error Resume Next
    Set UserControl.MouseIcon = MousePic
    If MousePic Is Nothing Then UserControl.MousePointer = vbDefault
    PropertyChanged "MouseIcon"
End Property
Public Property Get MouseIcon() As StdPicture
    Set MouseIcon = UserControl.MouseIcon
End Property

Public Property Let MousePointer(ByVal Pointer As MousePointerConstants)
Attribute MousePointer.VB_Description = "Returns/sets the type of mouse pointer displayed when over part of an object"
    ' same as VB's MousePointer property
    On Error Resume Next
    UserControl.MousePointer = Pointer
End Property
Public Property Get MousePointer() As MousePointerConstants
    MousePointer = UserControl.MousePointer
End Property

Public Property Let OLEDropMode(Value As OLEDropConstants)
Attribute OLEDropMode.VB_Description = "Returns/Sets whether this object can act as an OLE drop target"
    ' same as VB's OLEDropMode property
    ' Will forward the OLEDragOver, OLEDragDrop when set
    ' You can use this to allow the control to load an image dragged onto it
    On Error Resume Next
    If Value >= vbOLEDropNone And Value <= vbOLEDropAutomatic Then
        If Not Value = c_OLEDrop Then
            c_OLEDrop = Value
            If c_OLEDrop = vbOLEDropAutomatic Then
                UserControl.OLEDropMode = vbOLEDropManual
            Else
                UserControl.OLEDropMode = c_OLEDrop
            End If
        End If
        PropertyChanged "OLEDropMode"
    End If
End Property
Public Property Get OLEDropMode() As OLEDropConstants
    OLEDropMode = c_OLEDrop
End Property

Public Property Get ImagePointer() As Long
Attribute ImagePointer.VB_Description = "Allows the property page to retrieve image data during design time"
Attribute ImagePointer.VB_MemberFlags = "440"
    ' called only by the property page to get the PNG info from this control
    ' The property page will get the data, rewrite c_Data(0) which is a PNG header
    ' then display the animated PNG on the property page
    ' Should be made not visible to the user and will only return a value in design time
    If iparseIsArrayEmpty(VarPtrArray(c_Data)) Then
        CopyMemory c_Data(0), CLng(UBound(c_Data)), 4&
        ImagePointer = VarPtr(c_Data(0))
    End If
End Property
Friend Property Get VirtualTimerPointer() As Long
    ' only called by the property page & returns value only if not compiled
    ' In order to animate on the property page during design time
    ' we need to tell the timer thunk to ignore IDE safety, which
    ' is only done when compiled. This is a hack to allow uncompiled
    ' usercontrol pretend it is compiled. When compiled, animation
    ' works as intended on the property page.
    ' DO NOT STEP thru this usercontrol when the property page is animating
    If iparseIsUncompiled Then VirtualTimerPointer = z_CbMem
End Property

Public Sub Refresh()
Attribute Refresh.VB_Description = "Forces a complete repaint of a object"
    ' refresh the usercontrol
    UserControl.Refresh
End Sub
Public Sub Clear()
Attribute Clear.VB_Description = "Resets the control and clears the image"
    ' empties the usercontrol, destroys the image
    Call spt_ResetControl
    Set cPNG = Nothing
    Erase c_Data()
    PropertyChanged "OffsetX" ' force write props if in design view
    UserControl.Refresh
End Sub

Public Function LoadPicture_File(ByVal FileName As String) As Boolean
Attribute LoadPicture_File.VB_Description = "Allows loading an image from an existing file"

    ' PURPOSE: Convert passed image file into a 32bpp image
    
    ' Parameters.
    ' FileName :: full path of file. Validation occurs before we continue
    
    On Error Resume Next
    Dim hFile As Long, lSize As Long, lRtnRead As Long
    
    hFile = iparseGetFileHandle(FileName, True, False)
    If hFile = INVALID_HANDLE_VALUE Then Exit Function
    
    lSize = GetFileSize(hFile, 0&)
    If lSize > 56& Then
        Dim aDIB() As Byte  ' dummy array
        If spt_LoadPictureEx(hFile, FileName, aDIB(), 0&, 0&) Then
            ' when successful and only when in design view, then
            ' this was called by the property page only. We need
            ' to update our data array with this new image
            If ((c_Toggles And apngUserMode) = 0&) Then
                ReDim c_Data(0 To lSize - 1&)           ' cache for writing to property bag
                SetFilePointer hFile, 0&, 0&, 0&        ' set to beginning of file & read it
                ReadFile hFile, c_Data(0), lSize, lRtnRead, ByVal 0&
                CloseHandle hFile                       ' we won't be getting additonal frames
                PropertyChanged "OffsetX"               ' force write props if in design view
            ElseIf c_aniPNG.Loaded = apngLoaded Then
                CloseHandle hFile                       ' single frame image/non-APNG PNG; done
            Else
                ' when in runtime, the cPNG class may be still loaded for processing more frames
                ' in this case, we cannot close the file handle. The handle will be closed in cPng.DelayLoadPNG
            End If
            LoadPicture_File = True
        Else
            CloseHandle hFile
        End If
    Else
        CloseHandle hFile
    End If
    
End Function

Public Function LoadPicture_Stream(inStream() As Byte, _
                                    Optional ByVal StreamStart As Long = 0&, _
                                    Optional ByVal StreamLength As Long = 0&) As Boolean
Attribute LoadPicture_Stream.VB_Description = "Allows loading an image from a valid stream/byte array"
    
    ' PURPOSE: Convert passed array into a 32bpp image
    
    ' Parameters.
    ' inStream:: byte stream containing the image. Validation occurs below
    ' streamStart :: array position of 1st byte of the image file. Validated.
    ' streamLength :: total length of the image file. Validated.
    
    Dim nrDims As Long
    If iparseArrayProps(VarPtrArray(inStream), nrDims) = 0& Then Exit Function
    If nrDims > 1& Then Exit Function
    
    If StreamStart < LBound(inStream) Then StreamStart = LBound(inStream)
    If StreamLength = 0& Then StreamLength = UBound(inStream) - StreamStart + 1&
    LoadPicture_Stream = spt_LoadPictureEx(0&, vbNullString, inStream, StreamStart, StreamLength)

End Function

Public Function LoadPicture_Resource(ByVal ResIndex As Variant, ByVal ResSection As Variant, _
                            Optional VBglobal As IUnknown, _
                            Optional ByVal StreamStart As Long = 0&, _
                            Optional ByVal StreamLength As Long = 0&) As Boolean
Attribute LoadPicture_Resource.VB_Description = "Allows loading an image from a resource file"

    ' PURPOSE: Convert passed resource into a 32bpp image
    
    ' Parameters.
    ' ResIndex :: the resource file index (i.e., 101)
    ' ResSection :: must not be one of: vbResIcon,vbResBitmap,vbResCursor
    '       your resource section, i.e., "Custom", etc
    ' VbGlobal :: pass as VB.GLOBAL of the project containing the resource file
    '       - Allows class to be mobile; can exist in DLL or OCX
    '       - if not provided, class will use resource from existing workspace
    '       - For example, if this class was in a compiled OCX, then the only way
    '           to use the host's resource file is passing the host's VB.Global reference
    '           Otherwise, the OCX resource will be used (if it even exists).
    ' streamStart :: array position of 1st byte of the image file. Validated.
    ' streamLength :: total length of the image file. Validated.
    '   -- See LoadPicture_Stream for the validation
    
    On Error GoTo ExitRoutine
    
    Dim oWorkSpace As VB.Global, tPic As StdPicture
    
    If VBglobal Is Nothing Then
        Set oWorkSpace = VB.Global
    ElseIf TypeOf VBglobal Is VB.Global Then
        Set oWorkSpace = VBglobal
    Else
        Set oWorkSpace = VB.Global
    End If
    
    If VarType(ResSection) = vbString Then
        Dim inStream() As Byte
        On Error Resume Next
        ' could be anything, PNG,icon,gif,32bpp bitmap,wmf,tga etc
        inStream = oWorkSpace.LoadResData(ResIndex, ResSection)
        If Err Then
            Err.Clear
        Else
            LoadPicture_Resource = LoadPicture_Stream(inStream, StreamStart, StreamLength)
        End If
    End If
    
ExitRoutine:
    If Err Then Err.Clear
End Function

Public Function LoadPicture_DropedFiles(DragDrop_DataObject As DataObject) As Boolean
Attribute LoadPicture_DropedFiles.VB_Description = "Allows loading an image from OLE drag/drop operations"
    
    ' Can be called from your app if your app supports drag & drop of files
    ' When called, only the 1st dropped file will be processed

    ' Parameters
    ' DragDrop_DataObject :: the Data parameter in your form/control's OLEDragDrop event
    
    If cHost.GetDroppedFileNames(DragDrop_DataObject) Then
        LoadPicture_DropedFiles = LoadPicture_File(DragDrop_DataObject.Files(1))
    End If

End Function

Public Function LoadPicture_PastedFiles() As Boolean
Attribute LoadPicture_PastedFiles.VB_Description = "Allows loading an image from pasted files"
    
    ' Can be called from your app if your app supports Pasting of files
    ' When called, only the 1st pasted file will be processed
    
    Dim theFiles() As String
    If cHost.GetPastedFileNames(theFiles) Then
        LoadPicture_PastedFiles = LoadPicture_File(theFiles(1&))
    End If

End Function


' /////////////////// PRIVATE SUPPORT FUNCTIONS \\\\\\\\\\\\\\\\\\\\\\\\\\

Private Sub spt_RenderFrame(ByVal hDC As Long)
    
    ' Purpose: Composite the frame to be displayed & render it on screen
    
    Dim ucRect As RECT, clipRect As RECT, dcRect As RECT
    Dim Color As Long
    Dim FlipScaleX As Single, FlipScaleY As Single
    
    ' (c_Toggles And &H3) is used to identify 3 types of refresh/renders
    ' 0 :: normal windows refreshing, not internal-driven
    ' 1 :: display of 1st frame while remaining frames are being processed
    ' 2 :: changing frame during animation
    
    If (c_Toggles And apngRenderMask) = 0& Then                 ' window is refreshing, not changing frames
    
        GetClipBox hDC, dcRect                                  ' get invalidated area
        If cDChost Is Nothing Then                              ' create RECT with uc dimensions
            SetRect ucRect, 0&, 0&, cHost.Width, cHost.Height
            OffsetRect dcRect, -c_OffSetX, -c_OffSetY           ' adjust for user-defined offsets
        Else
            SetRect ucRect, 0&, 0&, cDChost.Width, cDChost.Height
        End If                                                  ' overlap RECTs and get update in relation to our control
        If IntersectRect(clipRect, ucRect, dcRect) = 0& Then Exit Sub
        
        With clipRect
            .Right = .Right - .Left                             ' adjust Right/Bottom to be Width/Height
            .Bottom = .Bottom - .Top
            If cDChost Is Nothing Then                          ' updating directly from source
                cHost.Render hDC, .Left + c_OffSetX, .Top + c_OffSetY, .Right, .Bottom, .Left, .Top, .Right, .Bottom, c_Opacity
            ElseIf (c_Toggles And apngSolidBkgUsed) Then        ' updating from the dcHost
                BitBlt hDC, .Left, .Top, .Right, .Bottom, iparseGetDC(cDChost.Handle, 0&), .Left, .Top, vbSrcCopy
                iparseGetDC 0&, 0&
            Else
                cDChost.Render hDC, .Left, .Top, .Right, .Bottom, .Left, .Top, .Right, .Bottom
            End If
        End With
        
    Else
        ' handle disposiiton instructions for previously drawn frame
        If c_aniPNG.Sequence > 1& Then                                  ' not on 1st frame
            With c_aniPNG.Frames(c_aniPNG.Sequence - 1&)
                Select Case (.FrameDisp_ROP \ &H100)
                Case apngDisp_Erase                                     ' zero out prev frame's coordinate
                    cHost.EraseDIBRect .FrameX, .FrameY, .FrameCx, .FrameCy
                Case apngDisp_Revert                                    ' copy prev canvas state from buffer
                    cHost.SetBits .FrameX, .FrameY, .FrameCx, .FrameCy, c_Buffer()
                End Select
            End With
        End If
            
        ' render current frame
        With c_aniPNG.Frames(c_aniPNG.Sequence)
            If c_aniPNG.FrameCount > 1& Then
                If (c_Toggles And apngRenderTimer) Then  ' else initial load which is only 1 frame, no need to cache disposition image data
                    ' does this frame force buffer actions? copy current state to buffer if needed
                    If (.FrameDisp_ROP \ &H100) = apngDisp_Revert Then          ' frame requires caching current state before rendering
                        If c_aniPNG.Sequence = 1& Then                          ' if 1st frame, cache 100% full transparency (all zeros)
                            ReDim c_Buffer(1 To .FrameCx * .FrameCy)
                        Else
                            cHost.GetBits .FrameX, .FrameY, .FrameCx, .FrameCy, c_Buffer()
                        End If
                    End If
                End If
                
                ' transfer frame data to cHost
                If (.FrameDisp_ROP And &HFF) = apngROP_Over Then ' for 1st frame and others that use ROP of zero
                    cHost.SetBits .FrameX, .FrameY, .FrameCx, .FrameCy, .ImageData
                Else  ' apngROP_Blend                                                   ' frames that use ROP of one
                    cBlendHost.SetBits .FrameX, .FrameY, .FrameCx, .FrameCy, .ImageData    ' set image data to the blend host & then render to the main host
                    cBlendHost.Render iparseGetDC(cHost.Handle, 0&), .FrameX, .FrameY, .FrameCx, .FrameCy, .FrameX, .FrameY, .FrameCx, .FrameCy, , g_GDItoken, cHost
                    iparseGetDC 0&, 0&
                End If
            End If
            
            If cDChost Is Nothing Then          ' rendering directly from source
                cHost.Render hDC, c_OffSetX, c_OffSetY, , , , , , , c_Opacity
            Else                                ' rendering from dcHost, render there now while mirroring and/or scaling
                If (c_Toggles And (apngSolidBkgUsed Or apngIsWindowed)) Then
                    ' allow solid bkg fill
                    Color = UserControl.BackColor
                    If Color < 0& Then Color = GetSysColor(Color And &HFF)
                    cDChost.Rectangle 0&, 0&, cDChost.Width, cDChost.Height, Color
                Else
                    cDChost.EraseDIB
                End If
        
                ' allow mirroring
                If ((c_Mirror And apngHorizontal) = apngHorizontal) Then FlipScaleX = -c_ScaleX Else FlipScaleX = c_ScaleX
                If ((c_Mirror And apngVertical) = apngVertical) Then FlipScaleY = -c_ScaleY Else FlipScaleY = c_ScaleY
        
                cHost.Render iparseGetDC(cDChost.Handle, 0&), c_OffSetX, c_OffSetY, cHost.Width * FlipScaleX, cHost.Height * FlipScaleY, , , , , c_Opacity, g_GDItoken, cDChost
                If (c_Toggles And (apngSolidBkgUsed Or apngIsWindowed)) Then ' render from solid bkg, simple bitblt and any blending is already done against solid bkg
                    BitBlt hDC, 0&, 0&, cDChost.Width, cDChost.Height, iparseGetDC(cDChost.Handle, 0&), 0&, 0&, vbSrcCopy
                    iparseGetDC 0&, 0&
                Else                            ' render from alpha and blend as needed
                    iparseGetDC 0&, 0&
                    cDChost.Render hDC
                End If
            End If
            
        End With
        
    End If

End Sub


Private Function spt_LoadPictureEx(FileHandle As Long, FileName As String, aStream() As Byte, StreamOffset As Long, StreamLength As Long) As Boolean
    
    ' PURPOSE: Send to APNG parser and process the return results
    ' For parameter information, see LoadPicture_File & LoadPicture_Stream
    
    Dim lRtn As Long
    Dim tHost As cDIB
    Dim bRestat As Boolean
    Set tHost = New cDIB
    
    Set cPNG = New cAPNG
    
    If c_aniState = apngPlay Then
        bRestat = True
        Me.Action = apngPause
    End If
    
    On Error GoTo ExitRoutine
    If g_GDItoken Then              ' gdi+ is available for use
        lRtn = cPNG.ScanPNG(FileHandle, FileName, aStream, StreamOffset, StreamLength, g_GDItoken, tHost)
    Else                            ' done manually using zLIB or pure VB. Success results in single-frame PNG only
        lRtn = cPNG.ManualLoad(FileHandle, aStream, StreamOffset, StreamLength, tHost)
    End If
    On Error GoTo 0
    
ExitRoutine:
    If Err Then
        MsgBox Err.Description      ' testing purposes only
        Err.Clear
    End If
    
    If lRtn Then                    ' fully or partially loaded
        Call spt_ResetControl
        Set cHost = tHost
        ' get frame & loop count from cPNG
        CopyMemory c_aniPNG, ByVal cPNG.AnimationControlPointer, 8&
        ' when in design view, only going to display one frame
        If ((c_Toggles And apngUserMode) = 0&) Then
            lRtn = apngLoaded           ' no further frames will be processed
        ElseIf lRtn = apngLoaded Then   ' the cPNG processed PNG, 1-frame APNG, or invalid APNG
            c_aniPNG.FrameCount = 1&    ' only 1 frame to display
        End If
        c_aniPNG.Loaded = lRtn
        
        ' cache the 1st frame's image data. Even if only ever going to display one frame,
        ' if user opts to add solid bkg color, we'll need these bytes
        ReDim c_aniPNG.Frames(1 To c_aniPNG.FrameCount)
        With c_aniPNG.Frames(1)
            CopyMemory .FrameCx, ByVal cPNG.FrameControlPointer(1), 24&
            If .FrameCx = 0& Then           ' will only be zero if non-APNG (i.e., standard PNG)
                .FrameCx = cHost.Width
                .FrameCy = cHost.Height
            End If
            If c_aniPNG.FrameCount > 1& Then ' cache bits if more than 1 frame is expected
                ReDim .ImageData(0 To .FrameCx * .FrameCy - 1&)
                CopyMemory .ImageData(0), ByVal cHost.BitsPointer, UBound(.ImageData) * 4& + 4&
                ' remove apngROP_Blend from 1st frame if it existed.
                ' Canvas is always erased before 1st frame is drawn; removing ROP now prevents having to validate during rendering
                .FrameDisp_ROP = (.FrameDisp_ROP And Not apngROP_Blend)
            End If
        End With
        c_AniLoops = c_aniPNG.LoopCount     ' set initial loop count & release class if not needed
        If c_aniPNG.Loaded = apngLoaded Then Set cPNG = Nothing
        
        c_aniPNG.Sequence = 1&              ' start with 1st frame
        c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderInit ' flag to prevent unnecessary bkg caching
        If (c_Toggles And apngUserMode) Then    ' during runtime, we don't automatically set to actual size
            Call UserControl_Resize
        Else
            lRtn = c_ScaleMode              ' during design time, we do set to actual size
            c_ScaleMode = apngActualSize
            Call UserControl_Resize
            c_ScaleMode = lRtn
        End If
        
        ' indicate we loaded a frame & it is not the lat frame
        RaiseEvent FrameLoaded(1&, c_aniPNG.FrameCount + 0&, False)
        RaiseEvent FrameChanged(1&, False)  ' notify that frame changed
        ' start timer to get additional frames as needed
        If c_aniPNG.Loaded = apngLoading Then spt_ManageTimer True, True
        spt_LoadPictureEx = True
    
    Else ' failure, the file/stream failed to parse
        Set cPNG = Nothing
        If bRestat Then Me.Action = apngPlay
    End If
    
End Function

Private Sub spt_CreateBuffers(ByVal ucCx As Long, ByVal ucCy As Long)

    Dim bDChost As Boolean, tState As APNGAnimationActions
    
    ' Up to 3 DIBs will be used to display animated pngs.
    ' Following matrix applies
    ' ------------------------------------------------------------------------------
    ' Scenario                  Source DIB       DC DIB         Blend DIB
    ' UC size = Source Size         1               0               0
    ' UC size <> Source Size        1               1               0
    ' Single Frame Image            1               0               0
    ' Solid Bkg Color Used          1               1               0
    ' Mirroring                     1               1               0
    ' Blend ROP Used by APNG        1               0               1
    ' Control is made Windowed      1               1               0
    ' Total DIBs...                 1      +      OR'd      +     OR'd
    ' ------------------------------------------------------------------------------
    ' DC DIB primary purposes:
    '   Contain scaled, mirrored image and/or solid bkg color applied.
    '   Used for refreshing control on normal window refresh events
    '   When not used, Source DIB is used instead
    ' Blend DIB :
    '   Required if any frame AlphaBlends to running animation, n/a for single frames
    '   Created only in TimerProc if required
    ' Source DIB always used
    '   Its DC is created in spt_LoadFileEx
    
    If c_aniPNG.Loaded = apngError Then Exit Sub
    
    If c_aniState = apngPlay Then       ' if animating we need to stop temporarily
        tState = c_aniState
        Me.Action = apngPause
    End If
                                        ' get controls bounds
    If ucCx = 0& Then ucCx = UserControl.ScaleWidth
    If ucCy = 0& Then ucCy = UserControl.ScaleHeight
    
    If c_Mirror Then                    ' do we need a DC Dib?
        bDChost = True
    ElseIf (c_Toggles And (apngSolidBkgUsed Or apngIsWindowed)) Then
        bDChost = True
    ElseIf Not (ucCx = cHost.Width And ucCy = cHost.Height) Then
        bDChost = True
    End If
    
    If bDChost Then                     ' we need DC Dib, set it up
        If Not cDChost Is Nothing Then  ' create only if size changing or doesn't exist
            bDChost = Not (cDChost.Width = ucCx And cDChost.Height = ucCy)
        End If
        If bDChost Then
            Set cDChost = New cDIB
            cDChost.InitializeDIB ucCx, ucCy
        End If
        If c_aniPNG.Loaded = apngLoaded Then
            c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderTimer
        Else
            c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderInit
        End If
    Else
        Set cDChost = Nothing           ' no longer needed, release it
    End If
    
    ' restart timer if needed
    If tState = apngPlay Then
        Me.Action = tState
    ElseIf c_aniPNG.Loaded = apngLoading Then
        spt_ManageTimer True, True
    End If

End Sub

Private Sub spt_ScaleToDestination(ByRef Cx As Long, ByRef Cy As Long)

    ' function Scales an image to fit the usercontrol and also
    ' determines the appropriate size for the usercontrol
    
    Dim uCx As Long, uCy As Long, bScaleUC As Boolean
    uCx = UserControl.ScaleWidth        ' uc current size
    uCy = UserControl.ScaleHeight
    
    If c_ScaleMode = apngClip Or c_aniPNG.FrameCount = 0& Then
        ' the image scale will be 1:1, the uc size does not change
        c_ScaleX = Ratio1to1: c_ScaleY = Ratio1to1
    
    ElseIf c_ScaleMode = apngActualSize Then
        ' the image scale will be 1:1, the uc size is resized to image
        c_ScaleX = Ratio1to1: c_ScaleY = Ratio1to1
        bScaleUC = True
    
    Else ' scaling in one way or another....
        c_ScaleX = uCx / c_aniPNG.Frames(1).FrameCx
        c_ScaleY = uCy / c_aniPNG.Frames(1).FrameCy
        Select Case c_ScaleMode
        Case apngStretch
            ' the image scale is set above, the uc size is left unchanged
        Case apngShrinkScaleToFit
            ' shrink only if it won't fit, else don't shrink
            ' the Image scale is calculated below, the uc size only changes if AutoSize=True
            If c_ScaleX > Ratio1to1 And c_ScaleY > Ratio1to1 Then
                ' image will fit without scaling; use 1:1 scaling
                c_ScaleX = Ratio1to1: c_ScaleY = Ratio1to1
            Else            ' image must be scaled; use same ratio for width/height
                If c_ScaleX > c_ScaleY Then c_ScaleX = c_ScaleY Else c_ScaleY = c_ScaleX
            End If
            bScaleUC = CBool(c_Toggles And apngAutoSize)
        Case Else ' always scale to target dimensions; use same ratio for width/height
            ' same as apngShrinkScaleToFit except scales above actual size too
            If c_ScaleX > c_ScaleY Then c_ScaleX = c_ScaleY Else c_ScaleY = c_ScaleX
            bScaleUC = CBool(c_Toggles And apngAutoSize)
        End Select
    End If
    
    If bScaleUC Then     ' calculate control's new bounds
        Cx = c_aniPNG.Frames(1).FrameCx * c_ScaleX
        Cy = c_aniPNG.Frames(1).FrameCy * c_ScaleY
    Else                ' control will not change size
        Cx = uCx
        Cy = uCy
    End If
    If Me.ImageCentered Then
        If c_aniPNG.FrameCount Then
            c_OffSetX = (Cx - c_aniPNG.Frames(1).FrameCx * c_ScaleX) \ 2
            c_OffSetY = (Cy - c_aniPNG.Frames(1).FrameCy * c_ScaleY) \ 2
        Else
            c_OffSetX = 0&: c_OffSetY = c_OffSetX
        End If
    End If
End Sub

Private Sub spt_ManageTimer(StartTimer As Boolean, asDelayTimer As Boolean)
    
    ' Routine starts/stops timer
    If (c_Toggles And apngUserMode) = 0& Then Exit Sub
    
    If c_TmrOwner = 0& Then
        On Error Resume Next
        c_TmrOwner = UserControl.ContainerHwnd
        On Error GoTo 0
        If c_TmrOwner = 0& Then
            c_TmrOwner = -1&
            Exit Sub
        End If
    ElseIf c_TmrOwner = -1& Then
        Exit Sub
    End If

    If StartTimer = 0& Then    ' stop timer
        If c_TimerID Then KillTimer c_TmrOwner, c_TimerID
        If Not asDelayTimer Then c_aniState = apngStop
        c_TimerID = 0&
    Else
        Dim newDelay As Long
        If asDelayTimer Then
            c_TimerID = -ObjPtr(Me)         ' indicates this is a delay load timer vs frame timer
            SetTimer c_TmrOwner, c_TimerID, 20&, c_Ptr
        ElseIf c_aniPNG.Loaded = apngLoaded Then
            If c_aniPNG.FrameCount Then             ' don't set timers for single frames
                If Not (c_aniState = apngPlay) Then ' already playing
                    c_aniState = apngStop           ' stop animation
                    If c_StepDelay Then             ' if stepping vs playing
                        newDelay = c_StepDelay
                    ElseIf c_aniPNG.Sequence < 1& Then
                        newDelay = 10&
                    Else                            ' determine frame's delay
                        newDelay = c_aniPNG.Frames(c_aniPNG.Sequence).FrameDelay
                        If newDelay < c_MinDelay Then newDelay = c_MinDelay
                    End If
                    c_TimerID = ObjPtr(Me)          ' indicates this is a frame timer
                    SetTimer c_TmrOwner, c_TimerID, newDelay, c_Ptr
                    c_aniState = apngPlay           ' set play state
                End If
            End If
        End If
    End If

End Sub

Private Sub spt_ResetControl()
    ' Routine clears everything except releaseing the cHost & clearing c_Data()
    spt_ManageTimer False, False    ' stop any timers
    With c_aniPNG                   ' clear our animation info structure
        .Loaded = apngError
        .FrameCount = 0&
        .LoopCount = 0&
        .Sequence = 0&
        Erase .Frames()
    End With
    Erase c_Buffer                  ' clear any rendering buffer
    cHost.DestroyDIB                ' destroy host DIB
    Set cBlendHost = Nothing        ' and release these if needed
    Set cDChost = Nothing
End Sub

Private Function spt_InUserMode() As Boolean
    ' support function to prevent "Client Site Not Available" errors
    ' in other applications that host usercontrols
    ' Example: Using MSAccess and compiled ocx
    '   Without this function...
    '       If any properties query Ambient.UserMode and control is added to an Access form: no problems
    '       If that control is then copied (i.e., CTRL+C): error
    '   With this function
    '       Error is trapped and Ambient.UserMode is assumed False since one can't CTRL+C controls in runtime
    Dim bResult As Boolean
    On Error Resume Next
    bResult = Ambient.UserMode
    If Err Then
        Err.Clear
    ElseIf bResult Then
        c_Toggles = c_Toggles Or apngUserMode
        spt_InUserMode = True
    End If
End Function


'///////////////// USERCONTROL EVENTS \\\\\\\\\\\\\\\\\\

Private Sub UserControl_Hide()
    c_Toggles = (c_Toggles Or apngIsHidden)
    Me.Action = apngPause ' pause timer; control is no longer visible, could be unloading
End Sub

Private Sub UserControl_HitTest(X As Single, Y As Single, HitResult As Integer)
    HitResult = vbHitResultHit ' allows selecting image during design time
End Sub

Private Sub UserControl_Initialize()
    UserControl.ScaleMode = vbPixels
    Call iparseAddRef
    Set cHost = New cDIB            ' create our source DIB class
    UserControl.DrawStyle = vbDot   ' this is the dotted border style, but pen width may make it look un-dotted
    UserControl.ForeColor = vbWindowFrame ' & color, in case they were changed by you
End Sub

Private Sub UserControl_InitProperties()
    c_MinDelay = 50&                 ' default settings for new controls
    c_ScaleMode = apngScaleAlways
    c_Opacity = 100&
    If spt_InUserMode Then
        c_Ptr = iparseAddressOf(z_CbMem, 1, 4, , Me, iparseIsUncompiled) ' get function pointer of our TimerProc & establish timer thunk
    End If
    If iparseIsUncompiled Then
        Call iparseManageGDIToken(UserControl.ContainerHwnd) ' determine if GDI+ is available & create IDE-safe GDI+ instance
    Else
        Call iparseManageGDIToken(0&)
    End If
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        c_Data() = .ReadProperty("Data", c_Data())
        c_MinDelay = .ReadProperty("Delay", 50&)
        c_ScaleMode = .ReadProperty("Stretch", apngScaleAlways)
        c_Mirror = .ReadProperty("Mirror", apngNone)
        UserControl.Enabled = .ReadProperty("Enabled", True)
        Set UserControl.MouseIcon = .ReadProperty("MouseIcon", Nothing)
        UserControl.MousePointer = .ReadProperty("MousePointer", vbDefault)
        UserControl.BackColor = .ReadProperty("BkColor", vbButtonFace)
        c_StepDelay = .ReadProperty("StepDelay", 0&)
        c_OffSetX = .ReadProperty("OffsetX", 0&)
        c_OffSetY = .ReadProperty("OffsetY", 0&)
        c_Opacity = .ReadProperty("Opacity", 100&)
        c_Toggles = .ReadProperty("Toggles", 0&)
        c_OLEDrop = .ReadProperty("OLEDrop", vbOLEDropNone)
        If c_OLEDrop = vbOLEDropAutomatic Then
            UserControl.OLEDropMode = vbOLEDropManual
        Else
            UserControl.OLEDropMode = c_OLEDrop
        End If
    End With
    If spt_InUserMode Then
        c_Ptr = iparseAddressOf(z_CbMem, 1, 4, , Me, iparseIsUncompiled) ' get function pointer of our TimerProc & establish timer thunk
    End If
    If iparseIsUncompiled Then
        Call iparseManageGDIToken(UserControl.ContainerHwnd) ' determine if GDI+ is available & create IDE-safe GDI+ instance
    Else
        Call iparseManageGDIToken(0&)
    End If
    If LoadPicture_Stream(c_Data) Then      ' load image & set user-defined loop count
        c_AniLoops = PropBag.ReadProperty("Loops", c_aniPNG.LoopCount)
        c_aniPNG.LoopCount = c_AniLoops
        If (c_Toggles And apngUserMode) Then Erase c_Data()    ' we don't need to cache the PNG/APNG source when in runtime
    Else
        Erase c_Data()
    End If
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "Delay", c_MinDelay, 50&
        .WriteProperty "Stretch", c_ScaleMode, apngScaleAlways
        .WriteProperty "Loops", c_aniPNG.LoopCount, 0&
        .WriteProperty "Mirror", c_Mirror, apngNone
        .WriteProperty "MouseIcon", UserControl.MouseIcon, Nothing
        .WriteProperty "MousePointer", UserControl.MousePointer, vbDefault
        .WriteProperty "Enabled", UserControl.Enabled, True
        .WriteProperty "OffsetX", c_OffSetX, 0&
        .WriteProperty "OffsetY", c_OffSetY, 0&
        .WriteProperty "BkColor", UserControl.BackColor, vbButtonFace
        .WriteProperty "StepDelay", c_StepDelay, 0&
        .WriteProperty "Opacity", c_Opacity, 100&
        .WriteProperty "Toggles", (c_Toggles And apngWritableMask), 0&
        .WriteProperty "OLEDrop", c_OLEDrop, vbOLEDropNone
        .WriteProperty "Data", c_Data()
    End With
End Sub

Private Sub UserControl_Paint()
    If c_aniPNG.FrameCount > 0& Then
        If (c_Toggles And apngIsHidden) = 0& Then
            If c_aniPNG.Sequence Then
                On Error Resume Next
                spt_RenderFrame UserControl.hDC   ' no AutoRedraw, we will only get notified by VB when to repaint
                If Err Then Err.Clear
                c_Toggles = (c_Toggles And Not apngRenderMask)
            End If
        End If
    End If
    If ((c_Toggles And apngUserMode) = 0&) Then    ' draw  border if in design view
        Rectangle UserControl.hDC, 0&, 0&, UserControl.ScaleWidth, UserControl.ScaleHeight
    End If
End Sub

Private Sub UserControl_Resize()
    If c_aniPNG.FrameCount > 0& Then
        Dim Cx As Long, Cy As Long, oCx As Long, oCy As Long
        oCx = UserControl.ScaleWidth
        oCy = UserControl.ScaleHeight
        Call spt_ScaleToDestination(Cx, Cy)             ' get new uc size & set image scale ratios
        Call spt_CreateBuffers(Cx, Cy)                  ' add/remove/resize dcHost
        If oCx = Cx And oCy = Cy Then
            ' no change in size expected, simply refresh
            UserControl.Refresh
        Else
            c_aniPNG.FrameCount = -c_aniPNG.FrameCount  ' flag to prevent potential recursion
            UserControl.Size ScaleX(Cx, vbPixels, vbTwips), ScaleY(Cy, vbPixels, vbTwips)
            ' in design view, resizing by the top left/right sizing handles, for some reason,
            ' does not honor the .Size call above. In this case, we will try to size the extender
            If Not ((Cx = UserControl.ScaleWidth) And (Cy = UserControl.ScaleHeight)) Then
                On Error Resume Next
                Extender.Width = ScaleX(Cx, vbPixels, vbContainerSize)
                Extender.Height = ScaleY(Cy, vbPixels, vbContainerSize)
                If Err Then Err.Clear
            End If
            c_aniPNG.FrameCount = -c_aniPNG.FrameCount
        End If
    End If
End Sub

Private Sub UserControl_Show()
    c_Toggles = (c_Toggles And Not apngIsHidden)
    If UserControl.hWnd Then              ' if it has an hWnd the application does not support transparent controls
        If (c_Toggles And apngIsWindowed) = 0& Then
            c_Toggles = c_Toggles Or apngIsWindowed
            UserControl.BackStyle = 1     ' opaque vs transaprent
            Call UserControl_Resize        ' validates c_ScaleX/Y calculated & creates offscreen buffer as needed
        End If
    End If
    If c_ScaleX = 0! Then Call spt_ScaleToDestination(0&, 0&) ' if c_ScaleX=0! then UserControl_Resize was not triggered
    If c_aniState = apngPause Then Me.Action = apngPlay
End Sub

Private Sub UserControl_Click()
    RaiseEvent Click
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseDown(Button, Shift, Int(ScaleX(X, vbPixels, vbContainerPosition)), Int(ScaleY(Y, vbPixels, vbContainerPosition)))
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseMove(Button, Shift, Int(ScaleX(X, vbPixels, vbContainerPosition)), Int(ScaleY(Y, vbPixels, vbContainerPosition)))
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseUp(Button, Shift, Int(ScaleX(X, vbPixels, vbContainerPosition)), Int(ScaleY(Y, vbPixels, vbContainerPosition)))
End Sub

Private Sub UserControl_OLEDragDrop(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    cHost.GetDroppedFileNames data
    If c_OLEDrop = vbOLEDropAutomatic Then
        ' handle automatic loads
        Effect = vbDropEffectCopy
        If data.Files.Count Then
            If LoadPicture_File(data.Files(1)) = False Then Beep
        End If
    Else ' pass manual loads to user
        RaiseEvent OLEDragDrop(data, Effect, Button, Shift, Int(ScaleX(X, vbPixels, vbContainerPosition)), Int(ScaleY(Y, vbPixels, vbContainerPosition)))
    End If
End Sub

Private Sub UserControl_OLEDragOver(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
    If c_OLEDrop = vbOLEDropAutomatic Then
        Effect = vbDropEffectCopy
    Else
        RaiseEvent OLEDragOver(data, Effect, Button, Shift, Int(ScaleX(X, vbPixels, vbContainerPosition)), Int(ScaleY(Y, vbPixels, vbContainerPosition)), State)
    End If
End Sub

Private Sub UserControl_Terminate()
    Me.Clear
    iparsezTerminate z_CbMem
    Call iparseRemoveRef
End Sub

'Callback ordinal 1
Private Function TimerProc(ByVal hWnd As Long, ByVal tMsg As Long, ByVal TimerID As Long, ByVal tickCount As Long) As Long
    
    KillTimer hWnd, TimerID    ' stop current timer
    
    If TimerID = ObjPtr(Me) Then    ' standard frame timer, only established when APNG fully loaded
        Dim bRestart As Boolean
        Dim bLoopComplete As Boolean
        Dim tValue As Long, lRtn As Long
        Dim tHost As cDIB
        
        ' determine next frame in the animation order
        tValue = c_aniPNG.Sequence
        c_aniPNG.Sequence = c_aniPNG.Sequence + 1
        If c_aniPNG.Sequence > c_aniPNG.FrameCount Then
            c_aniPNG.Sequence = 1&
            bLoopComplete = True
        End If
        
        If c_aniPNG.FrameCount = 1& Then  '  single frame PNG/APNG
            c_AniLoops = 0&                 ' shouldn't get here/timer should not have been created
            c_aniState = apngStop
        Else
            ' determine if timer should continue
            bRestart = True
            If bLoopComplete = True Then                ' another loop finished
                If Not c_aniPNG.LoopCount = 0& Then     ' has specified number of animation loops
                    c_AniLoops = c_AniLoops - 1&        ' decrease number of loops remaining
                    If c_AniLoops = 0& Then             ' end of desired loops, no more animation
                        c_aniState = apngStop
                        bRestart = False
                    End If
                End If
            End If
        End If
        
        c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderTimer ' tag used for the spt_RenderFrame to indicate whether or not
        UserControl.Refresh                      ' the frame is being refreshed or adavnced
        RaiseEvent FrameChanged(tValue, True)
    
        If bRestart = True Then         ' set timer for current frame
            If c_StepDelay Then         ' is user overriding the frame delay?
                tValue = c_StepDelay
            Else                        ' is delay less than minimal delay?
                If c_aniPNG.Frames(c_aniPNG.Sequence).FrameDelay < c_MinDelay Then
                    tValue = c_MinDelay
                Else
                    tValue = c_aniPNG.Frames(c_aniPNG.Sequence).FrameDelay
                End If
            End If
            SetTimer hWnd, TimerID, tValue, c_Ptr ' set timer
        Else
             RaiseEvent LoopsEnded      ' no more looping
        End If
        
    Else                                ' delay load timer, established only in by spt_LoadPictureEx
        
        ' call function to get next frame's info & image
        On Error Resume Next
        c_aniPNG.Loaded = cPNG.DelayLoadAPNG(True, tValue, tHost)
        If Err Then Err.Clear
        On Error GoTo 0
        
        If c_aniPNG.Loaded = apngError Then ' failed to load all frames, convert to static only
            Set cPNG = Nothing
            ' use the 1st frame's image data
            ' we don't need to keep the bits cached for single frames; the DIB will be the cache
            With c_aniPNG.Frames(tValue)
                CopyMemory ByVal cHost.BitsPointer, .ImageData(0), .FrameCx * .FrameCy * 4&
            End With
            ReDim c_aniPNG.Frames(tValue To tValue) ' clear all flags & image data; no longer applicable
            c_aniPNG.FrameCount = tValue
            c_aniPNG.Loaded = apngLoaded
            c_Toggles = (c_Toggles And Not apngRenderMask) Or apngRenderInit
            UserControl.Refresh
            RaiseEvent FrameLoaded(tValue, c_aniPNG.FrameCount + 0&, False)
            
        Else ' success, but may need to continue for additional frames
            
            With c_aniPNG.Frames(tValue) ' cache the frame info & image bits
                CopyMemory .FrameCx, ByVal cPNG.FrameControlPointer(tValue), 24&
                ReDim .ImageData(0 To .FrameCx * .FrameCy - 1&)
                CopyMemory .ImageData(0), ByVal tHost.BitsPointer, UBound(.ImageData) * 4& + 4&
                ' remove apngROP_Blend from 1st frame if it existed.
                ' Canvas is always erased before 1st frame is drawn; removing ROP now prevents having to validate during rendering
                If tValue = 1& Then .FrameDisp_ROP = (.FrameDisp_ROP And Not apngROP_Blend)
            End With
            
            If c_aniPNG.Loaded = apngLoaded Then ' fully loaded
                Set cPNG = Nothing
                ' per APNG specs, prior to rendering the 1st frame, the canvas must be erased completely
                ' this, in effect, negates the last frame's disposal code; just set it to zero so we don't
                ' have to make additional checks when rendering the last frame
                c_aniPNG.Frames(tValue).FrameDisp_ROP = (c_aniPNG.Frames(tValue).FrameDisp_ROP And &HFF)
                
                ' see if we need to buffer host. Any frame that blends to a previous frame will require one.
                For tMsg = 2& To c_aniPNG.FrameCount
                    If (c_aniPNG.Frames(tMsg).FrameDisp_ROP And &HFF) = apngROP_Blend Then
                        Set cBlendHost = New cDIB
                        cBlendHost.InitializeDIB cHost.Width, cHost.Height
                        Exit For
                    End If
                Next
                
                bRestart = True
                RaiseEvent FrameLoaded(tValue, c_aniPNG.FrameCount + 0&, bRestart)
                If bRestart Then
                    c_aniPNG.Sequence = 0&
                    spt_ManageTimer True, False  ' start animation
                End If
                
            Else    ' still processing frame info, get next frame
                RaiseEvent FrameLoaded(tValue, c_aniPNG.FrameCount + 0&, False)
                SetTimer hWnd, TimerID, 10&, c_Ptr
            End If
        End If
    
    End If
EH:
' CAUTION: DO NOT ADD ANY ADDITIONAL CODE OR COMMENTS PAST THE "END FUNCTION"
'          STATEMENT BELOW. Paul Caton's zProbe routine will read it as a start
'          of a new function/sub and the class timer's will fail every time.
End Function
