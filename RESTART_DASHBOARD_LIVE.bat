@echo off
echo ============================================
echo Restarting Dashboard Server (Live Trading)
echo ============================================
echo.

REM Kill any existing Python servers on port 8000
echo Stopping any existing Python servers...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8000 ^| findstr LISTENING') do (
    taskkill /F /PID %%a >nul 2>&1
)
timeout /t 2 /nobreak >nul

REM Set MT4 Files folder path
set "FILES_FOLDER=%APPDATA%\MetaQuotes\Terminal\7E6C4A6F67D435CAE80890D8C1401332\MQL4\Files"

echo Changing to MQL4 Files folder...
cd /d "%FILES_FOLDER%"

echo.
echo Starting Python web server on port 8000...
echo.

REM Check for auto-launch trigger file
if exist "LAUNCH_DASHBOARD_LIVE.trigger" (
    echo Auto-launch trigger detected! Dashboard will open automatically...
    echo.
    del "LAUNCH_DASHBOARD_LIVE.trigger" >nul 2>&1
    set AUTO_LAUNCH=1
) else (
    set AUTO_LAUNCH=0
)

REM Start Python server in background and wait a moment
start /min cmd /c "python -m http.server 8000 2>nul || python3 -m http.server 8000 2>nul"
timeout /t 2 /nobreak >nul

REM Auto-launch browser if trigger was detected
if "%AUTO_LAUNCH%"=="1" (
    echo Opening dashboard in browser...
    start http://localhost:8000/dashboard.html
    echo.
    echo Dashboard opened automatically!
    echo.
) else (
    echo Once started, open this URL in your browser:
    echo http://localhost:8000/dashboard.html
    echo.
)

echo Press Ctrl+C to stop the server
echo.

REM Keep server running in foreground
python -m http.server 8000 2>nul
if errorlevel 1 (
    python3 -m http.server 8000 2>nul
    if errorlevel 1 (
        echo.
        echo ERROR: Python not found!
        echo.
        echo Please install Python from: https://www.python.org/downloads/
        echo.
        pause
    )
)
