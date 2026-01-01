@echo off
cls
color 0A
echo.
echo ============================================
echo    Setting Up Smart Auto-Start Monitor
echo ============================================
echo.
echo This will set up automatic monitor startup:
echo - Monitor starts automatically when EA creates trigger file
echo - No need to run monitor manually
echo - Works for both Strategy Tester and Live Trading
echo - Uses Windows Task Scheduler (runs every minute)
echo.
echo ============================================
echo.
echo Press any key to continue, or Ctrl+C to cancel...
pause >nul

echo.
echo Setting up smart auto-start...
echo.

REM Get the current script directory
set "SCRIPT_DIR=%~dp0"
set "MONITOR_SCRIPT=%SCRIPT_DIR%AUTO_START_MONITOR.ps1"
set "TASK_NAME=SMC_Dashboard_AutoStart"

REM Check if monitor script exists
if not exist "%MONITOR_SCRIPT%" (
    echo [ERROR] AUTO_START_MONITOR.ps1 not found!
    echo.
    echo Please make sure this file is in the same folder:
    echo %SCRIPT_DIR%
    echo.
    pause
    exit /b 1
)

echo Creating Windows Task Scheduler task...
echo.

REM Delete existing task if it exists
schtasks /Delete /TN "%TASK_NAME%" /F >nul 2>&1

REM Create new task that runs every minute (using current user - no admin needed)
schtasks /Create /TN "%TASK_NAME%" /TR "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File \"%MONITOR_SCRIPT%\"" /SC MINUTE /MO 1 /F >nul 2>&1

if %ERRORLEVEL% == 0 (
    echo.
    echo ============================================
    echo [SUCCESS] Setup Complete!
    echo ============================================
    echo.
    echo Smart auto-start has been configured!
    echo.
    echo HOW IT WORKS:
    echo - Task Scheduler checks every minute for trigger files
    echo - When EA creates trigger file, monitor starts automatically
    echo - Dashboard launches automatically
    echo - No manual steps needed!
    echo - Works after computer restart (Task Scheduler runs automatically)
    echo.
    echo WHAT HAPPENS NOW:
    echo 1. Start Strategy Tester or Live Trading
    echo 2. Attach EA with EnableDashboardExport=true
    echo 3. Monitor starts automatically (within 1 minute)
    echo 4. Dashboard opens automatically
    echo.
    echo AFTER COMPUTER RESTART:
    echo - Task Scheduler starts automatically with Windows
    echo - System continues monitoring for trigger files
    echo - Dashboard will launch automatically when you start EA
    echo.
    echo TO REMOVE AUTO-START LATER:
    echo - Run: REMOVE_AUTO_START_SMART.bat
    echo.
    echo ============================================
    echo.
) else (
    echo.
    echo [ERROR] Failed to create task scheduler entry.
    echo.
    echo Possible reasons:
    echo - Insufficient permissions (try running as Administrator)
    echo - Task Scheduler service not running
    echo.
    echo Please try running this script as Administrator:
    echo Right-click SETUP_AUTO_START_SMART.bat ^> Run as administrator
    echo.
    pause
    exit /b 1
)

echo Press any key to close...
pause >nul
