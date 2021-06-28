@echo off

FOR /F "usebackq" %%X IN (
    `hostname`
) DO SET HOSTFILE=%%X\

mkdir C:\MAR_TEMP\
SET LogFile=C:\MAR_TEMP\%HOSTFILE%.log
call :WORDVER >%LogFile% 2>&1

:WORDVER
echo.
echo Created by Sinan Barghouthi McAfee Professional Services on 05/28/2019
echo McAfee Active Response - Word File MRU Retrieval %HOSTDIR% %DATE% %TIME%
echo Checking Microsoft Office Version
setlocal ENABLEDELAYEDEXPANSION
FOR /F "usebackq tokens=2,* skip=2" %%L IN (
    `reg query "HKEY_CLASSES_ROOT\Word.Application\CurVer"`
) DO SET WORDVER=%%M

if "%WORDVER%"=="Word.Application.16" (
SET USER_MRU_REGPATH=HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Word\User MRU
GOTO W16
)

if "%WORDVER%"=="Word.Application.15" (
SET FILE_MRU_REGPATH=HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\File MRU
GOTO W15
)

:W16
echo W16 Procedure Call
FOR /F "usebackq tokens=1,*" %%A IN (
    `reg query "%USER_MRU_REGPATH%" ^| find "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Word\User MRU\"`
) DO SET FILE_MRU_REGPATH=%%A %%B\File MRU

echo Final Query
FOR /F "usebackq tokens=1,* delims=*" %%X IN (
    `reg query "%FILE_MRU_REGPATH%" /v "Item 1"`
) DO SET WORD_FILE16=%%Y

GOTO EOF

:W15
echo W15 Procedure Call
FOR /F "usebackq tokens=1,*" %%A IN (
    `reg query "%FILE_MRU_REGPATH%" /v "Item 1"`
) DO SET WORD_FILE15=%%A %%B\File MRU

:EOF
echo.
exit /b
