@echo off

SET AGENT_DIR=C:\Program Files\McAfee\Agent
SET TEST_DIR=C:\Program Files\AMD\RyzenMaster


:MCFWINDOWSBUILD

echo.

echo Created by Sinan Barghouthi McAfee Professional Services on 01/04/2020

echo McAfee UBR Script run at %DATE% %TIME%

echo Checking Windows OS Build Number with UBR

setlocal ENABLEDELAYEDEXPANSION

FOR /F "usebackq tokens=2,* skip=2" %%L IN (

`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseID`

) DO SET RID=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (

`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName`

) DO SET PN=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (

`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild`

) DO SET CB=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (

`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v UBR`

) DO SET HEXAUBR=%%M

SET /A "DECAUBR=%HEXAUBR%"
SET OUTPUT=Version %RID% (%PN%.%CB%.%DECAUBR%)
echo %OUTPUT%

cd %AGENT_DIR%
maconfig.exe -custom -prop1 "%OUTPUT%"

GOTO EOF

:EOF
echo.
exit /b