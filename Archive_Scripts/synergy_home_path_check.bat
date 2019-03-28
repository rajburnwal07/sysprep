@echo off
::::Version: CB_10.1.3
SETLOCAL ENABLEEXTENSIONS
setlocal enabledelayedexpansion

REM set SYNERGY_HOME="C:\apache-tomcat-8.0.46\webapps\cloudblue"

set SYNERGY_HOME=%SYNERGY_HOME%
set SYNERGY_HOME
set SYNERGY_HOME=%SYNERGY_HOME:"=%
set SYNERGY_HOME

set css_exception_list=merchant.css,merchant_rl.css,modern_ui\organization.css,modern_ui\organization_rl.css
::##############################################################################################
echo "***********************************************************************************************"
echo "Taking backup Customized CSS from SYNERGY HOME"
	For %%i in (%css_exception_list%) do (
		echo %%i
	)

	echo "Deleting OLD files from SYNERGY HOME"
	FOR /D %%i IN ("%SYNERGY_HOME%\*") DO (
		if not "%%i"=="%SYNERGY_HOME%\branding" if not "%%i"=="%SYNERGY_HOME%\plugins" if not "%%i"=="%SYNERGY_HOME%\css" if not "%%i"=="%SYNERGY_HOME%\images" if not "%%i"=="%SYNERGY_HOME%\resources" if not "%%i"=="%SYNERGY_HOME%\WEB-INF" ( 
			echo Deleting %%i
		
		)
	)