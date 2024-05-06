# Get the network adapter named "Ethernet"
$adapter = Get-NetAdapter -Name "Ethernet"

# Check if the adapter exists
if ($adapter) {
    # Check if the adapter supports Wake-on-MagicPacket
    if ($adapter.WakeOnMagicPacket -eq 'Enabled') {
        Write-Output "Wake-on-MagicPacket is active for $($adapter.Name)."
    } else {
        Write-Output "Wake-on-MagicPacket is not active for $($adapter.Name)."
    }
} else {
    Write-Output "Ethernet adapter not found."
}

# Retrieve the current power options for the active power plan
$powerOptions = powercfg /query

# Output the power options
Write-Output "Power options for the active power plan:"
Write-Output $powerOptions
