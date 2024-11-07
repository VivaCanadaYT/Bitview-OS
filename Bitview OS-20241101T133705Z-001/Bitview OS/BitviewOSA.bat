@echo off
title BitView OS Alpha
color 0A

:menu
cls
echo ============================
echo Welcome to BitView OS
echo ============================
echo [1] Install Program
echo [2] Shut Down
echo ============================
set /p choice=Choose an option:

if %choice%==1 goto install
if %choice%==2 goto shutdown
goto menu

:install
cls
echo Choose a program to install:
echo ============================
echo [1] Programs For The OS
echo [2] New Features
echo [3] The OS
echo ============================
set /p program=Select a program:

if %program%==1 (
    call :installProgram "Programs For The OS"
) else if %program%==2 (
    call :installProgram "New Features"
) else if %program%==3 (
    call :installProgram "The OS"
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
) else (
    echo %programName% installed successfully!
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

:sysinfo
cls
echo System Information
echo ============================
echo OS Name: BitView OS 1.5
echo Processor: SSE2
echo Memory: 4GB
echo ============================
echo ITS STILL ON UNDER CONSTRUTION SO THIS IS FOR TESTING PURPOSES ONLY!
pause
goto menu

:shutdown
cls
echo Shutting down...
ping -n 2 localhost >nul
echo Thank you for using The Bitview OS! See you next time! 
ping -n 2 localhost >nul
exit
