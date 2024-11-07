@echo off
title BitView OS 3.2
color 0A

set soundPath=C:\Windows\Media\tada.wav
set "userName=Admin"

:menu
cls
echo ============================
echo Welcome to BitView OS 3.2
echo ============================
echo Current User: %userName%
echo ============================
echo [1] Install Program
echo [2] View System Info
echo [3] User Accounts
echo [4] File Explorer
echo [5] Help
echo [6] Play Games
echo [7] Shut Down
echo ============================
set /p choice=Choose an option:

if "%choice%"=="1" goto install
if "%choice%"=="2" goto sysinfo
if "%choice%"=="3" goto userAccounts
if "%choice%"=="4" goto fileExplorer
if "%choice%"=="5" goto help
if "%choice%"=="6" goto games
if "%choice%"=="7" goto shutdown
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
        echo hola amigos
        call :playSound
    )
)

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
echo OS Name: BitView OS 3.2
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
echo Some Features May Not Work
echo There is an easter egg in the installation part
echo It's made with Notepad
echo IT DOES NOT INSTALL FILE FROM YOUR COMPUTER THIS IS JUST ONLY A JOKE
echo ============================
pause
goto menu

:games
cls
echo ============================
echo Welcome to BitView OS Games!
echo ============================
echo [1] Number Guessing Game
echo [2] Rock-Paper-Scissors
echo [3] Back to Menu
set /p gameChoice=Choose a game:

if "%gameChoice%"=="1" goto numberGuessing
if "%gameChoice%"=="2" goto rockPaperScissors
if "%gameChoice%"=="3" goto menu
goto games

:numberGuessing
cls
echo Number Guessing Game
echo ============================
set /a target=%random% %% 100 + 1
set attempts=0

echo I have selected a number between 1 and 100. Try to guess it!
echo Press 'X' at any time to exit.

:guessLoop
set /p guess=Enter your guess: 
if /i "%guess%"=="X" goto games
set /a attempts+=1

if "%guess%"=="" (
    echo Please enter a number!
    goto guessLoop
)

if %guess% lss %target% (
    echo Too low! Try again.
) else if %guess% gtr %target% (
    echo Too high! Try again.
) else (
    echo Congratulations! You guessed the number %target% in %attempts% attempts.
    pause
    goto games
)

goto guessLoop

:rockPaperScissors
cls
echo Rock-Paper-Scissors Game
echo ============================
echo Choose Rock, Paper, or Scissors (or press 'X' to exit): 
set /p userChoice=

if /i "%userChoice%"=="X" goto games

set /a computerChoice=%random% %% 3

if /i "%userChoice%"=="Rock" (
    set choice=0
) else if /i "%userChoice%"=="Paper" (
    set choice=1
) else if /i "%userChoice%"=="Scissors" (
    set choice=2
) else (
    echo Invalid choice! Try again.
    pause
    goto games
)

if %computerChoice%==0 (
    set computerChoiceStr=Rock
) else if %computerChoice%==1 (
    set computerChoiceStr=Paper
) else (
    set computerChoiceStr=Scissors
)

echo You chose: %userChoice%
echo Computer chose: %computerChoiceStr%

if %choice%==%computerChoice% (
    echo It's a tie!
) else if %choice%==0 if %computerChoice%==2 (
    echo You win!
) else if %choice%==1 if %computerChoice%==0 (
    echo You win!
) else if %choice%==2 if %computerChoice%==1 (
    echo You win!
) else (
    echo You lose!
)

pause
goto games

:shutdown
cls
echo Shutting down...
ping -n 2 localhost >nul
echo Thank you for using The BitView OS! See you next time!
ping -n 2 localhost >nul
exit
