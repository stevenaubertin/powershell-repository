function Create-Callback{
    param(
        [Parameter(Mandatory=$true)][int]$interval,
        [Parameter(Mandatory=$true)][scriptblock]$action
    )
    $timer = [System.Timers.Timer]::new()
    $timer.Interval = $interval
    try{
        $timer.AutoReset = $false
        Register-ObjectEvent -InputObject $timer -EventName elapsed -SourceIdentifier callback -Action $action
        $timer.Start()
    }
    finally{
        $timer.Stop()
        $timer.Dispose()
        $timer = $null
        Unregister-Event callback
    }
}