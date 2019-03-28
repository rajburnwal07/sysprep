@ECHO OFF
::::Version: CB_10.1.0
SETLOCAL ENABLEEXTENSIONS
setlocal enabledelayedexpansion
set STARTTIME=%TIME%

REM set exception_list=branding,plugins,resources,WEB-INF\lib,WEB-INF\grails-app\i18n
REM for /D %%d in (%SYNERGY_HOME%\*) do (
	REM if "%%d" neq "%%i" (
		REM rd "%%d" /s /q
		REM echo Deleting %%d"
	REM )
REM )

echo "Deleting OLD files from SYNERGY HOME"
	FOR /D %%i IN ("%SYNERGY_HOME%\*") DO (
		if not "%%i"=="%SYNERGY_HOME%\branding" if not "%%i"=="%SYNERGY_HOME%\plugins" if not "%%i"=="%SYNERGY_HOME%\css" if not "%%i"=="%SYNERGY_HOME%\images" if not "%%i"=="%SYNERGY_HOME%\resources" if not "%%i"=="%SYNERGY_HOME%\WEB-INF" ( 
			rd /s /q "%%i"
			echo Deleting %%i
		)
	)

	FOR /D %%i IN ("%SYNERGY_HOME%\WEB-INF\*") DO (
		if not "%%i"=="%SYNERGY_HOME%\WEB-INF\lib" if not "%%i"=="%SYNERGY_HOME%\WEB-INF\grails-app" (
			rd /s /q "%%i"
			echo Deleting %%i
		)
	)

	FOR /D %%i IN ("%SYNERGY_HOME%\WEB-INF\grails-app\*") DO (
		if not "%%i"=="%SYNERGY_HOME%\WEB-INF\grails-app\i18n" (
			rd /s /q "%%i"
			echo Deleting %%i
		)
	)