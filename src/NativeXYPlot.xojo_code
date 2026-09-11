#tag Class
Protected Class NativeXYPlot
	#tag Note, Name = Readme
		NativeXYPlot - Fast, Lightweight, Pure Native Chart Engine for Xojo
		=====================================================================
		
		GitHub Repository:
		https://github.com/0xb01/NativeXYPlot
		
		Documentation:
		https://github.com/0xb01/NativeXYPlot/blob/main/docs/DOCUMENTATION.md
		
		License: MIT License
		
		Contributions, issues, and feature suggestions are welcome and appreciated!
	#tag EndNote

	#tag Method, Flags = &h0
		Sub AddBooleanSeries(xValues() As Double, states() As Boolean, c As Color, name As String = "", lineWidth As Integer = 2, highVal As Double = 1.0, lowVal As Double = 0.0)
		  // Convert True/False states to high/low numbers
		  Var yD() As Double
		  For Each b As Boolean In states
		    If b Then
		      yD.Add(highVal)
		    Else
		      yD.Add(lowVal)
		    End If
		  Next
		  // Add as step series
		  AddStepSeries(xValues, yD, c, name, lineWidth, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDateBooleanSeries(xDates() As DateTime, states() As Boolean, c As Color, name As String = "", lineWidth As Integer = 2, highVal As Double = 1.0, lowVal As Double = 0.0)
		  // Convert DateTime array to epoch seconds
		  Var xSec() As Double
		  For Each dt As DateTime In xDates
		    If dt Is Nil Then
		      xSec.Add(0)
		    Else
		      xSec.Add(dt.SecondsFrom1970)
		    End If
		  Next
		  // Add as boolean series
		  AddBooleanSeries(xSec, states, c, name, lineWidth, highVal, lowVal)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDateSeries(xDates() As DateTime, yValues() As Double, c As Color, name As String = "", lineWidth As Integer = 1, showSymbols As Boolean = False)
		  // Convert DateTime array to epoch seconds
		  Var xSec() As Double
		  For Each dt As DateTime In xDates
		    If dt Is Nil Then
		      xSec.Add(0)
		    Else
		      xSec.Add(dt.SecondsFrom1970)
		    End If
		  Next
		  
		  // Add as standard series
		  AddSeries(xSec, yValues, c, name, lineWidth, showSymbols)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDateStepSeries(xDates() As DateTime, yValues() As Double, c As Color, name As String = "", lineWidth As Integer = 1, showSymbols As Boolean = False)
		  // Convert DateTime array to epoch seconds
		  Var xSec() As Double
		  For Each dt As DateTime In xDates
		    If dt Is Nil Then
		      xSec.Add(0)
		    Else
		      xSec.Add(dt.SecondsFrom1970)
		    End If
		  Next
		  
		  // Add as step series
		  AddStepSeries(xSec, yValues, c, name, lineWidth, showSymbols)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddMarker(xSec As Double, label As String, c As Color = &c004C6D)
		  // Add vertical marker line with text
		  MarkerX.Add(xSec)
		  MarkerLabels.Add(label)
		  MarkerColors.Add(c)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSeries(xValues() As Double, yValues() As Double, c As Color, name As String = "", lineWidth As Integer = 1, showSymbols As Boolean = False)
		  // Add standard XY curve series
		  SeriesNames.Add(name)
		  SeriesColors.Add(c)
		  SeriesLineWidths.Add(lineWidth)
		  SeriesShowSymbols.Add(showSymbols)
		  SeriesIsStep.Add(False)
		  SeriesX.Add(xValues)
		  SeriesY.Add(yValues)
		  SeriesCount = SeriesCount + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddStepSeries(xValues() As Double, yValues() As Double, c As Color, name As String = "", lineWidth As Integer = 1, showSymbols As Boolean = False)
		  // Add step-line XY curve series
		  SeriesNames.Add(name)
		  SeriesColors.Add(c)
		  SeriesLineWidths.Add(lineWidth)
		  SeriesShowSymbols.Add(showSymbols)
		  SeriesIsStep.Add(True)
		  SeriesX.Add(xValues)
		  SeriesY.Add(yValues)
		  SeriesCount = SeriesCount + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddThreshold(valA As Double, valB As Double, zoneColor As Color = &cC0C0C0, markColor As Color = &c707070)
		  // Highlight range band between two Y values
		  Threshold_A = valA
		  Threshold_B = valB
		  ThresholdZoneColor = zoneColor
		  ThresholdColor = markColor
		  ShowThreshold = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTitle(t As String)
		  // Set main title
		  Title = t
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutoScale(marginPercent As Double = 0.05, includeZero As Boolean = False)
		  // Automatically calculate X and Y scales based on all added series
		  AutoScaleX(0.0)
		  AutoScaleY(marginPercent, includeZero)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutoScaleX(marginPercent As Double = 0.0)
		  // Automatically set X min/max from all series
		  If SeriesCount = 0 Then Return
		  
		  Var foundAny As Boolean = False
		  Var minX As Double = 1e30
		  Var maxX As Double = -1e30
		  
		  For s As Integer = 0 To SeriesCount - 1
		    Var xVals() As Double = SeriesX(s)
		    For Each x As Double In xVals
		      If x < minX Then minX = x
		      If x > maxX Then maxX = x
		      foundAny = True
		    Next
		  Next
		  
		  If Not foundAny Then Return
		  
		  If maxX <= minX Then
		    If IsDateAxis Then
		      maxX = minX + 3600
		    Else
		      maxX = minX + 1.0
		    End If
		  End If
		  
		  Var span As Double = maxX - minX
		  Var pad As Double = span * marginPercent
		  X_Min = minX - pad
		  X_Max = maxX + pad
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutoScaleY(marginPercent As Double = 0.05, includeZero As Boolean = False)
		  // Automatically set Y min/max from all series
		  If SeriesCount = 0 Or UseDiscreteY Then Return
		  
		  Var foundAny As Boolean = False
		  Var minY As Double = 1e30
		  Var maxY As Double = -1e30
		  
		  For s As Integer = 0 To SeriesCount - 1
		    Var yVals() As Double = SeriesY(s)
		    For Each y As Double In yVals
		      If y < minY Then minY = y
		      If y > maxY Then maxY = y
		      foundAny = True
		    Next
		  Next
		  
		  If Not foundAny Then Return
		  
		  If includeZero Then
		    If minY > 0.0 Then minY = 0.0
		    If maxY < 0.0 Then maxY = 0.0
		  End If
		  
		  If maxY <= minY Then
		    maxY = minY + 1.0
		  End If
		  
		  Var span As Double = maxY - minY
		  Var pad As Double = span * marginPercent
		  Y_Min = minY - pad
		  Y_Max = maxY + pad
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearMarkers()
		  // Remove all markers
		  Var emptyD() As Double
		  Var emptyS() As String
		  Var emptyC() As Color
		  MarkerX = emptyD
		  MarkerLabels = emptyS
		  MarkerColors = emptyC
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearSeries()
		  // Remove all series data
		  Var emptyS() As String
		  Var emptyC() As Color
		  Var emptyI() As Integer
		  Var emptyB() As Boolean
		  Var emptyV() As Variant
		  SeriesNames = emptyS
		  SeriesColors = emptyC
		  SeriesLineWidths = emptyI
		  SeriesShowSymbols = emptyB
		  SeriesIsStep = emptyB
		  SeriesX = emptyV
		  SeriesY = emptyV
		  SeriesCount = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ClipLine(ByRef x1 As Double, ByRef y1 As Double, ByRef x2 As Double, ByRef y2 As Double, xMin As Double, yMin As Double, xMax As Double, yMax As Double) As Boolean
		  // Cohen-Sutherland line clipping algorithm
		  Var code1 As Integer = 0
		  If x1 < xMin Then
		    code1 = code1 Or 1
		  ElseIf x1 > xMax Then
		    code1 = code1 Or 2
		  End If
		  If y1 < yMin Then
		    code1 = code1 Or 8
		  ElseIf y1 > yMax Then
		    code1 = code1 Or 4
		  End If
		  
		  Var code2 As Integer = 0
		  If x2 < xMin Then
		    code2 = code2 Or 1
		  ElseIf x2 > xMax Then
		    code2 = code2 Or 2
		  End If
		  If y2 < yMin Then
		    code2 = code2 Or 8
		  ElseIf y2 > yMax Then
		    code2 = code2 Or 4
		  End If
		  
		  While True
		    If (code1 Or code2) = 0 Then
		      Return True
		    ElseIf (code1 And code2) <> 0 Then
		      Return False
		    Else
		      Var outCode As Integer
		      If code1 <> 0 Then
		        outCode = code1
		      Else
		        outCode = code2
		      End If
		      
		      Var newX As Double = 0.0
		      Var newY As Double = 0.0
		      
		      If (outCode And 8) <> 0 Then
		        If y2 <> y1 Then newX = x1 + (x2 - x1) * (yMin - y1) / (y2 - y1)
		        newY = yMin
		      ElseIf (outCode And 4) <> 0 Then
		        If y2 <> y1 Then newX = x1 + (x2 - x1) * (yMax - y1) / (y2 - y1)
		        newY = yMax
		      ElseIf (outCode And 2) <> 0 Then
		        If x2 <> x1 Then newY = y1 + (y2 - y1) * (xMax - x1) / (x2 - x1)
		        newX = xMax
		      ElseIf (outCode And 1) <> 0 Then
		        If x2 <> x1 Then newY = y1 + (y2 - y1) * (xMin - x1) / (x2 - x1)
		        newX = xMin
		      End If
		      
		      If outCode = code1 Then
		        x1 = newX
		        y1 = newY
		        code1 = 0
		        If x1 < xMin Then
		          code1 = code1 Or 1
		        ElseIf x1 > xMax Then
		          code1 = code1 Or 2
		        End If
		        If y1 < yMin Then
		          code1 = code1 Or 8
		        ElseIf y1 > yMax Then
		          code1 = code1 Or 4
		        End If
		      Else
		        x2 = newX
		        y2 = newY
		        code2 = 0
		        If x2 < xMin Then
		          code2 = code2 Or 1
		        ElseIf x2 > xMax Then
		          code2 = code2 Or 2
		        End If
		        If y2 < yMin Then
		          code2 = code2 Or 8
		        ElseIf y2 > yMax Then
		          code2 = code2 Or 4
		        End If
		      End If
		    End If
		  Wend
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(w As Integer = 600, h As Integer = 400)
		  // Set default dimensions and styling
		  Width = w
		  Height = h
		  PlotLeft = 38
		  PlotTop = 45
		  PlotWidth = Max(50, w - 76)
		  PlotHeight = Max(50, h - 80)
		  PlotBgColor = &cFFFFFF
		  GridColor = &cE0E0E0
		  DualYAxis = True
		  ShowLegend = True
		  LegendPosition = 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTrackingOverlay(g As Graphics, mouseX As Double, mouseY As Double, showValues As Boolean = True, showLegend As Boolean = False)
		  // Draw vertical tracking guide and value badges
		  If g Is Nil Or Not Visible Then Return
		  If mouseX < PlotLeft Or mouseX > PlotLeft + PlotWidth Or mouseY < PlotTop Or mouseY > PlotTop + PlotHeight Then
		    Return
		  End If
		  
		  // Find nearest data X and draw overlay
		  Var nearestX As Double = GetNearestXValue(mouseX)
		  DrawTrackingOverlayByValue(g, nearestX, showValues, showLegend)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTrackingOverlayByValue(g As Graphics, targetDataX As Double, showValues As Boolean = True, showLegend As Boolean = False)
		  // Check if graphics is valid and target X is within visible range
		  If g Is Nil Or Not Visible Then Return
		  If targetDataX < X_Min - 1e-6 Or targetDataX > X_Max + 1e-6 Then Return
		  
		  Var clampedTargetX As Double = Max(X_Min, Min(targetDataX, X_Max))
		  Var trackScreenX As Double = ValueToScreenX(clampedTargetX)
		  If trackScreenX < PlotLeft Or trackScreenX > PlotLeft + PlotWidth Then Return
		  
		  // Draw vertical tracking guide line
		  g.DrawingColor = &c000000
		  Var curY As Double = PlotTop
		  While curY < PlotTop + PlotHeight
		    g.DrawLine(trackScreenX, curY, trackScreenX, Min(curY + 4, PlotTop + PlotHeight))
		    curY = curY + 8
		  Wend
		  
		  // Draw X badge on bottom axis
		  If ShowXAxisLabels Then
		    g.FontSize = 8
		    g.Bold = True
		    Var xBadgeStr As String
		    If IsDateAxis Then
		      Var dt As New DateTime(clampedTargetX, TimeZone.Current)
		      xBadgeStr = dt.ToString("dd/MM/yyyy HH:mm")
		    Else
		      xBadgeStr = clampedTargetX.ToString("0.##")
		    End If
		    Var bW As Double = g.TextWidth(xBadgeStr) + 8
		    Var bH As Double = g.TextHeight + 4
		    Var bX As Double = Max(PlotLeft, Min(trackScreenX - bW / 2, PlotLeft + PlotWidth - bW))
		    Var bY As Double = PlotTop + PlotHeight + 4
		    
		    g.DrawingColor = &c000000
		    g.FillRoundRectangle(bX, bY, bW, bH, 4, 4)
		    g.DrawingColor = &cFFFFFF
		    g.DrawText(xBadgeStr, bX + 4, bY + g.FontAscent + 2)
		  End If
		  
		  // Collect all active series points & badges
		  Var badgeCount As Integer = 0
		  Var ptXs() As Double
		  Var ptYs() As Double
		  Var badgeYs() As Double
		  Var badgeWs() As Double
		  Var badgeHs() As Double
		  Var badgeTexts() As String
		  Var badgeColors() As Color
		  
		  g.FontSize = 8
		  g.Bold = True
		  
		  For s As Integer = 0 To SeriesCount - 1
		    Var sName As String = SeriesNames(s)
		    If sName.Len = 0 Then Continue
		    
		    Var xVals() As Double = SeriesX(s)
		    Var yVals() As Double = SeriesY(s)
		    If xVals.Count = 0 Or yVals.Count = 0 Then Continue
		    
		    // Find closest point in this series
		    Var foundIdx As Integer = -1
		    Var bestDist As Double = 1e30
		    For i As Integer = 0 To xVals.LastIndex
		      Var dist As Double = Abs(xVals(i) - clampedTargetX)
		      If dist < bestDist Then
		        bestDist = dist
		        foundIdx = i
		      End If
		    Next
		    
		    If foundIdx >= 0 Then
		      Var ptX As Double = ValueToScreenX(xVals(foundIdx))
		      Var ptY As Double = ValueToScreenY(yVals(foundIdx))
		      
		      // Process series point if within visible X range (with 4px margin)
		      If ptX >= PlotLeft - 4 And ptX <= PlotLeft + PlotWidth + 4 Then
		        Var sColor As Color = SeriesColors(s)
		        
		        // Draw curve point dot (strictly clamped inside plot area)
		        Var dotRadius As Double = 3.5
		        Var drawDotX As Double = Max(PlotLeft + dotRadius, Min(ptX, PlotLeft + PlotWidth - dotRadius))
		        Var drawDotY As Double = Max(PlotTop + dotRadius, Min(ptY, PlotTop + PlotHeight - dotRadius))
		        
		        g.DrawingColor = sColor
		        g.FillOval(drawDotX - dotRadius, drawDotY - dotRadius, dotRadius * 2, dotRadius * 2)
		        g.DrawingColor = &cFFFFFF
		        g.DrawOval(drawDotX - dotRadius, drawDotY - dotRadius, dotRadius * 2, dotRadius * 2)
		        
		        If showValues Then
		          // Format value label
		          Var valStr As String
		          Var isStep As Boolean = (s <= SeriesIsStep.LastIndex And SeriesIsStep(s))
		          If isStep Or UseDiscreteY Then
			            Var fractional As Double = yVals(foundIdx) - Floor(yVals(foundIdx))
		            If fractional > 0.4 Or yVals(foundIdx) >= 0.8 Then
		              valStr = "ON"
		            Else
		              valStr = "OFF"
		            End If
		          Else
		            valStr = yVals(foundIdx).ToString("0.##") + Y_Unit
		          End If
		          
		          If showLegend Or ShowLegendInTrackingBadge Then
		            If sName.Len > 0 Then
		              valStr = sName + ": " + valStr
		            End If
		          End If
		          
		          Var vW As Double = g.TextWidth(valStr) + 8
		          Var vH As Double = g.TextHeight + 4
		          Var rawY As Double = Max(PlotTop, Min(drawDotY - vH / 2, PlotTop + PlotHeight - vH))
		          
		          ptXs.Add(drawDotX)
		          ptYs.Add(drawDotY)
		          badgeYs.Add(rawY)
		          badgeWs.Add(vW)
		          badgeHs.Add(vH)
		          badgeTexts.Add(valStr)
		          badgeColors.Add(sColor)
		          badgeCount = badgeCount + 1
		        End If
		      End If
		    End If
		  Next
		  
		  If showValues And badgeCount > 0 Then
		    // Sort badges by Y ascending
		    For i As Integer = 0 To badgeCount - 2
		      For j As Integer = i + 1 To badgeCount - 1
		        If badgeYs(i) > badgeYs(j) Then
		          Var tmpY As Double = badgeYs(i)
		          badgeYs(i) = badgeYs(j)
		          badgeYs(j) = tmpY
		          
		          Var tmpX As Double = ptXs(i)
		          ptXs(i) = ptXs(j)
		          ptXs(j) = tmpX
		          
		          Var tmpPtY As Double = ptYs(i)
		          ptYs(i) = ptYs(j)
		          ptYs(j) = tmpPtY
		          
		          Var tmpW As Double = badgeWs(i)
		          badgeWs(i) = badgeWs(j)
		          badgeWs(j) = tmpW
		          
		          Var tmpH As Double = badgeHs(i)
		          badgeHs(i) = badgeHs(j)
		          badgeHs(j) = tmpH
		          
		          Var tmpT As String = badgeTexts(i)
		          badgeTexts(i) = badgeTexts(j)
		          badgeTexts(j) = tmpT
		          
		          Var tmpC As Color = badgeColors(i)
		          badgeColors(i) = badgeColors(j)
		          badgeColors(j) = tmpC
		        End If
		      Next
		    Next
		    
		    // Top-down pass: prevent downward overlaps
		    For i As Integer = 1 To badgeCount - 1
		      If badgeYs(i) < badgeYs(i - 1) + badgeHs(i - 1) + 2 Then
		        badgeYs(i) = badgeYs(i - 1) + badgeHs(i - 1) + 2
		      End If
		    Next
		    
		    // Bottom-up pass: clamp to bottom border
		    If badgeYs(badgeCount - 1) > PlotTop + PlotHeight - badgeHs(badgeCount - 1) Then
		      badgeYs(badgeCount - 1) = PlotTop + PlotHeight - badgeHs(badgeCount - 1)
		      For i As Integer = badgeCount - 2 DownTo 0
		        If badgeYs(i) > badgeYs(i + 1) - badgeHs(i) - 2 Then
		          badgeYs(i) = badgeYs(i + 1) - badgeHs(i) - 2
		        End If
		      Next
		    End If
		    
		    // Final top clamp
		    If badgeYs(0) < PlotTop Then badgeYs(0) = PlotTop
		    
		    // Draw badges with leader lines if shifted
		    For i As Integer = 0 To badgeCount - 1
		      Var pX As Double = ptXs(i)
		      Var pY As Double = ptYs(i)
		      Var vY As Double = badgeYs(i)
		      Var vW As Double = badgeWs(i)
		      Var vH As Double = badgeHs(i)
		      Var sColor As Color = badgeColors(i)
		      Var valStr As String = badgeTexts(i)
		      
		      Var vX As Double
		      If pX <= PlotLeft + (PlotWidth / 2) Then
		        vX = Max(PlotLeft + 2, Min(pX + 8, PlotLeft + PlotWidth - vW - 2))
		      Else
		        vX = Max(PlotLeft + 2, Min(pX - vW - 8, PlotLeft + PlotWidth - vW - 2))
		      End If
		      
		      // Draw leader connector line if badge was shifted vertically
		      If Abs(vY + (vH / 2) - pY) > 5 Then
		        g.DrawingColor = Color.RGB(sColor.Red, sColor.Green, sColor.Blue, 150)
		        If pX <= PlotLeft + (PlotWidth / 2) Then
		          g.DrawLine(pX + 3.5, pY, vX, vY + (vH / 2))
		        Else
		          g.DrawLine(pX - 3.5, pY, vX + vW, vY + (vH / 2))
		        End If
		      End If
		      
		      // Draw badge background and text
		      g.DrawingColor = sColor
		      g.FillRoundRectangle(vX, vY, vW, vH, 4, 4)
		      g.DrawingColor = &cFFFFFF
		      g.DrawText(valStr, vX + 4, vY + g.FontAscent + 2)
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNearestXValue(screenX As Double) As Double
		  // Find closest X data value across all series within visible range
		  Var xTarget As Double = ScreenToValueX(screenX)
		  Var bestX As Double = xTarget
		  Var bestDist As Double = 1e30
		  Var found As Boolean = False
		  
		  For s As Integer = 0 To SeriesCount - 1
		    Var xVals() As Double = SeriesX(s)
		    If xVals.Count = 0 Then Continue
		    
		    For i As Integer = 0 To xVals.LastIndex
		      Var curX As Double = xVals(i)
		      If curX >= X_Min - 1e-6 And curX <= X_Max + 1e-6 Then
		        Var dist As Double = Abs(curX - xTarget)
		        If dist < bestDist Then
		          bestDist = dist
		          bestX = curX
		          found = True
		        End If
		      End If
		    Next
		  Next
		  
		  If Not found Then
		    bestX = Max(X_Min, Min(xTarget, X_Max))
		  End If
		  
		  Return bestX
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeChartPicture(w As Integer = 0, h As Integer = 0) As Picture
		  // Render plot into a Picture bitmap
		  If w <= 0 Then w = Width
		  If h <= 0 Then h = Height
		  If w <= 0 Then w = 600
		  If h <= 0 Then h = 400
		  
		  Var pic As New Picture(w, h)
		  Render(pic.Graphics)
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakePDFDocument(fitPage As Boolean = True, landscape As Boolean = True) As PDFDocument
		  // Render plot into vector PDF document
		  Var doc As New PDFDocument
		  doc.Landscape = landscape
		  If Title.Len > 0 Then
		    doc.Title = Title
		  End If
		  
		  Var g As Graphics = doc.Graphics
		  If fitPage Then
		    Var origLeft As Integer = PlotLeft
		    Var origTop As Integer = PlotTop
		    Var origW As Integer = PlotWidth
		    Var origH As Integer = PlotHeight
		    
		    PlotLeft = 38
		    PlotTop = 45
		    If LegendPosition = 2 Then
		      PlotWidth = Max(50, g.Width - 150)
		    Else
		      PlotWidth = Max(50, g.Width - 76)
		    End If
		    PlotHeight = Max(50, g.Height - 80)
		    
		    Render(g)
		    
		    PlotLeft = origLeft
		    PlotTop = origTop
		    PlotWidth = origW
		    PlotHeight = origH
		  Else
		    Render(g)
		  End If
		  
		  Return doc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportPDF(f As FolderItem, fitPage As Boolean = True, landscape As Boolean = True)
		  // Save plot directly to a PDF file
		  If f Is Nil Then Return
		  Var doc As PDFDocument = MakePDFDocument(fitPage, landscape)
		  Try
		    doc.Save(f)
		  Catch e As IOException
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Render(g As Graphics, clearBackground As Boolean = True)
		  // Check if graphics is valid and plot is visible
		  If g Is Nil Or Not Visible Then Return
		  
		  // Draw outer background if requested
		  If clearBackground Then
		    g.DrawingColor = &cFFFFFF
		    g.FillRectangle(0, 0, g.Width, g.Height)
		  End If
		  
		  // Draw plot background
		  g.DrawingColor = PlotBgColor
		  g.FillRectangle(PlotLeft, PlotTop, PlotWidth, PlotHeight)
		  
		  // Draw title
		  Var titleW As Double = 0
		  If Title.Len > 0 Then
		    g.DrawingColor = &c000000
		    g.FontSize = If(PlotHeight < 180, 10, 12)
		    g.Bold = True
		    titleW = g.TextWidth(Title)
		    Var titleY As Double = If(Y_Title.Len > 0, PlotTop - 18, PlotTop - 6)
		    g.DrawText(Title, PlotLeft, titleY)
		  End If
		  
		  // Draw legends
		  If ShowLegend And SeriesCount > 0 Then
		    g.FontSize = 8
		    g.Bold = False
		    
		    Select Case LegendPosition
		    Case 0
		      // Top Left (horizontal, after Y title)
		      Var leftOffset As Double = 0
		      If Y_Title.Len > 0 Then
		        g.FontSize = 9
		        g.Bold = True
		        leftOffset = g.TextWidth(Y_Title) + 14
		      ElseIf PlotTop <= 30 And titleW > 0 Then
		        leftOffset = titleW + 14
		      End If
		      g.FontSize = 8
		      g.Bold = False
		      Var minLeftX As Double = PlotLeft + leftOffset
		      Var legX As Double = minLeftX
		      Var legY As Double = PlotTop - 6
		      
		      For s As Integer = 0 To SeriesCount - 1
		        Var sName As String = SeriesNames(s)
		        If sName.Len = 0 Then Continue
		        Var sCol As Color = SeriesColors(s)
		        Var itemW As Double = 12 + g.TextWidth(sName) + 6
		        
		        If legX + itemW > PlotLeft + PlotWidth Then
		          If legY < PlotTop - 5 Then
		            legY = PlotTop - 4
		            legX = minLeftX
		          Else
			            Exit For
		          End If
		        End If
		        
		        g.DrawingColor = sCol
		        g.FillRoundRectangle(legX, legY - 5, 8, 5, 2, 2)
		        g.DrawingColor = &c333333
		        g.DrawText(sName, legX + 11, legY)
		        legX = legX + itemW
		      Next
		      
		    Case 2
		      // Right sidebar (vertical)
		      Var legX As Double = PlotLeft + PlotWidth + (If(DualYAxis, 55, 18))
		      Var legY As Double = PlotTop + 8
		      For s As Integer = 0 To SeriesCount - 1
		        Var sName As String = SeriesNames(s)
		        If sName.Len = 0 Then Continue
		        Var sCol As Color = SeriesColors(s)
		        Var itemY As Double = legY + (s * 16)
		        If itemY > PlotTop + PlotHeight Then Exit For
		        
		        g.DrawingColor = sCol
		        g.FillRoundRectangle(legX, itemY - 6, 10, 5, 2, 2)
		        g.DrawingColor = &c333333
		        g.DrawText(sName, legX + 14, itemY)
		      Next
		      
		    Case 3
		      // Inside Top Right (boxed overlay)
		      Var maxTextW As Double = 0
		      Var validCount As Integer = 0
		      For s As Integer = 0 To SeriesCount - 1
		        Var sName As String = SeriesNames(s)
		        If sName.Len = 0 Then Continue
		        validCount = validCount + 1
		        Var tw As Double = g.TextWidth(sName)
		        If tw > maxTextW Then maxTextW = tw
		      Next
		      
		      If validCount > 0 Then
		        Var boxW As Double = maxTextW + 36
		        Var boxH As Double = (validCount * 18) + 10
		        Var boxX As Double = PlotLeft + PlotWidth - boxW - 10
		        Var boxY As Double = PlotTop + 10
		        
		        g.DrawingColor = &cFAFAFA
		        g.FillRoundRectangle(boxX, boxY, boxW, boxH, 4, 4)
		        g.DrawingColor = &cCCCCCC
		        g.DrawRoundRectangle(boxX, boxY, boxW, boxH, 4, 4)
		        
		        Var currItemY As Double = boxY + 14
		        For s As Integer = 0 To SeriesCount - 1
		          Var sName As String = SeriesNames(s)
		          If sName.Len = 0 Then Continue
		          Var sCol As Color = SeriesColors(s)
		          
		          g.DrawingColor = sCol
		          g.FillRoundRectangle(boxX + 8, currItemY - 6, 10, 5, 2, 2)
		          g.DrawingColor = &c333333
		          g.DrawText(sName, boxX + 22, currItemY)
		          currItemY = currItemY + 18
		        Next
		      End If
		      
		    Else
		      // Top Right - strictly right-aligned, preserving title/Y-title area on left
		      Var leftOffset As Double = 0
		      If Y_Title.Len > 0 Then
		        g.FontSize = 9
		        g.Bold = True
		        leftOffset = g.TextWidth(Y_Title) + 16
		      ElseIf PlotTop <= 30 And titleW > 0 Then
		        leftOffset = titleW + 16
		      End If
		      g.FontSize = 8
		      g.Bold = False
		      Var minLeftX As Double = PlotLeft + leftOffset
		      Var availW As Double = Max(50, (PlotLeft + PlotWidth) - minLeftX)
		      
		      Var validIndices() As Integer
		      Var itemWidths() As Double
		      Var totalW As Double = 0
		      
		      For s As Integer = 0 To SeriesCount - 1
		        Var sName As String = SeriesNames(s)
		        If sName.Len = 0 Then Continue
		        Var itemW As Double = 12 + g.TextWidth(sName) + 6
		        validIndices.Add(s)
		        itemWidths.Add(itemW)
		        totalW = totalW + itemW
		      Next
		      
		      Var row1Indices() As Integer
		      Var row2Indices() As Integer
		      Var row1W As Double = 0
		      Var row2W As Double = 0
		      
		      If totalW <= availW Then
		        // Fits entirely on 1 row
		        For i As Integer = 0 To validIndices.LastIndex
		          row1Indices.Add(validIndices(i))
		          row1W = row1W + itemWidths(i)
		        Next
		      Else
		        // Balance items evenly across 2 rows (e.g. 8 items -> 4 & 4)
		        Var splitCount As Integer = Ceil(validIndices.Count / 2.0)
		        
		        For i As Integer = 0 To validIndices.LastIndex
		          Var idx As Integer = validIndices(i)
		          Var w As Double = itemWidths(i)
		          
		          If i < splitCount And (row1W + w <= availW) Then
		            row1Indices.Add(idx)
		            row1W = row1W + w
		          ElseIf row2W + w <= availW Then
		            row2Indices.Add(idx)
		            row2W = row2W + w
		          Else
		            Exit For
		          End If
		        Next
		      End If
		      
		      If row2Indices.Count = 0 Then
		        // Single row: right-aligned
		        Var startX As Double = PlotLeft + PlotWidth - row1W
		        Var legY As Double = PlotTop - 6
		        
		        For Each s As Integer In row1Indices
		          Var sName As String = SeriesNames(s)
		          Var sCol As Color = SeriesColors(s)
		          Var itemW As Double = 12 + g.TextWidth(sName) + 6
		          
		          g.DrawingColor = sCol
		          g.FillRoundRectangle(startX, legY - 5, 8, 5, 2, 2)
		          g.DrawingColor = &c333333
		          g.DrawText(sName, startX + 11, legY)
		          startX = startX + itemW
		        Next
		      Else
		        // Two rows: both strictly right-aligned against right edge
		        Var startX1 As Double = PlotLeft + PlotWidth - row1W
		        Var legY1 As Double = PlotTop - 12
		        For Each s As Integer In row1Indices
		          Var sName As String = SeriesNames(s)
		          Var sCol As Color = SeriesColors(s)
		          Var itemW As Double = 12 + g.TextWidth(sName) + 6
		          
		          g.DrawingColor = sCol
		          g.FillRoundRectangle(startX1, legY1 - 5, 8, 5, 2, 2)
		          g.DrawingColor = &c333333
		          g.DrawText(sName, startX1 + 11, legY1)
		          startX1 = startX1 + itemW
		        Next
		        
		        Var startX2 As Double = PlotLeft + PlotWidth - row2W
		        Var legY2 As Double = PlotTop - 4
		        For Each s As Integer In row2Indices
		          Var sName As String = SeriesNames(s)
		          Var sCol As Color = SeriesColors(s)
		          Var itemW As Double = 12 + g.TextWidth(sName) + 6
		          
		          g.DrawingColor = sCol
		          g.FillRoundRectangle(startX2, legY2 - 5, 8, 5, 2, 2)
		          g.DrawingColor = &c333333
		          g.DrawText(sName, startX2 + 11, legY2)
		          startX2 = startX2 + itemW
		        Next
		      End If
		    End Select
		  End If
		  
		  // Draw threshold highlight zone
		  If ShowThreshold Then
		    Var yA As Double = ValueToScreenY(Threshold_A)
		    Var yB As Double = ValueToScreenY(Threshold_B)
		    Var topY As Double = Max(PlotTop + 1, Min(yA, yB))
		    Var botY As Double = Min(PlotTop + PlotHeight - 1, Max(yA, yB))
		    Var hZone As Double = Max(0, botY - topY)
		    
		    g.DrawingColor = ThresholdZoneColor
		    If hZone > 0 Then
		      g.FillRectangle(PlotLeft + 1, topY, PlotWidth - 1, hZone)
		    End If
		    
		    g.DrawingColor = ThresholdColor
		    If yA >= PlotTop + 1 And yA <= PlotTop + PlotHeight - 1 Then
		      g.DrawLine(PlotLeft + 1, yA, PlotLeft + PlotWidth - 1, yA)
		    End If
		    If yB >= PlotTop + 1 And yB <= PlotTop + PlotHeight - 1 Then
		      g.DrawLine(PlotLeft + 1, yB, PlotLeft + PlotWidth - 1, yB)
		    End If
		  End If
		  
		  // Draw Y Axis and gridlines
		  g.FontSize = 8
		  g.Bold = False
		  If UseDiscreteY And Y_DiscreteLabels.Count > 0 Then
		    // Discrete text labels (e.g. OFF / ON or multi-channel digital tracks)
		    For d As Integer = 0 To Y_DiscreteLabels.LastIndex
		      Var dVal As Double = d * 1.0
		      Var sy As Double = ValueToScreenY(dVal)
		      If sy >= PlotTop + 1 And sy <= PlotTop + PlotHeight - 1 Then
		        g.DrawingColor = GridColor
		        g.DrawLine(PlotLeft + 1, sy, PlotLeft + PlotWidth - 1, sy)
		        
		        g.DrawingColor = &c333333
		        g.DrawLine(PlotLeft - 4, sy, PlotLeft, sy)
		        Var labelStr As String = Y_DiscreteLabels(d)
		        Var strW As Double = g.TextWidth(labelStr)
		        
		        // Position label centered in its channel lane if multi-channel, else on tick
		        Var labelY As Double
		        If Y_DiscreteLabels.Count > 2 Then
		          labelY = ValueToScreenY(dVal + 0.45) + (g.FontAscent / 2) - 1
		        Else
		          labelY = sy + (g.FontAscent / 2) - 1
		        End If
		        
		        If labelY >= PlotTop - 5 And labelY <= PlotTop + PlotHeight + 5 Then
		          g.DrawText(labelStr, PlotLeft - strW - 6, labelY)
		          If DualYAxis Then
		            g.DrawLine(PlotLeft + PlotWidth, sy, PlotLeft + PlotWidth + 4, sy)
		            g.DrawText(labelStr, PlotLeft + PlotWidth + 6, labelY)
		          End If
		        End If
		      End If
		    Next
		  Else
		    // Linear numeric grid
		    Var ySpan As Double = Y_Max - Y_Min
		    If ySpan <= 0 Then ySpan = 1
		    Var rawStep As Double = ySpan / Max(2, (PlotHeight / Y_TickDensity))
		    Var power As Double = 10.0 ^ Floor(Log(rawStep) / Log(10))
		    Var fraction As Double = rawStep / power
		    Var stepY As Double
		    If fraction <= 1.5 Then
		      stepY = 1.0 * power
		    ElseIf fraction <= 3.5 Then
		      stepY = 2.0 * power
		    ElseIf fraction <= 7.5 Then
		      stepY = 5.0 * power
		    Else
		      stepY = 10.0 * power
		    End If
		    If stepY <= 0 Then stepY = 1.0
		    
		    Var startY As Double = Ceil(Y_Min / stepY) * stepY
		    Var currY As Double = startY
		    While currY <= Y_Max + (stepY * 0.001)
		      Var sy As Double = ValueToScreenY(currY)
		      If sy >= PlotTop + 1 And sy <= PlotTop + PlotHeight - 1 Then
		        g.DrawingColor = GridColor
		        g.DrawLine(PlotLeft + 1, sy, PlotLeft + PlotWidth - 1, sy)
		        
		        g.DrawingColor = &c333333
		        g.DrawLine(PlotLeft - 4, sy, PlotLeft, sy)
		        Var labelStr As String = currY.ToString("0.##") + Y_Unit
		        Var strW As Double = g.TextWidth(labelStr)
		        g.DrawText(labelStr, PlotLeft - strW - 6, sy + (g.FontAscent / 2) - 1)
		        
		        If DualYAxis Then
		          g.DrawLine(PlotLeft + PlotWidth, sy, PlotLeft + PlotWidth + 4, sy)
		          g.DrawText(labelStr, PlotLeft + PlotWidth + 6, sy + (g.FontAscent / 2) - 1)
		        End If
		      End If
		      currY = currY + stepY
		    Wend
		  End If
		  
		  // Draw Y Axis title
		  If Y_Title.Len > 0 Then
		    g.DrawingColor = &c333333
		    g.FontSize = 9
		    g.Bold = True
		    g.DrawText(Y_Title, PlotLeft, PlotTop - 5)
		  End If
		  
		  // Draw X Axis and gridlines
		  g.FontSize = 8
		  g.Bold = False
		  If IsDateAxis Then
		    // Date/Time scale with collision-free adaptive step
		    Var xSpan As Double = X_Max - X_Min
		    If xSpan <= 0 Then xSpan = 3600
		    
		    Var sampleLbl As String = "10/09 00:00"
		    If xSpan > 2 * 86400 Then sampleLbl = "10/09"
		    Var minLabelSpacing As Double = g.TextWidth(sampleLbl) + 16
		    Var maxAllowedTicks As Integer = Max(2, Floor(PlotWidth / minLabelSpacing))
		    
		    Var stepX As Double = 0
		    If X_MajorTick > 0 And (xSpan / X_MajorTick) <= maxAllowedTicks Then
		      stepX = X_MajorTick
		    Else
		      Var candidateSteps() As Double = Array( _
		        60.0, 300.0, 900.0, 1800.0, 3600.0, 7200.0, 14400.0, 21600.0, 43200.0, _
		        86400.0, 172800.0, 259200.0, 604800.0, 1209600.0, 2592000.0 _
		      )
		      For Each cand As Double In candidateSteps
		        If (xSpan / cand) <= maxAllowedTicks Then
		          stepX = cand
		          Exit For
		        End If
		      Next
		      If stepX = 0 Then stepX = 2592000.0
		    End If
		    
		    Var startX As Double = Ceil(X_Min / stepX) * stepX
		    Var currX As Double = startX
		    While currX <= X_Max + (stepX * 0.001)
		      Var sx As Double = ValueToScreenX(currX)
		      If sx >= PlotLeft + 1 And sx <= PlotLeft + PlotWidth - 1 Then
		        g.DrawingColor = GridColor
		        g.DrawLine(sx, PlotTop + 1, sx, PlotTop + PlotHeight - 1)
		        
		        If ShowXAxisLabels Then
		          g.DrawingColor = &c333333
		          g.DrawLine(sx, PlotTop + PlotHeight, sx, PlotTop + PlotHeight + 4)
		          
		          Var dt As New DateTime(currX, TimeZone.Current)
		          Var dateLbl As String
		          If xSpan > 2 * 86400 Then
		            dateLbl = dt.ToString("dd/MM")
		          Else
		            dateLbl = dt.ToString("dd/MM HH:mm")
		          End If
		          Var lblW As Double = g.TextWidth(dateLbl)
		          g.DrawText(dateLbl, sx - (lblW / 2), PlotTop + PlotHeight + g.FontAscent + 4)
		        End If
		      End If
		      currX = currX + stepX
		    Wend
		  Else
		    // Linear numeric scale
		    Var xSpan As Double = X_Max - X_Min
		    If xSpan <= 0 Then xSpan = 1
		    Var rawStepX As Double = xSpan / Max(2, (PlotWidth / 80))
		    Var powerX As Double = 10.0 ^ Floor(Log(rawStepX) / Log(10))
		    Var fractionX As Double = rawStepX / powerX
		    Var stepX As Double
		    If fractionX <= 1.5 Then
		      stepX = 1.0 * powerX
		    ElseIf fractionX <= 3.5 Then
		      stepX = 2.0 * powerX
		    ElseIf fractionX <= 7.5 Then
		      stepX = 5.0 * powerX
		    Else
		      stepX = 10.0 * powerX
		    End If
		    If stepX <= 0 Then stepX = 1.0
		    
		    Var startX As Double = Ceil(X_Min / stepX) * stepX
		    Var currX As Double = startX
		    While currX <= X_Max + (stepX * 0.001)
		      Var sx As Double = ValueToScreenX(currX)
		      If sx >= PlotLeft + 1 And sx <= PlotLeft + PlotWidth - 1 Then
		        g.DrawingColor = GridColor
		        g.DrawLine(sx, PlotTop + 1, sx, PlotTop + PlotHeight - 1)
		        
		        If ShowXAxisLabels Then
		          g.DrawingColor = &c333333
		          g.DrawLine(sx, PlotTop + PlotHeight, sx, PlotTop + PlotHeight + 4)
		          
		          Var numLbl As String = currX.ToString("0.##")
		          Var lblW As Double = g.TextWidth(numLbl)
		          g.DrawText(numLbl, sx - (lblW / 2), PlotTop + PlotHeight + g.FontAscent + 4)
		        End If
		      End If
		      currX = currX + stepX
		    Wend
		  End If
		  
		  // Draw data curves
		  For s As Integer = 0 To SeriesCount - 1
		    Var xVals() As Double = SeriesX(s)
		    Var yVals() As Double = SeriesY(s)
		    If xVals.Count = 0 Or yVals.Count = 0 Then Continue
		    
		    Var cColor As Color = SeriesColors(s)
		    Var lWidth As Integer = SeriesLineWidths(s)
		    Var showSym As Boolean = SeriesShowSymbols(s) And ShowSymbols
		    Var isStep As Boolean = False
		    If s <= SeriesIsStep.LastIndex Then isStep = SeriesIsStep(s)
		    
		    g.DrawingColor = cColor
		    Var ptCount As Integer = Min(xVals.Count, yVals.Count)
		    
		    If isStep Then
		      // Draw step lines
		      For i As Integer = 0 To ptCount - 2
		        Var rawX1 As Double = ValueToScreenX(xVals(i))
		        Var rawY1 As Double = ValueToScreenY(yVals(i))
		        Var rawX2 As Double = ValueToScreenX(xVals(i + 1))
		        Var rawY2 As Double = ValueToScreenY(yVals(i + 1))
		        
		        // Horizontal segment
		        If rawY1 >= PlotTop And rawY1 <= PlotTop + PlotHeight Then
		          If Not ((rawX1 < PlotLeft And rawX2 < PlotLeft) Or (rawX1 > PlotLeft + PlotWidth And rawX2 > PlotLeft + PlotWidth)) Then
		            Var hx1 As Double = Max(PlotLeft, Min(rawX1, PlotLeft + PlotWidth))
		            Var hx2 As Double = Max(PlotLeft, Min(rawX2, PlotLeft + PlotWidth))
		            For w As Integer = 0 To lWidth - 1
		              If rawY1 + w <= PlotTop + PlotHeight Then
		                g.DrawLine(hx1, rawY1 + w, hx2, rawY1 + w)
		              End If
		            Next
		          End If
		        End If
		        
		        // Vertical transition segment (only within visible plot bounds, suppress on right edge)
		        If rawX2 >= PlotLeft And rawX2 < PlotLeft + PlotWidth - 0.5 Then
		          If Not ((rawY1 < PlotTop And rawY2 < PlotTop) Or (rawY1 > PlotTop + PlotHeight And rawY2 > PlotTop + PlotHeight)) Then
		            Var vy1 As Double = Max(PlotTop, Min(rawY1, PlotTop + PlotHeight))
		            Var vy2 As Double = Max(PlotTop, Min(rawY2, PlotTop + PlotHeight))
		            For w As Integer = 0 To lWidth - 1
		              If rawX2 + w < PlotLeft + PlotWidth Then
		                g.DrawLine(rawX2 + w, vy1, rawX2 + w, vy2)
		              End If
		            Next
		          End If
		        End If
		        
		        // Point symbol (strictly inside plot area)
		        If showSym Then
		          If rawX1 >= PlotLeft + 3 And rawX1 <= PlotLeft + PlotWidth - 3 And rawY1 >= PlotTop + 3 And rawY1 <= PlotTop + PlotHeight - 3 Then
		            g.FillOval(rawX1 - 3, rawY1 - 3, 6, 6)
		          End If
		        End If
		      Next
		    Else
		      // Draw linear lines with Cohen-Sutherland clipping
		      For i As Integer = 0 To ptCount - 2
		        Var x1 As Double = ValueToScreenX(xVals(i))
		        Var y1 As Double = ValueToScreenY(yVals(i))
		        Var x2 As Double = ValueToScreenX(xVals(i + 1))
		        Var y2 As Double = ValueToScreenY(yVals(i + 1))
		        
		        If ClipLine(x1, y1, x2, y2, PlotLeft, PlotTop, PlotLeft + PlotWidth, PlotTop + PlotHeight) Then
		          For w As Integer = 0 To lWidth - 1
		            If y1 + w <= PlotTop + PlotHeight And y2 + w <= PlotTop + PlotHeight Then
		              g.DrawLine(x1, y1 + w, x2, y2 + w)
		            End If
		          Next
		        End If
		        
		        // Point symbol (strictly inside plot area)
		        If showSym Then
		          Var symX As Double = ValueToScreenX(xVals(i))
		          Var symY As Double = ValueToScreenY(yVals(i))
		          If symX >= PlotLeft + 3 And symX <= PlotLeft + PlotWidth - 3 And symY >= PlotTop + 3 And symY <= PlotTop + PlotHeight - 3 Then
		            g.FillOval(symX - 3, symY - 3, 6, 6)
		          End If
		        End If
		      Next
		    End If
		    
		    // Last point symbol
		    If showSym And ptCount > 0 Then
		      Var symX As Double = ValueToScreenX(xVals(ptCount - 1))
		      Var symY As Double = ValueToScreenY(yVals(ptCount - 1))
		      If symX >= PlotLeft + 3 And symX <= PlotLeft + PlotWidth - 3 And symY >= PlotTop + 3 And symY <= PlotTop + PlotHeight - 3 Then
		        g.FillOval(symX - 3, symY - 3, 6, 6)
		      End If
		    End If
		  Next
		  
		  // Draw vertical markers
		  For m As Integer = 0 To MarkerX.LastIndex
		    Var mX As Double = ValueToScreenX(MarkerX(m))
		    If mX >= PlotLeft And mX <= PlotLeft + PlotWidth Then
		      g.DrawingColor = MarkerColors(m)
		      g.DrawLine(mX, PlotTop, mX, PlotTop + PlotHeight)
		      
		      Var mLbl As String = MarkerLabels(m)
		      If mLbl.Len > 0 Then
		        g.FontSize = 8
		        g.Bold = True
		        g.DrawText(mLbl, mX + 2, PlotTop + 10)
		      End If
		    End If
		  Next
		  
		  // Draw plot border box on top of data
		  g.DrawingColor = &c333333
		  g.DrawRectangle(PlotLeft, PlotTop, PlotWidth, PlotHeight)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenToValueX(screenX As Double) As Double
		  // Convert screen X pixel to data value
		  If PlotWidth <= 0 Then Return X_Min
		  Return X_Min + (screenX - PlotLeft) / PlotWidth * (X_Max - X_Min)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenToValueY(screenY As Double) As Double
		  // Convert screen Y pixel to data value
		  If PlotHeight <= 0 Then Return Y_Min
		  Return Y_Min + (PlotTop + PlotHeight - screenY) / PlotHeight * (Y_Max - Y_Min)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAutoPlotArea(canvasW As Integer, canvasH As Integer, topMargin As Integer = -1, bottomMargin As Integer = -1, leftMargin As Integer = -1, rightMargin As Integer = -1, bgColor As Color = &cFFFFFF, gridCol As Color = &cE0E0E0)
		  // Auto-calculate responsive plot box dimensions from canvas size
		  Width = canvasW
		  Height = canvasH
		  PlotBgColor = bgColor
		  GridColor = gridCol
		  
		  If leftMargin < 0 Then
		    leftMargin = 38
		  End If
		  
		  If rightMargin < 0 Then
		    If DualYAxis Then
		      rightMargin = 38
		    Else
		      rightMargin = 20
		    End If
		  End If
		  
		  If topMargin < 0 Then
		    If Title.Len > 0 Then
		      topMargin = 45
		    ElseIf ShowLegend And LegendPosition = 1 Then
		      topMargin = 30
		    Else
		      topMargin = 20
		    End If
		  End If
		  
		  If bottomMargin < 0 Then
		    If ShowXAxisLabels Then
		      bottomMargin = 35
		    Else
		      bottomMargin = 15
		    End If
		  End If
		  
		  PlotLeft = leftMargin
		  PlotTop = topMargin
		  PlotWidth = Max(10, canvasW - leftMargin - rightMargin)
		  PlotHeight = Max(10, canvasH - topMargin - bottomMargin)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPlotArea(left As Integer, top As Integer, w As Integer, h As Integer, bgColor As Color = &cFFFFFF, gridCol As Color = &cE0E0E0)
		  // Set plot position, dimensions, and colors
		  PlotLeft = left
		  PlotTop = top
		  PlotWidth = Max(10, w)
		  PlotHeight = Max(10, h)
		  PlotBgColor = bgColor
		  GridColor = gridCol
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetXDateScale(minSec As Double, maxSec As Double, majorTickSec As Double = 0, formatStr As String = "")
		  // Set date/time scale for X axis
		  IsDateAxis = True
		  X_Min = minSec
		  X_Max = maxSec
		  X_MajorTick = majorTickSec
		  X_LabelFormat = formatStr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetXLinearScale(minVal As Double, maxVal As Double)
		  // Set linear numeric scale for X axis
		  IsDateAxis = False
		  X_Min = minVal
		  X_Max = maxVal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetYDiscreteLabels(labels() As String, minVal As Double = -0.2, maxVal As Double = -1.0)
		  // Set custom text labels for Y axis (e.g. OFF / ON or multi-channel digital tracks)
		  Y_DiscreteLabels = labels
		  UseDiscreteY = True
		  Y_Min = minVal
		  If maxVal > minVal And maxVal > 0.0 Then
		    Y_Max = maxVal
		  Else
		    Y_Max = Max(1.0, labels.Count * 1.0 + 0.1)
		  End If
		  Y_Unit = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetYLinearScale(minVal As Double, maxVal As Double, unitStr As String = "")
		  // Set linear numeric scale and unit for Y axis
		  UseDiscreteY = False
		  Y_Min = minVal
		  Y_Max = maxVal
		  Y_Unit = unitStr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetYTitle(t As String)
		  // Set Y axis title
		  Y_Title = t
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueToScreenX(xVal As Double) As Double
		  // Convert data X value to screen pixel
		  If X_Max <= X_Min Then Return PlotLeft
		  Return PlotLeft + (xVal - X_Min) / (X_Max - X_Min) * PlotWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueToScreenY(yVal As Double) As Double
		  // Convert data Y value to screen pixel
		  If Y_Max <= Y_Min Then Return PlotTop + PlotHeight
		  Return PlotTop + PlotHeight - (yVal - Y_Min) / (Y_Max - Y_Min) * PlotHeight
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		DualYAxis As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		GridColor As Color = &cE0E0E0
	#tag EndProperty

	#tag Property, Flags = &h0
		Height As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		IsDateAxis As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MarkerColors() As Color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MarkerLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MarkerX() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		PlotBgColor As Color = &cFFFFFF
	#tag EndProperty

	#tag Property, Flags = &h0
		PlotHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PlotLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PlotTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PlotWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SeriesColors() As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		SeriesCount As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SeriesLineWidths() As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SeriesIsStep() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SeriesNames() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SeriesShowSymbols() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SeriesX() As Variant
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SeriesY() As Variant
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UseDiscreteY As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Y_DiscreteLabels() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LegendPosition As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowLegend As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowZoom As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowPan As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Visible As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowSymbols As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowThreshold As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowXAxisLabels As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Threshold_A As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Threshold_B As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		ThresholdColor As Color = &c707070
	#tag EndProperty

	#tag Property, Flags = &h0
		ThresholdZoneColor As Color = &cC0C0C0
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Width As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		X_AxisTitle As String
	#tag EndProperty

	#tag Property, Flags = &h0
		X_LabelFormat As String
	#tag EndProperty

	#tag Property, Flags = &h0
		X_MajorTick As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		X_Max As Double = 100
	#tag EndProperty

	#tag Property, Flags = &h0
		X_Min As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Y_Max As Double = 100
	#tag EndProperty

	#tag Property, Flags = &h0
		Y_Min As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Y_TickDensity As Integer = 30
	#tag EndProperty

	#tag Property, Flags = &h0
		Y_Title As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowLegendInTrackingBadge As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Y_Unit As String
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
			InitialValue="600"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="400"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
