@echo off
cls
color 0A
echo.
echo ============================================
echo    Setting Up Smart Auto-Start Monitor
echo    (No Admin Required)
echo ============================================
echo.
echo This will set up automatic monitor startup:
echo - Monitor starts automatically when EA creates trigger file
echo - No need to run monitor manually
echo - Works for both Strategy Tester and Live Trading
echo - Uses Windows Startup folder (no admin needed)
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
set "STARTUP_SCRIPT=%SCRIPT_DIR%START_MONITOR_ON_BOOT.ps1"

REM Get the Startup folder path
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "LAUNCHER_VBS=%STARTUP_FOLDER%\SMC_Dashboard_Smart_Monitor.vbs"

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

REM Create a PowerShell script that runs the monitor checker in a loop
echo Creating startup monitor script...
(
echo # Smart Monitor Starter - Runs on Windows Boot
echo # This script continuously checks for trigger files and starts monitor if needed
echo.
echo $SCRIPT_DIR = "%SCRIPT_DIR%"
echo $MONITOR_SCRIPT = Join-Path $SCRIPT_DIR "AUTO_START_MONITOR.ps1"
echo.
echo # Run the auto-start monitor checker every 30 seconds
echo while ^($true^) {
echo     Start-Sleep -Seconds 30
echo     if ^(Test-Path $MONITOR_SCRIPT^) {
echo         powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File $MONITOR_SCRIPT
echo     }
echo }
) > "%STARTUP_SCRIPT%"

REM Create VBScript launcher for Startup folder
echo Creating startup launcher...
(
echo Set WshShell = CreateObject^("WScript.Shell"^)
echo WshShell.Run "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File ""%STARTUP_SCRIPT%""", 0
echo Set WshShell = Nothing
) > "%LAUNCHER_VBS%"

if exist "%LAUNCHER_VBS%" (
    echo.
    echo ============================================
    echo [SUCCESS] Setup Complete!
    echo ============================================
    echo.
    echo Smart auto-start has been configured!
    echo.
    echo HOW IT WORKS:
    echo - Monitor checker runs automatically on Windows boot
    echo - Checks every 30 seconds for trigger files
    echo - When EA creates trigger file, monitor starts automatically
    echo - Dashboard launches automatically
    echo - No manual steps needed!
    echo - Works after computer restart
    echo.
    echo WHAT HAPPENS NOW:
    echo 1. Start Strategy Tester or Live Trading
    echo 2. Attach EA with EnableDashboardExport=true
    echo 3. Monitor starts automatically (within 30 seconds)
    echo 4. Dashboard opens automatically
    echo.
    echo TO START IT IMMEDIATELY (without restarting Windows):
    echo - Double-click: START_AUTO_LAUNCH.bat
    echo   OR
    echo - Restart your computer (monitor will start automatically)
    echo.
    echo TO REMOVE AUTO-START LATER:
    echo - Run: REMOVE_AUTO_START_SMART_NO_ADMIN.bat
    echo.
    echo ============================================
    echo.
) else (
    echo.
    echo [ERROR] Failed to create startup launcher.
    echo.
    echo Possible reasons:
    echo - Startup folder is read-only
    echo - Insufficient permissions
    echo.
    pause
    exit /b 1
)

echo Press any key to close...
pause >nul
