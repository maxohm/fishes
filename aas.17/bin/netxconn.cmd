@rem ***************************************************
@rem *** Copyright (c) 2017, maxohm [ at ] gmail.com ***
@rem ***************************************************

@echo off

:stage0
set xTASK=%0
set xHEAD="net.exe"
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
	exit /B 6
)

:stage5
set xPARAMS=use %xOBJECT%
set xCMD=%xSUBJECT% %xPARAMS% /persistent:yes /user:%xTSPRM4::= %
set x > %xLOGFILE%

echo JOB STARTED %DATE% %TIME% >> %xLOGFILE%
start "%xTSNAME%" /b /wait %xCMD% >> %xLOGFILE%
echo JOB FINISHED %DATE% %TIME% >> %xLOGFILE%

exit /B 0