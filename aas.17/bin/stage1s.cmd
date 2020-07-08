@rem ***************************************************
@rem *** Copyright (c) 2017, maxohm [ at ] gmail.com ***
@rem ***************************************************

:def
set xLOGDIR=%1
set xOBJECT=%2
set xSUBJECT=%3
set xTSPRM4=%4
set xNULPRM4=%4.nul

:chk
if not exist %xLOGDIR% exit /B 1

:objskip
set xSUBJECT=%xSUBJECT:/=\%
if not exist %xSUBJECT% exit /B 4
for /f %%I in ("%xSUBJECT%") do if /I "%%~nxI" NEQ %xHEAD% exit /B 5
set xSUBJECT=%xSUBJECT:/=\%
for /f %%I in ("%xSUBJECT%") do (
	set xSUBJDISK=%%~dI
	set xSUBJPATH=%%~dpI
	set xSUBJNAME=%%~nxI
)
set xSUBJPATH=%xSUBJPATH:~0,-1%
set xSUBJECT=%xSUBJPATH%\%xSUBJNAME%

:gettime
set curtime=%TIME::=%
set curdate=%DATE:.=%
set xTIMESTAMP=%curdate:~4%%curdate:~2,2%%curdate:~0,2%%xSUBJDISK:~0,1%%curtime:~0,6%
set xTIMESTAMP=%xTIMESTAMP: =0%

:getlog
set xLOGFILE=%xLOGDIR%\%xTIMESTAMP%.log