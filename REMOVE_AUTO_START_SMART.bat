@echo off
cls
color 0E
echo.
echo ============================================
echo    Removing Smart Auto-Start Monitor
echo ============================================
echo.

set "TASK_NAME=SMC_Dashboard_AutoStart"

echo Removing Windows Task Scheduler task...
echo.

schtasks /Delete /TN "%TASK_NAME%" /F >nul 2>&1

if %ERRORLEVEL% == 0 (
    echo.
    echo [SUCCESS] Smart auto-start has been removed.
    echo.
    echo The monitor will no longer start automatically.
    echo You can still start it manually using:
    echo - START_AUTO_LAUNCH.bat
    echo.
) else (
    echo.
    echo [INFO] Task not found or already removed.
    echo.
)

echo Press any key to close...
pause >nul
