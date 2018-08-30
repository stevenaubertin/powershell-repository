
<#PSScriptInfo

.VERSION 1.0

.GUID 9796d928-a7ab-42b6-a687-3729b4cd0f4e

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
 Generates script with the default parameters for this repository.

 For more information about 

#> 
[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$Path,

    [Parameter(Mandatory=$True,Position=1)]
    [string]$Description,

    [string]$Author='stevenaubertin@gmail.com',

    [string]$Version='1.0'
)

New-ScriptFileInfo -Path $Path `
                   -Description $Description `
                   -Author $Author `
                   -Version $Version `
                   -ProjectUri 'https://github.com/stevenaubertin/powershell-repository' `
                   -LicenseUri 'https://github.com/stevenaubertin/powershell-repository/blob/master/LICENSE.md' `
                   -Copyright '(c) 2018'

