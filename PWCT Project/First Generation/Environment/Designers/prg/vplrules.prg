DEFINE CLASS VPLRulesBase AS Custom

	PROCEDURE checkAllowRoot()
		
				LOCAL myret
				LOCAL cTableName,nRecord
				LOCAL cInterNum,cHis,cFile,cRules,nMax,X,cLine
				
				myret = .f.
				
				cTableName = ALIAS()
				nRecord = RECNO()
				
				cinternum = ALLTRIM(STR(t38->stepinternum))

				SELECT t46

				IF .NOT. EMPTY(t38->stepinterid)

					GOTO TOP

					LOCATE FOR UPPER(ALLTRIM(f_iid)) == UPPER(ALLTRIM(t38->stepinterid))

					IF FOUND()

						chis = f_myhis
						cfile = UPPER(ALLTRIM(MLINE(chis,9)))

						IF FILE(cfile)

							cfile = STRTRAN(cfile,".TRF",".RULES")

							IF FILE(cfile)

								crules = FILETOSTR(cfile)
								crules = UPPER(crules)

								nmax = MEMLINES(crules)

								FOR x = 1 TO nmax

									cline = MLINE(crules,x)
									cline = ALLTRIM(cline)
									crule = "AllowRoot: " + cinternum
				
									IF UPPER(ALLTRIM(cline)) == UPPER(ALLTRIM(crule))
									
										myret = .T.
										EXIT
										
									ENDIF

								NEXT

							ELSE
							
								stmsg( " (Check New Step) Cann't find the Rules file : " + cfile )
								myret = .T.
								
							ENDIF

						ENDIF

					ENDIF


				ENDIF

				SELECT (cTableName)
				GOTO nRecord

		RETURN myret


		PROCEDURE CreateMyIndex()
		
				This.DeleteMyIndex() 
				
				SELECT t38
				
				INDEX on stepid TAG mystepid
				INDEX on parentid TAG myparentid
				INDEX on stepinterid TAG myinterid
				
				SELECT T46
				
				INDEX ON F_IID TAG myIID
		 
				
		RETURN
		
		PROCEDURE  IndexFindStepID(cID)
		  
				SELECT t38
				seek cID ORDER tag mystepid
				
		RETURN
		
		PROCEDURE IndexFindParentID(cID)
	 
				SELECT t38
				seek cID ORDER tag myparentid
				
		RETURN
		
		PROCEDURE  IndexFindIID(cID)
	 
				SELECT t46
				seek cID ORDER tag myIID
				
		RETURN
		
				
		PROCEDURE  IndexFindStepInterID(cID)
		  
				SELECT t38
				seek cID ORDER tag myinterid
				
		RETURN
		
		PROCEDURE DeleteMyIndex()
		
				LOCAL cTableName,nRecord,nRecord2
				
				SELECT t38
 				
				TRY 
						DELETE TAG mystepid
						DELETE TAG myparentid
						DELETE TAG myinterid
				CATCH 
				ENDTRY 
				
				SELECT t46
		 
				TRY
					 DELETE TAG myIID
				CATCH
				ENDTRY
					
		RETURN


ENDDEFINE