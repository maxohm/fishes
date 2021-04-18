@rem %windir%\system32\cmd.exe
@rem
@rem (c) maxohm [ at ] gmail.com
@rem NETSH Teredo remove EXAMPLE
@rem
@%windir%\System32\netsh interface teredo set state disabled
@%windir%\System32\netsh interface teredo show state > %0.log
