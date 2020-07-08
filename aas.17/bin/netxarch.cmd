@rem ***************************************************
@rem *** Copyright (c) 2017, maxohm [ at ] gmail.com ***
@rem ***************************************************

@echo off

:stage0
set xTASK=%0
set xHEAD="cmd.exe"
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
echo xcopy > %xTSPRM4%\%xTIMESTAMP%
if not exist %xTSPRM4%\%xTIMESTAMP% exit /B 6
if exist %xTSPRM4%\%xTIMESTAMP% del %xTSPRM4%\%xTIMESTAMP%

:stage4
if %xNULPRM4%==.nul (
	exit /B 6
)

:stage5
set xPARAMS=/C xcopy /m/e/v/c/f/h/r/y/z
set xCMD=%xSUBJECT% %xPARAMS% %xOBJECT% %xTSPRM4%
set x > %xLOGFILE%

start "%xTSNAME%" /b /wait %xCMD% >> %xLOGFILE%
exit /B 0