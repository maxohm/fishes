@rem %windir%\system32\cmd.exe
@rem
@rem (c) maxohm [ at ] gmail.com
@rem fsutil get fs info example
@rem
@%windir%\System32\fsutil behavior query allowExtChar
@%windir%\System32\fsutil behavior query bugcheckOnCorrupt
@%windir%\System32\fsutil behavior query disable8dot3
@%windir%\System32\fsutil behavior query disableCompression
@%windir%\System32\fsutil behavior query disableCompressionLimit
@%windir%\System32\fsutil behavior query disableDeleteNotify
@%windir%\System32\fsutil behavior query disableEncryption
@%windir%\System32\fsutil behavior query disableFileMetadataOptimization
@%windir%\System32\fsutil behavior query disableLastAccess
@%windir%\System32\fsutil behavior query disableSpotCorruptionHandling
@%windir%\System32\fsutil behavior query encryptPagingFile
@%windir%\System32\fsutil behavior query memoryUsage
@%windir%\System32\fsutil behavior query mftZone
@%windir%\System32\fsutil behavior query quotaNotify
@%windir%\System32\fsutil behavior query symlinkEvaluation
@%windir%\System32\fsutil behavior query disableWriteAutoTiering c:
@%windir%\System32\fsutil behavior query disableTxf c:
