@echo off

:SYMANTEC_UNINST
echo.
echo Created by Sinan Barghouthi McAfee Professional Services on 02/10/2017
echo McAfee Symantec Verification Script run at %DATE% %TIME%
echo Checking Installed Symantec Version

setlocal ENABLEDELAYEDEXPANSION
FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{358ADFAB-4EA2-481E-8828-5AF10FB0FC8E}" /v DisplayVersion`
) DO SET DisplayVersion=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{8097EE64-FDE1-409A-B25D-3DFD862871E1}" /v DisplayVersion`
) DO SET DisplayVersion=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{B53661DC-CD94-4B14-B15F-D9DDCFF72558}" /v DisplayVersion`
) DO SET DisplayVersion=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{18F87B39-E281-4228-B83D-627FFC77A466}" /v DisplayVersion`
) DO SET DisplayVersion=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C02FF081-3B1D-47BA-AA68-37D0EA4B75C5}" /v DisplayVersion`
) DO SET DisplayVersion=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{78BC019C-656D-4458-A860-6977AA85049A}" /v DisplayVersion`
) DO SET DisplayVersion=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{3DCB7A99-79F6-4FC5-93F4-55DB5D275F12}" /v DisplayVersion`
) DO SET DisplayVersion=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C2103AF2-E66C-446B-9791-9207840EC821}" /v DisplayVersion`
) DO SET DisplayVersion=%%M

FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{2F160D9A-8222-413B-B3A4-E3A3105F3991}" /v DisplayVersion`
) DO SET DisplayVersion=%%M

if "%DisplayVersion%"=="14.0.1904.0000" (
GOTO Uninstall_14.0.1904.0000
)

if "%DisplayVersion%"=="12.1.7004.6500" (
GOTO Uninstall_12.1.7004.6500
)

if "%DisplayVersion%"=="12.1.4013.4013" (
GOTO Uninstall_12.1.4013.4013
)

if "%DisplayVersion%"=="12.1.6168.6000" (
GOTO Uninstall_12.1.6168.6000
)

if "%DisplayVersion%"=="12.1.3001.165" (
GOTO Uninstall_12.1.3001.165
)

if "%DisplayVersion%"=="12.1.4112.4156" (
GOTO Uninstall_12.1.4112.4156
)

if "%DisplayVersion%"=="14.0.2415.0200" (
GOTO Uninstall_14.0.2415.0200
)

if "%DisplayVersion%"=="12.1.2015.2015" (
GOTO Uninstall_12.1.2015.2015
)

if "%DisplayVersion%"=="12.1.5337.5000" (
GOTO Uninstall_12.1.5337.5000
)

:Uninstall_14.0.1904.0000
msiexec.exe /x{8097EE64-FDE1-409A-B25D-3DFD862871E1} /passive /norestart
GOTO EOF

:Uninstall_12.1.7004.6500
msiexec.exe /x{358ADFAB-4EA2-481E-8828-5AF10FB0FC8E} /passive /norestart
GOTO EOF

:Uninstall_12.1.4013.4013
msiexec.exe /x{B53661DC-CD94-4B14-B15F-D9DDCFF72558} /passive /norestart
GOTO EOF

:Uninstall_12.1.6168.6000
msiexec.exe /x{18F87B39-E281-4228-B83D-627FFC77A466} /passive /norestart
GOTO EOF

:Uninstall_12.1.3001.165
msiexec.exe /x{C02FF081-3B1D-47BA-AA68-37D0EA4B75C5} /passive /norestart
GOTO EOF

:Uninstall_12.1.4112.4156
msiexec.exe /x{78BC019C-656D-4458-A860-6977AA85049A} /passive /norestart
GOTO EOF

:Uninstall_14.0.2415.0200
msiexec.exe /x{3DCB7A99-79F6-4FC5-93F4-55DB5D275F12} /passive /norestart
GOTO EOF

:Uninstall_12.1.2015.2015
msiexec.exe /x{C2103AF2-E66C-446B-9791-9207840EC821} /passive /norestart
GOTO EOF

:Uninstall_12.1.5337.5000
msiexec.exe /x{2F160D9A-8222-413B-B3A4-E3A3105F3991} /passive /norestart
GOTO EOF

GOTO EOF

:EOF
echo.
exit /b