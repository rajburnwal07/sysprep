@echo off
REM move /Y "C:\apache-tomcat-8.0.46\ESCM-DataFiles\css\*" "C:\apache-tomcat-8.0.46\ESCM-DataFiles\movecss"
REM for /d %%d in (C:\apache-tomcat-8.0.46\ESCM-DataFiles\css\*) do (
	REM echo Dir: "%%d"
	REM move /Y %%d "C:\apache-tomcat-8.0.46\ESCM-DataFiles\movecss"
REM )

for /d %%d in (%CATALINA_HOME%\ESCM-DataFiles\branding\*) do (
		echo Dir: "%%d"
		REM move /Y %%d "%SYNERGY_HOME%\branding\"
	)