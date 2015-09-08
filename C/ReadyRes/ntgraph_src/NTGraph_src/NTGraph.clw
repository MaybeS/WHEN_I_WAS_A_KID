; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CNTGraphPropPage
LastTemplate=COlePropertyPage
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "NTGraph.h"
CDK=Y

ClassCount=6
Class1=CNTGraphCtrl
Class2=CNTGraphPropPage

ResourceCount=8
Resource1=IDD_PROPPAGE_ANNOTATION (English (U.S.))
LastPage=0
Resource2=IDD_PROPPAGE_ELEMENTS (English (U.S.))
Class3=CElementPropPage
Resource3=IDD_PROPPAGE_NTGRAPH (English (U.S.))
Class4=CAnnoPropPage
Resource4=IDD_ABOUTBOX_NTGRAPH (German (Germany))
Class5=CCursorPropPage
Resource5=IDD_ABOUTBOX_NTGRAPH
Class6=CFormatPropPage
Resource6=IDD_PROPAGE_FORMAT
Resource7=IDD_PROPAGE_FORMAT (German (Germany))
Resource8=IDD_PROPPAGE_CURSOR (English (U.S.))

[CLS:CNTGraphCtrl]
Type=0
HeaderFile=NTGraphCtl.h
ImplementationFile=NTGraphCtl.cpp
Filter=W
BaseClass=COleControl
VirtualFilter=wWC
LastObject=CNTGraphCtrl

[CLS:CNTGraphPropPage]
Type=0
HeaderFile=NTGraphPpg.h
ImplementationFile=NTGraphPpg.cpp
Filter=D
BaseClass=COlePropertyPage
VirtualFilter=idWC
LastObject=CNTGraphPropPage

[DLG:IDD_ABOUTBOX_NTGRAPH]
Type=1
Class=?
ControlCount=4
Control1=IDC_STATIC,static,1342308352
Control2=IDC_STATIC,static,1342308352
Control3=IDOK,button,1342373889
Control4=IDC_STATIC,static,1342177294

[DLG:IDD_PROPPAGE_ELEMENTS (English (U.S.))]
Type=1
Class=CElementPropPage
ControlCount=19
Control1=IDC_STATIC,static,1342308352
Control2=IDC_ELEMENTLIST,listbox,1352728833
Control3=IDC_ADDBUTTON,button,1342242816
Control4=IDC_DELBUTTON,button,1342242816
Control5=IDC_STATIC,static,1342308352
Control6=IDC_COMBO_TYPE,combobox,1344339970
Control7=IDC_STATIC,static,1342308352
Control8=IDC_EDIT_WIDTH,edit,1350631552
Control9=IDC_SPIN_WIDTH,msctls_updown32,1342177330
Control10=IDC_POINT_COLOR,button,1342242816
Control11=IDC_CHECK_VISIBLE,button,1342242851
Control12=IDC_STATIC,static,1342308352
Control13=IDC_COMBO_SYMBOL,combobox,1344339970
Control14=IDC_LINE_COLOR,button,1342242816
Control15=IDC_STATIC,static,1342308352
Control16=IDC_STATIC,static,1342308352
Control17=IDC_CHECK_SOLID,button,1342242851
Control18=IDC_EDIT_NAME,edit,1350631552
Control19=IDC_STATIC,static,1342308352

[CLS:CElementPropPage]
Type=0
HeaderFile=ElementPpg.h
ImplementationFile=ElementPpg.cpp
BaseClass=COlePropertyPage
Filter=D
LastObject=CElementPropPage
VirtualFilter=idWC

[DLG:IDD_PROPPAGE_NTGRAPH (English (U.S.))]
Type=1
Class=CNTGraphPropPage
ControlCount=19
Control1=IDC_STATIC,static,1342308352
Control2=IDC_CHECK_SHOWGRID,button,1342242851
Control3=IDC_COMBO_MODE,combobox,1344339970
Control4=IDC_STATIC,static,1342308352
Control5=IDC_CAPTION,edit,1350631552
Control6=IDC_CHECK_XLOG,button,1342242851
Control7=IDC_CHECK_YLOG,button,1342242851
Control8=IDC_GRID_COLOR,button,1342242816
Control9=IDC_FRAME_COLOR,button,1342242816
Control10=IDC_PLOT_COLOR,button,1342242816
Control11=IDC_STATIC,static,1342308352
Control12=IDC_STATIC,static,1342308352
Control13=IDC_STATIC,static,1342308352
Control14=IDC_AXIS_COLOR,button,1342242816
Control15=IDC_STATIC,static,1342308352
Control16=IDC_LABEL_COLOR,button,1342242816
Control17=IDC_STATIC,static,1342308352
Control18=IDC_COMBO_FRAME,combobox,1342242818
Control19=IDC_STATIC,static,1342308352

[DLG:IDD_PROPPAGE_ANNOTATION (English (U.S.))]
Type=1
Class=CAnnoPropPage
ControlCount=16
Control1=IDC_STATIC,static,1342308352
Control2=IDC_ANNOTATIONS,listbox,1352728833
Control3=IDC_ADDBUTTON,button,1342242816
Control4=IDC_DELBUTTON,button,1342242816
Control5=IDC_STATIC,static,1342308352
Control6=IDC_CHECK_VISIBLE,button,1342242851
Control7=IDC_LABEL_COLOR,button,1342242816
Control8=IDC_STATIC,static,1342308352
Control9=IDC_EDIT_CAPTION,edit,1350631552
Control10=IDC_STATIC,static,1342308352
Control11=IDC_COMBO_ORIENTATION,combobox,1342244866
Control12=IDC_STATIC,static,1342308352
Control13=IDC_STATIC,static,1342308352
Control14=IDC_EDIT_X,edit,1350631552
Control15=IDC_EDIT_Y,edit,1350631552
Control16=IDC_LABEL_BGCOLOR,button,1342242816

[CLS:CAnnoPropPage]
Type=0
HeaderFile=AnnoPpg.h
ImplementationFile=AnnoPpg.cpp
BaseClass=COlePropertyPage
Filter=D
LastObject=IDC_LABEL_BGCOLOR
VirtualFilter=idWC

[DLG:IDD_PROPPAGE_CURSOR (English (U.S.))]
Type=1
Class=CCursorPropPage
ControlCount=15
Control1=IDC_STATIC,static,1342308352
Control2=IDC_CURSORS,listbox,1352728833
Control3=IDC_ADDBUTTON,button,1342242816
Control4=IDC_DELBUTTON,button,1342242816
Control5=IDC_STATIC,static,1342308352
Control6=IDC_CHECK_VISIBLE,button,1342242851
Control7=IDC_CURSOR_COLOR,button,1342242816
Control8=IDC_STATIC,static,1342308352
Control9=IDC_COMBO_STYLE,combobox,1342244866
Control10=IDC_STATIC,static,1342308352
Control11=IDC_STATIC,static,1342308352
Control12=IDC_EDIT_X,edit,1350631552
Control13=IDC_EDIT_Y,edit,1350631552
Control14=IDC_STATIC,static,1342308352
Control15=IDC_COMBO_SNAP,combobox,1342244866

[CLS:CCursorPropPage]
Type=0
HeaderFile=CursorPpg.h
ImplementationFile=CursorPpg.cpp
BaseClass=COlePropertyPage
Filter=D
LastObject=CCursorPropPage
VirtualFilter=idWC

[DLG:IDD_PROPAGE_FORMAT]
Type=1
Class=CFormatPropPage
ControlCount=9
Control1=IDC_COMBO_AXIS,combobox,1344339970
Control2=IDC_STATIC,static,1342308352
Control3=IDC_EDIT_FORMAT,edit,1350631552
Control4=IDC_STATIC,static,1342308352
Control5=IDC_FORMAT_LIST,listbox,1352728833
Control6=IDC_STATIC,static,1342308352
Control7=IDC_COMBO_TYPE,combobox,1344339970
Control8=IDC_STATIC,static,1342308352
Control9=IDC_BUTTON_DEFAULT,button,1342242816

[CLS:CFormatPropPage]
Type=0
HeaderFile=FormatPpg.h
ImplementationFile=FormatPpg.cpp
BaseClass=COlePropertyPage
Filter=D
LastObject=IDC_COMBO_AXIS
VirtualFilter=idWC

[DLG:IDD_PROPAGE_FORMAT (German (Germany))]
Type=1
Class=?
ControlCount=9
Control1=IDC_COMBO_AXIS,combobox,1344339970
Control2=IDC_STATIC,static,1342308352
Control3=IDC_EDIT_FORMAT,edit,1350631552
Control4=IDC_STATIC,static,1342308352
Control5=IDC_FORMAT_LIST,listbox,1352728833
Control6=IDC_STATIC,static,1342308352
Control7=IDC_COMBO_TYPE,combobox,1344339970
Control8=IDC_STATIC,static,1342308352
Control9=IDC_BUTTON_DEFAULT,button,1342242816

[DLG:IDD_ABOUTBOX_NTGRAPH (German (Germany))]
Type=1
Class=?
ControlCount=4
Control1=IDC_STATIC,static,1342308352
Control2=IDC_STATIC,static,1342308352
Control3=IDOK,button,1342373889
Control4=IDC_STATIC,static,1342177294

