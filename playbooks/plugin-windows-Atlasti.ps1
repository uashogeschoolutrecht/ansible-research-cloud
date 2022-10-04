$ProgressPreference = 'SilentlyContinue'

# $ErrorActionPreference = "Stop"
 
function DownloadAtlasti([string] $url, [string] $downloadLocation, [int] $retries)
{
    while($true)
    {
        try
        {
            Invoke-WebRequest $url -OutFile $downloadLocation
            break
        }
        catch
        {
            $exceptionMessage = $_.Exception.Message
            Write-Host "Failed to download '$url': $exceptionMessage"
            if ($retries -gt 0) {
                $retries--
                Write-Host "Waiting 10 seconds before retrying. Retries left: $retries"
                Start-Sleep -Seconds 10
 
            }
            else
            {
                $exception = $_.Exception
                throw $exception
            }
        }
    }
}

try {
    DownloadAtlasti -url "https://github.com/StefHi/Atlasti/releases/download/v22.2/Atlasti_22.2.exe" -downloadLocation ".\Atlasti_driver.exe" -retries 3
    Start-Process "Atlasti_driver.exe" -argumentlist "-s" -wait
} catch {
    Write-Host "Atlasti installation has failed with the following error: $_"
    Throw "Aborted Atlasti installation returned $_"
}
