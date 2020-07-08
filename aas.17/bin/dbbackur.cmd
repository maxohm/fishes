@rem ***************************************************
@rem *** Copyright (c) 2017, maxohm [ at ] gmail.com ***
@rem ***************************************************

@echo off

:stage0
set xTASK=%0
set xHEAD="Rar.exe"
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
set xRESULT=%xOBJDISK%\%xTIMESTAMP%.%xOBJNAME%.rar
if exist %xRESULT% exit /B 6

:stage3
if not exist %xCLUDE% (
	echo *.cdx		 > %xCLUDE%
	echo *.tmp		>> %xCLUDE%
	echo *.bak		>> %xCLUDE%
	echo *.dir		>> %xCLUDE%
	echo *.ion		>> %xCLUDE%
	echo ~*.*		>> %xCLUDE%
)

:stage4
if %xNULPRM4%==.nul (
	rem
) else (
        if exist %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.rar exit /B 6
	if exist %xTSPRM4% echo 7z > %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.rar
	if not exist %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.rar exit /B 6
        if exist %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.rar del %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.rar
	set xRESULT=%xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%.rar
)

:stage5
set xPARAMS=a -rr5p -dh -k -m5 -mdG -mt4 -r -s -tsm -tsc -y -x@%xCLUDE% -hp%xOBJNAME%
set xCMD=%xSUBJECT% %xPARAMS% -- %xRESULT% %xOBJECT%
set x > %xLOGFILE%

echo JOB STARTED %DATE% %TIME% >> %xLOGFILE%
start "%xTSNAME%" /b /wait %xCMD% >> %xLOGFILE%
echo JOB FINISHED %DATE% %TIME% >> %xLOGFILE%

exit /B 0