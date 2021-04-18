@rem %windir%\system32\cmd.exe
@rem
@rem (c) maxohm [ at ] gmail.com
@rem
@%windir%\System32\netsh interface ip set address "Local0" dhcp
@%windir%\System32\netsh interface ip set dns "Local0" dhcp
