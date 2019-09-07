@rem %windir%\system32\cmd.exe
@rem
@rem (c) 2019, maxohm [ at ] gmail.com
@rem
@%windir%\System32\netsh interface ip delete dnsservers name="Local0" address="192.168.1.254"
@%windir%\System32\route.exe delete 0.0.0.0
