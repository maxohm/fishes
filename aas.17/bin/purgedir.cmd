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
call %xTSPATH%\stage1s.cmd %1 %2 %3 %4
if %ERRORLEVEL% NEQ 0 (
	set x > %xLOGFILE%
	echo ERROR %ERRORLEVEL% >> %xLOGFILE%
	exit /B %ERRORLEVEL%
)

:stage5
set xPARAMS=/C del /f/s/q/a
set xCMD=%xSUBJECT% %xPARAMS% %xOBJECT% %xTSPRM4%
set x > %xLOGFILE%

start "%xTSNAME%" /b /wait %xCMD% >> %xLOGFILE%

exit /B 0