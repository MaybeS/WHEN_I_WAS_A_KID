Attribute VB_Name = "UnzipModule"
Option Explicit

Public Type USERFUNCTION
  UZDLLPrnt     As Long     ' Pointer To Apps Print Function
  UZDLLSND      As Long     ' Pointer To Apps Sound Function
  UZDLLREPLACE  As Long     ' Pointer To Apps Replace Function
  UZDLLPASSWORD As Long     ' Pointer To Apps Password Function
  UZDLLMESSAGE  As Long     ' Pointer To Apps Message Function
  UZDLLSERVICE  As Long     ' Pointer To Apps Service Function (Not Coded!)
  TotalSizeComp As Long     ' Total Size Of Zip Archive
  TotalSize     As Long     ' Total Size Of All Files In Archive
  CompFactor    As Long     ' Compression Factor
  NumMembers    As Long     ' Total Number Of All Files In The Archive
  cchComment    As Integer  ' Flag If Archive Has A Comment!
End Type

Public UZUSER As USERFUNCTION
Public Enum ZMessageLevel
    All = 0
    Less = 1
    NoMessages = 2
End Enum
Public Enum ZExtractType
    Extract = 0
    ListContents = 1
End Enum
Public Enum ZPrivilege
    Ignore = 0
    ACL = 1
    Privileges = 2
End Enum

Private miExtractNewer     As Integer  ' 1 = Extract Only Newer, Else 0
Private miSpaceUnderScore  As Integer  ' 1 = Convert Space To Underscore, Else 0
Private miPromptOverwrite  As Integer  ' 1 = Prompt To Overwrite Required, Else 0
Private miQuiet            As ZMessageLevel  ' 2 = No Messages, 1 = Less, 0 = All
Private miWriteStdOut      As Integer  ' 1 = Write To Stdout, Else 0
Private miTestZip          As Integer  ' 1 = Test Zip File, Else 0
Private miExtractList      As ZExtractType  ' 0 = Extract, 1 = List Contents
Private miExtractOnlyNewer As Integer  ' 1 = Extract Only Newer, Else 0
Private miDisplayComment   As Integer  ' 1 = Display Zip File Comment, Else 0
Private miHonorDirectories As Integer  ' 1 = Honor Directories, Else 0
Private miOverWriteFiles   As Integer  ' 1 = Overwrite Files, Else 0
Private miConvertCR_CRLF   As Integer  ' 1 = Convert CR To CRLF, Else 0
Private miVerbose          As Integer  ' 1 = Zip Info Verbose
Private miCaseSensitivity  As Integer  ' 1 = Case Insensitivity, 0 = Case Sensitivity
Private miPrivilege        As ZPrivilege  ' 1 = ACL, 2 = Privileges, Else 0
Private msZipFileName      As String   ' The Zip File Name
Private msExtractDir       As String   ' Extraction Directory, Null If Current Directory

Public Function Unzip(sZipFileName As String, _
    sExtractDir As String) As Long
    Dim lRet As Long
        msZipFileName = sZipFileName
        msExtractDir = sExtractDir
        
    miExtractNewer = 0
    miSpaceUnderScore = 0
    miPromptOverwrite = 0
    miQuiet = NoMessages
    miWriteStdOut = 0
    miTestZip = 0
    miExtractList = Extract
    miExtractOnlyNewer = 0
    miDisplayComment = 0
    miHonorDirectories = 1
    miOverWriteFiles = 1
    miConvertCR_CRLF = 0
    miVerbose = 0
    miCaseSensitivity = 1
    miPrivilege = Ignore
    
    
    lRet = VBUnzip(msZipFileName, msExtractDir, miExtractNewer, _
        miSpaceUnderScore, miPromptOverwrite, CInt(miQuiet), _
        miWriteStdOut, miTestZip, CInt(miExtractList), _
        miExtractOnlyNewer, miDisplayComment, miHonorDirectories, _
        miOverWriteFiles, miConvertCR_CRLF, miVerbose, _
        miCaseSensitivity, CInt(miPrivilege))
    
    Unzip = lRet
    
    Exit Function

End Function
