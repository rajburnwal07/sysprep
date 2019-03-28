REM @ECHO OFF
Title "Validating System before Starting Applicaton install/update process..."	
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
set backup=backup_%mydate%_%mytime%
	mkdir %backup% 
	mkdir %backup%\war-file\
	mkdir %backup%\ESCM-DataFiles-new
	
set list=images,css,branding,resources,plugins
	set script_source=%CD%

Echo.
Echo ================================================================================
SET /P easversion="Please provide ISO [war-file location (till webapps)]: "  
	echo location of war: %easversion%
	call cd ../..
	set datafile_location=%CD%
	cd %script_source%
VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS
	IF ERRORLEVEL 1 ECHO Unable to enable extensions
	IF DEFINED SYNERGY_HOME (
	::ECHO Found SYNERGY_HOME processing for Application Update.	 	
	VERIFY OTHER 2>nul
	SETLOCAL ENABLEEXTENSIONS
		IF ERRORLEVEL 1 ECHO Unable to enable extensions
		IF DEFINED CATALINA_HOME (
		::ECHO Found CATALINA_HOME processing for Application Deployment. 		 
		if exist %CATALINA_HOME%\ESCM-DataFiles (
			if exist %CATALINA_HOME%\ESCM-DataFiles\lib (
				ECHO =============Datafile to War update Started========================
				set temp_var=1
				Goto :Start			
			)Else (
				ECHO =============War to War update Started========================
				set temp_var=2
				Goto :Start
			)			
		)Else (
			ECHO =============Fresh installation Started========================
			set temp_var=0
			Goto :Start
			)	
		)ELSE (
		ECHO CATALINA_HOME is NOT defined please install tomcat first 
		Goto :END_CASE			
		)
	ENDLOCAL 
	echo ===========tomcat end================== 	
	)ELSE (
	ECHO SYNERGY_HOME is NOT defined Configure SYNERGY_HOME first. 
	Goto :END_CASE
	)
ENDLOCAL 
 	
	:Start	
	SET choice=%temp_var%
	2>NUL CALL :CASE_%choice% # jump to :CASE_1, :CASE_2, etc.
	IF ERRORLEVEL 1 CALL :DEFAULT_CASE # If label doesn't exist
	EXIT /B

	:CASE_0 
		Echo Fresh Install Applicatoins	 
		Echo ===================================================== 
		 
		set new_warfile=%easversion%\order.war 
		set new_datafiles=%easversion%\order
		Title "validing previous war %easversion% (1/3)"		 
		if exist %easversion%\order (	rd %easversion%\order /s /q) 
		if exist %easversion%\order.war (	del %easversion%\order.war) 		
		cd %easversion%		
		Title "unzipping order.zip (2/3)" 		
		unzip order.zip
		
		call %CATALINA_HOME%\bin\shutdown.bat && call cd %script_source%
		if exist %SYNERGY_HOME% (	rd %SYNERGY_HOME% /s /q) 
		if exist %SYNERGY_HOME%.war (	del %SYNERGY_HOME%.war) 
		
		REM copy %easversion%\order.war %CATALINA_HOME%\webapps\
		robocopy "%easversion%" "%CATALINA_HOME%\webapps" order.war
		move %CATALINA_HOME%\webapps\order.war %SYNERGY_HOME%.war
		Title "copy ESCM-DataFiles to tomcat (3/3) 
		call cd %war_loction%
		cd ..
		mkdir %CATALINA_HOME%/ESCM-DataFiles
		robocopy ESCM-DataFiles %CATALINA_HOME%/ESCM-DataFiles /E	
		cd %CATALINA_HOME%\bin
		call %CATALINA_HOME%\bin\startup.bat
		cd /d %script_source%	
	  GOTO END_CASE
	  
	:CASE_1 
	    Echo Updating Applicatoins Datafile to War
	    Echo ===================================================== 
		Title "DataFiles to War Update...(1/6)"	
		
		set new_warfile=%easversion%\order.war 
		set new_datafiles=%easversion%\order
		Title "extracting zip %easversion% (2/6)"	
		if exist %easversion%\order rd %easversion%\order /s /q
		if exist %easversion%\order.war del %easversion%\order.war		
		cd %easversion% 	
		unzip order.zip && mkdir order && cd order			
		jar -xvf %easversion%\order.war		
		call %CATALINA_HOME%\bin\shutdown.bat && call cd %script_source%
		Title "creating %backup% folders (3/6)"				
		
		copy %SYNERGY_HOME%\WEB-INF\web.xml %script_source%\%backup%\ESCM-DataFiles-new\
		copy %CATALINA_HOME%\ESCM-DataFiles\synergy.properties %script_source%\%backup%\ESCM-DataFiles-new\
		copy %CATALINA_HOME%\ESCM-DataFiles\synergy-Config.groovy %script_source%\%backup%\ESCM-DataFiles-new\
		copy %CATALINA_HOME%\ESCM-DataFiles\synergy-DataSource.groovy %script_source%\%backup%\ESCM-DataFiles-new\
		copy %CATALINA_HOME%\ESCM-DataFiles\easTaxConfig.xml %script_source%\%backup%\ESCM-DataFiles-new\
		copy %CATALINA_HOME%\ESCM-DataFiles\ticketconfig.xml %script_source%\%backup%\ESCM-DataFiles-new\
		Title "war backup and comparing files (4/6)"		
		
		robocopy "%SYNERGY_HOME%" "%script_source%\%backup%\war-file" /E
		cd /d %script_source%\lib		
		(for %%i in (%list%) do ( 
			java CompareFile %script_source%\%backup%\war-file\%%i %new_datafiles%\%%i 
			echo %script_source%\%backup%\war-file\%%i == %new_datafiles%\%%i
			))				
		Title "removing previous war file (5/6)"		
		cd /d %CATALINA_HOME%\webapps 
		rd %CATALINA_HOME%\ESCM-DataFiles /s /q 
		mkdir %CATALINA_HOME%\ESCM-DataFiles 
		rd %SYNERGY_HOME% /s /q 
		del %SYNERGY_HOME%.war 
		echo %datafile_location%\Portal\%new_warfile% %CATALINA_HOME%\webapps\
		mkdir %SYNERGY_HOME%
		REM xcopy %easversion%\order.war %CATALINA_HOME%\webapps\ /s /e /y
		REM ren %CATALINA_HOME%\webapps\order.war %SYNERGY_HOME%.war
		robocopy "%easversion%" "%CATALINA_HOME%\webapps" order.war
		move %CATALINA_HOME%\webapps\order.war %SYNERGY_HOME%.war
		cd %SYNERGY_HOME% 
		jar -xvf %SYNERGY_HOME%.war
		Title "Merging old DataFiles with new Datafiles (6/6)
		(for %%i in (%list%) do ( xcopy %new_datafiles%\%%i %SYNERGY_HOME%\%%i\ /s /e /y ))
		copy %script_source%\%backup%\ESCM-DataFiles-new\web.xml %CATALINA_HOME%\ESCM-DataFiles\
		copy %script_source%\%backup%\ESCM-DataFiles-new\synergy.properties %CATALINA_HOME%\ESCM-DataFiles\
		copy %script_source%\%backup%\ESCM-DataFiles-new\synergy-Config.groovy %CATALINA_HOME%\ESCM-DataFiles\
		copy %script_source%\%backup%\ESCM-DataFiles-new\synergy-DataSource.groovy %CATALINA_HOME%\ESCM-DataFiles\
		copy %script_source%\%backup%\ESCM-DataFiles-new\easTaxConfig.xml %CATALINA_HOME%\ESCM-DataFiles\
		copy %script_source%\%backup%\ESCM-DataFiles-new\ticketconfig.xml %CATALINA_HOME%\ESCM-DataFiles\
		cd %CATALINA_HOME%\bin
		call %CATALINA_HOME%\bin\startup.bat
		cd /d %script_source%	  
	  GOTO END_CASE
	  
	:CASE_2		 
		Echo Updating Applicatoins War to War
		Echo ===================================================== 
		Title "updating EAS...(1/6)"		
		call cd Portal
		if exist %easversion%\order rd %easversion%\order /s /q
		if exist %easversion%\order.war del %easversion%\order.war
		call cd %easversion% 	
		call unzip order.zip && mkdir order && cd order
		call jar -xvf %easversion%\order.war
		set new_warfile=%easversion%\order.war 
		set new_datafiles=%easversion%\order
		call %CATALINA_HOME%\bin\shutdown.bat && call cd %script_source%		
		Title "war backup and comparing files (2/6)"
		robocopy "%SYNERGY_HOME%" "%script_source%\%backup%\war-file" /E
		
		cd /d %script_source%\lib 
		(for %%i in (%list%) do (call java CompareFile %script_source%\%backup%\war-file\%%i %new_datafiles%\%%i ))
		Title "removing previous war file (5/6)"
		cd /d %CATALINA_HOME%\webapps && call rd %SYNERGY_HOME% /s /q 
		if exist %SYNERGY_HOME%.war (call del %SYNERGY_HOME%.war)
		mkdir %SYNERGY_HOME%
		REM xcopy %new_warfile% %CATALINA_HOME%\webapps\ /s /e /y
		REM ren %CATALINA_HOME%\webapps\order.war %SYNERGY_HOME%.war
		
		robocopy "%easversion%" "%CATALINA_HOME%\webapps" order.war
		move %CATALINA_HOME%\webapps\order.war %SYNERGY_HOME%.war
		cd %SYNERGY_HOME% && call jar -xvf %SYNERGY_HOME%.war
		Title "Merging old DataFiles with new Datafiles (6/6)
		(for %%i in (%list%) do ( xcopy %new_datafiles%\%%i %SYNERGY_HOME%\%%i\ /s /e /y ))
		call %CATALINA_HOME%\bin\startup.bat	  
	  GOTO END_CASE
		  
	:END_CASE
	  VER > NUL # reset ERRORLEVEL 
	  REM exit
	  pause
	  