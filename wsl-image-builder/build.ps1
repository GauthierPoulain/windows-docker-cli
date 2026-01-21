$BuildName   = "docker-lite"         
$FinalTar    = ".\wsl-docker-lite.tar"
$UbuntuUrl   = "https://cdimage.ubuntu.com/ubuntu-base/releases/24.04/release/ubuntu-base-24.04.3-base-amd64.tar.gz"
$BaseTar     = "C:\Temp\ubuntu-base.tar.gz"
$NewUser     = "dockeradmin"
$NewPass     = "dockerpass"            

$BuildDir = "C:\Temp\build-wsl-docker-lite"

if (!(Test-Path $BuildDir)) {
    Write-Host "Creating temporary build directory..."
    New-Item -ItemType Directory -Force -Path $BuildDir | Out-Null
}

if (!(Test-Path $BaseTar)) {
    Write-Host "Downloading base image..."
    Invoke-WebRequest -Uri $UbuntuUrl -OutFile $BaseTar
}

Write-Host "Setup build environment..."
wsl --import $BuildName $BuildDir $BaseTar

$SetupScript = Get-Content -Raw -Path ".\setup.sh"
$SetupScript = $SetupScript -replace "<NEW_USER>", $NewUser
$SetupScript = $SetupScript -replace "<NEW_PASS>", $NewPass

Write-Host "Installing packages..."
wsl -d $BuildName -u root -- bash -c "$SetupScript"

Write-Host "Exporting final image..."
wsl --export $BuildName $FinalTar

Write-Host "Cleaning up..."
wsl --unregister $BuildName

if (Test-Path $BuildDir) {
    Write-Host "Removing temporary build directory..."
    Remove-Item $BuildDir -Recurse -Force
}


Write-Host "Image created: $FinalTar"
