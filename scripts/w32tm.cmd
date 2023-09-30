@rem %windir%\system32\cmd.exe
@rem
@rem (c) maxohm [ at ] gmail.com
@rem w32time service fix
@rem
@net stop w32time
@net start w32time
@w32tm /debug /disable
@w32tm /unregister
@w32tm /register
@rem
@rem w32TM /config /syncfromflags:manual /manualpeerlist:ntp2.vniiftri.ru
@rem w32tm /config /update
@rem w32tm /resync /force