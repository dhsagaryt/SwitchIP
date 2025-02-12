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