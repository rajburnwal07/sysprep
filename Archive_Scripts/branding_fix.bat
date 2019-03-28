@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
setlocal enabledelayedexpansion

echo "Removing Old Branding from SYNERGY HOME old"
	if exist "%SYNERGY_HOME%_old\branding\DeltaBranding" (
		rd "%SYNERGY_HOME%_old\branding\DeltaBranding" /s /q
		del "%SYNERGY_HOME%_old\branding\BrandingCSSandLESSfile.zip"
		del "%SYNERGY_HOME%_old\branding\defaultTheme.zip"
	)

echo "Moving Reseller Branding from SYNERGY HOME old to SYNERGY HOME"
	::if exist "%SYNERGY_HOME%_old\branding" move /Y "%SYNERGY_HOME%_old\branding\*" "%SYNERGY_HOME%\branding\"
	::echo "[Error] %ERRORLEVEL%"
	::pause
	for /d %%d in (%SYNERGY_HOME%_old\branding\*) do (
		echo Dir: "%%d"
		move /Y %%d "%SYNERGY_HOME%\branding\"
	)
	if NOT %ERRORLEVEL% == 0 (
		echo "[Error] %ERRORLEVEL%... Moving Reseller Branding from SYNERGY HOME old to SYNERGY HOME failed!"
	)