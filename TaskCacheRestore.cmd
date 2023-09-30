@rem %windir%\system32\cmd.exe
@rem
@rem (c) maxohm [ at ] gmail.com
@rem Memory Management EXAMPLE
@rem
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "C:\pagefile.sys 1024 1024"