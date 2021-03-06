*---------------------------------------------------------------------------*
* Time : 17:42:33    Date : 11/02/2011
*---------------------------------------------------------------------------*
* Programming without coding technology 1.8 (Smart) [2006-2011]  
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
Function CUSTOMERS
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

Resistance R_CUSTOMERS_18smart1() address Code Unit : Circuits\Main\Main\Main


Return 

* Resistance Code Unit : Circuits\Main\Main\Main
Resistance R_CUSTOMERS_18smart1() code
class CustomersDataClass From SystemDatabase
Data cWindowName init "CustomersDataWindow"
Data TableName init "Customers"
Data cCustName init ""
Data cCustAddress init ""
Data cCustPhone init ""
Data nCountry init 0
Data CountryItems init {}
Data CountryItemsIDs init {}
Data dDateOfBirth init date()
Data nBalance init 0
Method showwindow
Method closewindow
Method SetMode
Method UserInterface2Class
Method Class2ADO
Method ADO2Class
Method Class2UserInterface
Method ClearRecord
Method AutoGotoRecord
Method CheckData
Method GetTotalBalance
EndClass
Method showwindow Class CustomersDataClass
IF UsersObject:CheckPermission(1) = False
MyOut := MSGINFO("You don't have permission to access this window","Sorry")
Return 0
ENDIF
myout = self:connect()
myout = self:AutoGotoRecord()
if !iswindowdefined( &(self:cWindowName) )
DEFINE WINDOW &(self:cWindowName) ;
AT 10 ,10 ;
WIDTH 770 ;
HEIGHT 427 ;
ICON "PWCTICON" ;
TITLE "Customers Data" ;
CHILD ;
NOMINIMIZE ;
NOMAXIMIZE ;
NOSIZE ;
BACKCOLOR {64,0,64}

@ 49 ,5 IMAGE image1;
PICTURE "image\Back.jpg";
STRETCH ;
WIDTH 750 HEIGHT 285
@ 8 ,6 LABEL lblTitle ;
VALUE "Customers Data Window" ;
WIDTH 580 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {128,128,0}
@ 346 ,326 BUTTONEX btnFirst;
CAPTION "First";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:firstrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 346 ,389 BUTTONEX btnNext;
CAPTION "Next";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:nextrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 346 ,518 BUTTONEX btnLast;
CAPTION "Last";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:lastrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 346 ,673 BUTTONEX btnClose;
CAPTION "Close";
FONTCOLOR {0,0,0};
BACKCOLOR {132,242,179};
ON CLICK self:closewindow()  ;
WIDTH 80 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 346 ,455 BUTTONEX btnPrev;
CAPTION "Prev ";
FONTCOLOR {255,255,255};
BACKCOLOR {64,0,64};
ON CLICK self:prevrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 346 ,587 BUTTONEX btnDel;
CAPTION "Delete";
FONTCOLOR {255,255,255};
BACKCOLOR {255,0,0};
ON CLICK self:delrecord()  ;
WIDTH 70 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
NOXPSTYLE ;
TOOLTIP ""
@ 346 ,162 BUTTONEX btnsave;
CAPTION "Save";
ON CLICK self:saverecord()  ;
WIDTH 70 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 346 ,234 BUTTONEX btncancel;
CAPTION "Cancel";
ON CLICK self:cancelrecord()  ;
WIDTH 80 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 346 ,91 BUTTONEX btnedit;
CAPTION "Edit";
ON CLICK self:editrecord()  ;
WIDTH 60 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 346 ,8 BUTTONEX btnadd;
CAPTION "Add";
ON CLICK self:addrecord()  ;
WIDTH 70 HEIGHT 30 ;
FONT "Arial" SIZE 14 ;
TOOLTIP ""
@ 71 ,143 LABEL lbl1 ;
VALUE "Name" ;
WIDTH 60 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 117 ,123 LABEL lbl2 ;
VALUE "Address" ;
WIDTH 80 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 160 ,137 LABEL lbl3 ;
VALUE "Phone" ;
WIDTH 70 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 68 ,213 TEXTBOX textName;
HEIGHT 30 ;
WIDTH 420 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}

@ 113 ,213 TEXTBOX textAddress;
HEIGHT 30 ;
WIDTH 420 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}

@ 156 ,213 TEXTBOX textPhone;
HEIGHT 30 ;
WIDTH 200 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}

myout = Self:LoadLookupTable("country","country",@self:countryitems,"id",@self:countryitemsids)
@ 205 ,127 LABEL lblCountry ;
VALUE "Country" ;
WIDTH 70 ;
HEIGHT 40 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 203 ,213 COMBOBOX comboCountry;
WIDTH 200 ;
HEIGHT 300;
ITEMS self:CountryItems ;
FONT "Arial" SIZE 14 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}
@ 246 ,88 LABEL lbl5 ;
VALUE "Date of Birth" ;
WIDTH 110 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 243 ,213 DATEPICKER DateOfBirth;
WIDTH 200 ;
FONT "Arial" SIZE 14 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}
@ 288 ,127 LABEL lblBalance ;
VALUE "Balance" ;
WIDTH 80 ;
HEIGHT 30 ;
FONT "Arial" SIZE 14  ;
BACKCOLOR {236,233,216} ;
TRANSPARENT ;
FONTCOLOR {0,0,0}
@ 284 ,213 TEXTBOX textBalance;
HEIGHT 30 ;
WIDTH 200 ;
FONT "Arial" SIZE 14 ;
BACKCOLOR {255,255,255} ;
FONTCOLOR {0,0,0}

@ 8 ,588 BUTTONEX btnTotalBalance;
CAPTION "Get Total Balance";
ON CLICK self:GetTotalBalance()  ;
WIDTH 170 HEIGHT 30 ;
FONT "arial" SIZE 14 ;
TOOLTIP ""
END WINDOW

&(self:cWindowName).Center ( )
myout = self:showrecord()
myout = self:setmode(2)
ACTIVATE WINDOW &(self:cWindowName)
EndIF

Return 0
Method UserInterface2Class Class CustomersDataClass
self:cCustName := &(self:cWindowName).textName.Value
self:cCustAddress := &(self:cWindowName).textAddress.Value
self:cCustPhone := &(self:cWindowName).textPhone.Value
self:nCountry := &(self:cWindowName).ComboCountry.Value
self:nCountry := self:CountryItemsIDs[self:nCountry]
self:dDateOfBirth := &(self:cWindowName).DateofBirth.Value
self:nBalance := &(self:cWindowName).textBalance.Value
self:nBalance = VAL ( self:nBalance )
Return 0
Method Class2ADO Class CustomersDataClass
self:oRS:fields:item("CustName"):value := self:cCustName
self:oRS:fields:item("CustAddress"):value := self:cCustAddress
self:oRS:fields:item("CustPhone"):value := self:cCustPhone
self:oRS:fields:item("CountryID"):value := self:nCountry
self:oRS:fields:item("DateOfBirth"):value := self:dDateOfBirth
self:oRS:fields:item("Balance"):value := self:nBalance
Return 0
Method ADO2Class Class CustomersDataClass
self:cCustName := self:oRS:fields:item("CustName"):value
self:cCustAddress := self:oRS:fields:item("CustAddress"):value
self:cCustPhone := self:oRS:fields:item("CustPhone"):value
self:nCountry := Self:oRS:fields:item("CountryID"):value
self:dDateOfBirth := self:oRS:fields:item("DateOfBirth"):value
self:nBalance := self:oRS:fields:item("Balance"):value
Return 0
Method Class2UserInterface Class CustomersDataClass
&(self:cWindowName).textName.Value := self:cCustName
&(self:cWindowName).textAddress.Value := self:cCustAddress
&(self:cWindowName).textPhone.Value := self:cCustPhone
self:nCountry = self:LookupIDToIndex(self:nCountry,@self:CountryItemsIDs)
&(self:cWindowName).ComboCountry.Value := self:nCountry
&(self:cWindowName).DateOfBirth.Value := self:dDateofBirth
cBalance = STR ( self:nBalance )
cBalance = ALLTRIM ( cBalance )
&(self:cWindowName).textBalance.Value := cBalance
Return 0
Method ClearRecord Class CustomersDataClass
self:cCustName := ""
self:cCustAddress := ""
self:cCustPhone := ""
self:nCountry := 0
self:dDateOfBirth := Date()
self:nBalance := 0
Return 0
Method setmode(p1) Class CustomersDataClass
IF p1 = 1
&(self:cWindowName).btnfirst.Enabled := false
&(self:cWindowName).btnnext.Enabled := false
&(self:cWindowName).btnprev.Enabled := false
&(self:cWindowName).btnlast.Enabled := false
&(self:cWindowName).btndel.Enabled := false
&(self:cWindowName).btnclose.Enabled := false
&(self:cWindowName).btnsave.Enabled := true
&(self:cWindowName).btncancel.Enabled := true
&(self:cWindowName).btnedit.Enabled := false
&(self:cWindowName).btnadd.Enabled := false
&(self:cWindowName).textName.Enabled := true
&(self:cWindowName).textAddress.Enabled := true
&(self:cWindowName).textPhone.Enabled := true
&(self:cWindowName).ComboCountry.Enabled := True
&(self:cWindowName).DateOfBirth.Enabled := True
&(self:cWindowName).textBalance.Enabled := True
ENDIF
IF p1 = 2
&(self:cWindowName).btnfirst.Enabled := true
&(self:cWindowName).btnnext.Enabled := true
&(self:cWindowName).btnprev.Enabled := true
&(self:cWindowName).btnlast.Enabled := true
&(self:cWindowName).btndel.Enabled := true
&(self:cWindowName).btnclose.Enabled := true
&(self:cWindowName).btnsave.Enabled := false
&(self:cWindowName).btncancel.Enabled := false
&(self:cWindowName).btnedit.Enabled := true
&(self:cWindowName).btnadd.Enabled := true
&(self:cWindowName).textName.Enabled := False
&(self:cWindowName).textAddress.Enabled := False
&(self:cWindowName).textPhone.Enabled := False
&(self:cWindowName).ComboCountry.Enabled := False
&(self:cWindowName).DateOfBirth.Enabled := False
&(self:cWindowName).textBalance.Enabled := False
ENDIF
self:OperationMode := p1
Return 0
Method CheckData Class CustomersDataClass
Local myret,cName,nCountry
myret := True
cName := &(self:cWindowName).textName.Value
cName = ALLTRIM ( cName )
IF cName == ""
MyOut := MSGINFO("Enter Customer Name","Sorry")
myret := False
ENDIF
nCountry := &(self:cWindowName).ComboCountry.Value
IF nCountry = 0
MyOut := MSGINFO("Please select the country","Sorry")
myret := False
ENDIF
Return myret
Method GetTotalBalance Class CustomersDataClass
myoRS := TOLEAUTO():NEW( "ADODB.Recordset" )
myoRS:CursorType := 1
myoRS:ActiveConnection := self:oCon
myoRS:open ( "Select * from TotalBalance",self:oCon,3,3 )
nBalance := myoRS:fields:item("SumOfBalance"):value
cBalance = STR ( nBalance )
MyOut := MSGBOX(cBalance,"Total Balance")
myoRS:Close()
myoRS := TOLEAUTO():NEW( "ADODB.Recordset" )
myoRS:CursorType := 1
myoRS:ActiveConnection := self:oCon
myoRS:open ( "SELECT Sum(Customers.balance) AS SumOfbalance from Customers",self:oCon,3,3 )
nBalance := myoRS:fields:item("SumOfBalance"):value
cBalance = STR ( nBalance )
MyOut := MSGBOX(cBalance,"Total Balance")
myoRS:Close()
myoRS := TOLEAUTO():NEW( "ADODB.Recordset" )
myoRS:CursorType := 1
myoRS:ActiveConnection := self:oCon
myoRS:open ( "Select * from Customers",self:oCon,3,3 )
nBalance := 0
nMax := myoRS:RecordCount
IF nMax > 0
FOR x = 1 TO nMax STEP 1
custBalance := myoRS:fields:item("Balance"):value
nBalance := nBalance + custBalance
myoRS:MOVENEXT()
Next
ENDIF
cBalance = STR ( nBalance )
MyOut := MSGBOX(cBalance,"Total Balance")
myoRS:Close()
Return 0
Method closewindow Class CustomersDataClass
myout = self:disconnect()
&(self:cWindowName).Release ( )
Return 0
Method AutoGotoRecord Class CustomersDataClass
IF self:LFindRecord = true .and. self:OperationMode = 2
self:oRS:Find(self:CFindExpr)
mycheck := self:oRS:EOF()
IF mycheck = true
self:oRS:MOVEPREVIOUS()
ENDIF
IF iswindowdefined( &(self:cWindowName) )
myout = self:showrecord()
&(self:cWindowName).SetFocus ( )
ENDIF
ENDIF
self:LFindRecord := false
self:CFindExpr := ""
Return 0



End Of Resistance

*-------------------------------------------------------------------*
