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
    New-Item "C:\downloads" -ItemType Directory
    DownloadAtlasti -url "https://cdn.atlasti.com/win/22/Atlasti_22.2.msi" -downloadLocation "C:\downloads\Atlasti_22.2.msi" -retries 3
    DownloadAtlasti -url https://go.microsoft.com/fwlink/p/?LinkId=2124703 -downloadLocation "C:\downloads\MicrosoftEdgeWebview2Setup.exe" -retries 3
    Start-Process msiexec.exe -Wait -ArgumentList '/i C:\downloads\Atlasti_22.2.msi /qn' -Verb RunAs
    Start-process C:\downloads\MicrosoftEdgeWebview2Setup.exe -Wait -ArgumentList '/silent /install' -Verb RunAs
} catch {
    Write-Host "Atlasti installation has failed with the following error: $_"
    Throw "Aborted Atlasti installation returned $_"
}
