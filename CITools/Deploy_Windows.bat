@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
setlocal enabledelayedexpansion

echo "***********************************************************************************************"
if "%~1"=="" (
    echo No parameters have been provided.
	echo Provide Order.zip Location. i.e: D:\CB_10.0\ISO\Portal\CB_10.0\webapps
	pause
	goto :EOF
)

set order_location=%1%
echo order_location: %order_location%

::################### User variables ###################
REM ::set SYNERGY_HOME="/usr/share/tomcat/webapps/escm"
REM ::set CATALINA_HOME="/usr/share/tomcat"

::##############################################################

::################### Initializing variables ###################
set current_dir=%cd%
set Compare_War_location=%current_dir%\Compare_War
set BACKUP_DIRECTORY_NAME=%date:~10,4%_%date:~4,2%_%date:~7,2%_%time:~0,2%_%time:~3,2%_%time:~6,2%_%time:~9,2%
set Backup_location=%current_dir%\BACKUP\%BACKUP_DIRECTORY_NAME%
set compare_list=branding,css,images,plugins,resources,lib,i18n
::##############################################################


::###### Taking Decision {Fresh, Upgrade:DF2War, War2War} #######

IF DEFINED SYNERGY_HOME (
	IF DEFINED CATALINA_HOME (		 
		if exist %CATALINA_HOME%\ESCM-DataFiles (
			if exist %CATALINA_HOME%\ESCM-DataFiles\branding (
			::::=============ESCM-DataFiles to WAR Upgrade::=============
				For %%i in (%compare_list%) do (
					if exist %CATALINA_HOME%\ESCM-DataFiles\%%i (
						ECHO "%%i found"
						set flag=2

					)Else (
						ECHO "%%i not found in ESCM-DataFiles"
						set flag=0
						Goto :error	

					)
				)
			)Else (
			::::=============WAR to WAR Upgrade::=============
				For %%i in (%compare_list%) do (
					if not exist %CATALINA_HOME%\ESCM-DataFiles\%%i (
						ECHO "%%i not found"
						set flag=3

					)Else (
						ECHO "%%i found in ESCM-DataFiles"
						set flag=0
						Goto :error	

					)
				)
			)			
		)Else (
			::=============Fresh installation=============
			set flag=1
		)	
	)ELSE (
		ECHO CATALINA_HOME is NOT defined please install tomcat first 
		Goto :EOF			
	)
)ELSE (
	ECHO SYNERGY_HOME is NOT defined Configure SYNERGY_HOME first. 
	Goto :EOF
)

::##############################################################
echo Flag Value: %flag%

::########################## Extract zip #######################
echo "Extracting Order.zip"
echo WAR Location: %current_dir%
unzip -o %order_location%/order.zip -d "%current_dir%"
if NOT %ERRORLEVEL% == 0 (
	echo "[Error] WAR Unzip failed!"
	GOTO :EOF
)
cd %order_location%
cd ..
set "DataFiles_location=%cd%"
echo DataFiles_location: %DataFiles_location%
REM ::############ Get ESCM-DataFiles location if UNC path provided ##########
REM for /f "tokens=*" %%a in ("%order_location%") do (
REM set DataFiles_location=%%a
REM set DataFiles_location=!DataFiles_location:~0,-7!
REM )
REM echo DataFiles_location: %DataFiles_location%
::############ Get APP Name from SYNERGY_HOME ##########
for %%f in (%SYNERGY_HOME%) do set appname=%%~nxf
echo APP Name: %appname%
::##############################################################

::###### Deploying according to flag value #######
	:Start	
	2>NUL CALL :CASE_%flag% # jump to :CASE_1, :CASE_2, etc.
	EXIT /B

	:CASE_1
		Echo ============================ 
		Echo =    Fresh Installation    =	 
		Echo ============================
		call :fresh
		GOTO :END
	  
	:CASE_2 
		Echo ======================================= 
		Echo =    ESCM-DataFiles to WAR Upgrade    =	 
		Echo =======================================
		call :backup
		call :df_copy
		call :new_war_copy
		call :compare_folder "%Compare_War_location%\DF_WAR_Struct", "%Compare_War_location%\new_war"
		call :rm_df
		GOTO :END
		
	:CASE_3 
		Echo ============================
		Echo =    WAR to WAR Upgrade    =	 
		Echo ============================
		call :backup
		call :old_war_copy
		call :new_war_copy
		call :compare_folder "%Compare_War_location%\old_war", "%Compare_War_location%\new_war"
		GOTO :END

::##############################################################

::****************** Fresh Deploy War/ESCM-DataFiles Function *********************#
:fresh
	echo "Deploying WAR"
	move "%current_dir%\order.war" "%SYNERGY_HOME%.war"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] WAR Deployment failed!"
		pause
		exit 1
	)
	
	echo "Deployment ESCM-DataFiles"
	xcopy "%DataFiles_location%\ESCM-DataFiles" "%CATALINA_HOME%\ESCM-DataFiles" /HEYI
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] ESCM-DataFiles Deployment failed!"
		pause
		exit 1
	)
exit /b

::*******************************************************************#

::****************** Taking Backup War/ESCM-DataFiles Function *********************#
:backup
	echo "Taking Backup War/ESCM-DataFiles"
	mkdir "%Backup_location%"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] %Backup_location% directory creation failed!"
		pause
		exit 1
	)
	robocopy %SYNERGY_HOME% "%Backup_location%\%appname%" /s /e
	if NOT %ERRORLEVEL% == 1 (
		echo "[Error] WAR Backup failed!"
		pause
		exit 1
	)

	copy "%SYNERGY_HOME%.war" "%Backup_location%"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] WAR Backup failed!"
		pause
		exit 1
	)

	robocopy "%CATALINA_HOME%\ESCM-DataFiles" "%Backup_location%\ESCM-DataFiles" /s /e 
	if NOT %ERRORLEVEL% == 1 (
		echo "[Error] ESCM-DataFiles Backup failed!"
		pause
		exit 1
	)
exit /b

::*******************************************************************#

::****************** Restore War/ESCM-DataFiles Function *********************#
:restore
	echo "Restoring to previous state"
	rd %SYNERGY_HOME% /s /q
	del %SYNERGY_HOME%.war
	echo "New files deleted"
	robocopy "%Backup_location%\%appname%" "%CATALINA_HOME%\webapps\%appname%"  /s /e
	if NOT %ERRORLEVEL% == 1 (
		echo "[Error] %appname% Restore failed!"
		echo "Proceed for manual restore from location %Backup_location%"
		pause
		exit 1
	)

	copy "%Backup_location%\%appname%.war" "%CATALINA_HOME%\webapps\"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] %appname%.war Restore failed!"
		echo "Proceed for manual restore from location %Backup_location%"
		pause
		exit 1
	)

	robocopy "%Backup_location%\ESCM-DataFiles" %CATALINA_HOME%\ESCM-DataFiles /s /e 
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] ESCM-DataFiles Restore failed!"
		echo "Proceed for manual restore from location %Backup_location%"
		pause
		exit 1
	)
	echo Restore Completed.
	exit 0
exit /b
::*******************************************************************#

::****************** Copying ESCM-DataFiles For Merging Function *********************#
:df_copy
	echo "Copying ESCM-DataFiles For Merging"
	rd "%Compare_War_location%\DF_WAR_Struct" /s /q
	mkdir "%Compare_War_location%\DF_WAR_Struct\WEB-INF\grails-app\i18n"
	echo "Copying %compare_list% from ESCM-DataFiles for Merging"
	For %%i in (%compare_list%) do (
		if %%i == lib (
			echo "Copying %%i"
			xcopy %CATALINA_HOME%\ESCM-DataFiles\%%i "%Compare_War_location%\DF_WAR_Struct\WEB-INF\%%i" /HEYI 
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Copy failed! from DataFiles"
				pause
				exit 1
			)
		) else if %%i == i18n (
			echo "Copying %%i"
			xcopy %CATALINA_HOME%\ESCM-DataFiles\%%i "%Compare_War_location%\DF_WAR_Struct\WEB-INF\grails-app\%%i" /HEYI 
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Copy failed! from DataFiles"
				pause
				exit 1
			)
		) else (
			echo "Copying %%i"
			xcopy %CATALINA_HOME%\ESCM-DataFiles\%%i "%Compare_War_location%\DF_WAR_Struct\%%i" /HEYI
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Copy failed! from DataFiles"
				pause
				exit 1
			)
		)
	)
	)
	copy /Y "%CATALINA_HOME%\ESCM-DataFiles\web.xml" "%Compare_War_location%"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] web.xml Copy failed! from DataFiles"
		pause
		exit 1
	)
	
exit /b
::*******************************************************************#

::****************** Copying Old WAR For Merging Function *********************#
:old_war_copy
	echo "Copying Old WAR For Merging"
	rd "%Compare_War_location%\old_war" /s /q
	mkdir "%Compare_War_location%\old_war\WEB-INF\grails-app\i18n"
	echo "Copying old %compare_list% from SYNERGY_HOME for Merging"
	For %%i in (%compare_list%) do (
		if %%i == lib (
			echo "Copying %%i"
			xcopy %SYNERGY_HOME%\WEB-INF\%%i "%Compare_War_location%\old_war\WEB-INF\%%i" /HEYI 
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Copy failed! from Old WAR"
				pause
				exit 1
			)
		) else if %%i == i18n (
			echo "Copying %%i"
			xcopy %SYNERGY_HOME%\WEB-INF\grails-app\%%i "%Compare_War_location%\old_war\WEB-INF\grails-app\%%i" /HEYI 
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Copy failed! from Old WAR"
				pause
				exit 1
			)
		) else (
			echo "Copying %%i"
			xcopy %SYNERGY_HOME%\%%i "%Compare_War_location%\old_war\%%i" /HEYI
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Copy failed! from Old WAR"
				pause
				exit 1
			)
		)
	)
	)
	copy /Y "%SYNERGY_HOME%\WEB-INF\web.xml" "%Compare_War_location%"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] web.xml Copy failed! from Old WAR"
		pause
		exit 1
	)
	
exit /b
::*******************************************************************#

::****************** Copying New WAR For Merging Function *********************#
:new_war_copy
	echo "Copying New WAR For Merging"
	echo Removing Exsisting WAR from SYNERGY HOME Location
	rd %SYNERGY_HOME% /s /q
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] Old WAR Delete failed!"
		call :restore
	)
	
	del %SYNERGY_HOME%.war
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] Old WAR Delete failed!"
		call :restore
	)
	rd "%Compare_War_location%\new_war" /s /q
	mkdir "%Compare_War_location%\new_war\WEB-INF\grails-app\i18n"
	echo Copying New WAR to SYNERGY HOME Location
	move "%current_dir%\order.war" "%SYNERGY_HOME%.war"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] New WAR Copy failed! to SYNERGY HOME Location"
		call :restore
	)
	del "%current_dir%\order.war"
	echo Extracting New WAR
	unzip -o "%SYNERGY_HOME%.war" -d "%SYNERGY_HOME%"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] New WAR Unzip failed!"
		call :restore
	)
	
	echo "Copying New %compare_list% from SYNERGY HOME for Merging"
	For %%i in (%compare_list%) do (
		if %%i == lib (
			echo "Copying %%i"
			xcopy %SYNERGY_HOME%\WEB-INF\%%i "%Compare_War_location%\new_war\WEB-INF\%%i" /HEYI 
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Copy failed! from New WAR"
				call :restore
			)
		) else if %%i == i18n (
			echo "Copying %%i"
			xcopy %SYNERGY_HOME%\WEB-INF\grails-app\%%i "%Compare_War_location%\new_war\WEB-INF\grails-app\%%i" /HEYI 
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Copy failed! from New WAR"
				call :restore
			)
		) else (
			echo "Copying %%i"
			xcopy %SYNERGY_HOME%\%%i "%Compare_War_location%\new_war\%%i" /HEYI
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Copy failed! from New WAR"
				call :restore
			)
		)
	)
	)

exit /b
::*******************************************************************#

::****************** Merging ESCM-DataFiles/Old WAR & New War Function *********************#
:compare_folder
	echo Comparing Folders
	echo "%current_dir%\lib\CompareFile.jar"
	copy /Y "%current_dir%\lib\CompareFile.jar" "%Compare_War_location%"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] Comparing failed! Couldn't copy jar file"
		call :restore
	)
	
	set "source_dir=%~1"
	set "dest_dir=%~2"
	echo Source Folder: %source_dir%
	echo Destination Folder: %dest_dir%
	
	echo "Copy latest Branding folder to existing WAR before merging"
	xcopy %dest_dir%\branding\* %source_dir%\branding\ /HEYI
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] Copy latest Branding folder failed!"
		call :restore
	)
	
	echo "Removing Branding folder from New War"
	rd "%dest_dir%\branding" /s /q
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] removing Branding folder failed!"
		call :restore
	)
  
	echo Comparing for extracting the Delta-WAR
	cd "%Compare_War_location%"
	"%JAVA_HOME%\bin\java" -jar CompareFile.jar "%source_dir%" "%dest_dir%"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] Comparing failed!"
		call :restore
	)
	
	echo Merging Delta WAR with the existing customized WAR
	For %%i in (%compare_list%) do (
		if %%i == lib (
			echo "Copying %%i"
			if exist "%dest_dir%\WEB-INF\%%i" xcopy "%dest_dir%\WEB-INF\%%i" "%source_dir%\WEB-INF\%%i" /HEYI 
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] Merging failed!"
				call :restore
			)
		) else if %%i == i18n (
			echo "Copying %%i"
		) else (
			echo "Copying %%i"
			if exist "%dest_dir%\%%i" xcopy "%dest_dir%\%%i" "%source_dir%\%%i" /HEYI
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] Merging failed!"
				call :restore
			)
		)
	)

	echo Copy Merged WAR to SYNERGY HOME location
	For %%i in (%compare_list%) do (
		if %%i == lib (
			echo "Copying %%i"
			if exist "%source_dir%\WEB-INF\%%i" xcopy "%source_dir%\WEB-INF\%%i" "%SYNERGY_HOME%\WEB-INF\%%i" /HEYI 
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Merging failed! to SYNERGY HOME location"
				call :restore
			)
		) else if %%i == i18n (
			echo "Copying %%i"
			if exist "%source_dir%\WEB-INF\grails-app\%%i" xcopy "%source_dir%\WEB-INF\grails-app\%%i" "%SYNERGY_HOME%\WEB-INF\grails-app\%%i" /HEYI 
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Merging failed! to SYNERGY HOME location"
				call :restore
			)
		) else (
			echo "Copying %%i"
			if exist "%source_dir%\%%i" xcopy "%source_dir%\%%i" "%SYNERGY_HOME%\%%i" /HEYI
			if NOT %ERRORLEVEL% == 0 (
				echo "[Error] %%i Merging failed! to SYNERGY HOME location"
				call :restore
			)
		)
	)
	
	copy /Y "%Compare_War_location%\web.xml" "%SYNERGY_HOME%\WEB-INF\"
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] web.xml Merging failed! to SYNERGY HOME location"
		call :restore
	)
	echo Successfully Upgraded

exit /b
::*******************************************************************#

::****************** Removing ESCM-DataFiles Content Function *********************#
:rm_df
	echo "Removing ESCM-DataFiles Content"
	For %%i in (%compare_list%) do (
		echo "Removing %%i"
		if exist %CATALINA_HOME%\ESCM-DataFiles\%%i rd %CATALINA_HOME%\ESCM-DataFiles\%%i /s /q
	)
	if exist %CATALINA_HOME%\ESCM-DataFiles\unused_files rd %CATALINA_HOME%\ESCM-DataFiles\unused_files /s /q
exit /b
::*******************************************************************#

:END
echo "Deployment Completed, proceed for next steps."
pause
goto :EOF

:error
echo "Inconsistent ESCM-DataFiles"
pause
