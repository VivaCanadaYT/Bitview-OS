@echo off
title BitView OS 3.4
color 3F

set soundPath=C:\Windows\Media\tada.wav
set "userName=Admin"

:menu
cls
echo ============================
echo Welcome to BitView OS 3.4
echo ============================
echo Current User: %userName%
echo ============================
echo [1] Install Program
echo [2] View System Info
echo [3] User Accounts
echo [4] File Explorer
echo [5] Help
echo [6] Play Games
echo [7] Credits
echo [8] Run Command
echo [9] Shut Down
echo ============================
set /p choice=Choose an option:

if "%choice%"=="1" goto install
if "%choice%"=="2" goto sysinfo
if "%choice%"=="3" goto userAccounts
if "%choice%"=="4" goto fileExplorer
if "%choice%"=="5" goto help
if "%choice%"=="6" goto games
if "%choice%"=="7" goto credits
if "%choice%"=="8" goto runCommand
if "%choice%"=="9" goto shutdown
goto menu

:runCommand
cls
echo ============================
echo Run Command
echo ============================
echo Type a command to run:
echo (Type 'menu' to return, 'crash' for crash screen, or 'echo' for custom message)
echo ============================
set /p command=Enter command:

if /i "%command%"=="menu" goto menu
if /i "%command%"=="crash" goto crashScreen
if /i "%command%"=="echo" (
    set /p msg=Enter your message: 
    echo %msg%
    pause
    goto runCommand
)

:: Attempt to run any entered command
%command%
echo Command executed.
pause
goto runCommand

:crashScreen
color 4F
cls
echo ============================
echo BitView OS - CRITICAL ERROR
echo ============================
echo An unexpected error has occurred.
echo System must be restarted to continue.
echo ============================
echo Error Code: 0xB1TV1EW
echo Please restart your system.
echo ============================
echo (Press any key to return to menu)
pause >nul
color 3F
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
        echo "¡Felicidades! You've discovered a hidden message!"
        call :playSound
    ) else if %easterEggChance%==1 (
        echo "Nothing..."
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
echo OS Name: BitView OS 3.4
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
echo IT DOES NOT INSTALL FILES FROM YOUR COMPUTER THIS IS JUST A JOKE
echo I'm warning you, do not type magic, please :(
echo ============================
pause
goto menu

:games
cls
echo ============================
echo Welcome to BitView OS Games!
echo ============================
echo [1] Number Guessing Game
echo [2] Guess the Word Game
echo [3] Simple Math Quiz
echo [4] Back to Menu
set /p gameChoice=Choose a game:

if "%gameChoice%"=="1" goto numberGuessing
if "%gameChoice%"=="2" goto guessTheWord
if "%gameChoice%"=="3" goto simpleMathQuiz
if "%gameChoice%"=="4" goto menu
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
if /i "%guess%"=="magic" (
    echo "Easter Egg Activated! You can skip the game now."
    echo The number was %target%. Press any key to return to games.
    pause >nul
    goto games
)

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

:guessTheWord
cls
echo Guess the Word Game
echo ============================
setlocal enabledelayedexpansion
set wordList=apple banana cherry grape orange
set /a randIndex=%random% %% 5
set words[0]=apple
set words[1]=banana
set words[2]=cherry
set words[3]=grape
set words[4]=orange
set targetWord=!words[%randIndex%]!
set attempts=0
set maxAttempts=3

echo I have selected a fruit name. You have %maxAttempts% attempts to guess it!
echo Press 'X' at any time to exit.

:wordGuessLoop
set /p guess=Enter your guess: 
if /i "%guess%"=="X" goto games
if /i "%guess%"=="magic" (
    echo "Easter Egg Activated! The correct word was "%targetWord%"."
    pause
    goto games
)
set /a attempts+=1

if /i "%guess%"=="!targetWord!" (
    echo Congratulations! You guessed the word "%targetWord%" in %attempts% attempts.
    pause
    goto games
) else (
    echo Incorrect guess. You have !maxAttempts! - !attempts! attempts left.
)

if !attempts! geq %maxAttempts% (
    echo Sorry, you've run out of attempts. The correct word was "%targetWord%".
)

goto wordGuessLoop

:simpleMathQuiz
cls
echo Simple Math Quiz
echo ============================
set /a num1=%random% %% 10 + 1
set /a num2=%random% %% 10 + 1
set /a correctAnswer=num1 + num2
set attempts=0
set maxAttempts=3

echo What is the sum of %num1% and %num2%?
echo You have %maxAttempts% attempts to answer.
echo Press 'X' at any time to exit.

:mathQuizLoop
set /p answer=Your answer: 
if /i "%answer%"=="X" goto games
if /i "%answer%"=="magic" (
    echo "Easter Egg Activated! The correct answer was %correctAnswer%."
    pause
    goto games
)
set /a attempts+=1

if "%answer%"=="%correctAnswer%" (
    echo Correct! The answer is %correctAnswer%.
    pause
    goto games
) else (
    echo Incorrect answer. You have %maxAttempts% - %attempts% attempts left.
)

if %attempts% geq %maxAttempts% (
    echo Sorry, you've run out of attempts. The correct answer was %correctAnswer%.
    pause
    goto games
)

pause
goto games

:credits
cls
echo ============================
echo BitView OS Credits
echo ============================
echo Developed by: [vivacanadayt]
echo Special Thanks to: YOU!
echo ============================
pause
goto menu

:shutdown
cls
echo Shutting down...
ping -n 2 localhost >nul
echo Thank you for using BitView OS! See you next time!
ping -n 2 localhost >nul
exit
