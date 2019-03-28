@echo off
echo user cloudblueftp>> ftpcmd.dat
echo Independent12#>> ftpcmd.dat
echo bin>> ftpcmd.dat
echo put %1>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -s:ftpcmd.dat cloudblueftp.eastus.cloudapp.azure.com
del ftpcmd.dat
pause