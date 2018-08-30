
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

 @param String $Name The name of the program to check for.
 @return Booleam Returns true if a program matching the specified name is installed.

 This script is inspired from : https://www.reich-consulting.net/support/lan-administration/check-if-a-program-is-installed-using-powershell-3/

#> 
[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True, Position=1)]
    [string]$Name
)

$InstallationPathx86 = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
$InstallationPathx64 = "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"

function Test-Installed {
    param (
        [Parameter(Mandatory=$True, Position=1)]
        [string]$InstallationPath
    )
    return ((Get-ChildItem $InstallationPath) | Where-Object { $_.GetValue( "DisplayName" ) -like "*$Name*" } ).Length -gt 0
}

$x86 = Test-Installed -InstallationPath $InstallationPathx86;
$x64 = Test-Installed -InstallationPath $InstallationPathx64;

return $x86 -or $x64;