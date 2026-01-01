@echo off
cls
color 0E
echo.
echo ============================================
echo    Removing Smart Auto-Start Monitor
echo    (No Admin Version)
echo ============================================
echo.

set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "LAUNCHER_VBS=%STARTUP_FOLDER%\SMC_Dashboard_Smart_Monitor.vbs"
set "STARTUP_SCRIPT=%~dp0START_MONITOR_ON_BOOT.ps1"

echo Removing startup launcher...
if exist "%LAUNCHER_VBS%" (
    del "%LAUNCHER_VBS%" >nul 2>&1
    echo [SUCCESS] Startup launcher removed.
) else (
    echo [INFO] Startup launcher not found (may already be removed).
)

echo.
echo Removing startup script...
if exist "%STARTUP_SCRIPT%" (
    del "%STARTUP_SCRIPT%" >nul 2>&1
    echo [SUCCESS] Startup script removed.
) else (
    echo [INFO] Startup script not found (may already be removed).
)

echo.
echo Smart auto-start has been removed.
echo.
echo The monitor will no longer start automatically.
echo You can still start it manually using:
echo - START_AUTO_LAUNCH.bat
echo.

echo Press any key to close...
pause >nul
