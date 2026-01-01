# SMC Sessions EA - Dashboard & UI/UX Repository

A beautiful, real-time web dashboard for monitoring the SMC Sessions Expert Advisor. This repository contains all UI/UX components, dashboard files, and automation scripts for seamless dashboard integration.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Dashboard Features](#dashboard-features)
- [Troubleshooting](#troubleshooting)
- [Requirements](#requirements)
- [Integration with SMC EA](#integration-with-smc-ea)

## 🎯 Overview

This dashboard provides a modern, real-time web interface to monitor your SMC Sessions EA. It displays:

- **Account Information**: Balance, equity, current symbol, bid price, spread
- **Market Status**: Bias (BULLISH/BEARISH/SIDEWAYS), CHOCH, FVG status
- **Asian Range**: High, low, and range calculations
- **Liquidity Sweep Status**: High/low sweep detection
- **Trading Status**: Session status, open trades, P/L
- **Statistics**: Win rate, profit factor, performance metrics
- **News Filter**: News blocking status

The dashboard auto-refreshes every 5 seconds and launches automatically when the EA starts.

## ✨ Features

### 🎨 Modern UI/UX
- **Dark Theme**: Professional dark color scheme optimized for trading
- **Responsive Design**: Works on desktop, tablet, and mobile devices
- **Animated Elements**: Smooth animations and transitions
- **Real-time Updates**: Auto-refreshes every 5 seconds
- **Visual Indicators**: Color-coded status badges and indicators

### 🚀 Auto-Launch System
- **Smart Auto-Start**: Automatically launches when EA starts (recommended)
- **Traditional Auto-Start**: Starts on Windows boot
- **Manual Start**: Option to start manually if preferred
- **Works with Strategy Tester**: Automatically detects tester mode
- **Works with Live Trading**: Automatically detects live trading mode

### 📊 Real-time Monitoring
- **Live Data**: Real-time EA status and market data
- **Performance Metrics**: Win rate, profit factor, drawdown
- **Trade Tracking**: Open trades, P/L, session status
- **Market Analysis**: Bias, CHOCH, FVG, liquidity sweeps

## 🚀 Quick Start

### Option 1: Smart Auto-Start (Recommended)

1. **Double-click:** `SETUP_AUTO_START_SMART.bat`
2. **Press any key** when prompted
3. **Done!** Dashboard will launch automatically when you start the EA

**✅ Benefits:**
- No manual steps needed
- Works after computer restart
- Automatically detects Strategy Tester or Live Trading
- Runs via Windows Task Scheduler

### Option 2: Traditional Auto-Start

1. **Double-click:** `SETUP_AUTO_START.bat`
2. **Press any key** when prompted
3. Monitor runs automatically on Windows boot

### Option 3: Manual Start

1. **Double-click:** `START_AUTO_LAUNCH.bat`
2. **Keep the window open** (minimize it)
3. Dashboard launches automatically when EA starts

## 📦 Installation

### Prerequisites

- **Windows 10/11** (for automation scripts)
- **Python 3.x** (for web server)
- **MetaTrader 4** with SMC Sessions EA installed
- **Web Browser** (Chrome, Firefox, Edge, etc.)

### Step 1: Install Python

1. Download Python from: https://www.python.org/downloads/
2. During installation, check **"Add Python to PATH"**
3. Verify installation:
   ```cmd
   python --version
   ```

### Step 2: Setup Dashboard

1. **Choose your setup method:**
   - **Recommended:** Double-click `SETUP_AUTO_START_SMART.bat`
   - **Alternative:** Double-click `SETUP_AUTO_START.bat`
   - **Manual:** Use `START_AUTO_LAUNCH.bat`

2. **Enable Dashboard in EA:**
   - Open MetaTrader 4
   - Attach SMC Sessions EA to chart
   - Set `EnableDashboardExport = true` in EA inputs
   - Click OK

3. **Dashboard will launch automatically!**

## 📖 Usage

### Accessing the Dashboard

Once running, access the dashboard at:
- **URL:** `http://localhost:8000/dashboard.html`
- **Auto-opens** in your default browser
- **Auto-refreshes** every 5 seconds

### Dashboard Sections

#### 1. Account Card
- Balance and equity
- Current symbol
- Bid price and spread

#### 2. Market Status Card
- Bias (BULLISH/BEARISH/SIDEWAYS)
- CHOCH status
- FVG ready status and entry price

#### 3. Asian Range Card
- Asian session high and low
- Range in pips

#### 4. Liquidity Sweep Card
- High sweep status
- Low sweep status
- Sweep time

#### 5. Trading Status Card
- In session indicator
- Session hours
- Trade taken today
- Open trades count
- Open P/L (dollars and pips)

#### 6. Statistics Card
- Daily win rate
- Overall win rate
- Profit factor

#### 7. News Filter Card
- Filter enabled status
- Blocking status

### Restarting the Dashboard

If the dashboard stops working:

- **Strategy Tester:** Double-click `RESTART_DASHBOARD_TESTER.bat`
- **Live Trading:** Double-click `RESTART_DASHBOARD_LIVE.bat`

## 📁 File Structure

```
SMC_Dashboard/
├── README.md                          # This file
├── DASHBOARD_README.md                # Detailed usage guide
├── dashboard.html                     # Main dashboard interface
│
├── AUTO_LAUNCH_DASHBOARD.ps1         # Core monitor script
├── AUTO_START_MONITOR.ps1            # Smart auto-start checker
├── SETUP_STARTUP.ps1                 # Startup folder setup
├── START_MONITOR_ON_BOOT.ps1         # Boot monitor script
│
├── SETUP_AUTO_START_SMART.bat        # Smart auto-start setup (recommended)
├── SETUP_AUTO_START_SMART_NO_ADMIN.bat # Smart setup (no admin)
├── SETUP_AUTO_START.bat              # Traditional auto-start setup
├── START_AUTO_LAUNCH.bat             # Manual start option
│
├── REMOVE_AUTO_START_SMART.bat       # Remove smart auto-start
├── REMOVE_AUTO_START_SMART_NO_ADMIN.bat # Remove smart (no admin)
├── REMOVE_AUTO_START.bat             # Remove traditional auto-start
│
├── RESTART_DASHBOARD_TESTER.bat      # Restart (Strategy Tester)
└── RESTART_DASHBOARD_LIVE.bat        # Restart (Live Trading)
```

## 🎨 Dashboard Features

### Visual Design

- **Color Scheme:**
  - Primary: Dark blue (#0a0e27)
  - Cards: Dark purple (#1a1f3a)
  - Accents: Blue, green, red, yellow, purple
  - Text: White with secondary gray tones

- **Animations:**
  - Animated top banner with candlestick graphics
  - Smooth card hover effects
  - Fade-in animations
  - Gradient text effects

- **Responsive Layout:**
  - Grid-based card layout
  - Adapts to screen size
  - Mobile-friendly design

### Status Indicators

- **Active Status:** Green badge with pulsing dot
- **Waiting Status:** Yellow badge
- **Error Status:** Red badge
- **Yes/No Indicators:** Color-coded status dots

### Data Display

- **Large Values:** Prominent display for important metrics
- **Formatted Numbers:** Proper decimal formatting
- **Color Coding:**
  - Green: Positive values, bullish bias
  - Red: Negative values, bearish bias
  - Gray: Neutral values

## 🔧 Troubleshooting

### Dashboard Not Loading?

1. **Check if server is running:**
   - Open browser to: `http://localhost:8000/dashboard.html`
   - If it doesn't load, restart the server

2. **Restart the server:**
   - Strategy Tester: `RESTART_DASHBOARD_TESTER.bat`
   - Live Trading: `RESTART_DASHBOARD_LIVE.bat`

3. **Check Python installation:**
   ```cmd
   python --version
   ```
   If not found, install Python and add to PATH.

4. **Check port 8000:**
   - Ensure port 8000 is not in use by another application
   - Try restarting your computer

### Monitor Not Starting?

**For Smart Auto-Start:**
1. Check Task Scheduler:
   - Press `Windows Key + R`
   - Type: `taskschd.msc`
   - Press Enter
   - Look for: `SMC_Dashboard_AutoStart`
   - Should run every minute

2. If missing, run setup again:
   - Double-click: `SETUP_AUTO_START_SMART.bat`

**For Traditional Auto-Start:**
1. Check Windows Startup folder:
   - Press `Windows Key + R`
   - Type: `shell:startup`
   - Press Enter
   - Should see: `SMC_Dashboard_Monitor.vbs`

2. If missing, run setup again:
   - Double-click: `SETUP_AUTO_START.bat`

### EA Not Creating JSON File?

1. **Check EA is running:**
   - Verify EA is attached to chart
   - Check Experts tab for initialization message

2. **Check Dashboard Export setting:**
   - Ensure `EnableDashboardExport = true` in EA inputs

3. **Check file location:**
   - Strategy Tester: `MT4/tester/files/SMC_Dashboard.json`
   - Live Trading: `MT4/MQL4/Files/SMC_Dashboard.json`

4. **Check EA logs:**
   - Look in Experts tab for dashboard export messages
   - Check for any error messages

### Removing Auto-Start

**Smart Auto-Start:**
- Double-click: `REMOVE_AUTO_START_SMART.bat`

**Traditional Auto-Start:**
- Double-click: `REMOVE_AUTO_START.bat`

## 📋 Requirements

### System Requirements
- **OS:** Windows 10/11
- **Python:** 3.x (for web server)
- **Browser:** Modern browser (Chrome, Firefox, Edge)
- **MetaTrader 4:** With SMC Sessions EA installed

### EA Requirements
- **SMC Sessions EA:** Latest version
- **EnableDashboardExport:** Must be set to `true`
- **AutoTrading:** Enabled (for live trading)

## 🔗 Integration with SMC EA

This dashboard is designed to work with the **SMC Sessions EA**. The EA exports data to a JSON file that this dashboard reads.

### How It Works

1. **EA Export:**
   - EA runs and calculates market data
   - Every 5 seconds, EA exports data to `SMC_Dashboard.json`
   - File location depends on mode (tester vs live)

2. **Monitor Detection:**
   - Monitor script watches for trigger files
   - When EA starts, it creates a trigger file
   - Monitor detects trigger and starts web server

3. **Dashboard Display:**
   - Web server serves `dashboard.html`
   - JavaScript reads `SMC_Dashboard.json` every 5 seconds
   - Dashboard updates with latest data

### EA Configuration

In the SMC Sessions EA, ensure:
```
EnableDashboardExport = true
```

This enables the dashboard export feature in the EA.

## 📚 Related Documentation

For more information about the SMC Sessions EA:
- **Main Repository:** [SMC_Sessions_EA](../SMC_Sessions_EA)
- **EA README:** See main repository for complete EA documentation
- **Usage Guide:** See main repository for EA usage instructions

## 🎨 UI/UX Design Philosophy

This dashboard follows modern UI/UX principles:

- **Clarity:** Clear visual hierarchy and information organization
- **Consistency:** Consistent color scheme and design patterns
- **Feedback:** Visual indicators for all status changes
- **Performance:** Fast loading and smooth animations
- **Accessibility:** High contrast and readable fonts
- **Responsiveness:** Works on all screen sizes

## 🔄 Updates & Maintenance

### Updating the Dashboard

1. Download latest version from repository
2. Replace `dashboard.html` with new version
3. Restart dashboard server (if needed)

### Customization

You can customize the dashboard by editing `dashboard.html`:
- Colors: Modify CSS variables in `:root`
- Layout: Adjust grid and card structure
- Data: Modify JavaScript data parsing

## 📝 License

This dashboard is part of the SMC Sessions EA project. See the main repository for license information.

## 🤝 Contributing

Contributions are welcome! Areas for improvement:
- Additional visualizations
- Performance optimizations
- Mobile app version
- Additional data displays
- Custom themes

## 📧 Support

For issues or questions:
1. Check the troubleshooting section
2. Review EA logs in MT4 Experts tab
3. Check main repository for EA-related issues

---

**Developed by:** BluePips University By Deejay

**© 2024 BluePips University | All Rights Reserved**

---

*Happy Trading! 📈*
