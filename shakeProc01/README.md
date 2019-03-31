# Shake Table Data Parser / Plotter

Main file = shakeDataBatchProc.m

Parser/Cleaner = shakeDataCleanSmooth.m

shakeDataPlot(cleanedData) = Makes 3 figures of cleanedData

shakeDataPlotSub(cleanedData) = Makes 1 Figure with subplots of cleanedData - shows filtered data
shakeDataPlotSub2(cleanedData, [xLow, xHigh]) = Makes 1 Figure with subplots of un-filtered cleanedData, optional xlimit input

shakeDataPlotSubRaw(rawData) = Makes 1 Figure with subplots of rawData

Note: functions with a 'b' appended are made to work with older version of MATLAB.