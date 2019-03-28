@echo off
set "source_dir=D:\CloudBlue Work\azure_deploy\CITools\Compare_War\DF_WAR_Struct"
	set "dest_dir=D:\CloudBlue Work\azure_deploy\CITools\Compare_War\new_war"
	
set compare_list=branding,css,images,plugins,resources,lib,i18n

	echo "Copying old %compare_list% from SYNERGY_HOME for Merging"
	For %%i in (%compare_list%) do (
		if %%i == lib (
			echo "Copying lib %%i"
			REM xcopy %SYNERGY_HOME%\WEB-INF\%%i "%Compare_War_location%\old_war\WEB-INF\%%i" /HEYI 
			REM if NOT %ERRORLEVEL% == 0 (
				REM echo "[Error] Copy failed!"
				REM pause
				REM exit 1
			REM )
		) else if %%i == i18n (
			echo "Copying i18n %%i"
			REM xcopy %SYNERGY_HOME%\WEB-INF\%%i "%Compare_War_location%\old_war\WEB-INF\%%i" /HEYI 
			REM if NOT %ERRORLEVEL% == 0 (
				REM echo "[Error] Copy failed!"
				REM pause
				REM exit 1
			REM )
		) else (
			echo "Copying %%i"
			REM xcopy %SYNERGY_HOME%\%%i "%Compare_War_location%\old_war\%%i" /HEYI
			REM if NOT %ERRORLEVEL% == 0 (
				REM echo "[Error] Copy failed!"
				REM pause
				REM exit 1
			REM )
		)
	)
REM ::****************** Merging ESCM-DataFiles/Old WAR & New War Function *********************#
REM :compare_folder
	REM echo Comparing Folders
	REM echo "%current_dir%\lib\CompareFile.class"
	REM copy "%current_dir%\lib\CompareFile.class" "%Compare_War_location%"
	
	REM set "source_dir=%~1"
	REM set "dest_dir=%~2"
	REM echo Source Folder: %source_dir%
	REM echo Destination Folder: %dest_dir%
	
	REM echo "Copy latest Branding folder to existing WAR before merging"
	REM xcopy %dest_dir%\branding\* %source_dir%\branding\ /s /e
	
	REM echo "Removing Branding folder from New War"
	REM rd "%dest_dir%\branding" /s /q
  
	REM echo Comparing for extracting the Delta-WAR
	REM cd "%Compare_War_location%"
	REM echo %cd%
	REM echo %JAVA_HOME%\bin\java CompareFile "%source_dir%" "%dest_dir%"
	REM "%JAVA_HOME%\bin\java" CompareFile "%source_dir%" "%dest_dir%"
	REM if NOT %ERRORLEVEL% == 0 (
		REM echo "[Error] Merging failed!"
		REM call :restore
	REM )
	
	REM echo Merging Delta WAR with the existing customized WAR
	REM For %%i in (%compare_list%) do (
		REM if %%i == lib (
			REM if exist %dest_dir%\WEB-INF\%%i (
				REM echo "Copying %%i"
				REM xcopy %dest_dir%\WEB-INF\%%i %source_dir%\WEB-INF\%%i /HEYI 
				REM if NOT %ERRORLEVEL% == 0 (
					REM echo "[Error] Merging failed!"
					REM call :restore
				REM )
			REM )
		REM ) else (
			REM if exist %dest_dir%\%%i (
				REM echo "Copying %%i"
				REM xcopy %dest_dir%\%%i %source_dir%\%%i /HEYI
				REM if NOT %ERRORLEVEL% == 0 (
					REM echo "[Error] Merging failed!"
					REM call :restore
				REM )
			REM )
		REM )
	REM )

	REM echo Copy Merged WAR to SYNERGY_HOME location
	REM For %%i in (%compare_list%) do (
		REM if %%i == lib (
			REM if exist %source_dir%\WEB-INF\%%i (
				REM echo "Copying %%i"
				REM xcopy %source_dir%\WEB-INF\%%i\* %SYNERGY_HOME%\WEB-INF\%%i\ /HEYI 
				REM if NOT %ERRORLEVEL% == 0 (
					REM echo "[Error] Merging failed!"
					REM call :restore
				REM )
			REM )
		REM ) else (
			REM if exist %source_dir%\%%i (
				REM echo "Copying %%i"
				REM xcopy %source_dir%\%%i\* %SYNERGY_HOME%\%%i /HEYI
				REM if NOT %ERRORLEVEL% == 0 (
					REM echo "[Error] Merging failed!"
					REM call :restore
				REM )
			REM )
		REM )
	REM )
	
	REM copy "%Compare_War_location%/old_war/WEB-INF/grails-app/i18n/messages.properties" "%SYNERGY_HOME%/WEB-INF/grails-app/i18n/" 
	REM copy "%Compare_War_location%/web.xml" "%SYNERGY_HOME%/WEB-INF/"
	REM echo Successfully Upgraded
	REM pause
REM exit /b
REM ::*******************************************************************#