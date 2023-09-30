<#
.SYNOPSIS
    Windows Defender Uninstall

.DESCRIPTION
    Uninstalls Windows Defender an all it's components

.NOTES
	File Name      : UninstallWindowsDefender
    Author: maxohm [at] gmail.com
	Prerequisite   : PowerShell V2 over Vista and upper.
	Copyright - Max Ohm
#>

Uninstall-WindowsFeature -Name Windows-Defender