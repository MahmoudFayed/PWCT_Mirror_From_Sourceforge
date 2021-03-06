*---------------------------------------------------------------------------*
* Time : 17:21:02    Date : 12/11/2012
*---------------------------------------------------------------------------*
* Programming without coding technology 1.8 (Smart) [2006-2012]  
* URL : http://www.sourceforge.net/projects/doublesvsoop   
*---------------------------------------------------------------------------*
* Visual Programming Language : HarbourPWCT 
*---------------------------------------------------------------------------*
* Compilers                   : Borland C/C++ & Harbour
* GUI Framework               : HarbourMiniGUI Extended
*---------------------------------------------------------------------------*
#include "SSXHB.ch"
#include "MiniGUI.ch"
#include "hbclass.ch"
Function SHEHADA_REPORT
Public True,False 
True = .T. 
False = .F. 
 Details :
 * (Noun) *
Parameters SP1,SP2,SP3,SP4,SP5,SP6,SP7,SP8
	DataUnit :
	CodeUnit :
			Circuit        Main                          
				Branch     Main                          
					Resistance Main                          
	VetoUnit :

Resistance R_SHEHADA_REPORT_18smart1() address Code Unit : Circuits\Main\Main\Main


Return 

* Resistance Code Unit : Circuits\Main\Main\Main
Resistance R_SHEHADA_REPORT_18smart1() code
class ShehadaReportClass From Report_Base
Data ReportName init "Shehadaarabic"
Method showwindow
Method closewindow
Method SizeReport
Method checkchange
EndClass
Method ShowWindow Class ShehadaReportClass
if !iswindowdefined( ShehadaReportWindow )
DEFINE WINDOW ShehadaReportWindow ;
AT 10 ,10 ;
WIDTH 1031 ;
HEIGHT 538 ;
ON SIZE self:SizeReport()  ;
ON MAXIMIZE self:SizeReport()  ;
ICON "PWCTICON" ;
TITLE "��������" ;
CHILD ;
BACKCOLOR {255,255,255}

@ 449 ,666 BUTTONEX btn1;
CAPTION "�����";
ON CLICK self:CloseWindow()  ;
WIDTH 100 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 449 ,774 BUTTONEX btn2;
CAPTION "�����";
ON CLICK self:PrintReport()  ;
WIDTH 100 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 449 ,880 BUTTONEX btn3;
CAPTION "���";
ON CLICK self:ShowReport()  ;
WIDTH 100 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
self:oActiveX := TActiveX():New( "ShehadaReportWindow", "snpvw.Snapshot Viewer Control.1" , 18 , 32 , 979 , 417)
self:oActiveX:Load()
@ 449 ,29 TEXTBOX text1;
ON CHANGE self:checkchange()  ;
HEIGHT 30 ;
WIDTH 70 ;
BACKCOLOR {0,255,128} ;
FONTCOLOR {0,0,0}

@ 449 ,108 CHECKBOX check2;
CAPTION "��� ������";
ON CHANGE self:checkchange()  ;
WIDTH 110;
Height 30;
FONT "Arial" SIZE 9 ;
BACKCOLOR {236,233,216} ;
FONTCOLOR {0,0,0}
END WINDOW

ShehadaReportWindow.Maximize ( )
ACTIVATE WINDOW ShehadaReportWindow
EndIF

Return 0
Method CloseWindow Class ShehadaReportClass
ShehadaReportWindow.Release ( )
Return 0
Method SizeReport Class ShehadaReportClass
Local tempvar1,tempvar2
tempvar1 := ShehadaReportWindow.Width
tempvar2 := ShehadaReportWindow.Height
self:oactivex:nWidth := tempvar1 - 84
self:oactivex:nHeight := tempvar2 - 125
ShehadaReportWindow.btn1.Row := tempvar2-88
ShehadaReportWindow.btn2.Row := tempvar2-88
ShehadaReportWindow.btn3.Row := tempvar2-88
self:oactivex:Show ( )
ShehadaReportWindow.check2.Row := tempvar2 - 88
ShehadaReportWindow.text1.Row := tempvar2 - 88
Return 0
Method CheckChange Class ShehadaReportClass
self:filter := ""
tvalue2 := ShehadaReportWindow.Check2.Value
IF tvalue2 = true
cOrderNumber := ShehadaReportWindow.text1.Value
cOrderNumber = ALLTRIM ( cOrderNumber )
self:filter := self:filter + " orders.ordernumber = " + cordernumber
ENDIF
Return 0



End Of Resistance

*-------------------------------------------------------------------*
