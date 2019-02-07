@echo off

REM FOR /F "tokens=*" %%i IN ('git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT 690d52ab8efe0a266bc975ab47b57ff9d061ea42 8bf135254bc1ec09988b01ddcc87f5105ee2338c') DO SET X=%%i
FOR /F "tokens=*" %%i IN ('git diff --name-only HEAD~...HEAD Jenkins') DO SET X=%%i

SET result=false
echo %X%
IF "%X%" NEQ "" SET result=true

IF "%result%"=="true" (

    echo "Changes in Directory"
) 

IF "%result%" =="false" (

    echo "No Changes"
)
pause