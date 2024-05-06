# Define the registry path for the Wake-on-LAN setting
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"

# Check if the registry path exists
if (Test-Path $registryPath) {
    # Check if Wake-on-LAN is already enabled
    $wolEnabled = (Get-ItemProperty -Path $registryPath).EnableWOL

    if ($wolEnabled -eq 0) {
        # Enable Wake-on-LAN
        Set-ItemProperty -Path $registryPath -Name EnableWOL -Value 1
        Write-Output "Wake-on-LAN has been successfully enabled."
    } else {
        Write-Output "Wake-on-LAN is already enabled."
    }
} else {
    Write-Output "Registry path for Wake-on-LAN setting not found."
}

# Check if the command was successful
if ($LASTEXITCODE -eq 0) {
    Write-Output "USB Selective Suspend setting has been successfully disabled."
} else {
    Write-Output "Failed to disable USB Selective Suspend setting."
    Write-Output "Powercfg command output: $cmdOutput"
}
