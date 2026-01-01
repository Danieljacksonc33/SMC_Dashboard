# SMC Sessions EA - Dashboard Guide

## Quick Start

### Smart Auto-Start (Recommended - NEW!)

**No manual setup needed!** The monitor starts automatically when you start the EA:

1. **Double-click:** `SETUP_AUTO_START_SMART.bat` (one-time setup)
2. **Press any key** when prompted
3. **Done!** Now whenever you start the tester or live EA, the dashboard will launch automatically

**✅ Works After Restart:** Task Scheduler runs automatically with Windows, so the system continues working after you restart your computer. No need to run setup again!

### Traditional Auto-Start (Alternative)

1. **Double-click:** `SETUP_AUTO_START.bat`
2. **Press any key** when prompted
3. Monitor runs automatically on Windows boot

### Manual Start (Alternative)

If you prefer to start the monitor manually:
1. **Double-click:** `START_AUTO_LAUNCH.bat`
2. **Keep the window open** (minimize it)
3. Dashboard launches automatically when EA starts

---

## How It Works

1. **Monitor runs** (automatically on Windows boot, or manually)
2. **You start Strategy Tester or Live Trading**
3. **You attach EA** with `EnableDashboardExport=true`
4. **EA creates trigger file**
5. **Monitor detects trigger**
6. **Monitor starts Python server**
7. **Monitor opens dashboard in browser**
8. **Done!** No manual steps needed

---

## Dashboard Access

Once the dashboard is running:
- **URL:** `http://localhost:8000/dashboard.html`
- **Auto-refreshes** every 5 seconds
- **Shows real-time EA status**

---

## Troubleshooting

### Dashboard Not Loading?

1. **Restart the server:**
   - For Strategy Tester: Double-click `RESTART_DASHBOARD_TESTER.bat`
   - For Live Trading: Double-click `RESTART_DASHBOARD_LIVE.bat`

2. **Check if Python is installed:**
   - Open Command Prompt
   - Type: `python --version`
   - If not found, install from: https://www.python.org/downloads/

3. **Check if server is running:**
   - Open browser to: `http://localhost:8000/dashboard.html`
   - If it doesn't load, the server isn't running

### Monitor Not Starting?

**For Smart Auto-Start:**
1. **Check Task Scheduler:**
   - Press `Windows Key + R`
   - Type: `taskschd.msc`
   - Press Enter
   - Look for task: `SMC_Dashboard_AutoStart`
   - Should be running every minute

2. **If missing, run setup again:**
   - Double-click: `SETUP_AUTO_START_SMART.bat`

**For Traditional Auto-Start:**
1. **Check Windows Startup folder:**
   - Press `Windows Key + R`
   - Type: `shell:startup`
   - Press Enter
   - You should see: `SMC_Dashboard_Monitor.vbs`

2. **If missing, run setup again:**
   - Double-click: `SETUP_AUTO_START.bat`

---

## Removing Auto-Start

**For Smart Auto-Start:**
1. **Double-click:** `REMOVE_AUTO_START_SMART.bat`
2. Task Scheduler task will be removed
3. Monitor will no longer start automatically

**For Traditional Auto-Start:**
1. **Double-click:** `REMOVE_AUTO_START.bat`
2. Monitor will no longer start automatically

---

## File Structure

### Essential Files
- `AUTO_LAUNCH_DASHBOARD.ps1` - Core monitor script
- `AUTO_START_MONITOR.ps1` - Smart auto-start checker (runs via Task Scheduler)
- `dashboard.html` - Dashboard interface
- `SETUP_AUTO_START_SMART.bat` - Smart auto-start setup (recommended)
- `SETUP_AUTO_START.bat` - Traditional auto-start setup
- `START_AUTO_LAUNCH.bat` - Manual start option
- `REMOVE_AUTO_START_SMART.bat` - Remove smart auto-start
- `REMOVE_AUTO_START.bat` - Remove traditional auto-start

### Troubleshooting Files
- `RESTART_DASHBOARD_TESTER.bat` - Restart server (Strategy Tester)
- `RESTART_DASHBOARD_LIVE.bat` - Restart server (Live Trading)

---

## Notes

- **Works for both Strategy Tester and Live Trading**
- **Same setup handles both scenarios**
- **Monitor runs in background** (hidden window)
- **Dashboard auto-refreshes** every 5 seconds
- **No manual steps needed** after initial setup
- **Persists after computer restart** - Task Scheduler runs automatically with Windows

---

## Support

If you encounter issues:
1. Check the Experts tab in MT4 for error messages
2. Verify Python is installed and accessible
3. Ensure port 8000 is not in use by another application
4. Try restarting the server using the restart scripts
