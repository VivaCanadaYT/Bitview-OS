@echo off
title BitView OS 2.0
color 0A

set soundPath=C:\Windows\Media\tada.wav
:menu
cls
echo ============================
echo Welcome to BitView OS 2.0
echo ============================
echo [1] Install Program
echo [2] View System Info
echo [3] Shut Down
echo ============================
set /p choice=Choose an option:

if %choice%==1 goto install
if %choice%==2 goto sysinfo
if %choice%==3 goto shutdown
goto menu

:install
cls
echo Choose a program to install:
echo ============================
echo [1] Programs For The OS
echo [2] New Features
echo [3] The OS
echo [4] Bonus Tools
echo ============================
set /p program=Select a program:

if %program%==1 (
    call :installProgram "Programs For The OS"
) else if %program%==2 (
    call :installProgram "New Features"
) else if %program%==3 (
    call :installProgram "The OS"
) else if %program%==4 (
    call :installProgram "Bonus Tools"
) else (
    echo Invalid selection!
    pause
    goto install
)

:installProgram
set programName=%~1
cls
echo Setup is starting for %programName%...
ping -n 2 localhost >nul
echo Installing %programName%...
echo Please wait...
call :loading 5
set /a errorChance=%random% %% 10
if %errorChance%==0 (
    echo Error: Installation of %programName% failed!
    call :playSound
) else (
    echo %programName% installed successfully!
    call :playSound
)
pause
goto menu

:loading
setlocal
set /a total=20
for /L %%i in (1,1,%total%) do (
    set /p "=# " <nul
    ping -n 1 localhost >nul
)
echo.
endlocal
goto :eof

:playSound

powershell -c (New-Object Media.SoundPlayer "%soundPath%").PlaySync();
goto :eof

:sysinfo
cls
echo System Information
echo ============================
echo OS Name: BitView OS 2.0
echo Processor: SSE2
echo Memory: 4GB
echo ============================
echo This Setup has been finished and its no longer under construcion!
pause
goto menu

:shutdown
cls
echo Shutting down...
ping -n 2 localhost >nul
echo Thank you for using The BitView OS! See you next time! 
ping -n 2 localhost >nul
exit
