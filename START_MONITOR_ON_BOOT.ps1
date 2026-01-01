# Smart Monitor Starter - Runs on Windows Boot
# This script continuously checks for trigger files and starts monitor if needed

$SCRIPT_DIR = "C:\Users\test\OneDrive\Desktop\Trading\all bots\SMC_Sessions_EA\"
$MONITOR_SCRIPT = Join-Path $SCRIPT_DIR "AUTO_START_MONITOR.ps1"

# Run the auto-start monitor checker every 30 seconds
while ($true) {
    Start-Sleep -Seconds 30
    if (Test-Path $MONITOR_SCRIPT) {
        powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File $MONITOR_SCRIPT
    }
}
