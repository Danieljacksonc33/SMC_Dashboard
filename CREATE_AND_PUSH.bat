@echo off
echo ========================================
echo   Create SMC_Dashboard on GitHub
echo ========================================
echo.
echo This will open GitHub in your browser to create the repository.
echo.
echo Steps:
echo 1. The browser will open to GitHub new repository page
echo 2. Repository name should be: SMC_Dashboard
echo 3. Description: Real-time web dashboard and UI/UX components for SMC Sessions EA
echo 4. Choose Public or Private
echo 5. DO NOT initialize with README, .gitignore, or license
echo 6. Click "Create repository"
echo 7. Come back here and press any key to continue
echo.
pause
echo.
echo Opening GitHub...
start https://github.com/new
echo.
echo ========================================
echo   Waiting for you to create repository...
echo ========================================
echo.
pause
echo.
echo ========================================
echo   Pushing to GitHub...
echo ========================================
echo.
cd /d "%~dp0"
git branch -M main
git push -u origin main
echo.
if %ERRORLEVEL% EQU 0 (
    echo ========================================
    echo   SUCCESS! Repository pushed to GitHub
    echo ========================================
    echo.
    echo Repository URL: https://github.com/Danieljacksonc33/SMC_Dashboard
) else (
    echo ========================================
    echo   ERROR: Push failed
    echo ========================================
    echo.
    echo Make sure you:
    echo 1. Created the repository on GitHub
    echo 2. Named it exactly: SMC_Dashboard
    echo 3. Did NOT initialize with README
    echo.
    echo Then try running this script again.
)
echo.
pause
