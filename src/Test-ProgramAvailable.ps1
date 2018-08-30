
<#PSScriptInfo

.VERSION 1.0

.GUID 221c8c7a-d278-4112-b501-f3b043346819

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
 Returns true if a program is available from the command line 

#> 
[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True, Position=1)]
    [string]$ProgramName
)

try{
    $_ = . $ProgramName
    return $true
}
catch{
    return $false
}
