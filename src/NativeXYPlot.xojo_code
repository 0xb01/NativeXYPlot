#tag Class
Protected Class NativeXYPlot
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

	#tag Method, Flags = &h0
		Sub Constructor(w As Integer = 600, h As Integer = 400)
		  // Set default dimensions and styling
		  Width = w
		  Height = h
		  PlotLeft = 50
		  PlotTop = 45
		  PlotWidth = Max(50, w - 100)
		  PlotHeight = Max(50, h - 75)
		  PlotBgColor = &cFFFFFF
		  GridColor = &cE0E0E0
		  DualYAxis = True
		  ShowLegend = True
		  LegendPosition = 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTrackingOverlay(g As Graphics, mouseX As Integer, mouseY As Integer, showValues As Boolean = True)
		  // Check if graphics is valid and mouse is inside plot
		  If g Is Nil Then Return
		  If mouseX < PlotLeft Or mouseX > PlotLeft + PlotWidth Or mouseY < PlotTop Or mouseY > PlotTop + PlotHeight Then
		    Return
		  End If
		  
		  // Find nearest data X
		  Var nearestX As Double = GetNearestXValue(mouseX)
		  Var trackScreenX As Double = ValueToScreenX(nearestX)
		  If trackScreenX < PlotLeft Or trackScreenX > PlotLeft + PlotWidth Then Return
		  
		  // Draw vertical tracking guide line
		  g.DrawingColor = &c000000
		  Var curY As Double = PlotTop
		  While curY < PlotTop + PlotHeight
		    g.DrawLine(trackScreenX, curY, trackScreenX, Min(curY + 4, PlotTop + PlotHeight))
		    curY = curY + 8
		  Wend
		  
		  // Draw date badge on bottom axis
		  If IsDateAxis Then
		    Var dt As New DateTime(nearestX, TimeZone.Current)
		    Var xBadgeStr As String = dt.ToString("dd/MM/yyyy HH:mm")
		    g.FontSize = 8
		    g.Bold = True
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
		      Var dist As Double = Abs(xVals(i) - nearestX)
		      If dist < bestDist Then
		        bestDist = dist
		        foundIdx = i
		      End If
		    Next
		    
		    If foundIdx >= 0 Then
		      Var ptX As Double = ValueToScreenX(xVals(foundIdx))
		      Var ptY As Double = ValueToScreenY(yVals(foundIdx))
		      
		      If ptX >= PlotLeft And ptX <= PlotLeft + PlotWidth And ptY >= PlotTop And ptY <= PlotTop + PlotHeight Then
		        Var sColor As Color = SeriesColors(s)
		        
		        // Draw curve point dot
		        g.DrawingColor = sColor
		        g.FillOval(ptX - 4, ptY - 4, 8, 8)
		        g.DrawingColor = &cFFFFFF
		        g.DrawOval(ptX - 4, ptY - 4, 8, 8)
		        
		        If showValues Then
		          // Format value label
		          Var valStr As String
		          If UseDiscreteY And Y_DiscreteLabels.Count > 0 Then
		            Var idx As Integer = Round(yVals(foundIdx))
		            If idx >= 0 And idx <= Y_DiscreteLabels.LastIndex Then
		              valStr = Y_DiscreteLabels(idx)
		            Else
		              valStr = yVals(foundIdx).ToString("0.##")
		            End If
		          Else
		            valStr = yVals(foundIdx).ToString("0.##") + Y_Unit
		          End If
		          
		          Var vW As Double = g.TextWidth(valStr) + 8
		          Var vH As Double = g.TextHeight + 4
		          Var rawY As Double = Max(PlotTop, Min(ptY - vH / 2, PlotTop + PlotHeight - vH))
		          
		          ptXs.Add(ptX)
		          ptYs.Add(ptY)
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
		        vX = pX + 8
		      Else
		        vX = pX - vW - 8
		      End If
		      
		      // Draw leader connector line if badge was shifted vertically
		      If Abs(vY + (vH / 2) - pY) > 6 Then
		        g.DrawingColor = Color.RGB(sColor.Red, sColor.Green, sColor.Blue, 150)
		        If pX <= PlotLeft + (PlotWidth / 2) Then
		          g.DrawLine(pX + 4, pY, vX, vY + (vH / 2))
		        Else
		          g.DrawLine(pX - 4, pY, vX + vW, vY + (vH / 2))
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
		  // Find closest X data value across all series
		  Var xTarget As Double = ScreenToValueX(screenX)
		  Var bestX As Double = xTarget
		  Var bestDist As Double = 1e30
		  
		  For s As Integer = 0 To SeriesCount - 1
		    Var xVals() As Double = SeriesX(s)
		    If xVals.Count = 0 Then Continue
		    
		    For i As Integer = 0 To xVals.LastIndex
		      Var dist As Double = Abs(xVals(i) - xTarget)
		      If dist < bestDist Then
		        bestDist = dist
		        bestX = xVals(i)
		      End If
		    Next
		  Next
		  
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
		    
		    PlotLeft = 50
		    PlotTop = 45
		    If LegendPosition = 2 Then
		      PlotWidth = Max(50, g.Width - 170)
		    Else
		      PlotWidth = Max(50, g.Width - 100)
		    End If
		    PlotHeight = Max(50, g.Height - 75)
		    
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
		Sub Render(g As Graphics)
		  // Check if graphics is valid
		  If g Is Nil Then Return
		  
		  // Draw outer background
		  g.DrawingColor = &cFFFFFF
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  // Draw plot background
		  g.DrawingColor = PlotBgColor
		  g.FillRectangle(PlotLeft, PlotTop, PlotWidth, PlotHeight)
		  
		  // Draw title
		  If Title.Len > 0 Then
		    g.DrawingColor = &c000000
		    g.FontSize = 13
		    g.Bold = True
		    g.DrawText(Title, PlotLeft, PlotTop - 25)
		  End If
		  
		  // Draw legends
		  If ShowLegend And SeriesCount > 0 Then
		    g.FontSize = 9
		    g.Bold = False
		    
		    Select Case LegendPosition
		    Case 0
		      // Top Left (horizontal above graph)
		      Var legX As Double = PlotLeft
		      Var legY As Double = PlotTop - 10
		      For s As Integer = 0 To SeriesCount - 1
		        Var sName As String = SeriesNames(s)
		        If sName.Len = 0 Then Continue
		        Var sCol As Color = SeriesColors(s)
		        
		        g.DrawingColor = sCol
		        g.FillRoundRectangle(legX, legY - 6, 12, 6, 2, 2)
		        g.DrawingColor = &c333333
		        g.DrawText(sName, legX + 16, legY)
		        legX = legX + 20 + g.TextWidth(sName) + 12
		        If legX > PlotLeft + PlotWidth - 30 Then Exit For
		      Next
		      
		    Case 2
		      // Right sidebar (vertical)
		      Var legX As Double = PlotLeft + PlotWidth + (If(DualYAxis, 55, 18))
		      Var legY As Double = PlotTop + 8
		      For s As Integer = 0 To SeriesCount - 1
		        Var sName As String = SeriesNames(s)
		        If sName.Len = 0 Then Continue
		        Var sCol As Color = SeriesColors(s)
		        Var itemY As Double = legY + (s * 20)
		        If itemY > PlotTop + PlotHeight Then Exit For
		        
		        g.DrawingColor = sCol
		        g.FillRoundRectangle(legX, itemY - 7, 14, 8, 2, 2)
		        g.DrawingColor = &c333333
		        g.DrawText(sName, legX + 18, itemY)
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
		          g.FillRoundRectangle(boxX + 8, currItemY - 6, 12, 6, 2, 2)
		          g.DrawingColor = &c333333
		          g.DrawText(sName, boxX + 24, currItemY)
		          currItemY = currItemY + 18
		        Next
		      End If
		      
		    Else
		      // Top Right (horizontal above graph, right-aligned) - Default (1)
		      Var totalW As Double = 0
		      For s As Integer = 0 To SeriesCount - 1
		        Var sName As String = SeriesNames(s)
		        If sName.Len = 0 Then Continue
		        totalW = totalW + 16 + g.TextWidth(sName) + 14
		      Next
		      Var legX As Double = Max(PlotLeft, PlotLeft + PlotWidth - totalW + 14)
		      Var legY As Double = PlotTop - 10
		      For s As Integer = 0 To SeriesCount - 1
		        Var sName As String = SeriesNames(s)
		        If sName.Len = 0 Then Continue
		        Var sCol As Color = SeriesColors(s)
		        
		        g.DrawingColor = sCol
		        g.FillRoundRectangle(legX, legY - 6, 12, 6, 2, 2)
		        g.DrawingColor = &c333333
		        g.DrawText(sName, legX + 16, legY)
		        legX = legX + 16 + g.TextWidth(sName) + 14
		      Next
		    End Select
		  End If
		  
		  // Draw threshold highlight zone
		  If ShowThreshold Then
		    Var yA As Double = ValueToScreenY(Threshold_A)
		    Var yB As Double = ValueToScreenY(Threshold_B)
		    Var topY As Double = Max(PlotTop, Min(yA, yB))
		    Var botY As Double = Min(PlotTop + PlotHeight, Max(yA, yB))
		    Var hZone As Double = Max(0, botY - topY)
		    
		    g.DrawingColor = ThresholdZoneColor
		    If hZone > 0 Then
		      g.FillRectangle(PlotLeft, topY, PlotWidth, hZone)
		    End If
		    
		    g.DrawingColor = ThresholdColor
		    If yA >= PlotTop And yA <= PlotTop + PlotHeight Then
		      g.DrawLine(PlotLeft, yA, PlotLeft + PlotWidth, yA)
		    End If
		    If yB >= PlotTop And yB <= PlotTop + PlotHeight Then
		      g.DrawLine(PlotLeft, yB, PlotLeft + PlotWidth, yB)
		    End If
		  End If
		  
		  // Draw Y Axis and gridlines
		  g.FontSize = 8
		  g.Bold = False
		  If UseDiscreteY And Y_DiscreteLabels.Count > 0 Then
		    // Discrete text labels (e.g. OFF / ON)
		    For d As Integer = 0 To Y_DiscreteLabels.LastIndex
		      Var dVal As Double = d * 1.0
		      Var sy As Double = ValueToScreenY(dVal)
		      If sy >= PlotTop And sy <= PlotTop + PlotHeight Then
		        g.DrawingColor = GridColor
		        g.DrawLine(PlotLeft, sy, PlotLeft + PlotWidth, sy)
		        
		        g.DrawingColor = &c333333
		        g.DrawLine(PlotLeft - 4, sy, PlotLeft, sy)
		        Var labelStr As String = Y_DiscreteLabels(d)
		        Var strW As Double = g.TextWidth(labelStr)
		        g.DrawText(labelStr, PlotLeft - strW - 6, sy + (g.FontAscent / 2) - 1)
		        
		        If DualYAxis Then
		          g.DrawLine(PlotLeft + PlotWidth, sy, PlotLeft + PlotWidth + 4, sy)
		          g.DrawText(labelStr, PlotLeft + PlotWidth + 6, sy + (g.FontAscent / 2) - 1)
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
		      If sy >= PlotTop And sy <= PlotTop + PlotHeight Then
		        g.DrawingColor = GridColor
		        g.DrawLine(PlotLeft, sy, PlotLeft + PlotWidth, sy)
		        
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
		    // Date/Time scale
		    Var xSpan As Double = X_Max - X_Min
		    If xSpan <= 0 Then xSpan = 3600
		    Var stepX As Double
		    If X_MajorTick > 0 Then
		      stepX = X_MajorTick
		    ElseIf xSpan > 14 * 86400 Then
		      stepX = 7 * 86400
		    ElseIf xSpan > 3 * 86400 Then
		      stepX = 86400
		    ElseIf xSpan > 86400 Then
		      stepX = 43200
		    ElseIf xSpan > 6 * 3600 Then
		      stepX = 7200
		    ElseIf xSpan > 3600 Then
		      stepX = 1800
		    Else
		      stepX = 300
		    End If
		    
		    Var startX As Double = Ceil(X_Min / stepX) * stepX
		    Var currX As Double = startX
		    While currX <= X_Max + (stepX * 0.001)
		      Var sx As Double = ValueToScreenX(currX)
		      If sx >= PlotLeft And sx <= PlotLeft + PlotWidth Then
		        g.DrawingColor = GridColor
		        g.DrawLine(sx, PlotTop, sx, PlotTop + PlotHeight)
		        
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
		      If sx >= PlotLeft And sx <= PlotLeft + PlotWidth Then
		        g.DrawingColor = GridColor
		        g.DrawLine(sx, PlotTop, sx, PlotTop + PlotHeight)
		        
		        g.DrawingColor = &c333333
		        g.DrawLine(sx, PlotTop + PlotHeight, sx, PlotTop + PlotHeight + 4)
		        
		        Var numLbl As String = currX.ToString("0.##")
		        Var lblW As Double = g.TextWidth(numLbl)
		        g.DrawText(numLbl, sx - (lblW / 2), PlotTop + PlotHeight + g.FontAscent + 4)
		      End If
		      currX = currX + stepX
		    Wend
		  End If
		  
		  // Draw plot border box
		  g.DrawingColor = &c333333
		  g.DrawRectangle(PlotLeft, PlotTop, PlotWidth, PlotHeight)
		  
		  // Draw data curves
		  For s As Integer = 0 To SeriesCount - 1
		    Var xVals() As Double = SeriesX(s)
		    Var yVals() As Double = SeriesY(s)
		    If xVals.Count = 0 Or yVals.Count = 0 Then Continue
		    
		    Var cColor As Color = SeriesColors(s)
		    Var lWidth As Integer = SeriesLineWidths(s)
		    Var showSym As Boolean = SeriesShowSymbols(s)
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
		        If Not ((rawX1 < PlotLeft And rawX2 < PlotLeft) Or (rawX1 > PlotLeft + PlotWidth And rawX2 > PlotLeft + PlotWidth) Or rawY1 < PlotTop Or rawY1 > PlotTop + PlotHeight) Then
		          Var hx1 As Double = Max(PlotLeft, Min(rawX1, PlotLeft + PlotWidth))
		          Var hx2 As Double = Max(PlotLeft, Min(rawX2, PlotLeft + PlotWidth))
		          Var hy As Double = Max(PlotTop, Min(rawY1, PlotTop + PlotHeight))
		          For w As Integer = 0 To lWidth - 1
		            g.DrawLine(hx1, hy + w, hx2, hy + w)
		          Next
		        End If
		        
		        // Vertical transition segment
		        If rawX2 >= PlotLeft And rawX2 <= PlotLeft + PlotWidth Then
		          If Not ((rawY1 < PlotTop And rawY2 < PlotTop) Or (rawY1 > PlotTop + PlotHeight And rawY2 > PlotTop + PlotHeight)) Then
		            Var vy1 As Double = Max(PlotTop, Min(rawY1, PlotTop + PlotHeight))
		            Var vy2 As Double = Max(PlotTop, Min(rawY2, PlotTop + PlotHeight))
		            For w As Integer = 0 To lWidth - 1
		              g.DrawLine(rawX2 + w, vy1, rawX2 + w, vy2)
		            Next
		          End If
		        End If
		        
		        // Point symbol
		        If showSym And rawX1 >= PlotLeft And rawX1 <= PlotLeft + PlotWidth And rawY1 >= PlotTop And rawY1 <= PlotTop + PlotHeight Then
		          g.FillOval(rawX1 - 3, rawY1 - 3, 6, 6)
		        End If
		      Next
		    Else
		      // Draw linear lines
		      For i As Integer = 0 To ptCount - 2
		        Var rawX1 As Double = ValueToScreenX(xVals(i))
		        Var rawY1 As Double = ValueToScreenY(yVals(i))
		        Var rawX2 As Double = ValueToScreenX(xVals(i + 1))
		        Var rawY2 As Double = ValueToScreenY(yVals(i + 1))
		        
		        If (rawX1 < PlotLeft And rawX2 < PlotLeft) Or (rawX1 > PlotLeft + PlotWidth And rawX2 > PlotLeft + PlotWidth) Then
		          Continue
		        End If
		        If (rawY1 < PlotTop And rawY2 < PlotTop) Or (rawY1 > PlotTop + PlotHeight And rawY2 > PlotTop + PlotHeight) Then
		          Continue
		        End If
		        
		        Var x1 As Double = Max(PlotLeft, Min(rawX1, PlotLeft + PlotWidth))
		        Var y1 As Double = Max(PlotTop, Min(rawY1, PlotTop + PlotHeight))
		        Var x2 As Double = Max(PlotLeft, Min(rawX2, PlotLeft + PlotWidth))
		        Var y2 As Double = Max(PlotTop, Min(rawY2, PlotTop + PlotHeight))
		        
		        For w As Integer = 0 To lWidth - 1
		          g.DrawLine(x1, y1 + w, x2, y2 + w)
		        Next
		        
		        // Point symbol
		        If showSym And rawX1 >= PlotLeft And rawX1 <= PlotLeft + PlotWidth And rawY1 >= PlotTop And rawY1 <= PlotTop + PlotHeight Then
		          g.FillOval(rawX1 - 3, rawY1 - 3, 6, 6)
		        End If
		      Next
		    End If
		    
		    // Last point symbol
		    If showSym And ptCount > 0 Then
		      Var xLast As Double = ValueToScreenX(xVals(ptCount - 1))
		      Var yLast As Double = ValueToScreenY(yVals(ptCount - 1))
		      If xLast >= PlotLeft And xLast <= PlotLeft + PlotWidth And yLast >= PlotTop And yLast <= PlotTop + PlotHeight Then
		        g.FillOval(xLast - 3, yLast - 3, 6, 6)
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
		Sub SetYDiscreteLabels(labels() As String, minVal As Double = -0.2, maxVal As Double = 0.0)
		  // Set custom text labels for Y axis (e.g. OFF / ON)
		  Y_DiscreteLabels = labels
		  UseDiscreteY = True
		  Y_Min = minVal
		  If maxVal > minVal Then
		    Y_Max = maxVal
		  Else
		    Y_Max = Max(1.0, labels.LastIndex * 1.0 + 0.2)
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
		ShowThreshold As Boolean = False
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
