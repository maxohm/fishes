@rem %windir%\system32\cmd.exe
@rem
@rem (c) maxohm [ at ] gmail.com
@rem NETSH Teredo remove EXAMPLE
@rem
netsh interface teredo set state disabled
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled
netsh interface ipv6 isatap set state state=disabled
@rem
netsh interface teredo show state > %0.log
netsh interface ipv6 6to4 show state >> %0.log
netsh interface ipv6 isatap show state >> %0.log