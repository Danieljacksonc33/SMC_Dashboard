# Modular Dashboard Guide

## Overview

The dashboard now supports **multiple strategies** with separate sections for each. This allows you to monitor multiple EAs simultaneously on one dashboard.

## Current Structure

```
SMC_Dashboard/
├── dashboard.html              # Original single-strategy dashboard
├── dashboard_modular.html       # NEW: Multi-strategy dashboard
└── [other files]
```

## How It Works

### Strategy Configuration

Edit `dashboard_modular.html` and find the `STRATEGIES` array:

```javascript
const STRATEGIES = [
    {
        name: 'SMC Sessions EA',
        jsonFile: 'SMC_Dashboard.json',
        displayName: 'SMC Sessions'
    }
    // Add more strategies here:
    // {
    //     name: 'SMC Order Blocks EA',
    //     jsonFile: 'SMC_OrderBlocks_Dashboard.json',
    //     displayName: 'SMC Order Blocks'
    // }
];
```

### Adding a New Strategy

1. **Your EA exports JSON data** (e.g., `SMC_OrderBlocks_Dashboard.json`)
2. **Add to STRATEGIES array:**
   ```javascript
   {
       name: 'SMC Order Blocks EA',
       jsonFile: 'SMC_OrderBlocks_Dashboard.json',
       displayName: 'SMC Order Blocks'
   }
   ```
3. **Dashboard automatically creates a new section** for that strategy

## Features

- ✅ **Separate sections** for each strategy
- ✅ **Independent status** indicators per strategy
- ✅ **All data displayed** in organized cards
- ✅ **Auto-refresh** every 5 seconds
- ✅ **Error handling** - shows error if strategy data unavailable

## Usage

### Option 1: Use Modular Dashboard (Recommended for Multiple Strategies)

1. Rename `dashboard_modular.html` to `dashboard.html` (backup original first)
2. Or access directly: `http://localhost:8000/dashboard_modular.html`

### Option 2: Keep Original (Single Strategy)

- Continue using `dashboard.html` for single strategy monitoring

## Example: Two Strategies

```javascript
const STRATEGIES = [
    {
        name: 'SMC Sessions EA',
        jsonFile: 'SMC_Dashboard.json',
        displayName: 'SMC Sessions'
    },
    {
        name: 'SMC Order Blocks EA',
        jsonFile: 'SMC_OrderBlocks_Dashboard.json',
        displayName: 'SMC Order Blocks'
    }
];
```

This will display:
- **Section 1:** SMC Sessions EA (with all its cards)
- **Section 2:** SMC Order Blocks EA (with all its cards)

## Customization

Each strategy section includes:
- Strategy name header
- Status indicator (Active/Waiting/Error)
- All standard cards (Account, Market, Trading, Statistics, etc.)

The dashboard automatically adapts to show all configured strategies.

## Future Strategies

When you create a new EA:
1. Make it export JSON data (like `dashboard_export.mqh` does)
2. Add it to the STRATEGIES array
3. Dashboard will automatically display it

No code changes needed beyond adding the strategy configuration!
