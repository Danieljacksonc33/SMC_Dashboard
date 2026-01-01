@echo off
echo ============================================
echo Dashboard Auto-Launch Monitor
echo ============================================
echo.

REM Check if monitor is already running
tasklist /FI "IMAGENAME eq powershell.exe" 2>nul | find /I "powershell.exe" >nul
if %ERRORLEVEL% == 0 (
    echo [INFO] PowerShell processes detected.
    echo The monitor might already be running.
    echo.
    echo To check, look for a PowerShell window monitoring triggers.
    echo.
)

echo Starting Dashboard Auto-Launch Monitor...
echo.
echo This will monitor for EA trigger files and automatically launch the dashboard.
echo.
echo Keep this window open to keep monitoring active.
echo Press Ctrl+C to stop monitoring.
echo.
echo ============================================
echo.

cd /d "%~dp0"
powershell -ExecutionPolicy Bypass -File "%~dp0AUTO_LAUNCH_DASHBOARD.ps1"

pause
