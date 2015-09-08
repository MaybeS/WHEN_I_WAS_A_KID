Attribute VB_Name = "UnzipM"

Public Type UNZIPnames
  uzFiles(0 To 99) As String
End Type
Public Type UNZIPCBChar
  ch(32800) As Byte
End Type
Public Type UNZIPCBCh
  ch(256) As Byte
End Type

Public Type DCLIST
  ExtractOnlyNewer  As Long    ' 1 = Extract Only Newer, Else 0
  SpaceToUnderScore As Long    ' 1 = Convert Space To Underscore, Else 0
  PromptToOverwrite As Long    ' 1 = Prompt To Overwrite Required, Else 0
  fQuiet            As Long    ' 2 = No Messages, 1 = Less, 0 = All
  ncflag            As Long    ' 1 = Write To Stdout, Else 0
  ntflag            As Long    ' 1 = Test Zip File, Else 0
  nvflag            As Long    ' 0 = Extract, 1 = List Zip Contents
  nUflag            As Long    ' 1 = Extract Only Newer, Else 0
  nzflag            As Long    ' 1 = Display Zip File Comment, Else 0
  ndflag            As Long    ' 1 = Honor Directories, Else 0
  noflag            As Long    ' 1 = Overwrite Files, Else 0
  naflag            As Long    ' 1 = Convert CR To CRLF, Else 0
  nZIflag           As Long    ' 1 = Zip Info Verbose, Else 0
  C_flag            As Long    ' 1 = Case Insensitivity, 0 = Case Sensitivity
  fPrivilege        As Long    ' 1 = ACL, 2 = Privileges
  Zip               As String  ' The Zip Filename To Extract Files
  ExtractDir        As String  ' The Extraction Directory, NULL If Extracting To Current Dir
End Type

Public Type UZPVER
  structlen       As Long         ' Length Of The Structure Being Passed
  flag            As Long         ' Bit 0: is_beta  bit 1: uses_zlib
  beta            As String * 10  ' e.g., "g BETA" or ""
  date            As String * 20  ' e.g., "4 Sep 95" (beta) or "4 September 1995"
  zlib            As String * 10  ' e.g., "1.0.5" or NULL
  Unzip(1 To 4)   As Byte         ' Version Type Unzip
  zipinfo(1 To 4) As Byte         ' Version Type Zip Info
  os2dll          As Long         ' Version Type OS2 DLL
  windll(1 To 4)  As Byte         ' Version Type Windows DLL
End Type

Private Type ZIPnames
    s(0 To 99) As String
End Type

Private Type ZPOPT
    fSuffix As Long
    fEncrypt As Long
    fSystem As Long
    fVolume As Long
    fExtra As Long
    fNoDirEntries As Long
    fExcludeDate As Long
    fIncludeDate As Long
    fVerbose As Long
    fQuiet As Long
    fCRLF_LF As Long
    fLF_CRLF As Long
    fJunkDir As Long
    fRecurse As Long
    fGrow As Long
    fForce As Long
    fMove As Long
    fDeleteEntries As Long
    fUpdate As Long
    fFreshen As Long
    fJunkSFX As Long
    fLatestTime As Long
    fComment As Long
    fOffsets As Long
    fPrivilege As Long
    fEncryption As Long
    fRepair As Long
    flevel As Byte
    date As String ' 8 bytes long
    szRootDir As String ' up to 256 bytes long
End Type

Public Type ZIPUSERFUNCTIONS
    DLLPrnt As Long
    DLLPASSWORD As Long
    DLLCOMMENT As Long
    DLLSERVICE As Long
End Type

Private Type CBChar
    ch(4096) As Byte
End Type

Private Declare Function ZpInit Lib "zip32.dll" _
(ByRef Zipfun As ZIPUSERFUNCTIONS) As Long ' Set Zip Callbacks

Private Declare Function ZpSetOptions Lib "zip32.dll" _
(ByRef Opts As ZPOPT) As Long ' Set Zip options

Private Declare Function ZpGetOptions Lib "zip32.dll" _
() As ZPOPT ' used to check encryption flag only

Private Declare Function ZpArchive Lib "zip32.dll" _
(ByVal argc As Long, ByVal funame As String, ByRef argv As ZIPnames) As Long ' Real zipping action
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private uZipNumber As Integer
Private uZipMessage As String
Private uZipInfo As String
Private uVBSkip As Integer
Public msOutput As String

Public lRet As Long
Public UZDCL As DCLIST
Public UZVER As UZPVER
Public uExcludeNames As UNZIPnames
Public uZipNames     As UNZIPnames
Private Function FnPtr(ByVal lp As Long) As Long
    FnPtr = lp
End Function
Private Function DLLPrnt(ByRef fname As CBChar, ByVal x As Long) As Long
    Dim s0$, xx As Long
    Dim sVbZipInf As String
    
    On Error Resume Next
    s0 = ""
    For xx = 0 To x
        If fname.ch(xx) = 0 Then xx = 99999 Else s0 = s0 + Chr(fname.ch(xx))
    Next xx
    
    msOutput = msOutput & s0
    
    sVbZipInf = ""
    
    DoEvents
    DLLPrnt = 0
    
End Function
Private Function DllServ(ByRef fname As CBChar, ByVal x As Long) As Long
    
    Dim s0 As String
    Dim xx As Long
    
    On Error Resume Next
    
    s0 = ""
    
    For xx = 0 To x - 1
        If fname.ch(xx) = 0 Then Exit For
        s0 = s0 & Chr$(fname.ch(xx))
    Next
    
    DllServ = 0
End Function
Private Function DllPass(ByRef s1 As Byte, x As Long, _
    ByRef s2 As Byte, _
    ByRef s3 As Byte) As Long
    On Error Resume Next
    DllPass = 1
End Function
Private Function DllComm(ByRef s1 As CBChar) As CBChar
    On Error Resume Next
    s1.ch(0) = vbNullString
    DllComm = s1
End Function
Private Function VBZip(argc As Integer, zipname As String, _
        mynames As ZIPnames, junk As Integer, _
        recurse As Integer, updat As Integer, _
        freshen As Integer, basename As String, _
        Optional Encrypt As Integer = 0, _
        Optional IncludeSystem As Integer = 0, _
        Optional IgnoreDirectoryEntries As Integer = 0, _
        Optional Verbose As Integer = 0, _
        Optional Quiet As Integer = 0, _
        Optional CRLFtoLF As Integer = 0, _
        Optional LFtoCRLF As Integer = 0, _
        Optional Grow As Integer = 0, _
        Optional Force As Integer = 0, _
        Optional iMove As Integer = 0, _
        Optional DeleteEntries As Integer = 0) As Long
    
    Dim hmem As Long, xx As Integer
    Dim retcode As Long
    Dim MYUSER As ZIPUSERFUNCTIONS
    Dim MYOPT As ZPOPT
    
    On Error Resume Next ' nothing will go wrong :-)
    
    msOutput = ""
    MYUSER.DLLPrnt = FnPtr(AddressOf DLLPrnt)
    MYUSER.DLLPASSWORD = FnPtr(AddressOf DllPass)
    MYUSER.DLLCOMMENT = FnPtr(AddressOf DllComm)
    MYUSER.DLLSERVICE = 0& ' not coded yet :-)
    
    MYOPT.fSuffix = 0        ' include suffixes (not yet implemented)
    MYOPT.fEncrypt = Encrypt     ' 1 if encryption wanted
    MYOPT.fSystem = IncludeSystem        ' 1 to include system/hidden files
    MYOPT.fVolume = 0        ' 1 if storing volume label
    MYOPT.fExtra = 0         ' 1 if including extra attributes
    MYOPT.fNoDirEntries = IgnoreDirectoryEntries  ' 1 if ignoring directory entries
    MYOPT.fExcludeDate = 0   ' 1 if excluding files earlier than a specified date
    MYOPT.fIncludeDate = 0   ' 1 if including files earlier than a specified date
    MYOPT.fVerbose = Verbose       ' 1 if full messages wanted
    MYOPT.fQuiet = Quiet         ' 1 if minimum messages wanted
    MYOPT.fCRLF_LF = CRLFtoLF        ' 1 if translate CR/LF to LF
    MYOPT.fLF_CRLF = LFtoCRLF ' 1 if translate LF to CR/LF
    MYOPT.fJunkDir = junk    ' 1 if junking directory names
    MYOPT.fRecurse = recurse ' 1 if recursing into subdirectories
    MYOPT.fGrow = Grow          ' 1 if allow appending to zip file
    MYOPT.fForce = Force         ' 1 if making entries using DOS names
    MYOPT.fMove = iMove          ' 1 if deleting files added or updated
    MYOPT.fDeleteEntries = DeleteEntries ' 1 if files passed have to be deleted
    MYOPT.fUpdate = updat    ' 1 if updating zip file--overwrite only if newer
    MYOPT.fFreshen = freshen ' 1 if freshening zip file--overwrite only
    MYOPT.fJunkSFX = 0       ' 1 if junking sfx prefix
    MYOPT.fLatestTime = 0    ' 1 if setting zip file time to time of latest file in archive
    MYOPT.fComment = 0       ' 1 if putting comment in zip file
    MYOPT.fOffsets = 0       ' 1 if updating archive offsets for sfx Files
    MYOPT.fPrivilege = 0     ' 1 if not saving privelages
    MYOPT.fEncryption = 0    'Read only property!
    MYOPT.fRepair = 0        ' 1=> fix archive, 2=> try harder to fix
    MYOPT.flevel = 0         ' compression level - should be 0!!!
    MYOPT.date = vbNullString ' "12/31/79"? US Date?
    MYOPT.szRootDir = UCase$(basename)
    
    retcode = ZpInit(MYUSER)
    retcode = ZpSetOptions(MYOPT)
    retcode = ZpArchive(argc, zipname, mynames)
    
    VBZip = retcode
End Function
Private Sub UZReceiveDLLMessage(ByVal ucsize As Long, _
    ByVal csiz As Long, _
    ByVal cfactor As Integer, _
    ByVal mo As Integer, _
    ByVal dy As Integer, _
    ByVal yr As Integer, _
    ByVal hh As Integer, _
    ByVal mm As Integer, _
    ByVal c As Byte, ByRef fname As UNZIPCBCh, _
    ByRef meth As UNZIPCBCh, ByVal crc As Long, _
    ByVal fCrypt As Byte)

  Dim s0     As String
  Dim xx     As Long
  Dim strout As String * 80
  On Error Resume Next
  strout = Space(80)
  If uZipNumber = 0 Then
    Mid(strout, 1, 50) = "Filename:"
    Mid(strout, 53, 4) = "Size"
    Mid(strout, 62, 4) = "Date"
    Mid(strout, 71, 4) = "Time"
    uZipMessage = strout & vbNewLine
    strout = Space(80)
  End If

  s0 = ""

  For xx = 0 To 255
    If fname.ch(xx) = 0 Then Exit For
    s0 = s0 & Chr(fname.ch(xx))
  Next

  Mid(strout, 1, 50) = Mid(s0, 1, 50)
  Mid(strout, 51, 7) = Right("        " & Str(ucsize), 7)
  Mid(strout, 60, 3) = Right("0" & Trim(Str(mo)), 2) & "/"
  Mid(strout, 63, 3) = Right("0" & Trim(Str(dy)), 2) & "/"
  Mid(strout, 66, 2) = Right("0" & Trim(Str(yr)), 2)
  Mid(strout, 70, 3) = Right(Str(hh), 2) & ":"
  Mid(strout, 73, 2) = Right("0" & Trim(Str(mm)), 2)

  uZipMessage = uZipMessage & strout & vbNewLine
  uZipNumber = uZipNumber + 1

End Sub
Private Function UZDLLPrnt(ByRef fname As UNZIPCBChar, ByVal x As Long) As Long

  Dim s0 As String
  Dim xx As Long
  On Error Resume Next

  s0 = ""
  For xx = 0 To x - 1
    If fname.ch(xx) = 0 Then Exit For
    s0 = s0 & Chr(fname.ch(xx))
  Next

  If Mid$(s0, 1, 1) = vbLf Then s0 = vbNewLine ' Damn UNIX :-)
  uZipInfo = uZipInfo & s0

msOutput = uZipInfo
    
  UZDLLPrnt = 0

End Function
Private Function UZDLLServ(ByRef mname As UNZIPCBChar, ByVal x As Long) As Long

    Dim s0 As String
    Dim xx As Long
    On Error Resume Next
    
    s0 = ""
    For xx = 0 To x - 1
        If mname.ch(xx) = 0 Then Exit For
        s0 = s0 + Chr(mname.ch(xx))
    Next
    UZDLLServ = 0 ' Setting this to 1 will abort the zip!

End Function
Private Function UZDLLPass(ByRef p As UNZIPCBCh, _
  ByVal n As Long, ByRef m As UNZIPCBCh, _
  ByRef Name As UNZIPCBCh) As Integer

  Dim prompt     As String
  Dim xx         As Integer
  Dim szpassword As String
  On Error Resume Next

  UZDLLPass = 1

  If uVBSkip = 1 Then Exit Function
  szpassword = InputBox("Please Enter The Password!")
  If szpassword = "" Then
    uVBSkip = 1
    Exit Function
  End If
  For xx = 0 To 255
    If m.ch(xx) = 0 Then
      Exit For
    Else
      prompt = prompt & Chr(m.ch(xx))
    End If
  Next

  For xx = 0 To n - 1
    p.ch(xx) = 0
  Next
  For xx = 0 To Len(szpassword) - 1
    p.ch(xx) = Asc(Mid(szpassword, xx + 1, 1))
  Next
  p.ch(xx) = Chr(0)
  UZDLLPass = 0
End Function
Private Function UZDLLRep(ByRef fname As UNZIPCBChar) As Long

  Dim s0 As String
  Dim xx As Long

  On Error Resume Next

  UZDLLRep = 100 ' 100 = Do Not Overwrite - Keep Asking User
  s0 = ""
  For xx = 0 To 255
    If fname.ch(xx) = 0 Then xx = 99999 Else s0 = s0 & Chr(fname.ch(xx))
  Next
  xx = MsgBox("Overwrite " & s0 & "?", vbExclamation & vbYesNoCancel, _
              "VBUnZip32 - File Already Exists!")

  If xx = vbNo Then Exit Function
  If xx = vbCancel Then
    UZDLLRep = 104       ' 104 = Overwrite None
    Exit Function
  End If
  UZDLLRep = 102         ' 102 = Overwrite 103 = Overwrite All

End Function
Public Function szTrim(szString As String) As String
    
    Dim pos As Integer
    Dim ln  As Integer
    
    pos = InStr(szString, Chr(0))
    ln = Len(szString)
    
    Select Case pos
        Case Is > 1
            szTrim = Trim(Left(szString, pos - 1))
        Case 1
            szTrim = ""
        Case Else
            szTrim = Trim(szString)
    End Select

End Function
Public Function VBUnzip(ByRef sZipFileName, ByRef sUnzipDirectory As String, _
    ByRef iExtractNewer As Integer, _
    ByRef iSpaceUnderScore As Integer, _
    ByRef iPromptOverwrite As Integer, _
    ByRef iQuiet As Integer, _
    ByRef iWriteStdOut As Integer, _
    ByRef iTestZip As Integer, _
    ByRef iExtractList As Integer, _
    ByRef iExtractOnlyNewer As Integer, _
    ByRef iDisplayComment As Integer, _
    ByRef iHonorDirectories As Integer, _
    ByRef iOverwriteFiles As Integer, _
    ByRef iConvertCR_CRLF As Integer, _
    ByRef iVerbose As Integer, _
    ByRef iCaseSensitivty As Integer, _
    ByRef iPrivilege As Integer) As Long
    
    msOutput = ""
    
    uExcludeNames.uzFiles(0) = vbNullString
    uZipNames.uzFiles(0) = vbNullString
    
    uZipNumber = 0
    uZipMessage = vbNullString
    uZipInfo = vbNullString
    uVBSkip = 0
    
    With UZDCL
        .ExtractOnlyNewer = iExtractOnlyNewer
        .SpaceToUnderScore = iSpaceUnderScore
        .PromptToOverwrite = iPromptOverwrite
        .fQuiet = iQuiet
        .ncflag = iWriteStdOut
        .ntflag = iTestZip
        .nvflag = iExtractList
        .nUflag = iExtractNewer
        .nzflag = iDisplayComment
        .ndflag = iHonorDirectories
        .noflag = iOverwriteFiles
        .naflag = iConvertCR_CRLF
        .nZIflag = iVerbose
        .C_flag = iCaseSensitivty
        .fPrivilege = iPrivilege
        .Zip = sZipFileName
        .ExtractDir = sUnzipDirectory
    End With
    
    With UZUSER
        .UZDLLPrnt = FnPtr(AddressOf UZDLLPrnt)
        .UZDLLSND = 0&
        .UZDLLREPLACE = FnPtr(AddressOf UZDLLRep)
        .UZDLLPASSWORD = FnPtr(AddressOf UZDLLPass)
        .UZDLLMESSAGE = FnPtr(AddressOf UZReceiveDLLMessage)
        .UZDLLSERVICE = FnPtr(AddressOf UZDLLServ)
    End With
    
    With UZVER
        .structlen = Len(UZVER)
        .beta = Space$(9) & vbNullChar
        .date = Space$(19) & vbNullChar
        .zlib = Space$(9) & vbNullChar
    End With
    
    Call fcopy.Unzip

    VBUnzip = lRet
End Function






