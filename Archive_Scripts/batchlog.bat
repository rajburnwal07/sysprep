@echo off
REM set LOGFILE=batch.log
REM call :LOG >> %LOGFILE% 1>>CON
REM exit /B

REM :LOG
REM dir /b


robocopy "D:\CloudBlue Work\azure_deploy\CITools\BACKUP\_an_19_19_24_46_53\ESCM-DataFiles" %CATALINA_HOME%\ESCM-DataFiles /s /e 
	if NOT %ERRORLEVEL% == 0 || 1 (
		echo "[Error] ESCM-DataFiles Restore failed!"
		echo "Proceed for manual restore from location %Backup_location%"
		pause
	)