<#
.SYNOPSIS
    Xbox Game Overlay Remove

.DESCRIPTION
    Removes XboxGameOverlay an all it's components

.NOTES
	File Name      : XboxGameOverlayRemove.ps2
    Author: maxohm [at] gmail.com
	Prerequisite   : PowerShell V2 over Vista and upper.
	Copyright - Max Ohm
#>

Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage
Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxGameOverlay* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.Xbox.TCUI* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxApp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.GamingServices* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxIdentityProvider* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage
