@echo off
setlocal

set "PASSWORD=MySecretPassword123"

:START
start "" powershell -ExecutionPolicy Bypass -File "%~dp0ShowBee.ps1"

:WAIT
tasklist | find /i "powershell.exe" >nul
if not errorlevel 1 (
    timeout /t 1 /nobreak >nul
    goto WAIT
)

:: Reopen immediately
start "" "%~f0"

:: Ask for password
set /p PASS=Enter password to stop:

if "%PASS%"=="%PASSWORD%" (
    taskkill /f /im powershell.exe >nul 2>&1
    exit
)

exit 
