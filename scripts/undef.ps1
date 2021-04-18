<#
.SYNOPSIS
    Windows Defender remove

.DESCRIPTION
    Removes Windows Defender an all it's components

.NOTES
	File Name      : undock.ps2
    Author: maxohm [at] gmail.com
	Prerequisite   : PowerShell V2 over Vista and upper.
	Copyright - Max Ohm
#>

Uninstall-WindowsFeature -Name Windows-Defender