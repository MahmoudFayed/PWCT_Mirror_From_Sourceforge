* command3 : move up
* command4 : move down
* command10 : cut
* command8 : copy
* check1 : ignore
* command2 : delete
DEFINE CLASS GD_AvoidErrors as Custom

PROCEDURE AvoidGeneratedStepErrors(objGDWindow)
LOCAL objgdwindow as Form
IF .not. EMPTY(t38->stepinterid) .and. t38->stepinternum != 1
		objgdwindow.command3.enabled = .f.
		objgdwindow.command4.enabled = .f.
		objgdwindow.command10.enabled = .f.
		objgdwindow.command8.enabled = .f.
		objgdwindow.check1.enabled = .f.
		objgdwindow.command2.enabled = .f.
ELSE
		objgdwindow.command3.enabled = .t.
		objgdwindow.command4.enabled = .t.
		objgdwindow.command10.enabled = .t.
		objgdwindow.command8.enabled = .t.
		objgdwindow.check1.enabled = .t.
		objgdwindow.command2.enabled = .t.
ENDIF
 


RETURN

ENDDEFINE