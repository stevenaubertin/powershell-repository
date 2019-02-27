
<#PSScriptInfo

.VERSION 1.0

.GUID 1500df13-108a-45d5-bb59-c2eed6116a77

.AUTHOR stevenaubertin@gmail.com

.COMPANYNAME 

.COPYRIGHT (c) 2018

.TAGS 

.LICENSEURI https://github.com/stevenaubertin/powershell-repository/blob/master/LICENSE.md

.PROJECTURI https://github.com/stevenaubertin/powershell-repository

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


.PRIVATEDATA 

#>

<# 

.DESCRIPTION 
 Nix-like wich command with "wich" alias 
#> 
[CmdletBinding()]
[alias("which")]
Param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$Name
)


Get-Command $Name | Select-Object -ExpandProperty Definition