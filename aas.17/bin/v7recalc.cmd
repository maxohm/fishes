@rem ***************************************************
@rem *** Copyright (c) 2017, maxohm [ at ] gmail.com ***
@rem ***************************************************

@echo off

:stage0
set xTASK=%0
set xOBJSKIP=0
set xHEAD="1cv7s.exe"
for /f %%I in ("%xTASK%") do (
	set xTSDISK=%%~dI
	set xTSPATH=%%~dpI
	set xTSNAME=%%~nI
)

:stage1
call %xTSPATH%\stage1.cmd %1 %2 %3 %4
if %ERRORLEVEL% NEQ 0 (
	set x > %xLOGFILE%
	echo ERROR %ERRORLEVEL% >> %xLOGFILE%
	exit /B %ERRORLEVEL%
)

:stage2
set xRESULT=%xOBJDISK%\%xTIMESTAMP%.%xOBJNAME%.zip
if exist %xRESULT% exit /B 6

:stage3
if not exist %nCLUDE% (
echo [General] 			 > %nCLUDE%
echo Quit=1 			>> %nCLUDE%
echo Output=%xLOGFILE%		>> %nCLUDE%
echo CheckAndRepair=1 		>> %nCLUDE%
echo [CheckAndRepair] 		>> %nCLUDE%
echo Repair=0 			>> %nCLUDE%
echo PhysicalIntegrity=0 	>> %nCLUDE%
echo Reindex=0 			>> %nCLUDE%
echo LogicalIntegrity=0 	>> %nCLUDE%
echo RecalcSecondaries=1 	>> %nCLUDE%
echo RecalcTotals=1 		>> %nCLUDE%
echo Pack=0 			>> %nCLUDE%
echo SkipUnresolved=0 		>> %nCLUDE%
echo CreateForUnresolved=0 	>> %nCLUDE%
echo Reconstruct=0 		>> %nCLUDE%
)

:stage4
if %xNULPRM4%==.nul (
	rem
) else (
	if exist %xTSPRM4% set %nCLUDE%=%xTSPRM4% 
	if exist %xOBJPATH%\%xTSPRM4% set %nCLUDE%=%xOBJPATH%\%xTSPRM4%
)

:stage5
set xPARAMS=CONFIG /Nv7service /Pv7service /D%xOBJECT% /@%nCLUDE%
set xCMD=%xSUBJECT% %xPARAMS%
set x > %xLOGFILE%

echo JOB STARTED %DATE% %TIME% >> %xLOGFILE%
start "%xTSNAME%" /b /wait %xCMD%
echo JOB FINISHED %DATE% %TIME% >> %xLOGFILE%

exit /B 0