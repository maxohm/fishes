@rem %windir%\system32\cmd.exe
@rem
@rem (c) maxohm [ at ] gmail.com
@rem SCHTASKS ONSTART EXAMPLE
@rem
@SCHTASKS /CREATE /F /RU "" /SC ONSTART /TN %1