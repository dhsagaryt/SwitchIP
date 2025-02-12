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