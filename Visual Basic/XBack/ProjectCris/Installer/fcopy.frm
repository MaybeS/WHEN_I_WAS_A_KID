VERSION 5.00
Begin VB.Form fCopy 
   BorderStyle     =   0  '없음
   Caption         =   "Form1"
   ClientHeight    =   210
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   210
   LinkTopic       =   "Form1"
   ScaleHeight     =   210
   ScaleWidth      =   210
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows 기본값
End
Attribute VB_Name = "fcopy"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function Wiz_SingleEntryUnzip Lib "c:\windows\Uz.dll" _
  (ByVal ifnc As Long, ByRef ifnv As UNZIPnames, _
   ByVal xfnc As Long, ByRef xfnv As UNZIPnames, _
   dcll As DCLIST, Userf As USERFUNCTION) As Long

Private Declare Sub UzpVersion2 Lib "c:\windows\Uz.dll" (uzpv As UZPVER)
Public Sub Unzip()

    UzpVersion2 UZVER
    lRet = Wiz_SingleEntryUnzip(0, uZipNames, 0, uExcludeNames, UZDCL, UZUSER)
    Unload Me
End Sub

Private Sub Form_Load()
Unload Me
End Sub
