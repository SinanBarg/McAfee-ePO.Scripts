@ECHO OFF 

sc stop scsrvc
sc delete scsrvc
sc delete swin 
"\Program files\Mcafee\Agent\x86\Mctray.exe" unloadplugin=scormcpl.dll 
del /Q "C:\WINDOWS\system32\drivers\swin.sys"
rmdir /S /Q "<volume>:\Solidcore"
rmdir /S /Q "C:\Program Files\McAfee\Solidcore"
rmdir /S /Q "\Documents and Settings\All Users\Start Menu\Programs\McAfee\Solidifier" 
rmdir /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\McAfee\Solidifier" 
rmdir /S /Q "C:\ProgramData\McAfee\Solidcore" 
reg delete "HKLM\SYSTEM\CurrentControlSet\services\swin" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\McAfee\Agent\Applications\SOLIDCOR5000_WIN" /f 
reg delete "HKLM\SOFTWARE\McAfee\Agent\Applications\SOLIDCOR5000_WIN" /f 
reg delete "HKLM\SOFTWARE\Network Associates\ePolicy Orchestrator\Application Plugins\SOLIDCOR5000_WIN" /f 
reg delete "HKLM\SOFTWARE\Wow6432Node\Network Associates\ePolicy Orchestrator\Application Plugins\SOLIDCOR5000_WIN" /f 
reg delete "HKLM\SOFTWARE\Classes\Installer\Features\4E9BD2348836F234A9BD168E87F25439" /f
reg delete "HKLM\SOFTWARE\Classes\Installer\Products\4E9BD2348836F234A9BD168E87F25439" /f
cd "C:\Program Files\McAfee\Agent\"
maconfig.exe -custom -prop1 "Solidcore Install Fix"
EXIT