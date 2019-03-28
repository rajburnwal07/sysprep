@echo off

FOR /F "tokens=*" %%i IN ('git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT 690d52ab8efe0a266bc975ab47b57ff9d061ea42 8bf135254bc1ec09988b01ddcc87f5105ee2338c') DO SET X=%%i

SET result=false

IF "%X%" NEQ "" SET result=true

IF "%result%"=="true" (

    echo "commit is in Deploy_Linux.sh, execute the build script for that"
) 

IF "%result%" =="false" (

    echo "Commit made on other files..so normal build "
)
pause