@rem ***************************************************
@rem *** Copyright (c) 2020, maxohm [ at ] gmail.com ***
@rem *** TASKS V1 COMPATIBILITY REMOVED !!! ************
@rem ***************************************************

@echo off
set prefix=%~dp0%
set config=%~dpn0%.cfg
set sig=%1
set nulsig=%1.nul

if not exist %config% exit /b 1
if not %nulsig%==.nul goto %sig%

:config
for /f "eol=# tokens=1,2 delims==" %%i in (%config%) do set %%i=%prefix%%%j
if not exist %SERVICES% 	exit /b 2
if not exist %OBJECTS% 		exit /b 3
if not exist %SCHEMA% 		exit /b 4
if not exist %LOGDIR% 		exit /b 5
call %0 rdparam
exit /b 0

:rdparam
@echo SCHTASKS /Delete /TN * /F > %OUTFILE%
for /f "eol=# tokens=1,2,3,4,5,6,7 delims=;" %%i in (%SCHEMA%) do (
	for /f "eol=# tokens=1,2,3,4,5,6,7 delims=;" %%a in (%OBJECTS%) do (
		set %%i=%%a
		set %%j=%%b
		set %%k=%%c
		set %%l=%%d
		set %%m=%%e
		set %%n=%%f
		set %%o=%%g
		call %0 wrtask
	)
)
@echo CLS >> %OUTFILE%
@echo SCHTASKS /Query /FO CSV >> %OUTFILE%
@echo SCHTASKS /CREATE /F /RU "" /SC ONSTART /TN "ONSTART" /TR %OUTFILE% >> %OUTFILE%

exit /b 0

:wrtask
for /f "eol=# tokens=1,2 delims==" %%u in (%SERVICES%) do (
	if %%u==%xSVC% (
	        if %xLOGDIR%.nul==.nul (
			@echo SCHTASKS /CREATE /F /ST %xTIME% /TN "%%u %xTIME::=% %xDATE%" /D %xDATE% /SC WEEKLY /RU "" /TR "%prefix%%%v %LOGDIR%%%~nv %xOBJ% %xEXEC% %xTSPRM4%" >> %OUTFILE%
			if not exist %LOGDIR%%%~nv mkdir %LOGDIR%%%~nv
		)
		if not %xLOGDIR%.nul==.nul (
			if exist %LOGDIR% @echo at %xTIME% /every:%xDATE% %prefix%%%v %xLOGDIR% %xOBJ% %xEXEC% %xTSPRM4% >> %OUTFILE%
			if not exist %LOGDIR% (
				@echo at %xTIME% /every:%xDATE% %prefix%%%v %LOGDIR%%%~nv %xOBJ% %xEXEC% %xTSPRM4% >> %OUTFILE%
				if not exist %LOGDIR%%%~nv mkdir %LOGDIR%%%~nv
			)
		)
	)
)

exit /b 0