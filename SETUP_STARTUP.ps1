# Setup Dashboard Monitor in Startup Folder

$startupFolder = [Environment]::GetFolderPath('Startup')
$scriptPath = Join-Path $PSScriptRoot "AUTO_LAUNCH_DASHBOARD.ps1"
$vbsPath = Join-Path $startupFolder "SMC_Dashboard_Monitor.vbs"

Write-Host "Setting up dashboard monitor..."
Write-Host "Startup folder: $startupFolder"
Write-Host "Monitor script: $scriptPath"
Write-Host ""

if (-not (Test-Path $scriptPath)) {
    Write-Host "[ERROR] Monitor script not found: $scriptPath" -ForegroundColor Red
    pause
    exit 1
}

# Create VBScript content
$vbsContent = @"
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File ""$scriptPath""", 0
Set WshShell = Nothing
"@

try {
    Set-Content -Path $vbsPath -Value $vbsContent -ErrorAction Stop
    
    if (Test-Path $vbsPath) {
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "[SUCCESS] Setup Complete!" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Dashboard monitor has been added to Windows Startup."
        Write-Host ""
        Write-Host "WHAT HAPPENS NOW:"
        Write-Host "- Monitor will run automatically when Windows starts"
        Write-Host "- Dashboard will launch automatically when EA starts"
        Write-Host "- No manual steps needed!"
        Write-Host ""
        Write-Host "TO START IT IMMEDIATELY (without restarting Windows):"
        Write-Host "- Double-click: START_AUTO_LAUNCH.bat"
        Write-Host ""
    } else {
        Write-Host "[ERROR] File was not created successfully" -ForegroundColor Red
    }
} catch {
    Write-Host "[ERROR] Failed to create startup file: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Possible reasons:"
    Write-Host "- Insufficient permissions"
    Write-Host "- Startup folder is read-only"
    Write-Host ""
    Write-Host "Try running PowerShell as Administrator and run this script again."
}

Write-Host ""
pause
