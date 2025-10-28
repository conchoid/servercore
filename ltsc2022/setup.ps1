$env:ChocolateyInstall = "C:\chocolatey"

$tempPath = "$env:TEMP\choco-setup"
New-Item -ItemType Directory -Path $tempPath -Force | Out-Null
Set-Location -Path $tempPath

Write-Host "Downloading Chocolatey 1.4.0..."
Invoke-WebRequest -Uri "https://www.nuget.org/api/v2/package/chocolatey/1.4.0" -OutFile "chocolatey.1.4.0.nupkg"

Rename-Item "chocolatey.1.4.0.nupkg" "chocolatey.1.4.0.zip"
Write-Host "Expanding package..."
Expand-Archive -Path "chocolatey.1.4.0.zip" -DestinationPath "choco" -Force

Write-Host "Running chocolateyInstall.ps1..."
Set-Location -Path "$tempPath\choco\tools"
.\chocolateyInstall.ps1

Write-Host "Adding C:\chocolatey\bin to PATH..."
setx /M PATH "C:\chocolatey\bin;$env:PATH"

Write-Host "`Chocolatey 1.4.0 has been installed to C:\chocolatey."

choco install git 7zip -y