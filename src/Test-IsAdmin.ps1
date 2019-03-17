
<#PSScriptInfo

.VERSION 1.0

.GUID 07e3c447-c26b-4aba-a053-ca8212766bd7

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
 A script that test whether the current session is running elevated 

#> 
([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")


