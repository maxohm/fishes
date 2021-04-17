@rem %windir%\system32\cmd.exe
@rem
@rem (c) 2021, maxohm [ at ] gmail.com
@rem
@%windir%\System32\netsh interface teredo set state disabled
@%windir%\System32\netsh interface teredo show state > %0.log
