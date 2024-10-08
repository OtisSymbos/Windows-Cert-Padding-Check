# Define the registry paths
$regPath1 = "HKLM:\Software\Microsoft\Cryptography\Wintrust\Config"
$regPath2 = "HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config"

# Define the registry key name and value
$regName = "EnableCertPaddingCheck"
$regValue = "1"

# Check if the first path exists, if not create it
if (-not (Test-Path $regPath1)) {
    New-Item -Path $regPath1 -Force | Out-Null
}

# Add or update the registry key for the first path
Set-ItemProperty -Path $regPath1 -Name $regName -Value $regValue -Force

# Check if the second path exists, if not create it
if (-not (Test-Path $regPath2)) {
    New-Item -Path $regPath2 -Force | Out-Null
}

# Add or update the registry key for the second path
Set-ItemProperty -Path $regPath2 -Name $regName -Value $regValue -Force

Write-Host "Registry keys have been successfully added or updated."
