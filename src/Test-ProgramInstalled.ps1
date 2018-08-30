
<#PSScriptInfo

.VERSION 1.0

.GUID 6164cc42-9e95-49eb-b8eb-d9f5285fdbb9

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
 Returns true if a program with the specified display name is installed.
 This function will check both the regular Uninstall location as well as the
 "Wow6432Node" location to ensure that both 32-bit and 64-bit locations are
 checked for software installations.

 @param String $program The name of the program to check for.
 @return Booleam Returns true if a program matching the specified name is installed.

 This script is From : https://www.reich-consulting.net/support/lan-administration/check-if-a-program-is-installed-using-powershell-3/

#> 
[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$ProgramName
)

$x86 = ((Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall") |
    Where-Object { $_.GetValue( "DisplayName" ) -like "*$ProgramName*" } ).Length -gt 0;

$x64 = ((Get-ChildItem "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") |
    Where-Object { $_.GetValue( "DisplayName" ) -like "*$ProgramName*" } ).Length -gt 0;

return $x86 -or $x64;