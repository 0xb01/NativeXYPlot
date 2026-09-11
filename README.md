# NativeXYPlot for Xojo

[![Xojo Compatibility](https://img.shields.io/badge/Xojo-2021r3%2B%20%7C%202024%2B-blue.svg)](https://www.xojo.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Zero Dependencies](https://img.shields.io/badge/Dependencies-Zero%20(Pure%20Native)-brightgreen.svg)](#features)
[![Platform](https://img.shields.io/badge/Platform-Desktop%20%7C%20Web-orange.svg)](#features)

Fast, zero-dependency 2D plotting, multi-plot grid matrix layout, and time-series charting library in 100% pure native Xojo code.

![NativeXYPlot Showcase Demo](docs/Screenshot.png)

---

## Interactive Demo Modes

The included demo project (`demo/Sample.xojo_project`) showcases 6 built-in recipe tabs:

| Tab | Demo Mode | Description | Key Features |
| :---: | :--- | :--- | :--- |
| **0** | **IoT Telemetry** | Multi-sensor climate monitoring over a 7-day timeline. | Date axis (`SetXDateScale`), comfort zone shading (`AddThreshold`), milestone markers (`AddMarker`). |
| **1** | **Waveforms** | High-frequency harmonic sine waves & damped cosine decays. | Dual-polarity linear scales (`-10V..+10V`), math functions, multi-series styling. |
| **2** | **Live Feed** | Real-time sensor stream updating on a 250ms interval timer. | Dynamic rolling ring buffer (`mLiveX`, `mLiveY`), auto-scrolling linear scale. |
| **3** | **Digital I/O** | Multi-channel actuator & relay timeline with discrete logic states. | Discrete categorical Y labels (`SetYDiscreteLabels`), stacked boolean digital lanes (`AddDateBooleanSeries`). |
| **4** | **Synced 3-Plot** | 3 stacked subplots linked to a unified time axis. | Synchronized scrubbing cursor (`DrawTrackingOverlayByValue`), linked timeline crosshairs. |
| **5** | **2x2 Multi-Grid** | $2 \times 2$ heterogeneous matrix layout with mixed scales. | Matrix container (`NativeXYPlotGrid`), independent zoom/pan, broadcast crosshair sync. |

---

## Features

- **100% Pure Native**: Works seamlessly on Desktop and Web without any plugins (`Graphics`, `Picture`, `PDFDocument`).
- **Multiple Data Formats**: Handles Numbers (`Double`), Time-Series (`DateTime`), ON/OFF Pulses (`Boolean`), and Custom Text Labels.
- **Multi-Plot Grid System (`NativeXYPlotGrid`)**: Layout multiple subplots in rows and columns on one canvas, with independent or linked zoom/pan.
- **High-Speed 60 FPS Hover Tracking**: Decoupled static background picture buffer + instant mouse crosshair and value badges (`DrawTrackingOverlay`).
- **Synchronized Scrubbing**: Link multiple subplots to a single cursor across time/numeric domains (`DrawTrackingOverlayByValue`).
- **Customizable Styling**: Per-chart titles, unit suffixes (`"°C"`, `" psi"`), tolerance threshold bands, markers, and legends.
- **Real-Time Streaming**: High-throughput ring buffer streaming support.
- **Vector PDF & PNG Exporting**: Export crisp vector PDFs and high-resolution PNG images.

---

## Quickstart

### 1. Single Plot
```vb
Var plot As New NativeXYPlot(Canvas1.Width, Canvas1.Height)
plot.AddTitle("Telemetry Monitor")
plot.SetPlotArea(60, 45, Canvas1.Width - 120, Canvas1.Height - 80)
plot.SetXDateScale(dStart.SecondsFrom1970, dEnd.SecondsFrom1970)
plot.SetYLinearScale(15.0, 30.0, "°C")

plot.AddThreshold(20.0, 24.0, &cE8F5E9, &c81C784)
plot.AddDateSeries(dateArray, tempArray, &c3185FC, "Sensor 1", 2)
plot.AddMarker(eventDate.SecondsFrom1970, "Alert", &cE63946)

Canvas1.Backdrop = plot.MakeChartPicture()
```

### 2. Multi-Plot Grid Matrix (2x2)
```vb
Var grid As New NativeXYPlotGrid(Canvas1.Width, Canvas1.Height, 2, 2)
grid.SetSpacing(45, 30, 38, 38, 25, 30)

// Configure Cell (0, 0):
Var p00 As NativeXYPlot = grid.Plot(0, 0)
p00.SetXLinearScale(0, 100)
p00.SetYLinearScale(0, 100, " psi")
p00.SetYTitle("Pressure")
p00.AddSeries(xVals, yPress, &c0077B6, "Feed A", 2)

// Configure Cell (0, 1):
Var p01 As NativeXYPlot = grid.Plot(0, 1)
p01.SetXLinearScale(0, 100)
p01.SetYLinearScale(-10, 10, " V")
p01.SetYTitle("Voltage")
p01.AddSeries(xVals, yVolt, &c3185FC, "Sine", 2)

// Render:
Canvas1.Backdrop = grid.MakeChartPicture()
```

---

## Interactive Tracking & Keyboard Shortcuts

```vb
// In Canvas.MouseMove:
Sub MouseMove(X As Integer, Y As Integer)
  mMouseX = X
  mMouseY = Y
  Canvas1.Refresh
End Sub

// In Canvas.Paint:
Sub Paint(g As Graphics, areas() As Rect)
  g.DrawPicture(mBasePic, 0, 0)
  grid.DrawTrackingOverlay(g, mMouseX, mMouseY, True)
End Sub
```

| Key / Mouse Action | What It Does |
| :---: | :--- |
| **`P`** | **Toggle Data Point Dots**: Switches between clean lines only and lines with circular dots at each data point. |
| **`L`** | **Toggle Tracking Legend Badge**: Shows or hides the floating dark legend summary box during hover. |
| **Mouse Drag** | **Pan Viewport**: Click and drag horizontally to pan/scroll across the data domain. |
| **Mouse Wheel** | **Zoom In / Out**: Scroll mouse wheel to zoom centered at the cursor position. |

---

## Full Documentation

See [docs/DOCUMENTATION.md](docs/DOCUMENTATION.md) for the complete API reference, properties, and step-by-step recipes.

---

## Repository Structure

```
├── .gitattributes                # LF normalization
├── .gitignore                   # Build & debug artifact ignore rules
├── README.md                    # Overview & quickstart
├── docs/
│   ├── DOCUMENTATION.md         # Full API & architecture reference
│   └── Screenshot.png           # Showcase screenshot
├── src/
│   ├── NativeXYPlot.xojo_code     # Core single-plot engine class
│   └── NativeXYPlotGrid.xojo_code # Multi-plot matrix container class
└── demo/
    ├── Sample.xojo_project      # Showcase desktop demo project
    ├── NativeXYPlot.xojo_code
    ├── NativeXYPlotGrid.xojo_code
    └── Window1.xojo_window      # Demo UI with segmented tabs & 2x2 grid
```

---

## Contributing

Contributions, bug reports, pull requests, and feature suggestions are warmly welcomed and appreciated! Feel free to open an issue or submit a pull request on [GitHub](https://github.com/0xb01/NativeXYPlot).

---

## License

MIT License. Free for commercial and open-source use.

