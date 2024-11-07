@echo off
title BitView OS 3.0
color 0A

set soundPath=C:\Windows\Media\tada.wav
set "userName=Admin"

:menu
cls
echo ============================
echo Welcome to BitView OS 3.0
echo ============================
echo Current User: %userName%
echo ============================
echo [1] Install Program
echo [2] View System Info
echo [3] User Accounts
echo [4] File Explorer
echo [5] Help
echo [6] Shut Down
echo ============================
set /p choice=Choose an option:

if "%choice%"=="1" goto install
if "%choice%"=="2" goto sysinfo
if "%choice%"=="3" goto userAccounts
if "%choice%"=="4" goto fileExplorer
if "%choice%"=="5" goto help
if "%choice%"=="6" goto shutdown
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

if "%program%"=="1" (
    call :installProgram "Programs For The OS"
) else if "%program%"=="2" (
    call :installProgram "New Features"
) else if "%program%"=="3" (
    call :installProgram "The OS"
) else if "%program%"=="4" (
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
set /a easterEggChance=%random% %% 5

if %errorChance%==0 (
    echo Error: Installation of %programName% failed!
    call :playSound
) else (
    echo %programName% installed successfully!
    call :playSound
    if %easterEggChance%==0 (
        echo hola amigo!
        call :playSound
    )
)

:: Pause here to allow user to read the message before returning to the menu
echo.
echo Press any key to continue...
pause >nul
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
echo OS Name: BitView OS 3.0
echo Processor: SSE2
echo Memory: 5GB
echo ============================
pause
goto menu

:userAccounts
cls
echo User Accounts Management
echo ============================
echo Current User: %userName%
echo ============================
echo [1] Change User
echo [2] Back to Menu
set /p accountChoice=Choose an option:

if "%accountChoice%"=="1" (
    set /p newUserName=Enter new user name: 
    set "userName=%newUserName%"
    echo User name changed to %userName%.
    pause
) else (
    goto menu
)
goto userAccounts

:fileExplorer
cls
echo Simulating File Explorer...
echo ============================
echo [1] Open Documents
echo [2] Open Downloads
echo [3] Back to Menu
set /p explorerChoice=Choose a directory:

if "%explorerChoice%"=="1" (
    echo Opening Documents...
    timeout /t 2 >nul
) else if "%explorerChoice%"=="2" (
    echo Opening Downloads...
    timeout /t 2 >nul
) else (
    goto menu
)
goto fileExplorer

:help
cls
echo Help Section
echo ============================
echo This is a simulation of BitView OS.
echo Some Features May Not work
echo It's made with Notepad
echo There is also an Easter Egg when you install some stuff
echo IT DOES NOT INSTALL IT FILES ON YOUR COMPUTER, THIS IS JUST A JOKE!
echo ============================
pause
goto menu

:shutdown
cls
echo Shutting down...
ping -n 2 localhost >nul
echo Thank you for using The BitView OS! See you next time!
ping -n 2 localhost >nul
exit
