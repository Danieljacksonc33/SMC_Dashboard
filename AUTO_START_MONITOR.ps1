# Auto-Start Monitor Script
# This script checks for trigger files and automatically starts the monitor if needed
# Runs via Windows Task Scheduler every minute

$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$MONITOR_SCRIPT = Join-Path $SCRIPT_DIR "AUTO_LAUNCH_DASHBOARD.ps1"
$MT4_PATH = "$env:APPDATA\MetaQuotes\Terminal\7E6C4A6F67D435CAE80890D8C1401332"
$TESTER_TRIGGER = "$MT4_PATH\tester\files\LAUNCH_DASHBOARD_TESTER.trigger"
$LIVE_TRIGGER = "$MT4_PATH\MQL4\Files\LAUNCH_DASHBOARD_LIVE.trigger"

# Function to check if monitor is running
function IsMonitorRunning {
    try {
        $processes = Get-Process -Name "powershell" -ErrorAction SilentlyContinue
        foreach ($proc in $processes) {
            try {
                $cmdLine = (Get-CimInstance Win32_Process -Filter "ProcessId = $($proc.Id)" -ErrorAction SilentlyContinue).CommandLine
                if ($cmdLine -and $cmdLine -like "*AUTO_LAUNCH_DASHBOARD.ps1*") {
                    return $true
                }
            } catch {
                # Try WMI as fallback
                try {
                    $cmdLine = (Get-WmiObject Win32_Process -Filter "ProcessId = $($proc.Id)" -ErrorAction SilentlyContinue).CommandLine
                    if ($cmdLine -and $cmdLine -like "*AUTO_LAUNCH_DASHBOARD.ps1*") {
                        return $true
                    }
                } catch {
                    # Ignore errors
                }
            }
        }
    } catch {
        # If we can't check, assume not running to be safe
    }
    return $false
}

# Check for trigger files
$testerTriggerExists = Test-Path $TESTER_TRIGGER
$liveTriggerExists = Test-Path $LIVE_TRIGGER

# If trigger exists but monitor is not running, start it
if (($testerTriggerExists -or $liveTriggerExists) -and -not (IsMonitorRunning)) {
    # Start monitor in background (hidden window)
    Start-Process -FilePath "powershell.exe" `
        -ArgumentList "-ExecutionPolicy", "Bypass", "-WindowStyle", "Hidden", "-File", "`"$MONITOR_SCRIPT`"" `
        -WindowStyle Hidden
    
    # Log to file for debugging (optional)
    $logFile = Join-Path $SCRIPT_DIR "monitor_auto_start.log"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - Monitor auto-started (trigger detected)" | Out-File -FilePath $logFile -Append
}
