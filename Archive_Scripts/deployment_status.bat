REM @echo off

			if exist "%CATALINA_HOME%\deployment_status.txt" (
				REM set /p ds_value=<"%CATALINA_HOME%\deployment_status.txt"
				for /f "tokens=1 delims= " %%a in (%CATALINA_HOME%\deployment_status.txt) do (
					set ds_value=%%a
				)
				echo Deployment Status: %ds_value%
				if "%ds_value%" == "1" (
					echo "Proceed for Deployment"
					echo 0 > "%CATALINA_HOME%\deployment_status.txt"
					type "%CATALINA_HOME%\deployment_status.txt"
					
					echo "Deployment Succeded"
					echo 1 > "%CATALINA_HOME%\deployment_status.txt"
					type "%CATALINA_HOME%\deployment_status.txt"
					
				)else (
					echo "Mis Match in Deployment"
					REM set /p location=Please provide Backup Location: 
					
					echo "Calling Restore"
					echo 2 > "%CATALINA_HOME%\deployment_status.txt"
					type "%CATALINA_HOME%\deployment_status.txt"
					
					echo "Proceed for Deployment"
					echo 1 > "%CATALINA_HOME%\deployment_status.txt"
					type "%CATALINA_HOME%\deployment_status.txt"
					
					echo "Deployment Succeded"
					echo 1 > "%CATALINA_HOME%\deployment_status.txt"
					type "%CATALINA_HOME%\deployment_status.txt"
				)	
					
			)else (
				echo "Upgrading for First Time"
				echo 0 > "%CATALINA_HOME%\deployment_status.txt"
				type "%CATALINA_HOME%\deployment_status.txt"
				
				echo "Proceed for Deployment"
				
					
				echo "Deployment Succeded"
				echo 2 > "%CATALINA_HOME%\deployment_status.txt"
				type "%CATALINA_HOME%\deployment_status.txt"
			)