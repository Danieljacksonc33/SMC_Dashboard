@echo off
echo ============================================
echo Removing Auto-Start Dashboard Monitor
echo ============================================
echo.

set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "LAUNCHER_VBS=%STARTUP_FOLDER%\SMC_Dashboard_Monitor.vbs"

if exist "%LAUNCHER_VBS%" (
    del "%LAUNCHER_VBS%"
    echo [SUCCESS] Dashboard monitor removed from Windows Startup.
    echo.
    echo The monitor will no longer start automatically.
    echo.
) else (
    echo [INFO] Dashboard monitor was not in Windows Startup.
    echo.
)

pause
