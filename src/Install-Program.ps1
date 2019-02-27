
<#PSScriptInfo

.VERSION 1.0

.GUID 1da94b33-7d2b-4a81-a3b2-acc93972335c

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
 Install a program using chocolatey https://chocolatey.org/.

#> 
[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True, Position=1)]
    [string]$Name
)

try{
    choco install $Name
}
catch{    
    $install = 'n'
    while(!('y','n' -contains ($install = $(Read-Host "To install $Name this script requires chocolatey which is not found, would you like to install it ?([Y]es/[N]o)")))){}
    if('y' -eq $install){
        Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
}