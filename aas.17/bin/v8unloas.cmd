@rem ***************************************************
@rem *** Copyright (c) 2017, maxohm [ at ] gmail.com ***
@rem ***************************************************

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

:stage4
if %xNULPRM4%==.nul (
	rem
) else (
        if exist %xTSPRM4%\%xTIMESTAMP%.dt exit /B 6
	if exist %xTSPRM4% echo 1cv8 > %xTSPRM4%\%xTIMESTAMP%.dt
	if not exist %xTSPRM4%\%xTIMESTAMP%.dt exit /B 6
        if exist %xTSPRM4%\%xTIMESTAMP% del %xTSPRM4%\%xTIMESTAMP%.dt
	set xRESULT=%xTSPRM4%\%xTIMESTAMP%.dt
)

:stage5
set xPARAMS=CONFIG /N"v8service" /P"v8service" /S%xOBJECT% /DisableUpMessages /Out%xLOGFILE% -NoTruncate /DumpIB%xRESULT%
set xCMD=%xSUBJECT% %xPARAMS%
set x > %xLOGFILE%

echo JOB STARTED %DATE% %TIME% >> %xLOGFILE%
start "%xTSNAME%" /b /wait %xCMD%
echo JOB FINISHED %DATE% %TIME% >> %xLOGFILE%

exit /B 0