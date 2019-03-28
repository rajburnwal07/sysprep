@echo off
::::Version: CB_10.1.3
SETLOCAL ENABLEEXTENSIONS
setlocal enabledelayedexpansion

::################### Initializing variables ###################
set Compare_War_location=%cd%\Compare_War
set css_exception_list=merchant.css,merchant_rl.css,modern_ui\organization.css,modern_ui\organization_rl.css
::##############################################################################################
echo "***********************************************************************************************"
if exist "%Compare_War_location%" rd "%Compare_War_location%" /s /q
mkdir "%Compare_War_location%\old_war\css\modern_ui"

echo "Taking backup Customized CSS from SYNERGY HOME"
	For %%i in (%css_exception_list%) do (
		echo %%i
		move /Y "%SYNERGY_HOME%\css\%%i" "%Compare_War_location%\old_war\css\%%i"
	)
	
echo "Replacing Customized CSS to SYNERGY HOME"
	For %%i in (%css_exception_list%) do (
		echo %%i
		move /Y "%Compare_War_location%\old_war\css\%%i" "%SYNERGY_HOME%\css\%%i"
		if NOT %ERRORLEVEL% == 0 (
			echo "[Error] Replacing Customized %%i failed!"
			goto :error
		)
	)
pause