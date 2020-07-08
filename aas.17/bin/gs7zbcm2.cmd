@rem ***************************************************
@rem *** Copyright (c) 2018, maxohm [ at ] gmail.com ***
@rem ***************************************************

@echo off

:stage0
set xTASK=%0
set xHEAD="7z.exe"
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
set xRESULT=%xOBJDISK%\%xTIMESTAMP%.%xOBJNAME%
if exist %xRESULT% exit /B 6

:stage3
if exist %nCLUDE% set xOBJECT=@%nCLUDE%
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
        if exist %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME% exit /B 6
	if exist %xTSPRM4% echo 7z > %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%
	if not exist %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME% exit /B 6
        if exist %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME% del %xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%
	set xRESULT=%xTSPRM4%\%xTIMESTAMP%.%xOBJNAME%
	if not exist /openssl/bin/openssl.exe exit /B 6
	set xSSL=/openssl/bin/openssl.exe
)

:stage5
set xPARAMS=a -mtc=on -mx=9 -myx=9 -snh -snl -ssw -t7z -v2000m -y -x@%xCLUDE%
set xCMD=%xSUBJECT% %xPARAMS% -- %xRESULT% %xOBJECT%
set x > %xLOGFILE%

echo JOB STARTED %DATE% %TIME% >> %xLOGFILE%
start "%xTSNAME%" /b /wait %xCMD% >> %xLOGFILE%

:stage6

	@echo %xSSL% >> %xLOGFILE%
	@echo %xSSL% enc -gost89 -out %xRESULT%.bak -in %xRESULT% -k %COMPUTERNAME% >> %xLOGFILE%
	%xSSL% enc -gost89 -out %xRESULT%.bak -in %xRESULT% -k %COMPUTERNAME%

rem if exist %xRESULT%.bak del %xRESULT%
rem if exist %xRESULT%.bak ren %xRESULT%.bak %xRESULT%

echo JOB FINISHED %DATE% %TIME% >> %xLOGFILE%
exit /B 0