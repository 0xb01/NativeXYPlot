#tag Class
Protected Class NativeXYPlotGrid
	#tag Note, Name = Readme
		NativeXYPlotGrid - Multi-Chart Matrix & Synchronized Plot Layout Engine
		=======================================================================
		
		GitHub Repository:
		https://github.com/0xb01/NativeXYPlot
		
		Documentation:
		https://github.com/0xb01/NativeXYPlot/blob/main/docs/DOCUMENTATION.md
		
		License: MIT License
		
		Contributions, issues, and feature suggestions are welcome and appreciated!
	#tag EndNote

	#tag Method, Flags = &h0
		Sub AutoScaleAll(marginPercent As Double = 0.05, includeZero As Boolean = False)
		  // Auto-scale all plots in grid
		  For Each p As NativeXYPlot In mPlots
		    If p <> Nil Then
		      p.AutoScale(marginPercent, includeZero)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutoScaleColumn(col As Integer, marginPercent As Double = 0.05, includeZero As Boolean = False)
		  // Auto-scale all plots in specified column
		  If col < 0 Or col >= Columns Then Return
		  For r As Integer = 0 To Rows - 1
		    Var p As NativeXYPlot = GetPlotInternal(r, col)
		    If p <> Nil Then
		      p.AutoScale(marginPercent, includeZero)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutoScaleRow(row As Integer, marginPercent As Double = 0.05, includeZero As Boolean = False)
		  // Auto-scale all plots in specified row
		  If row < 0 Or row >= Rows Then Return
		  For c As Integer = 0 To Columns - 1
		    Var p As NativeXYPlot = GetPlotInternal(row, c)
		    If p <> Nil Then
		      p.AutoScale(marginPercent, includeZero)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearPlots()
		  // Clear and reset all plots
		  Var emptyList() As NativeXYPlot
		  mPlots = emptyList
		  EnsureCapacity()
		  RecalculateLayout()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(w As Integer = 800, h As Integer = 600, numRows As Integer = 2, numCols As Integer = 2)
		  // Initialize grid container with dimensions and cell counts
		  Width = w
		  Height = h
		  Rows = Max(1, numRows)
		  Columns = Max(1, numCols)
		  MarginLeft = 38
		  MarginRight = 38
		  MarginTop = 35
		  MarginBottom = 35
		  GapX = 45
		  GapY = 35
		  LinkAllX = False
		  LinkColumnX = False
		  LinkAllY = False
		  LinkRowY = False
		  SyncCrosshair = True
		  
		  EnsureCapacity()
		  RecalculateLayout()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTrackingOverlay(g As Graphics, mouseX As Double, mouseY As Double, showValues As Boolean = True, showLegend As Boolean = False)
		  // Draw tracking overlay crosshair on target plot or synchronized across linked plots
		  If g Is Nil Then Return
		  
		  Var hitRow As Integer = -1
		  Var hitCol As Integer = -1
		  Var targetPlot As NativeXYPlot = GetPlotAt(mouseX, mouseY, hitRow, hitCol)
		  If targetPlot = Nil Then Return
		  
		  If SyncCrosshair Or LinkAllX Or LinkColumnX Then
		    Var nearestDataX As Double = targetPlot.GetNearestXValue(mouseX)
		    Var u As Double = (mouseX - targetPlot.PlotLeft) * 1.0 / Max(1, targetPlot.PlotWidth)
		    u = Max(0.0, Min(1.0, u))
		    
		    If LinkAllX Then
		      // Sync across all subplots
		      For Each p As NativeXYPlot In mPlots
		        If p <> Nil Then
		          If p.IsDateAxis = targetPlot.IsDateAxis And nearestDataX >= p.X_Min And nearestDataX <= p.X_Max Then
		            p.DrawTrackingOverlayByValue(g, nearestDataX, showValues, showLegend)
		          Else
		            Var pScreenX As Double = p.PlotLeft + u * p.PlotWidth
		            Var pValX As Double = p.GetNearestXValue(pScreenX)
		            p.DrawTrackingOverlayByValue(g, pValX, showValues, showLegend)
		          End If
		        End If
		      Next
		    ElseIf LinkColumnX Then
		      // Sync across subplots in the same column
		      For r As Integer = 0 To Rows - 1
		        Var colPlot As NativeXYPlot = GetPlotInternal(r, hitCol)
		        If colPlot <> Nil Then
		          If colPlot.IsDateAxis = targetPlot.IsDateAxis And nearestDataX >= colPlot.X_Min And nearestDataX <= colPlot.X_Max Then
		            colPlot.DrawTrackingOverlayByValue(g, nearestDataX, showValues, showLegend)
		          Else
		            Var pScreenX As Double = colPlot.PlotLeft + u * colPlot.PlotWidth
		            Var pValX As Double = colPlot.GetNearestXValue(pScreenX)
		            colPlot.DrawTrackingOverlayByValue(g, pValX, showValues, showLegend)
		          End If
		        End If
		      Next
		    ElseIf SyncCrosshair Then
		      // Broadcast synchronized tracking overlay across all grid subplots
		      For Each p As NativeXYPlot In mPlots
		        If p <> Nil Then
		          If p = targetPlot Then
		            p.DrawTrackingOverlay(g, mouseX, mouseY, showValues, showLegend)
		          ElseIf p.IsDateAxis = targetPlot.IsDateAxis And nearestDataX >= p.X_Min And nearestDataX <= p.X_Max Then
		            p.DrawTrackingOverlayByValue(g, nearestDataX, showValues, showLegend)
		          Else
		            Var pScreenX As Double = p.PlotLeft + u * p.PlotWidth
		            Var pValX As Double = p.GetNearestXValue(pScreenX)
		            p.DrawTrackingOverlayByValue(g, pValX, showValues, showLegend)
		          End If
		        End If
		      Next
		    End If
		    Return
		  End If
		  
		  targetPlot.DrawTrackingOverlay(g, mouseX, mouseY, showValues, showLegend)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTrackingOverlayByValue(g As Graphics, targetDataX As Double, showValues As Boolean = True, showLegend As Boolean = False)
		  // Draw tracking overlay snapped to shared X domain across all active plots
		  If g Is Nil Then Return
		  For Each p As NativeXYPlot In mPlots
		    If p <> Nil Then
		      p.DrawTrackingOverlayByValue(g, targetDataX, showValues, showLegend)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EnsureCapacity()
		  // Ensure internal plot array accommodates Rows * Columns
		  Var totalCells As Integer = Rows * Columns
		  While mPlots.Count < totalCells
		    mPlots.Add(Nil)
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportPDF(f As FolderItem, fitPage As Boolean = True, landscape As Boolean = True)
		  // Export entire plot grid directly to vector PDF file
		  If f Is Nil Then Return
		  Var doc As PDFDocument = MakePDFDocument(fitPage, landscape)
		  Try
		    doc.Save(f)
		  Catch e As IOException
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPlotAt(screenX As Double, screenY As Double) As NativeXYPlot
		  // Hit-test screen coordinates to find subplot instance
		  Var r As Integer = -1
		  Var c As Integer = -1
		  Return GetPlotAt(screenX, screenY, r, c)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPlotAt(screenX As Double, screenY As Double, ByRef outRow As Integer, ByRef outCol As Integer) As NativeXYPlot
		  // Hit-test screen coordinates and return subplot with row/column indices
		  outRow = -1
		  outCol = -1
		  
		  Var halfGapX As Double = GapX / 2.0
		  Var halfGapY As Double = GapY / 2.0
		  
		  For r As Integer = 0 To Rows - 1
		    For c As Integer = 0 To Columns - 1
		      Var p As NativeXYPlot = GetPlotInternal(r, c)
		      If p <> Nil And p.Visible Then
		        Var leftB As Double = If(c = 0, 0, p.PlotLeft - halfGapX)
		        Var rightB As Double = If(c = Columns - 1, Width, p.PlotLeft + p.PlotWidth + halfGapX)
		        Var topB As Double = If(r = 0, 0, p.PlotTop - halfGapY)
		        Var botB As Double = If(r = Rows - 1, Height, p.PlotTop + p.PlotHeight + halfGapY)
		        
		        If screenX >= leftB And screenX <= rightB And screenY >= topB And screenY <= botB Then
		          outRow = r
		          outCol = c
		          Return p
		        End If
		      End If
		    Next
		  Next
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetPlotInternal(row As Integer, col As Integer) As NativeXYPlot
		  If row < 0 Or row >= Rows Or col < 0 Or col >= Columns Then Return Nil
		  Var idx As Integer = row * Columns + col
		  If idx >= 0 And idx < mPlots.Count Then
		    Return mPlots(idx)
		  End If
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HandleMouseDrag(deltaX As Integer, deltaY As Integer, hitPlot As NativeXYPlot) As Boolean
		  // Apply panning delta to hit plot or linked subplots
		  If hitPlot = Nil Or Not hitPlot.AllowPan Then Return False
		  If deltaX = 0 Then Return False
		  
		  Var plotW As Double = Max(1, hitPlot.PlotWidth)
		  Var span As Double = hitPlot.X_Max - hitPlot.X_Min
		  Var deltaVal As Double = (deltaX * 1.0 / plotW) * span
		  
		  If LinkAllX Then
		    For Each p As NativeXYPlot In mPlots
		      If p <> Nil And p.AllowPan Then
		        p.X_Min = p.X_Min + deltaVal
		        p.X_Max = p.X_Max + deltaVal
		      End If
		    Next
		  ElseIf LinkColumnX Then
		    Var hitR As Integer = -1
		    Var hitC As Integer = -1
		    Call GetPlotAt(hitPlot.PlotLeft + 5, hitPlot.PlotTop + 5, hitR, hitC)
		    If hitC >= 0 Then
		      For r As Integer = 0 To Rows - 1
		        Var colP As NativeXYPlot = GetPlotInternal(r, hitC)
		        If colP <> Nil And colP.AllowPan Then
		          colP.X_Min = colP.X_Min + deltaVal
		          colP.X_Max = colP.X_Max + deltaVal
		        End If
		      Next
		    Else
		      hitPlot.X_Min = hitPlot.X_Min + deltaVal
		      hitPlot.X_Max = hitPlot.X_Max + deltaVal
		    End If
		  Else
		    hitPlot.X_Min = hitPlot.X_Min + deltaVal
		    hitPlot.X_Max = hitPlot.X_Max + deltaVal
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HandleMouseWheel(x As Integer, y As Integer, deltaX As Integer, deltaY As Integer, zoomFactor As Double = 1.2) As Boolean
		  // Apply zoom to subplot under cursor or linked subplots
		  Var hitRow As Integer = -1
		  Var hitCol As Integer = -1
		  Var hitPlot As NativeXYPlot = GetPlotAt(x, y, hitRow, hitCol)
		  If hitPlot = Nil Or Not hitPlot.AllowZoom Then Return False
		  
		  Var factor As Double = If(deltaY < 0, 1.0 / zoomFactor, zoomFactor)
		  Var plotW As Double = Max(1, hitPlot.PlotWidth)
		  Var focusRatio As Double = (x - hitPlot.PlotLeft) * 1.0 / plotW
		  focusRatio = Max(0.0, Min(1.0, focusRatio))
		  
		  Var span As Double = hitPlot.X_Max - hitPlot.X_Min
		  Var newSpan As Double = span * factor
		  Var newMin As Double = hitPlot.X_Min + (span - newSpan) * focusRatio
		  Var newMax As Double = newMin + newSpan
		  
		  If LinkAllX Then
		    For Each p As NativeXYPlot In mPlots
		      If p <> Nil And p.AllowZoom Then
		        Var pSpan As Double = p.X_Max - p.X_Min
		        Var pNewSpan As Double = pSpan * factor
		        Var pNewMin As Double = p.X_Min + (pSpan - pNewSpan) * focusRatio
		        p.X_Min = pNewMin
		        p.X_Max = pNewMin + pNewSpan
		      End If
		    Next
		  ElseIf LinkColumnX Then
		    For r As Integer = 0 To Rows - 1
		      Var colPlot As NativeXYPlot = GetPlotInternal(r, hitCol)
		      If colPlot <> Nil And colPlot.AllowZoom Then
		        Var pSpan As Double = colPlot.X_Max - colPlot.X_Min
		        Var pNewSpan As Double = pSpan * factor
		        Var pNewMin As Double = colPlot.X_Min + (pSpan - pNewSpan) * focusRatio
		        colPlot.X_Min = pNewMin
		        colPlot.X_Max = pNewMin + pNewSpan
		      End If
		    Next
		  Else
		    hitPlot.X_Min = newMin
		    hitPlot.X_Max = newMax
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasPlot(row As Integer, col As Integer) As Boolean
		  // Check if plot is assigned at cell
		  Return GetPlotInternal(row, col) <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeChartPicture(w As Integer = 0, h As Integer = 0) As Picture
		  // Render entire grid into an offscreen Picture bitmap
		  Var targetW As Integer = If(w > 0, w, Width)
		  Var targetH As Integer = If(h > 0, h, Height)
		  If targetW <= 0 Or targetH <= 0 Then Return Nil
		  
		  Var pic As New Picture(targetW, targetH)
		  Var g As Graphics = pic.Graphics
		  
		  If targetW <> Width Or targetH <> Height Then
		    Var origW As Integer = Width
		    Var origH As Integer = Height
		    Width = targetW
		    Height = targetH
		    RecalculateLayout()
		    Render(g, True)
		    Width = origW
		    Height = origH
		    RecalculateLayout()
		  Else
		    Render(g, True)
		  End If
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakePDFDocument(fitPage As Boolean = True, landscape As Boolean = True) As PDFDocument
		  // Render entire plot grid into vector PDF document
		  Var doc As New PDFDocument
		  doc.Landscape = landscape
		  Var g As Graphics = doc.Graphics
		  
		  If fitPage Then
		    Var origW As Integer = Width
		    Var origH As Integer = Height
		    Width = g.Width
		    Height = g.Height
		    RecalculateLayout()
		    Render(g, True)
		    Width = origW
		    Height = origH
		    RecalculateLayout()
		  Else
		    Render(g, True)
		  End If
		  
		  Return doc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Plot(row As Integer, col As Integer) As NativeXYPlot
		  // Get or auto-instantiate plot at specified cell
		  If row < 0 Or row >= Rows Or col < 0 Or col >= Columns Then Return Nil
		  EnsureCapacity()
		  Var idx As Integer = row * Columns + col
		  Var p As NativeXYPlot = mPlots(idx)
		  If p = Nil Then
		    p = New NativeXYPlot(Width, Height)
		    mPlots(idx) = p
		    RecalculateLayout()
		  End If
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecalculateLayout()
		  // Calculate layout bounds for every cell in grid
		  EnsureCapacity()
		  
		  Var totalGapX As Double = (Columns - 1) * GapX
		  Var totalGapY As Double = (Rows - 1) * GapY
		  Var availW As Double = Max(50, Width - MarginLeft - MarginRight - totalGapX)
		  Var availH As Double = Max(50, Height - MarginTop - MarginBottom - totalGapY)
		  
		  Var cellPlotW As Double = Max(30, availW / Columns)
		  Var cellPlotH As Double = Max(30, availH / Rows)
		  
		  For r As Integer = 0 To Rows - 1
		    For c As Integer = 0 To Columns - 1
		      Var p As NativeXYPlot = GetPlotInternal(r, c)
		      If p <> Nil Then
		        Var leftPos As Integer = MarginLeft + c * (cellPlotW + GapX)
		        Var topPos As Integer = MarginTop + r * (cellPlotH + GapY)
		        p.Width = Width
		        p.Height = Height
		        p.SetPlotArea(leftPos, topPos, cellPlotW, cellPlotH, p.PlotBgColor, p.GridColor)
		        
		        // Auto-configure bottom X labels for linked column plots
		        If LinkColumnX Then
		          p.ShowXAxisLabels = (r = Rows - 1)
		        End If
		      End If
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Render(g As Graphics, clearBackground As Boolean = True)
		  // Draw all subplots to graphics context
		  If g Is Nil Then Return
		  
		  If clearBackground Then
		    g.DrawingColor = &cFFFFFF
		    g.FillRectangle(0, 0, g.Width, g.Height)
		  End If
		  
		  For Each p As NativeXYPlot In mPlots
		    If p <> Nil Then
		      p.Render(g, False)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDimensions(w As Integer, h As Integer)
		  // Resize grid canvas dimensions
		  Width = w
		  Height = h
		  RecalculateLayout()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGrid(numRows As Integer, numCols As Integer)
		  // Reconfigure grid dimensions and preserve existing cell plots
		  Var newRows As Integer = Max(1, numRows)
		  Var newCols As Integer = Max(1, numCols)
		  If newRows = Rows And newCols = Columns Then Return
		  
		  Var oldPlots() As NativeXYPlot = mPlots
		  Var oldRows As Integer = Rows
		  Var oldCols As Integer = Columns
		  
		  Rows = newRows
		  Columns = newCols
		  Var emptyList() As NativeXYPlot
		  mPlots = emptyList
		  EnsureCapacity()
		  
		  // Migrate existing plots
		  For r As Integer = 0 To Min(oldRows, Rows) - 1
		    For c As Integer = 0 To Min(oldCols, Columns) - 1
		      Var oldIdx As Integer = r * oldCols + c
		      Var newIdx As Integer = r * Columns + c
		      If oldIdx < oldPlots.Count Then
		        mPlots(newIdx) = oldPlots(oldIdx)
		      End If
		    Next
		  Next
		  
		  RecalculateLayout()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPlot(row As Integer, col As Integer, p As NativeXYPlot)
		  // Assign custom plot instance to specific cell
		  If row < 0 Or row >= Rows Or col < 0 Or col >= Columns Then Return
		  EnsureCapacity()
		  Var idx As Integer = row * Columns + col
		  mPlots(idx) = p
		  RecalculateLayout()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSpacing(hGap As Integer, vGap As Integer, mLeft As Integer = 38, mRight As Integer = 38, mTop As Integer = 35, mBottom As Integer = 35)
		  // Configure layout margins and gaps
		  GapX = hGap
		  GapY = vGap
		  MarginLeft = mLeft
		  MarginRight = mRight
		  MarginTop = mTop
		  MarginBottom = mBottom
		  RecalculateLayout()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Columns As Integer = 2
	#tag EndProperty

	#tag Property, Flags = &h0
		GapX As Integer = 45
	#tag EndProperty

	#tag Property, Flags = &h0
		GapY As Integer = 35
	#tag EndProperty

	#tag Property, Flags = &h0
		Height As Integer = 600
	#tag EndProperty

	#tag Property, Flags = &h0
		LinkAllX As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		LinkAllY As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		LinkColumnX As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		LinkRowY As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		MarginBottom As Integer = 35
	#tag EndProperty

	#tag Property, Flags = &h0
		MarginLeft As Integer = 38
	#tag EndProperty

	#tag Property, Flags = &h0
		MarginRight As Integer = 38
	#tag EndProperty

	#tag Property, Flags = &h0
		MarginTop As Integer = 35
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPlots() As NativeXYPlot
	#tag EndProperty

	#tag Property, Flags = &h0
		Rows As Integer = 2
	#tag EndProperty

	#tag Property, Flags = &h0
		SyncCrosshair As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowSymbols As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Width As Integer = 800
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="800"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="600"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Rows"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Columns"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
