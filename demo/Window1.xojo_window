#tag DesktopWindow
Begin DesktopWindow Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   600
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   Resizeable      =   True
   Title           =   "NativeXYPlot Demo"
   Type            =   0
   Visible         =   True
   Width           =   900
   Begin DesktopSegmentedButton ModeTabs
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      Italic          =   False
      SegmentCount    =   6
      Segment(0)\Caption=   "IoT Telemetry"
      Segment(0)\Enabled=   True
      Segment(0)\Selected=   True
      Segment(1)\Caption=   "Waveforms"
      Segment(1)\Enabled=   True
      Segment(1)\Selected=   False
      Segment(2)\Caption=   "Live Feed"
      Segment(2)\Enabled=   True
      Segment(2)\Selected=   False
      Segment(3)\Caption=   "Digital I/O"
      Segment(3)\Enabled=   True
      Segment(3)\Selected=   False
      Segment(4)\Caption=   "Synced 3-Plot"
      Segment(4)\Enabled=   True
      Segment(4)\Selected=   False
      Segment(5)\Caption=   "2x2 Multi-Grid"
      Segment(5)\Enabled=   True
      Segment(5)\Selected=   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectionStyle  =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   565
   End
   Begin DesktopButton BtnReset
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Reset Zoom"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      Italic          =   False
      Left            =   595
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   85
   End
   Begin DesktopButton BtnExport
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Export PNG"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      Italic          =   False
      Left            =   688
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   88
   End
   Begin DesktopButton BtnExportPDF
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Export PDF"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      Italic          =   False
      Left            =   784
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   96
   End
   Begin DesktopCheckBox ChkSeries1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Living Room"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   50
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   0
      Width           =   140
   End
   Begin DesktopCheckBox ChkSeries2
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Master Bedroom"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      Italic          =   False
      Left            =   170
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   50
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   0
      Width           =   150
   End
   Begin DesktopCheckBox ChkSeries3
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Office"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      Italic          =   False
      Left            =   330
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   50
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   0
      Width           =   140
   End
   Begin DesktopCheckBox ChkSeries4
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Sync Crosshair"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      Italic          =   False
      Left            =   480
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   50
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   False
      VisualState     =   0
      Width           =   140
   End
   Begin DesktopCanvas PlotCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   460
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   80
      Transparent     =   True
      Visible         =   True
      Width           =   860
   End
   Begin DesktopLabel StatusLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Mode: IoT Telemetry | Hover to inspect values | Drag to pan | Mouse wheel to zoom"
      TextAlignment   =   0
      TextColor       =   &c555555
      Tooltip         =   ""
      Top             =   555
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   860
   End
   Begin Timer SimTimer
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   250
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  // Ensure segments exist if not loaded from file
		  If ModeTabs.SegmentCount = 0 Then
		    Var s0 As New Segment
		    s0.Caption = "IoT Telemetry"
		    ModeTabs.AddSegment(s0)
		    
		    Var s1 As New Segment
		    s1.Caption = "Waveforms"
		    ModeTabs.AddSegment(s1)
		    
		    Var s2 As New Segment
		    s2.Caption = "Live Feed"
		    ModeTabs.AddSegment(s2)
		    
		    Var s3 As New Segment
		    s3.Caption = "Digital I/O"
		    ModeTabs.AddSegment(s3)
		    
		    Var s4 As New Segment
		    s4.Caption = "Synced 3-Plot"
		    ModeTabs.AddSegment(s4)
		    
		    Var s5 As New Segment
		    s5.Caption = "2x2 Multi-Grid"
		    ModeTabs.AddSegment(s5)
		  End If
		  
		  // Show default demo on open
		  SetDemoMode(0)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  // Redraw plot on window resize
		  RedrawPlot()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  // Redraw plot on window maximize / finish resize
		  RedrawPlot()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub GenerateDemoData()
		  // Generate IoT telemetry data (7 days, hourly)
		  mIotDates.ResizeTo(-1)
		  mIotRoom1.ResizeTo(-1)
		  mIotRoom2.ResizeTo(-1)
		  mIotRoom3.ResizeTo(-1)
		  mIotPower.ResizeTo(-1)
		  mIotSolar.ResizeTo(-1)
		  mIotGrid.ResizeTo(-1)
		  mSyncRelay.ResizeTo(-1)
		  mSyncFan.ResizeTo(-1)
		  mSyncPump.ResizeTo(-1)
		  
		  Var baseDt As DateTime = DateTime.Now - New DateInterval(0, 0, 7)
		  For i As Integer = 0 To 168
		    Var curDt As DateTime = baseDt + New DateInterval(0, 0, 0, i)
		    mIotDates.Add(curDt)
		    
		    // Temperature curves (°C)
		    Var diurnal As Double = Sin(i * 3.14159 / 12.0) * 2.5
		    mIotRoom1.Add(22.0 + diurnal + (Rnd * 0.4 - 0.2))
		    mIotRoom2.Add(20.8 + (Sin((i + 3) * 3.14159 / 12.0) * 2.0) + (Rnd * 0.4 - 0.2))
		    mIotRoom3.Add(23.2 + (Sin((i + 6) * 3.14159 / 12.0) * 1.8) + (Rnd * 0.4 - 0.2))
		    
		    // Power curves (kW)
		    Var hvacLoad As Double = 1.0 + Max(0.0, Sin((i + 2) * 3.14159 / 12.0)) * 2.8 + (Rnd * 0.3)
		    Var hrOfDay As Integer = i Mod 24
		    Var solarGen As Double = 0.0
		    If hrOfDay >= 6 And hrOfDay <= 18 Then
		      solarGen = Sin((hrOfDay - 6) * 3.14159 / 12.0) * 4.2 + (Rnd * 0.2)
		    End If
		    Var netGrid As Double = Max(0.0, hvacLoad + 0.8 - solarGen)
		    
		    mIotPower.Add(hvacLoad)
		    mIotSolar.Add(solarGen)
		    mIotGrid.Add(netGrid)
		    
		    // Multi-channel digital state timelines (True/False)
		    If i = 168 Then
		      mSyncRelay.Add(mSyncRelay(167))
		      mSyncFan.Add(mSyncFan(167))
		      mSyncPump.Add(mSyncPump(167))
		    Else
		      mSyncRelay.Add(hrOfDay >= 8 And hrOfDay <= 20)
		      mSyncFan.Add(hrOfDay >= 7 And hrOfDay <= 22)
		      mSyncPump.Add((i Mod 6) < 4)
		    End If
		  Next
		  
		  // Generate math waveform data (200 points)
		  mWaveX.ResizeTo(-1)
		  mWaveY1.ResizeTo(-1)
		  mWaveY2.ResizeTo(-1)
		  mWaveY3.ResizeTo(-1)
		  For i As Integer = 0 To 200
		    Var x As Double = i * 0.5
		    mWaveX.Add(x)
		    mWaveY1.Add(Sin(x / 5.0) * 7.5)
		    mWaveY2.Add(Cos(x / 3.0) * 6.0 * Exp(-x / 60.0))
		    mWaveY3.Add(Sin(x / 1.5) * 3.0)
		  Next
		  
		  // Generate initial live feed buffer (50 points)
		  mLiveX.ResizeTo(-1)
		  mLiveY1.ResizeTo(-1)
		  mLiveY2.ResizeTo(-1)
		  mLiveStep = 0
		  For i As Integer = 0 To 50
		    mLiveX.Add(i * 1.0)
		    mLiveY1.Add(45.0 + Sin(i * 0.2) * 15.0 + Rnd * 5.0)
		    mLiveY2.Add(60.0 + Cos(i * 0.15) * 20.0 + Rnd * 4.0)
		    mLiveStep = i
		  Next
		  
		  // Generate digital state data (24 hours, 15-min intervals)
		  mStateDates.ResizeTo(-1)
		  mStateRelay.ResizeTo(-1)
		  mStatePump.ResizeTo(-1)
		  mStateValve.ResizeTo(-1)
		  Var stateBaseDt As DateTime = DateTime.Now - New DateInterval(0, 0, 1)
		  For i As Integer = 0 To 96
		    Var curDt As DateTime = stateBaseDt + New DateInterval(0, 0, 0, 0, i * 15)
		    mStateDates.Add(curDt)
		    If i = 96 Then
		      mStateRelay.Add(mStateRelay(95))
		      mStatePump.Add(mStatePump(95))
		      mStateValve.Add(mStateValve(95))
		    Else
		      mStateRelay.Add((i Mod 32) < 20)
		      mStatePump.Add((i Mod 16) < 10)
		      mStateValve.Add((i Mod 8) < 3)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BuildPlotPicture(targetW As Integer, targetH As Integer) As Picture
		  If targetW <= 0 Or targetH <= 0 Then Return Nil
		  Var pic As New Picture(targetW, targetH)
		  Var g As Graphics = pic.Graphics
		  g.DrawingColor = &cFFFFFF
		  g.FillRectangle(0, 0, targetW, targetH)
		  RenderToGraphics(g, targetW, targetH, (targetW = PlotCanvas.Width And targetH = PlotCanvas.Height))
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RenderToGraphics(g As Graphics, targetW As Integer, targetH As Integer, updateActivePlot As Boolean = False)
		  // Route rendering to active demo mode recipe
		  If targetW <= 0 Or targetH <= 0 Then Return
		  
		  Select Case mCurrentDemoMode
		  Case 0
		    RenderMode0_IoT(g, targetW, targetH, updateActivePlot)
		  Case 1
		    RenderMode1_MathWaveforms(g, targetW, targetH, updateActivePlot)
		  Case 2
		    RenderMode2_LiveStream(g, targetW, targetH, updateActivePlot)
		  Case 3
		    RenderMode3_DigitalIO(g, targetW, targetH, updateActivePlot)
		  Case 4
		    RenderMode4_SyncedPlots(g, targetW, targetH, updateActivePlot)
		  Case 5
		    RenderMode5_MultiGrid(g, targetW, targetH, updateActivePlot)
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RenderMode5_MultiGrid(g As Graphics, targetW As Integer, targetH As Integer, updateActivePlot As Boolean)
		  // Recipe: 2x2 Multi-Plot Grid Layout (Heterogeneous Chart Types & Scales)
		  Var grid As New NativeXYPlotGrid(targetW, targetH, 2, 2)
		  grid.SetSpacing(45, 30, 38, 38, 25, 30)
		  grid.SyncCrosshair = (ChkSeries4.Value)
		  grid.ShowSymbols = mShowPoints
		  
		  Var showTitles As Boolean = ChkSeries1.Value
		  Var showLegends As Boolean = ChkSeries2.Value
		  
		  // 1. Cell (0, 0): Real-Time Streaming Sensor Feed (Live / Buffer) - Pan/Zoom OFF
		  Var p00 As NativeXYPlot = grid.Plot(0, 0)
		  p00.Title = ""
		  p00.ShowLegend = showLegends
		  p00.ShowSymbols = mShowPoints
		  p00.AllowPan = False
		  p00.AllowZoom = False
		  p00.SetPlotArea(p00.PlotLeft, p00.PlotTop, p00.PlotWidth, p00.PlotHeight, &cFFFFFF, &cEAEAEA)
		  Var minX0 As Double = mLiveX(0)
		  Var maxX0 As Double = mLiveX(mLiveX.LastIndex)
		  p00.SetXLinearScale(minX0, maxX0)
		  p00.SetYLinearScale(0.0, 100.0, " psi")
		  p00.SetYTitle(If(showTitles, "Pressure (psi)", ""))
		  p00.AddThreshold(30.0, 70.0, &cE0F2F1, &c4DB6AC)
		  p00.AddSeries(mLiveX, mLiveY1, &c0077B6, "Feed A", 2, mShowPoints)
		  p00.AddSeries(mLiveX, mLiveY2, &cF77F00, "Feed B", 2, mShowPoints)
		  
		  // 2. Cell (0, 1): Harmonic Math Waveforms & Damped Cosine - Pan/Zoom ON
		  Var p01 As NativeXYPlot = grid.Plot(0, 1)
		  p01.Title = ""
		  p01.ShowLegend = showLegends
		  p01.ShowSymbols = mShowPoints
		  p01.AllowPan = True
		  p01.AllowZoom = True
		  p01.SetPlotArea(p01.PlotLeft, p01.PlotTop, p01.PlotWidth, p01.PlotHeight, &cFFFFFF, &cEAEAEA)
		  If mGridVoltMaxX <= mGridVoltMinX Then
		    mGridVoltMinX = 0.0
		    mGridVoltMaxX = 100.0
		  End If
		  p01.SetXLinearScale(mGridVoltMinX, mGridVoltMaxX)
		  p01.SetYLinearScale(-10.0, 10.0, " V")
		  p01.SetYTitle(If(showTitles, "Voltage (V)", ""))
		  p01.AddThreshold(-5.0, 5.0, &cFFF8E1, &cFFD54F)
		  p01.AddSeries(mWaveX, mWaveY1, &c3185FC, "Sine", 2, mShowPoints)
		  p01.AddSeries(mWaveX, mWaveY2, &cE63946, "Damped Cos", 2, mShowPoints)
		  p01.AddSeries(mWaveX, mWaveY3, &c2A9D8F, "Harmonic", 1, mShowPoints)
		  
		  // 3. Cell (1, 0): IoT Climate Telemetry (7 Days) - Pan/Zoom ON
		  Var p10 As NativeXYPlot = grid.Plot(1, 0)
		  p10.Title = ""
		  p10.ShowLegend = showLegends
		  p10.ShowSymbols = mShowPoints
		  p10.AllowPan = True
		  p10.AllowZoom = True
		  p10.SetPlotArea(p10.PlotLeft, p10.PlotTop, p10.PlotWidth, p10.PlotHeight, &cFFFFFF, &cEAEAEA)
		  If mGridTempMaxSec <= mGridTempMinSec Then
		    mGridTempMinSec = mIotDates(0).SecondsFrom1970
		    mGridTempMaxSec = mIotDates(mIotDates.LastIndex).SecondsFrom1970
		  End If
		  p10.SetXDateScale(mGridTempMinSec, mGridTempMaxSec)
		  p10.SetYLinearScale(16.0, 28.0, "°C")
		  p10.SetYTitle(If(showTitles, "Temperature (°C)", ""))
		  p10.AddThreshold(20.0, 24.0, &cE8F5E9, &c81C784)
		  p10.AddDateSeries(mIotDates, mIotRoom1, &c3185FC, "Living", 2, mShowPoints)
		  p10.AddDateSeries(mIotDates, mIotRoom2, &cFA9B70, "Bedroom", 2, mShowPoints)
		  
		  // 4. Cell (1, 1): Digital Actuator States (Discrete Channels) - Pan/Zoom OFF
		  Var p11 As NativeXYPlot = grid.Plot(1, 1)
		  p11.Title = ""
		  p11.ShowLegend = showLegends
		  p11.ShowSymbols = mShowPoints
		  p11.AllowPan = False
		  p11.AllowZoom = False
		  p11.SetPlotArea(p11.PlotLeft, p11.PlotTop, p11.PlotWidth, p11.PlotHeight, &cFFFFFF, &cEAEAEA)
		  Var stateFirstSec As Double = mStateDates(0).SecondsFrom1970
		  Var stateEndSec As Double = mStateDates(mStateDates.LastIndex).SecondsFrom1970
		  p11.SetXDateScale(stateFirstSec, stateEndSec)
		  p11.SetYDiscreteLabels(Array("Valve", "Pump", "Relay"), -0.2, 3.1)
		  p11.SetYTitle(If(showTitles, "Channels", ""))
		  p11.AddDateBooleanSeries(mStateDates, mStateRelay, &c3185FC, "Relay", 2, 2.8, 2.1)
		  p11.AddDateBooleanSeries(mStateDates, mStatePump, &cE63946, "Pump", 2, 1.8, 1.1)
		  p11.AddDateBooleanSeries(mStateDates, mStateValve, &c2A9D8F, "Valve", 2, 0.8, 0.1)
		  
		  If updateActivePlot Then
		    Self.mGrid = grid
		    Self.mPlot = p00
		  End If
		  
		  grid.Render(g, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RenderMode0_IoT(g As Graphics, targetW As Integer, targetH As Integer, updateActivePlot As Boolean)
		  // Recipe: IoT Climate Telemetry & Comfort Thresholds
		  Var plot As New NativeXYPlot(targetW, targetH)
		  plot.ShowSymbols = mShowPoints
		  plot.AddTitle("HVAC Climate Telemetry & Comfort Thresholds")
		  
		  Var leftMargin As Integer = 38
		  Var rightMargin As Integer = 38
		  Var topMargin As Integer = 45
		  Var bottomMargin As Integer = 35
		  plot.SetPlotArea(leftMargin, topMargin, Max(50, targetW - leftMargin - rightMargin), Max(45, targetH - topMargin - bottomMargin), &cFFFFFF, &cEAEAEA)
		  
		  Var firstSec As Double = mIotDates(0).SecondsFrom1970
		  Var endSec As Double = mIotDates(mIotDates.LastIndex).SecondsFrom1970
		  Var deltaSec As Double = endSec - firstSec
		  Var curMinSec As Double = firstSec + deltaSec * mViewPortLeft
		  Var curMaxSec As Double = curMinSec + deltaSec * mViewPortWidth
		  
		  plot.SetXDateScale(curMinSec, curMaxSec)
		  plot.SetYLinearScale(16.0, 28.0, "°C")
		  plot.SetYTitle("Temperature")
		  
		  // Highlight comfort zone (20°C - 24°C)
		  plot.AddThreshold(20.0, 24.0, &cE8F5E9, &c81C784)
		  
		  // Add series if checkbox is checked
		  If ChkSeries1.Value Then plot.AddDateSeries(mIotDates, mIotRoom1, &c3185FC, "Living Room", 2, mShowPoints)
		  If ChkSeries2.Value Then plot.AddDateSeries(mIotDates, mIotRoom2, &cFA9B70, "Master Bedroom", 2, mShowPoints)
		  If ChkSeries3.Value Then plot.AddDateSeries(mIotDates, mIotRoom3, &c43AA8B, "Office", 2, mShowPoints)
		  
		  // Add event markers
		  Var event1 As DateTime = DateTime.Now - New DateInterval(0, 0, 5)
		  Var event2 As DateTime = DateTime.Now - New DateInterval(0, 0, 2)
		  plot.AddMarker(event1.SecondsFrom1970, "Occupancy Mode", &c004C6D)
		  plot.AddMarker(event2.SecondsFrom1970, "Filter Cleaned", &c6A4C93)
		  
		  If updateActivePlot Then Self.mPlot = plot
		  plot.Render(g, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RenderMode1_MathWaveforms(g As Graphics, targetW As Integer, targetH As Integer, updateActivePlot As Boolean)
		  // Recipe: Numeric Math Waveforms & Damped Oscillations
		  Var plot As New NativeXYPlot(targetW, targetH)
		  plot.ShowSymbols = mShowPoints
		  plot.AddTitle("Harmonic Waveforms & Damped Oscillations")
		  
		  Var leftMargin As Integer = 38
		  Var rightMargin As Integer = 38
		  Var topMargin As Integer = 45
		  Var bottomMargin As Integer = 35
		  plot.SetPlotArea(leftMargin, topMargin, Max(50, targetW - leftMargin - rightMargin), Max(45, targetH - topMargin - bottomMargin), &cFFFFFF, &cEAEAEA)
		  
		  Var totalSpan As Double = 100.0
		  Var curMinX As Double = totalSpan * mViewPortLeft
		  Var curMaxX As Double = curMinX + totalSpan * mViewPortWidth
		  
		  plot.SetXLinearScale(curMinX, curMaxX)
		  plot.SetYLinearScale(-10.0, 10.0, " V")
		  plot.SetYTitle("Voltage")
		  
		  // Highlight threshold range
		  plot.AddThreshold(-5.0, 5.0, &cFFF8E1, &cFFD54F)
		  
		  // Add series if checkbox is checked
		  If ChkSeries1.Value Then plot.AddSeries(mWaveX, mWaveY1, &c3185FC, "Primary Sine", 2, mShowPoints)
		  If ChkSeries2.Value Then plot.AddSeries(mWaveX, mWaveY2, &cE63946, "Damped Cosine", 2, mShowPoints)
		  If ChkSeries3.Value Then plot.AddSeries(mWaveX, mWaveY3, &c2A9D8F, "Harmonic", 1, mShowPoints)
		  
		  If updateActivePlot Then Self.mPlot = plot
		  plot.Render(g, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RenderMode2_LiveStream(g As Graphics, targetW As Integer, targetH As Integer, updateActivePlot As Boolean)
		  // Recipe: Real-Time Telemetry Streaming Buffer (250ms interval)
		  Var plot As New NativeXYPlot(targetW, targetH)
		  plot.ShowSymbols = mShowPoints
		  plot.AddTitle("Real-Time Telemetry Feed (250ms Buffer)")
		  
		  Var leftMargin As Integer = 38
		  Var rightMargin As Integer = 38
		  Var topMargin As Integer = 45
		  Var bottomMargin As Integer = 35
		  plot.SetPlotArea(leftMargin, topMargin, Max(50, targetW - leftMargin - rightMargin), Max(45, targetH - topMargin - bottomMargin), &cFFFFFF, &cEAEAEA)
		  
		  Var minX As Double = mLiveX(0)
		  Var maxX As Double = mLiveX(mLiveX.LastIndex)
		  
		  plot.SetXLinearScale(minX, maxX)
		  plot.SetYLinearScale(0.0, 100.0, " psi")
		  plot.SetYTitle("Pressure")
		  
		  // Highlight safe pressure zone
		  plot.AddThreshold(30.0, 70.0, &cE0F2F1, &c4DB6AC)
		  
		  // Add streaming feed series
		  If ChkSeries1.Value Then plot.AddSeries(mLiveX, mLiveY1, &c0077B6, "Feed A", 2, mShowPoints)
		  If ChkSeries2.Value Then plot.AddSeries(mLiveX, mLiveY2, &cF77F00, "Feed B", 2, mShowPoints)
		  
		  If updateActivePlot Then Self.mPlot = plot
		  plot.Render(g, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RenderMode3_DigitalIO(g As Graphics, targetW As Integer, targetH As Integer, updateActivePlot As Boolean)
		  // Recipe: Multi-Channel Digital I/O State Timelines (ON/OFF Logic Lanes)
		  Var plot As New NativeXYPlot(targetW, targetH)
		  plot.AddTitle("Digital I/O & Relay Actuator States (Multi-Channel)")
		  
		  Var leftMargin As Integer = 38
		  Var rightMargin As Integer = 38
		  Var topMargin As Integer = 45
		  Var bottomMargin As Integer = 35
		  plot.SetPlotArea(leftMargin, topMargin, Max(50, targetW - leftMargin - rightMargin), Max(45, targetH - topMargin - bottomMargin), &cFFFFFF, &cEAEAEA)
		  
		  Var firstSec As Double = mStateDates(0).SecondsFrom1970
		  Var endSec As Double = mStateDates(mStateDates.LastIndex).SecondsFrom1970
		  Var deltaSec As Double = endSec - firstSec
		  Var curMinSec As Double = firstSec + deltaSec * mViewPortLeft
		  Var curMaxSec As Double = curMinSec + deltaSec * mViewPortWidth
		  
		  plot.SetXDateScale(curMinSec, curMaxSec)
		  plot.SetYDiscreteLabels(Array("Valve", "Pump", "Relay"), -0.2, 3.1)
		  plot.SetYTitle("Channel")
		  
		  // Add boolean digital traces into stacked channel lanes
		  If ChkSeries1.Value Then plot.AddDateBooleanSeries(mStateDates, mStateRelay, &c3185FC, "Relay 1 (Power)", 2, 2.8, 2.1)
		  If ChkSeries2.Value Then plot.AddDateBooleanSeries(mStateDates, mStatePump, &cE63946, "Coolant Pump", 2, 1.8, 1.1)
		  If ChkSeries3.Value Then plot.AddDateBooleanSeries(mStateDates, mStateValve, &c2A9D8F, "Solenoid Valve", 2, 0.8, 0.1)
		  
		  If updateActivePlot Then Self.mPlot = plot
		  plot.Render(g, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RenderMode4_SyncedPlots(g As Graphics, targetW As Integer, targetH As Integer, updateActivePlot As Boolean)
		  // Recipe: Synchronized Multi-Plot Scrubbing (3 Stacked Subplots)
		  Var firstSec As Double = mIotDates(0).SecondsFrom1970
		  Var endSec As Double = mIotDates(mIotDates.LastIndex).SecondsFrom1970
		  Var deltaSec As Double = endSec - firstSec
		  Var curMinSec As Double = firstSec + deltaSec * mViewPortLeft
		  Var curMaxSec As Double = curMinSec + deltaSec * mViewPortWidth
		  
		  Var gap As Integer = 28
		  Var topMargin As Integer = 45
		  Var bottomMargin As Integer = 30
		  Var leftMargin As Integer = 38
		  Var rightMargin As Integer = 38
		  Var plotH As Integer = Max(45, (targetH - topMargin - bottomMargin - (gap * 2)) / 3)
		  Var plotW As Integer = Max(50, targetW - leftMargin - rightMargin)
		  
		  // Plot 1: Temperature (Top)
		  Var p1 As New NativeXYPlot(targetW, targetH)
		  p1.ShowSymbols = mShowPoints
		  p1.AddTitle("Synchronized 3-Plot Scrubbing: Multi-Sensor Analytics")
		  p1.SetPlotArea(leftMargin, topMargin, plotW, plotH, &cFFFFFF, &cEAEAEA)
		  p1.SetXDateScale(curMinSec, curMaxSec)
		  p1.SetYLinearScale(16.0, 28.0, "°C")
		  p1.SetYTitle("Temp")
		  p1.ShowXAxisLabels = False
		  p1.AddThreshold(20.0, 24.0, &cE8F5E9, &c81C784)
		  p1.AddDateSeries(mIotDates, mIotRoom1, &c3185FC, "Living Room", 2, mShowPoints)
		  p1.AddDateSeries(mIotDates, mIotRoom2, &cFA9B70, "Bedroom", 2, mShowPoints)
		  p1.AddDateSeries(mIotDates, mIotRoom3, &c43AA8B, "Office", 2, mShowPoints)
		  
		  // Plot 2: Power & Solar Generation (Middle)
		  Var p2 As New NativeXYPlot(targetW, targetH)
		  p2.ShowSymbols = mShowPoints
		  p2.SetPlotArea(leftMargin, topMargin + plotH + gap, plotW, plotH, &cFFFFFF, &cEAEAEA)
		  p2.SetXDateScale(curMinSec, curMaxSec)
		  p2.SetYLinearScale(0.0, 6.0, " kW")
		  p2.SetYTitle("Power")
		  p2.ShowXAxisLabels = False
		  p2.AddThreshold(0.0, 3.5, &cFFF9C4, &cFFF176)
		  p2.AddDateSeries(mIotDates, mIotPower, &cE63946, "HVAC Load", 2, mShowPoints)
		  p2.AddDateSeries(mIotDates, mIotSolar, &cE9C46A, "Solar PV", 2, mShowPoints)
		  p2.AddDateSeries(mIotDates, mIotGrid, &c264653, "Grid Draw", 2, mShowPoints)
		  
		  // Plot 3: Digital Actuators & Relays (Bottom)
		  Var p3 As New NativeXYPlot(targetW, targetH)
		  p3.SetPlotArea(leftMargin, topMargin + (plotH + gap) * 2, plotW, plotH, &cFFFFFF, &cEAEAEA)
		  p3.SetXDateScale(curMinSec, curMaxSec)
		  p3.SetYDiscreteLabels(Array("Pump", "Fan", "Relay"), -0.2, 3.1)
		  p3.SetYTitle("Control")
		  p3.ShowXAxisLabels = True
		  p3.AddDateBooleanSeries(mIotDates, mSyncRelay, &c2A9D8F, "Compressor", 2, 2.8, 2.1)
		  p3.AddDateBooleanSeries(mIotDates, mSyncFan, &c3A86FF, "Vent Fan", 2, 1.8, 1.1)
		  p3.AddDateBooleanSeries(mIotDates, mSyncPump, &c8338EC, "Circ Pump", 2, 0.8, 0.1)
		  
		  // Add sync event markers across timeline
		  Var alertDt As DateTime = DateTime.Now - New DateInterval(0, 0, 4)
		  Var schedDt As DateTime = DateTime.Now - New DateInterval(0, 0, 2)
		  p1.AddMarker(alertDt.SecondsFrom1970, "Peak Demand Alert", &cE63946)
		  p1.AddMarker(schedDt.SecondsFrom1970, "Eco Schedule", &c004C6D)
		  p2.AddMarker(alertDt.SecondsFrom1970, "", &cE63946)
		  p2.AddMarker(schedDt.SecondsFrom1970, "", &c004C6D)
		  p3.AddMarker(alertDt.SecondsFrom1970, "", &cE63946)
		  p3.AddMarker(schedDt.SecondsFrom1970, "", &c004C6D)
		  
		  If updateActivePlot Then
		    mPlot1 = p1
		    mPlot2 = p2
		    mPlot3 = p3
		    mPlot = p1
		  End If
		  
		  p1.Render(g, False)
		  p2.Render(g, False)
		  p3.Render(g, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawPlot()
		  // Check canvas size
		  If PlotCanvas.Width <= 0 Or PlotCanvas.Height <= 0 Then Return
		  mBasePicture = BuildPlotPicture(PlotCanvas.Width, PlotCanvas.Height)
		  PlotCanvas.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetView()
		  // Reset pan and zoom to full view
		  mViewPortLeft = 0.0
		  mViewPortWidth = 1.0
		  mGridVoltMinX = 0.0
		  mGridVoltMaxX = 100.0
		  If mIotDates.Count > 0 Then
		    mGridTempMinSec = mIotDates(0).SecondsFrom1970
		    mGridTempMaxSec = mIotDates(mIotDates.LastIndex).SecondsFrom1970
		  End If
		  mGrid = Nil
		  mActiveHitPlot = Nil
		  RedrawPlot()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDemoMode(mode As Integer)
		  // Set active demo mode and reset zoom
		  mCurrentDemoMode = mode
		  mViewPortLeft = 0.0
		  mViewPortWidth = 1.0
		  mGrid = Nil
		  mActiveHitPlot = Nil
		  
		  If mode >= 0 And mode < ModeTabs.SegmentCount Then
		    If ModeTabs.SelectedSegmentIndex <> mode Then
		      ModeTabs.SelectedSegmentIndex = mode
		    End If
		  End If
		  
		  // Generate data if needed
		  If mIotDates.Count = 0 Then
		    GenerateDemoData()
		  End If
		  
		  mGridVoltMinX = 0.0
		  mGridVoltMaxX = 100.0
		  If mIotDates.Count > 0 Then
		    mGridTempMinSec = mIotDates(0).SecondsFrom1970
		    mGridTempMaxSec = mIotDates(mIotDates.LastIndex).SecondsFrom1970
		  End If
		  
		  // Start live timer for streaming modes
		  If mode = 2 Or mode = 5 Then
		    SimTimer.Mode = 2
		  Else
		    SimTimer.Mode = 0
		  End If
		  
		  // Reset checkboxes
		  ChkSeries1.Value = True
		  ChkSeries2.Value = True
		  ChkSeries3.Value = True
		  ChkSeries4.Value = False
		  
		  // Update UI labels and checkbox captions
		  Select Case mode
		  Case 0
		    ChkSeries1.Caption = "Living Room"
		    ChkSeries1.Visible = True
		    ChkSeries2.Caption = "Master Bedroom"
		    ChkSeries2.Visible = True
		    ChkSeries3.Caption = "Office"
		    ChkSeries3.Visible = True
		    ChkSeries4.Visible = False
		    StatusLabel.Text = "Mode: IoT Telemetry | Toggle checkboxes | Hover values | 'P': toggle dots | 'L': legend badge"
		  Case 1
		    ChkSeries1.Caption = "Primary Sine"
		    ChkSeries1.Visible = True
		    ChkSeries2.Caption = "Damped Cosine"
		    ChkSeries2.Visible = True
		    ChkSeries3.Caption = "Harmonic"
		    ChkSeries3.Visible = True
		    ChkSeries4.Visible = False
		    StatusLabel.Text = "Mode: Math Waveforms | Toggle checkboxes | Hover values | 'P': toggle dots | 'L': legend badge"
		  Case 2
		    ChkSeries1.Caption = "Feed A"
		    ChkSeries1.Visible = True
		    ChkSeries2.Caption = "Feed B"
		    ChkSeries2.Visible = True
		    ChkSeries3.Visible = False
		    ChkSeries4.Visible = False
		    StatusLabel.Text = "Mode: Live Stream (Active Feed) | Toggle checkboxes | 'P': toggle dots | 'L': legend badge"
		  Case 3
		    ChkSeries1.Caption = "Relay 1 (Power)"
		    ChkSeries1.Visible = True
		    ChkSeries2.Caption = "Coolant Pump"
		    ChkSeries2.Visible = True
		    ChkSeries3.Caption = "Solenoid Valve"
		    ChkSeries3.Visible = True
		    ChkSeries4.Visible = False
		    StatusLabel.Text = "Mode: Digital I/O State Timeline | Toggle checkboxes | 'L': legend badge"
		  Case 4
		    ChkSeries1.Caption = "Sync Temp Plot"
		    ChkSeries1.Visible = True
		    ChkSeries2.Caption = "Sync Power Plot"
		    ChkSeries2.Visible = True
		    ChkSeries3.Caption = "Sync Relay Plot"
		    ChkSeries3.Visible = True
		    ChkSeries4.Visible = False
		    StatusLabel.Text = "Mode: Synced 3-Plot | Scrub plots | Toggle sync checkboxes | 'P': toggle dots | 'L': legend badge"
		  Case 5
		    ChkSeries1.Caption = "Show Titles"
		    ChkSeries1.Visible = True
		    ChkSeries2.Caption = "Show Legends"
		    ChkSeries2.Visible = True
		    ChkSeries3.Caption = "Real-Time Stream"
		    ChkSeries3.Visible = True
		    ChkSeries4.Caption = "Sync Crosshairs"
		    ChkSeries4.Visible = True
		    StatusLabel.Text = "Mode: 2x2 Multi-Grid | Pan/zoom on Voltage & Temp | Toggle titles/legends | 'P': toggle dots | 'L': legend badge"
		  End Select
		  
		  RedrawPlot()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mShowPoints As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBasePicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentDemoMode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIotDates() As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIotPower() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIotRoom1() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIotRoom2() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIotRoom3() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsDragging As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowTrackingLegend As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLiveStep As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLiveX() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLiveY1() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLiveY2() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseX As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseY As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlot As NativeXYPlot
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGrid As NativeXYPlotGrid
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActiveHitPlot As NativeXYPlot
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlot1 As NativeXYPlot
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlot2 As NativeXYPlot
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlot3 As NativeXYPlot
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSharedDataX As Double = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStateDates() As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStatePump() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStateRelay() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStateValve() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridVoltMinX As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridVoltMaxX As Double = 100.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridTempMinSec As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGridTempMaxSec As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIotSolar() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIotGrid() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSyncFan() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSyncPump() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSyncRelay() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mViewPortLeft As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mViewPortWidth As Double = 1.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWaveX() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWaveY1() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWaveY2() As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWaveY3() As Double
	#tag EndProperty


#tag EndWindowCode

#tag Events ModeTabs
	#tag Event
		Sub Pressed(segmentIndex As Integer)
		  // Switch active demo mode tab
		  SetDemoMode(segmentIndex)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BtnReset
	#tag Event
		Sub Pressed()
		  // Reset zoom and pan
		  ResetView()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BtnExport
	#tag Event
		Sub Pressed()
		  // Export plot to PNG image
		  If mPlot Is Nil Then Return
		  Var f As FolderItem = FolderItem.ShowSaveFileDialog(".png", "NativeXYPlot_Demo.png")
		  If f <> Nil Then
		    Var pic As Picture = BuildPlotPicture(1920, 1080)
		    If pic <> Nil Then
		      pic.Save(f, Picture.Formats.PNG)
		      f.Open
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BtnExportPDF
	#tag Event
		Sub Pressed()
		  // Export plot to vector PDF
		  If mPlot Is Nil Then Return
		  Var f As FolderItem = FolderItem.ShowSaveFileDialog(".pdf", "NativeXYPlot_Demo.pdf")
		  If f <> Nil Then
		    Var doc As New PDFDocument
		    doc.Landscape = True
		    doc.Title = "NativeXYPlot Export"
		    Var g As Graphics = doc.Graphics
		    RenderToGraphics(g, g.Width, g.Height, False)
		    doc.Save(f)
		    f.Open
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChkSeries1
	#tag Event
		Sub ValueChanged()
		  // Redraw when checkbox toggled
		  RedrawPlot()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChkSeries2
	#tag Event
		Sub ValueChanged()
		  // Redraw when checkbox toggled
		  RedrawPlot()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChkSeries3
	#tag Event
		Sub ValueChanged()
		  // Redraw when checkbox toggled
		  RedrawPlot()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChkSeries4
	#tag Event
		Sub ValueChanged()
		  // Redraw when checkbox toggled
		  RedrawPlot()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlotCanvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Key.Uppercase = "L" Then
		    mShowTrackingLegend = Not mShowTrackingLegend
		    Me.Refresh
		    Return True
		  ElseIf Key.Uppercase = "P" Then
		    mShowPoints = Not mShowPoints
		    StatusLabel.Text = "Data Points (dots): " + If(mShowPoints, "Visible (Lines + Dots)", "Hidden (Lines Only)") + " | 'P': toggle dots | 'L': legend badge"
		    RedrawPlot()
		    Return True
		  End If
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  // Set focus to canvas for keyboard shortcuts
		  Me.SetFocus
		  
		  // Start pan drag
		  mStartX = X
		  mStartY = Y
		  mIsDragging = True
		  
		  If mCurrentDemoMode = 5 And mGrid <> Nil Then
		    mActiveHitPlot = mGrid.GetPlotAt(X, Y)
		  End If
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  // Pan viewport while dragging
		  If Not mIsDragging Then Return
		  
		  If mCurrentDemoMode = 5 And mGrid <> Nil Then
		    If mActiveHitPlot <> Nil Then
		      Var deltaPix As Integer = mStartX - X
		      If mGrid.HandleMouseDrag(deltaPix, 0, mActiveHitPlot) Then
		        Var pVolt As NativeXYPlot = mGrid.Plot(0, 1)
		        If pVolt <> Nil Then
		          mGridVoltMinX = pVolt.X_Min
		          mGridVoltMaxX = pVolt.X_Max
		        End If
		        Var pTemp As NativeXYPlot = mGrid.Plot(1, 0)
		        If pTemp <> Nil Then
		          mGridTempMinSec = pTemp.X_Min
		          mGridTempMaxSec = pTemp.X_Max
		        End If
		        mStartX = X
		        mStartY = Y
		        RedrawPlot()
		      End If
		    End If
		    Return
		  End If
		  
		  If mPlot = Nil Then Return
		  Var deltaPix As Integer = mStartX - X
		  If deltaPix = 0 Then Return
		  
		  Var plotW As Double = Max(1, mPlot.PlotWidth)
		  Var deltaNorm As Double = (deltaPix * 1.0 / plotW) * mViewPortWidth
		  mViewPortLeft = Max(0.0, Min(1.0 - mViewPortWidth, mViewPortLeft + deltaNorm))
		  mStartX = X
		  mStartY = Y
		  RedrawPlot()
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(x As Integer, y As Integer)
		  // Track cursor position for overlay
		  mMouseX = X
		  mMouseY = Y
		  
		  If mCurrentDemoMode = 4 Then
		    If mPlot1 <> Nil And X >= mPlot1.PlotLeft And X <= mPlot1.PlotLeft + mPlot1.PlotWidth Then
		      mSharedDataX = mPlot1.GetNearestXValue(X)
		    Else
		      mSharedDataX = -1
		    End If
		  End If
		  
		  Me.Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  // Stop pan drag
		  mIsDragging = False
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(x As Integer, y As Integer, deltaX As Integer, deltaY As Integer) As Boolean
		  // Zoom in / out at cursor point
		  If mCurrentDemoMode = 5 And mGrid <> Nil Then
		    Var handled As Boolean = mGrid.HandleMouseWheel(X, Y, deltaX, deltaY, 1.2)
		    If handled Then
		      Var pVolt As NativeXYPlot = mGrid.Plot(0, 1)
		      If pVolt <> Nil Then
		        mGridVoltMinX = pVolt.X_Min
		        mGridVoltMaxX = pVolt.X_Max
		      End If
		      Var pTemp As NativeXYPlot = mGrid.Plot(1, 0)
		      If pTemp <> Nil Then
		        mGridTempMinSec = pTemp.X_Min
		        mGridTempMaxSec = pTemp.X_Max
		      End If
		      RedrawPlot()
		      Return True
		    End If
		    Return False
		  End If
		  
		  If mPlot = Nil Then Return False
		  Var zoomFactor As Double = 1.2
		  Var plotW As Double = Max(1, mPlot.PlotWidth)
		  Var focusRatio As Double = ((X - mPlot.PlotLeft) * 1.0) / plotW
		  focusRatio = Max(0.0, Min(1.0, focusRatio))
		  
		  If deltaY < 0 Then
		    // Zoom in
		    Var newWidth As Double = Max(0.005, mViewPortWidth / zoomFactor)
		    mViewPortLeft = mViewPortLeft + (mViewPortWidth - newWidth) * focusRatio
		    mViewPortWidth = newWidth
		  ElseIf deltaY > 0 Then
		    // Zoom out
		    Var newWidth As Double = Min(1.0, mViewPortWidth * zoomFactor)
		    mViewPortLeft = mViewPortLeft - (newWidth - mViewPortWidth) * focusRatio
		    mViewPortWidth = newWidth
		  End If
		  
		  mViewPortLeft = Max(0.0, Min(1.0 - mViewPortWidth, mViewPortLeft))
		  RedrawPlot()
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  // Draw base chart picture
		  If mBasePicture <> Nil Then
		    g.DrawPicture(mBasePicture, 0, 0)
		  End If
		  
		  If mCurrentDemoMode = 5 Then
		    // Draw grid tracking overlay
		    If mGrid <> Nil And mMouseX >= 0 Then
		      mGrid.DrawTrackingOverlay(g, mMouseX, mMouseY, True, mShowTrackingLegend)
		    End If
		  ElseIf mCurrentDemoMode = 4 Then
		    // Draw linked crosshair overlay across selected plots
		    If mSharedDataX >= 0 Then
		      If ChkSeries1.Value And mPlot1 <> Nil Then mPlot1.DrawTrackingOverlayByValue(g, mSharedDataX, True, mShowTrackingLegend)
		      If ChkSeries2.Value And mPlot2 <> Nil Then mPlot2.DrawTrackingOverlayByValue(g, mSharedDataX, True, mShowTrackingLegend)
		      If ChkSeries3.Value And mPlot3 <> Nil Then mPlot3.DrawTrackingOverlayByValue(g, mSharedDataX, True, mShowTrackingLegend)
		    End If
		  Else
		    // Draw tracking overlay crosshair on top
		    If mPlot <> Nil And mMouseX >= 0 Then
		      mPlot.DrawTrackingOverlay(g, mMouseX, mMouseY, True, mShowTrackingLegend)
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SimTimer
	#tag Event
		Sub Action()
		  // Advance live data simulation step
		  If mCurrentDemoMode <> 2 And Not (mCurrentDemoMode = 5 And ChkSeries3.Value) Then Return
		  
		  mLiveStep = mLiveStep + 1
		  mLiveX.Add(mLiveStep * 1.0)
		  mLiveY1.Add(45.0 + Sin(mLiveStep * 0.2) * 15.0 + Rnd * 5.0)
		  mLiveY2.Add(60.0 + Cos(mLiveStep * 0.15) * 20.0 + Rnd * 4.0)
		  
		  If mLiveX.Count > 60 Then
		    mLiveX.RemoveAt(0)
		    mLiveY1.RemoveAt(0)
		    mLiveY2.RemoveAt(0)
		  End If
		  
		  RedrawPlot()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue="2061463551"
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="NativeXYPlot Showcase & Interactive Demo"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="900"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
