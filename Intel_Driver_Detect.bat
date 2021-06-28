@echo off
SET LogFile=C:\TEMP\MFC_IntelDriver.log
call :MCFINTELDRIVER >%LogFile% 2>&1

:MCFINTELDRIVER
echo.
echo Created by Sinan Barghouthi McAfee Professional Services on 02/10/2017
echo McAfee Intel Driver Script run at %DATE% %TIME%
echo Checking Intel Driver USB v3.0 eXtensible Host Controller Driver Version
setlocal ENABLEDELAYEDEXPANSION
FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{240C3DDD-C5E9-4029-9DF7-95650D040CF2}" /v DisplayVersion`
) DO SET Version32=%%M
FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{240C3DDD-C5E9-4029-9DF7-95650D040CF2}" /v DisplayVersion`
) DO SET Version64=%%M

SET AgentDir=C:\Program Files\McAfee\Agent
SET HOMEDir=%UserProfile%\Desktop\
cd %AgentDir%

echo 32-Bit Driver Version %Version32%
echo 64-Bit Driver Version %Version64%

if "%Version32%"=="2.5.0.19" (
SET PROPVER=%Version32% 
GOTO MCFPROP
)
if "%Version64%"=="2.5.0.19" (
SET PROPVER=%Version64% 
GOTO MCFPROP
)
GOTO DIFFVER

:MCFPROP
echo maconfig.exe -custom -prop1 "Intel USB 3.0 eXtensible host controller" -prop2 "%PROPVER%"
maconfig.exe -custom -prop1 "Intel USB 3.0 eXtensible host controller" -prop2 "%PROPVER%"
GOTO EOF

:DIFFVER
if not "%Version32%"=="" (
SET PROPVER=%Version32% 
GOTO DIFFVER32
)
if not "%Version64%"=="" (
SET PROPVER=%Version64% 
GOTO DIFFVER64
)
GOTO NODRIVER

:DIFFVER32
echo maconfig.exe -custom -prop1 "Intel USB 3.0 eXtensible host controller" -prop2 "%Version32%"
maconfig.exe -custom -prop1 "Intel USB 3.0 eXtensible host controller" -prop2 "%Version32%"
GOTO EOF

:DIFFVER64
echo maconfig.exe -custom -prop1 "Intel USB 3.0 eXtensible host controller" -prop2 "%Version64%"
maconfig.exe -custom -prop1 "Intel USB 3.0 eXtensible host controller" -prop2 "%Version64%"
GOTO EOF

:NODRIVER
echo No Intel USB Driver Found
maconfig.exe -custom -prop1 "Intel USB 3.0 eXtensible host controller" -prop2 "Not Installed"

:EOF
echo.
exit /b