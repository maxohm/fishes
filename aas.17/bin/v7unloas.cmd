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
echo CheckAndRepair=0 		>> %nCLUDE%
echo UnloadData=1 		>> %nCLUDE%
echo [UnloadData]		>> %nCLUDE%
echo IncludeUserDef=1 		>> %nCLUDE%
echo Password=%xOBJNAME% 	>> %nCLUDE%
)

:stage4
if %xNULPRM4%==.nul (
	rem
) else (
        if exist %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.zip exit /B 6
	if exist %xTSPRM4% echo 7z > %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.zip
	if not exist %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.zip exit /B 6
        if exist %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.zip del %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.zip
	set xRESULT=%xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.zip
	
)
if exist %nCLUDE% echo UnloadToFile=%xRESULT% 	>> %nCLUDE%

:stage5
set xPARAMS=CONFIG /Nv7service /Pv7service /D%xOBJECT% /@%nCLUDE%
set xCMD=%xSUBJECT% %xPARAMS%


echo JOB STARTED %DATE% %TIME% >> %xLOGFILE%
start "%xTSNAME%" /b /wait %xCMD%
set x >> %xLOGFILE%
echo JOB FINISHED %DATE% %TIME% >> %xLOGFILE%

exit /B 0