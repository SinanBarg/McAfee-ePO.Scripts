@echo off

SET LogFile=C:\TEMP\Uninst_IntelDriver.log
call :UNINST_INTELDRIVER >%LogFile% 2>&1

:UNINST_INTELDRIVER
echo.
echo Created by Sinan Barghouthi McAfee Professional Services on 03/10/2017
echo McAfee UNINSTALL Intel Driver Script run at %DATE% %TIME%
echo Checking Intel Driver USB v3.0 eXtensible Host Controller Driver Version 2.5.0.19
setlocal ENABLEDELAYEDEXPANSION
FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{240C3DDD-C5E9-4029-9DF7-95650D040CF2}" /v DisplayVersion`
) DO SET Version32=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{240C3DDD-C5E9-4029-9DF7-95650D040CF2}" /v DisplayVersion`
) DO SET Version64=%%M

SET INTELDir32="C:\Program Files\Intel\Intel(R) USB 3.0 eXtensible Host Controller Driver\uninstall"
SET INTELDir64="C:\Program Files (x86)\Intel\Intel(R) USB 3.0 eXtensible Host Controller Driver\uninstall"

echo 32-Bit Driver Version %Version32%
echo 64-Bit Driver Version %Version64%
echo INTELDir32= %IntelDir32%
echo INTELDir64= %IntelDir64%

if "%Version32%"=="2.5.0.19" (
echo Enter Setup
SET SETUP=%INTELDir32%
GOTO SETUP
)
if "%Version64%"=="2.5.0.19" (
echo Enter Setup
SET SETUP=%INTELDir64% 
GOTO SETUP
)
:DIFFVER
if not "%Version32%"=="" (
SET PROPVER=%Version32% 
GOTO DIFFVER
)
if not "%Version64%"=="" (
SET PROPVER=%Version64% 
GOTO DIFFVER
)
GOTO NODRIVER

:SETUP
cd %SETUP%
setup.exe -uninstall -s
GOTO EOF

:DIFFVER
echo Different Intel Driver Version Found "%Version32%"
GOTO EOF

:NODRIVER
echo No Intel USB Driver Found
GOTO EOF

:EOF
echo.
exit /b