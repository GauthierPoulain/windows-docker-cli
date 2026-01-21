wsl --update

wsl --unregister docker-lite

./img-builder/build.ps1

wsl --import docker-lite . ./img-builder/wsl-docker-lite.tar

schtasks /create /xml .\KeepWSLDockerActive.xml /tn "KeepWSLDockerActive"  /f

$env:PATH += ";$PWD\bin"
