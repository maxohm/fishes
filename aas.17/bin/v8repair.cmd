@echo off

:stage0
set xTASK=%0
set xOBJSKIP=0
set xHEAD="1cv8.exe"
for /f %%I in ("%xTASK%") do (
	set xTSDISK=%%~dI
	set xTSPATH=%%~dpI
	set xTSNAME=%%~nI
)

:stage1
call %xTSPATH%\stage1s.cmd %1 %2 %3 %4
if %ERRORLEVEL% NEQ 0 (
	set x > %xLOGFILE%
	echo ERROR %ERRORLEVEL% >> %xLOGFILE%
	exit /B %ERRORLEVEL%
)

:stage5
set xPARAMS=CONFIG /N"v8service" /P"v8service" /F%xOBJECT% /DisableupMessages /Out%xLOGFILE% -NoTruncate /IBCheckAndRepair -ReIndex -LogIntergrity -RecalcTotals -BadRefClear -BadDataDelete -IBCompression
set xCMD=%xSUBJECT% %xPARAMS%
set x > %xLOGFILE%

echo JOB STARTED %DATE% %TIME% >> %xLOGFILE%
start "%xTSNAME%" /b /wait %xCMD%
echo JOB FINISHED %DATE% %TIME% >> %xLOGFILE%


exit /B 0