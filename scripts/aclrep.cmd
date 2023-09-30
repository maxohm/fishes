@rem %windir%\system32\cmd.exe
@rem
@rem (c) maxohm [ at ] gmail.com
@rem ACLs REPAIR SCRIPT
@rem
@rem TAKEOWN /F * /R /A
@rem icacls * /grant "Администраторы":(OI)(CI)F /T /C /L
@rem icacls * /grant "Все":(OI)(CI)M /T /C /Q
