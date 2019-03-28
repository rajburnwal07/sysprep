@echo off
::::Version: CB_10.1.3
SETLOCAL ENABLEEXTENSIONS
setlocal enabledelayedexpansion

::Checking Unzip is working or not
unzip /? 2> nul
if NOT %ERRORLEVEL% == 0 if not %ERRORLEVEL% == 9 (
	echo "Unzip is not working, please install unzip first"
	goto :EOF
)