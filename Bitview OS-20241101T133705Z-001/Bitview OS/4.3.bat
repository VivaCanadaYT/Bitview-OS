@echo off
title BitView OS 4.3
color 1F

:startScreen
cls
echo ========================================================
echo                    Welcome to BitView OS 
echo                 An Batch-Based Operating System
echo ========================================================
echo.
echo Developed by [vivacanadayt] or ThatGamingUser
echo.
echo Starting up...
timeout /t 4 >nul
goto signOn

set soundPath=C:\Windows\Media\tada.wav
set "userName=Admin"

:signOn
cls
echo ============================
echo BitView OS
echo ============================
set /p userName=Please enter your username: 
if "%userName%"=="" (
    echo Username cannot be blank. Please try again.
    pause
    goto signOn
)
echo Hello, %userName%! Signing you in...
ping -n 2 localhost >nul
goto menu

:menu
cls
echo ============================
echo Welcome to BitView OS 4.3
echo ============================
echo Current User: %userName%
echo ============================
echo [1] Apps
echo [2] View System Info
echo [3] User Accounts
echo [4] File Explorer
echo [5] Help
echo [6] Play Games
echo [7] Credits
echo [8] Run Command
echo [9] Settings
echo [10] Utilities
echo [11] Go Back to the Legacy Version
echo [12] Activate Bitview OS
echo [13] Power Options
echo ============================
set /p choice=Choose an option:

if "%choice%"=="1" goto apps
if "%choice%"=="2" goto sysinfo
if "%choice%"=="3" goto userAccounts
if "%choice%"=="4" goto fileExplorer
if "%choice%"=="5" goto help
if "%choice%"=="6" goto games
if "%choice%"=="7" goto credits
if "%choice%"=="8" goto runCommand
if "%choice%"=="9" goto settings
if "%choice%"=="10" goto utilities
if "%choice%"=="11" goto restoreSetup
if "%choice%"=="12" goto activateOs
if "%choice%"=="13" goto powerOptions
goto menu

:activateOs
cls
echo ====================
echo Activate Bitview OS
echo ====================
echo ------------------------                        
echo The Activation Key Example :
echo BITOS-1234567890-12345
echo ------------------------                           
echo Use the Random Key if you want it will be activated!
echo You can replace the key if you want
echo Also, You dont really need to activated but still
echo Use it if you want to
echo --------------------------------------------------                             
set /p command=Enter Key:

if /i "%command%"=="" goto activatEd

:activatEd
cls
echo Activated!
echo You can go back to the main menu in few secounds
timeout /t 5 >nul
goto menu


:restoreSetup
cls
echo ============================
echo Restoring Setup...
echo ============================
echo This will revert the OS to its under contruction setup version
echo You can go back to the recent version later if you want to 
echo MAKE SURE THAT YOU HAVE THE 1.0 VERSION INSTALLED, OTHERWISE IT WONT WORK
echo Are you sure you want to continue? (Y/N)
set /p confirm=Choice:

if /i "%confirm%"=="Y" (
    cls
    echo Restoring to legacy version...
    timeout /t 2 >nul
    start /wait Bitview_OS.bat
    exit
) else (
    goto menu
)


:sysinfo
cls
echo ============================
echo System Information
echo ============================
echo OS Name: BitView OS 4.3
echo Processor: SSE2 Compatible Processor
echo Memory: 5GB RAM
echo Storage: 256GB
echo Date: %date%
echo Time: %time%
echo ============================
echo Press any key to return to the main menu...
pause >nul
goto menu


:runCommand
cls
echo ============================
echo Run Command
echo ============================
echo Type a command to run:
echo (Type 'menu' to return, 'crash' to trigger crash screen)
echo Commnands: 'echo', 'date', 'time', 'calc', 'clear', 'crash2'
echo New Command: bitvivit and instantShutdown
echo ============================
set /p command=Enter command:

if /i "%command%"=="menu" goto menu
if /i "%command%"=="crash" goto crashScreen
if /i "%command%"=="crash2" goto crashScreen2
if /i "%command%"=="bitvivit" goto bitvivit
if /i "%command%"=="instantShutdown" goto instantshutdown
if /i "%command%"=="clear" cls & goto runCommand
if /i "%command%"=="date" (
    echo Today's date is:
    date /t
    pause
    goto runCommand
)
if /i "%command%"=="time" (
    echo Current time is:
    time /t
    pause
    goto runCommand
)
if /i "%command%"=="echo" (
    set /p echoMessage=Type a message: 
    echo %echoMessage%
    pause
    goto runCommand
)
if /i "%command%"=="calc" (
    start calc
    goto runCommand
)

:: Attempt to run any entered command and check for errors
%command% || (
    echo.
    echo Command failed to execute.
    pause
)
goto runCommand

:instantShutdown
cls
echo ============================
echo Your system is about to shut down in 10 seconds...
echo ============================
timeout /t 10 >nul
goto shutdown

:settings
cls
echo ============================
echo Settings
echo ============================
echo [1] Change Display Color
echo [2] Back to Menu
echo ============================
set /p settingsChoice=Choose an option:

if "%settingsChoice%"=="1" goto changeColor
if "%settingsChoice%"=="2" goto menu
goto settings

:changeColor
cls
echo ============================
echo [1] Blue and White [Default]
echo [2] Black and Green [Legacy]
echo [3] Red and White
echo [4] Yellow
echo [5] Cyan and Black
echo [6] Purple and Black
echo [7] White
echo ===========================
set /p colorChoice=Enter color option:

if "%colorChoice%"=="1" color 3F
if "%colorChoice%"=="2" color 0A
if "%colorChoice%"=="3" color 4F
if "%colorChoice%"=="4" color 6E
if "%colorChoice%"=="5" color 0B
if "%colorChoice%"=="6" color 50
if "%colorChoice%"=="7" color F0

echo Color changed! Returning to Settings.
pause
goto settings

:utilities
cls
echo ============================
echo Utilities
echo ============================
echo [1] Open Calculator
echo [2] Open Notepad
echo [3] Disk Check
echo [4] MSPaint
echo [5] Regedit
echo [6] CMD
echo [7] Back to Menu
echo ============================
set /p utilityChoice=Choose a utility:

if "%utilityChoice%"=="1" start calc & goto utilities
if "%utilityChoice%"=="2" start notepad & goto utilities
if "%utilityChoice%"=="3" (
    echo Running Disk Check...
    chkdsk
    pause
    goto utilities
)
if "%utilityChoice%"=="4" (
    echo Opening MS Paint...
    start mspaint

) else if "%utilityChoice%"=="5" (
    echo Opening Registry Editor...
    start regedit

) else if "%utilityChoice%"=="6" (
    echo Opening CMD...
    start cmd

) else (
    goto menu
)
if "%utilityChoice%"=="7" goto menu
goto utilities

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
echo (or Press any key to return to menu)
pause >nul
color 3F
goto menu

:crashScreen2
color 0C
cls
echo ============================
echo BitView OS - KERNEL PANIC
echo ============================
echo An unexpected error has occurred.
echo System must be restarted to continue.
echo ============================
echo Error Code: 0x0000006A
echo Please restart your system.
echo ============================
echo (or Press any key to return to menu)
pause >nul
color 3F
goto menu
pause >nul
color 3F
goto startScreen

:bitvivit
color 4F
cls
echo ============================
echo BitView OS - THIRD PARTY FILE SYSTEM_ AILURE
echo ============================
echo An unexpected error has occurred.
echo System must be restarted to continue.
echo ============================
echo Error Code: 0x000000H2
echo Please restart your system.
echo ============================
echo (or Press any key to return to menu)
pause >nul
color 3F
goto menu

goto runCommand
:apps
cls
echo ============================
echo BitView OS Apps
echo ============================
echo [1] BitCalc
echo [2] BitTimer
echo [3] BitColor
echo [4] BitNote
echo [5] Back to Menu
echo ============================
set /p appChoice=Choose an app:

if "%appChoice%"=="1" goto bitcalc
if "%appChoice%"=="2" goto bittimer
if "%appChoice%"=="3" goto bitcolor
if "%appChoice%"=="4" goto bitnote
if "%appChoice%"=="5" goto menu
goto apps

:bitcalc
cls
echo ============================
echo BitCalc - Simple Calculator
echo ============================
set /p calculation=Enter calculation (e.g., 2+2):
set /a result=%calculation%
echo Result: %result%
pause
goto apps

:bittimer
cls
echo ============================
echo BitTimer - Simple Timer App
echo ============================
set /p timerDuration=Enter duration in seconds: 

echo Timer started for %timerDuration% seconds...
for /L %%i in (%timerDuration%,-1,1) do (
    echo %%i seconds remaining...
    timeout /t 1 >nul
)
echo Time's up!
pause
goto apps

:bitcolor
cls
echo ============================
echo BitColor - Simple Color Picker
echo ============================
echo Choose a color:
echo [1] Red
echo [2] Green
echo [3] Blue
echo [4] Yellow
echo [5] Back to Apps
set /p colorChoice=Choose an option:

if "%colorChoice%"=="1" (
    color 4F
    echo You selected Red!
) else if "%colorChoice%"=="2" (
    color 2F
    echo You selected Green!
) else if "%colorChoice%"=="3" (
    color 1F
    echo You selected Blue!
) else if "%colorChoice%"=="4" (
    color 6F
    echo You selected Yellow!
) else if "%colorChoice%"=="5" goto apps
goto bitcolor

:bitnote
cls
echo ============================
echo BitNote - Simple Notes App
echo ============================
set "notesFile=notes.txt"

:noteMenu
echo [1] Create New Note
echo [2] View Notes
echo [3] Back to Apps
set /p noteChoice=Choose an option:

if "%noteChoice%"=="1" (
    set /p noteInput=Enter your note: 
    echo %noteInput% >> %notesFile%
    echo Note saved.
    pause
    goto noteMenu
)
if "%noteChoice%"=="2" (
    cls
    echo ============================
    echo Your Notes:
    echo ============================
    type %notesFile%
    echo ============================
    pause
    goto noteMenu
)
if "%noteChoice%"=="3" goto apps
goto noteMenu


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
echo and can be have some bugs
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
echo Developed by: [vivacanadayt] or ThatGamingUser
echo Special Thanks to: YOU!
echo ============================
pause
goto menu

:powerOptions
cls
echo ============================
echo         Power Options
echo ============================
echo [1] Shutdown
echo [2] Restart
echo [3] Hibernate
echo [4] Sign Off
echo [5] Enable Safe Mode
echo [6] Back to Menu
echo ============================
set /p powerChoice=Choose an option:

if "%powerChoice%"=="1" goto shutdown
if "%powerChoice%"=="2" goto restart
if "%powerChoice%"=="3" goto hibernate
if "%powerchoice%"=="4" goto signOff
if "%powerChoice%"=="5" goto safeMode
if "%powerChoice%"=="6" goto menu
goto powerOptions

:safeMode
cls
echo =================
echo Enable Safe Mode
echo =================
echo Are you sure about this?
echo You can go back to regular mode by reopening the batch file
echo Are you sure you want to enable safe mode? (Y/N)
set /p confirm=Choice:

if /i "%confirm%"=="Y" (
    cls
    echo Restarting to Safe Mode
    timeout /t 2 >nul
    goto startSafe
) else (
    goto menu
)



:startSafe
cls
echo ========================================================
echo                 Welcome to BitView OS Safe Mode
echo                 A Batch-Based Operating System
echo ========================================================
echo.
echo Developed by [vivacanadayt] or ThatGamingUser
echo.
echo Starting up...
timeout /t 2 >nul
goto menuSafe

:menuSafe
cls
echo ============================
echo Welcome to BitView OS Safe Mode
echo ============================
echo Current User: %userName%
echo ============================
echo [1] Apps
echo [2] View System Info
echo [3] Play Games
echo [4] Run Command
echo [5] Settings
echo [6] Power Options
echo ============================
set /p choice=Choose an option:

if "%choice%"=="1" goto apps
if "%choice%"=="2" goto userAccounts
if "%choice%"=="3" goto games
if "%choice%"=="4" goto runCommand
if "%choice%"=="5" goto settings
if "%choice%"=="6" goto powerOptions

:signOff
cls
echo ============================
echo Signing off %userName%...
echo ============================
timeout /t 2 >nul
set userName=
goto signOn

:shutdown
cls
color 07
echo ============================
echo       Shutting Down...
echo ============================
echo BitView OS is powering off.
echo Please wait...
timeout /t 3 >nul
cls
color 07
echo ============================
echo       BitView OS 
echo       has shut down.
echo ============================
echo It is now safe to close the window.
timeout /t 20 >nul
exit


:restart
cls
echo Restarting BitView OS...
timeout /t 2 >nul
goto startScreen

:hibernate
cls
echo Hibernating BitView OS...
timeout /t 2 >nul
echo System is now in hibernation.
timeout /t 2 >nul
echo.
pause >nul
goto resume

:resume
cls
echo Press Any Key to Resume Bitview OS
timeout /t 1 >nul
pause >nul
goto menu

:startScreen
cls
echo ========================================================
echo                   Welcome to BitView OS 
echo                 A Batch-Based Operating System
echo ========================================================
echo.
echo Developed by [vivacanadayt] or ThatGamingUser
echo.
echo Starting up...
timeout /t 2 >nul
goto menu