#REQUIRES -Version 2.0

<#
.SYNOPSIS
    Fast Docker remove

.DESCRIPTION
    Removes Docker an all it's components

.NOTES
	File Name      : UninstallDockerMsftProvider
    Author: maxohm [at] gmail.com
	Prerequisite   : PowerShell V2 over Vista and upper.
	Copyright - Max Ohm
#>

<##>
Restart-Service docker
<##>
docker swarm leave --force
docker ps --quiet | ForEach-Object {docker stop $_}
docker system prune --volumes --all
<##>
Uninstall-Package -Name docker -ProviderName DockerMsftProvider
Uninstall-Module -Name DockerMsftProvider
<##>
Get-PackageProvider -Name *Docker*
Get-HNSNetwork | Remove-HNSNetwork
Get-ContainerNetwork | Remove-ContainerNetwork
<##>
Remove-Item "C:\ProgramData\Docker" -Recurse -Force
<#
Remove-WindowsFeature Containers
Remove-WindowsFeature Hyper-V
Restart-Computer -Force
#>