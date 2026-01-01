@echo off
cls
color 0A
echo.
echo ============================================
echo    Setting Up Auto-Start Dashboard Monitor
echo ============================================
echo.
echo This will add the dashboard monitor to Windows Startup
echo so it runs automatically when Windows starts.
echo.
echo WHAT THIS DOES:
echo - Adds monitor to Windows Startup folder
echo - Monitor runs automatically on Windows boot
echo - Dashboard launches automatically when EA starts
echo - No manual steps needed after setup
echo.
echo ============================================
echo.
echo Press any key to continue, or Ctrl+C to cancel...
pause >nul

echo.
echo Setting up auto-start...
echo.

REM Get the current script directory
set "SCRIPT_DIR=%~dp0"
set "MONITOR_SCRIPT=%SCRIPT_DIR%AUTO_LAUNCH_DASHBOARD.ps1"

REM Get the Startup folder path
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

REM Create a VBScript launcher (Windows Startup doesn't support .ps1 directly)
set "LAUNCHER_VBS=%STARTUP_FOLDER%\SMC_Dashboard_Monitor.vbs"

REM Check if monitor script exists
if not exist "%MONITOR_SCRIPT%" (
    echo [ERROR] AUTO_LAUNCH_DASHBOARD.ps1 not found!
    echo.
    echo Please make sure this file is in the same folder:
    echo %SCRIPT_DIR%
    echo.
    pause
    exit /b 1
)

REM Create VBScript that runs the PowerShell monitor
echo Creating startup launcher...
(
echo Set WshShell = CreateObject^("WScript.Shell"^)
echo WshShell.Run "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File ""%MONITOR_SCRIPT%""", 0
echo Set WshShell = Nothing
) > "%LAUNCHER_VBS%"

if exist "%LAUNCHER_VBS%" (
    echo.
    echo ============================================
    echo [SUCCESS] Setup Complete!
    echo ============================================
    echo.
    echo Dashboard monitor has been added to Windows Startup.
    echo.
    echo WHAT HAPPENS NOW:
    echo - Monitor will run automatically when Windows starts
    echo - Dashboard will launch automatically when EA starts
    echo - No manual steps needed!
    echo.
    echo TO START IT IMMEDIATELY (without restarting Windows):
    echo 1. Double-click: START_AUTO_LAUNCH.bat
    echo    OR
    echo 2. Restart your computer (monitor will start automatically)
    echo.
    echo TO REMOVE AUTO-START LATER:
    echo - Double-click: REMOVE_AUTO_START.bat
    echo.
    echo ============================================
    echo.
) else (
    echo.
    echo [ERROR] Failed to create startup launcher.
    echo.
    echo Possible reasons:
    echo - Insufficient permissions (try running as Administrator)
    echo - Startup folder is read-only
    echo.
    echo Please try running this script as Administrator:
    echo Right-click SETUP_AUTO_START.bat ^> Run as administrator
    echo.
    pause
    exit /b 1
)

echo Press any key to close...
pause >nul
