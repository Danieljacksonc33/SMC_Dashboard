# Auto-Launch Dashboard Monitor
# This script monitors for trigger files and automatically launches the dashboard
# Can be started manually or automatically via Task Scheduler

$MT4_PATH = "$env:APPDATA\MetaQuotes\Terminal\7E6C4A6F67D435CAE80890D8C1401332"
$TESTER_TRIGGER = "$MT4_PATH\tester\files\LAUNCH_DASHBOARD_TESTER.trigger"
$LIVE_TRIGGER = "$MT4_PATH\MQL4\Files\LAUNCH_DASHBOARD_LIVE.trigger"

# Check if running in hidden mode (from Task Scheduler)
$isHidden = $false
try {
    $parent = (Get-WmiObject Win32_Process -Filter "ProcessId = $PID").ParentProcessId
    $parentProc = Get-Process -Id $parent -ErrorAction SilentlyContinue
    if ($parentProc -and $parentProc.ProcessName -eq "svchost") {
        $isHidden = $true
    }
} catch {
    # Ignore errors
}

if (-not $isHidden) {
    Write-Host "========================================"
    Write-Host "Dashboard Auto-Launch Monitor"
    Write-Host "========================================"
    Write-Host ""
    Write-Host "Monitoring for dashboard launch triggers..."
    Write-Host "Press Ctrl+C to stop monitoring"
    Write-Host ""
}

$testerServerRunning = $false
$liveServerRunning = $false

while ($true) {
    # Check for tester trigger
    if (Test-Path $TESTER_TRIGGER) {
        if (-not $isHidden) {
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Tester trigger detected!"
        }
        Remove-Item $TESTER_TRIGGER -Force -ErrorAction SilentlyContinue
        
        if (-not $testerServerRunning) {
            if (-not $isHidden) {
                Write-Host "Starting tester dashboard server..."
            }
            $testerFolder = "$MT4_PATH\tester\files"
            Start-Process -FilePath "python" -ArgumentList "-m", "http.server", "8000" -WorkingDirectory $testerFolder -WindowStyle Minimized -ErrorAction SilentlyContinue
            if ($LASTEXITCODE -ne 0) {
                Start-Process -FilePath "python3" -ArgumentList "-m", "http.server", "8000" -WorkingDirectory $testerFolder -WindowStyle Minimized -ErrorAction SilentlyContinue
            }
            Start-Sleep -Seconds 2
            $testerServerRunning = $true
        }
        
        if (-not $isHidden) {
            Write-Host "Opening dashboard in browser..."
        }
        Start-Process "http://localhost:8000/dashboard.html"
        if (-not $isHidden) {
            Write-Host "Dashboard opened!"
            Write-Host ""
        }
    }
    
    # Check for live trigger
    if (Test-Path $LIVE_TRIGGER) {
        if (-not $isHidden) {
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Live trigger detected!"
        }
        Remove-Item $LIVE_TRIGGER -Force -ErrorAction SilentlyContinue
        
        if (-not $liveServerRunning) {
            if (-not $isHidden) {
                Write-Host "Starting live dashboard server..."
            }
            $liveFolder = "$MT4_PATH\MQL4\Files"
            Start-Process -FilePath "python" -ArgumentList "-m", "http.server", "8000" -WorkingDirectory $liveFolder -WindowStyle Minimized -ErrorAction SilentlyContinue
            if ($LASTEXITCODE -ne 0) {
                Start-Process -FilePath "python3" -ArgumentList "-m", "http.server", "8000" -WorkingDirectory $liveFolder -WindowStyle Minimized -ErrorAction SilentlyContinue
            }
            Start-Sleep -Seconds 2
            $liveServerRunning = $true
        }
        
        if (-not $isHidden) {
            Write-Host "Opening dashboard in browser..."
        }
        Start-Process "http://localhost:8000/dashboard.html"
        if (-not $isHidden) {
            Write-Host "Dashboard opened!"
            Write-Host ""
        }
    }
    
    Start-Sleep -Seconds 1
}
