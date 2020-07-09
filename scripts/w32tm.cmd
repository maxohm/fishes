@rem %windir%\system32\cmd.exe
@rem
@rem (c) 2020, maxohm [ at ] gmail.com
@rem
@net stop w32time
@w32tm /debug /disable
@w32tm /unregister
@w32tm /register
@net start w32time
