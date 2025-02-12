@echo off

:: Default Variable
Set "autName=Sagar Mondal"
Set "proName=SwitchIP"
Set "proVer=2.3"

title %proName% %proVer% by %autName%

chcp 65001 > nul
cls

:: Program File Check!!
IF NOT "%~n0"=="%proName% %proVer%" (
    ECHO Incorrect Namespace! This program made by %autName%".
    ECHO Exiting...
    pause
    exit
)

set logfile=%USERPROFILE%\Desktop\SWITCHIP-[%date%].log
echo Starting SwitchIP At Time [%date%] [%time%] >> %logfile%

goto bnr
pause

:bnr
echo.
echo  [33m███████[0m╗[33m██[0m╗    [33m██[0m╗[33m██[0m╗[33m████████[0m╗ [33m██████[0m╗[33m██[0m╗  [33m██[0m╗[33m██[0m╗[33m██████[0m╗ 
echo  [33m██[0m╔════╝[33m██[0m║    [33m██[0m║[33m██[0m║╚══[33m██[0m╔══╝[33m██[0m╔════╝[33m██[0m║  [33m██[0m║[33m██[0m║[33m██[0m╔══[33m██[0m╗
echo  [33m███████[0m╗[33m██[0m║ [33m█[0m╗ [33m██[0m║[33m██[0m║   [33m██[0m║   [33m██[0m║     [33m███████[0m║[33m██[0m║[33m██████[0m╔╝
echo  ╚════[33m██[0m║[33m██[0m║[33m███[0m╗[33m██[0m║[33m██[0m║   [33m██[0m║   [33m██[0m║     [33m██[0m╔══[33m██[0m║[33m██[0m║[33m██[0m╔═══╝ 
echo  [33m███████[0m║╚[33m███[0m╔[33m███[0m╔╝[33m██[0m║   [33m██[0m║   ╚[33m██████[0m╗[33m██[0m║  [33m██[0m║[33m██[0m║[33m██[0m║ [92m%proVer%[0m
echo  ╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚═╝╚═╝     
echo.
echo  [94mThis tool will attempt to fix common network issues by[0m
echo  [94mresetting the IP configuration and clearing DNS.[0m
echo.

:OptMenu1
CHOICE /N /C:YN /M "[96m   [0m Do You Really Want To SwitchIP? [[96mY[0m/[96mN[0m]:"%1
:: Handle user input
IF ERRORLEVEL ==2 echo. & GOTO Endxit
IF ERRORLEVEL ==1 GOTO BasicOpt
goto OptMenu1



REM =====================================
REM	== Basic Option ======================
REM =====================================
:BasicOpt
cls
echo.
echo. >> %logfile%

:: Step 1: Flush DNS Cache
echo Step 1: Flush DNS Cache >> %logfile%
ipconfig /flushdns >> %logfile%
if %errorlevel% NEQ 0 (
    echo ❌ ERROR: Failed to flush DNS cache!
    echo ℹ️  Possible Fix: Try running this script as Administrator.
    rem goto end
) else (
    echo [92m✅[0m DNS cache cleared! This fixes website loading problems.
)
echo.
echo. >> %logfile%

:: Step 2: Release IP Address
echo Step 2: Release IP Address >> %logfile%
ipconfig /release >> %logfile%
if %errorlevel% NEQ 0 (
    echo ❌ ERROR: Failed to release IP address!
    echo ℹ️  Possible Fix: Ensure you are connected to a network.
    rem goto end
) else (
    echo [92m✅[0m IP address released! Disconnecting from the network.
)
echo.
echo. >> %logfile%

:: Wait Time Gap!!
TIMEOUT /T 5 /NOBREAK > nul

:: Step 3: Renew IP Address
echo Step 3: Renew IP Address >> %logfile%
ipconfig /renew >> %logfile%
if %errorlevel% NEQ 0 (
    echo ❌ ERROR: Failed to renew IP address!
    echo ℹ️  Possible Fix: Restart your router and try again.
    rem goto end
) else (
    echo [92m✅[0m New IP address assigned! Reconnecting to the network.
)
echo.
echo. >> %logfile%

:: Step 4: Re-Flush DNS Cache
echo Step 4: Re-Flush DNS Cache >> %logfile%
ipconfig /flushdns >> %logfile%
if %errorlevel% NEQ 0 (
    echo ❌ ERROR: Failed to Re-flush DNS cache!
    echo ℹ️  Possible Fix: Try running this script as Administrator.
    rem goto end
) else (
    echo [92m✅[0m DNS cache Re-cleared! For Ensure!
)
echo.
echo. >> %logfile%

:: Play Sound Alert
powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\notify.wav").PlaySync()
echo Detail Log File Location At: [93m%logfile%[0m
echo.
echo. >> %logfile%
goto OptMenu2

:OptMenu2
CHOICE /N /C:YN /M "[96m   [0m Run Advanced SwitchIP? [[96mY[0m/[96mN[0m]:"%1
:: Handle user input
IF ERRORLEVEL ==2 echo. & GOTO Endxit
IF ERRORLEVEL ==1 GOTO AdvOpt
goto OptMenu2