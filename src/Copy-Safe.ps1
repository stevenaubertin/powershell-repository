function Copy-Safe{
    param(
        [Parameter(Mandatory=$true)][string]$Source, 
        [Parameter(Mandatory=$true)][string]$Destination, 
        [bool]$CheckHash=$true, 
        [switch]$Force
    )

    # Basic check
    if(!(Test-Path $Source)) { Write-Error "Source file $Source doesn't exists" }
    if(Test-Path $Destination) { Write-Error "Destination file $Destination already exists" }
    
    # Create file info
    $s = New-Object System.IO.FileInfo -ArgumentList $Source

    # Get hash for file
    if($CheckHash){
        $sHash = Get-FileHash -Algorithm MD5 $Source
    }

    # Setup parameters
    $params = @{
        'Path'= $Source;
        'Destination'=$Destination;
    }
    if ($Force){
        $params.Add('Force', $true)
    }
    if ($Verbose){
        $params.Add('Verbose', $true)
    }

    Copy-Item @params

    if ($CheckHash){
        $dHash = Get-FileHash -Algorithm MD5 $Destination
        if ($sHash.Hash -ne $dHash.Hash){
            Write-Error "Hash from source '$Source' differ from the destionation '$Destination'"
        }
    }
}

Set-Alias safecopy Copy-Safe
Export-ModuleMember -Function Copy-Safe -Alias safecopy
