@rem ***************************************************
@rem *** Copyright (c) 2017, maxohm [ at ] gmail.com ***
@rem ***************************************************

@echo off

set xOBJECT=%1
set xSUBJECT=c:\PROGRA~1\7-Zip\7z.exe

:stage0
if not exist %xOBJECT% exit /B 1
if not exist %xSUBJECT% exit /B 2

:stage1
for /f %%I in ("%xOBJECT%") do (
	set xOBJDISK=%%~dI
	set xOBJPATH=%%~dpI
	set xOBJNAME=%%~nI%%~xI
)

set curtime=%TIME::=%
set curdate=%DATE:.=%
set xTIMESTAMP=%curdate:~4%%curdate:~2,2%%curdate:~0,2%%xOBJDISK:~0,1%%curtime:~0,6%
set xTIMESTAMP=%xTIMESTAMP: =0%

:stage2
set xLOGFILE=%1\..\%xTIMESTAMP%.%xOBJNAME%.log
echo JOB STARTED %DATE% %TIME% > %xLOGFILE%
if not exist %xLOGFILE% exit /B 3
set xRESULT=%1\..\%xTIMESTAMP%.%xOBJNAME%
if exist %xRESULT% exit /B 6
:stage3
:stage4
:stage5
set xPARAMS=a -bb3 -mhe=on -mtc=on -mx=9 -myx=9 -p%COMPUTERNAME% -r -snh -snl -ssw -t7z -v2000m -y
set xCMD=%xSUBJECT% %xPARAMS% -- %xRESULT% %xOBJECT%
set x >> %xLOGFILE%


start "%xTSNAME%" /b /wait %xCMD% >> %xLOGFILE%
echo JOB FINISHED %DATE% %TIME% >> %xLOGFILE%
exit /B 0