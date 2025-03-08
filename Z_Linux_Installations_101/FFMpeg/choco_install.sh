# Install Chocolatey (Run as Administrator)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest -UseBasicParsing 'https://community.chocolatey.org/install.ps1' | Invoke-Expression

# Verify Chocolatey Installation
choco --version

# Install FFmpeg (Run as Administrator)
choco install ffmpeg -y
#choco install chocolateygui #optionally, install a UI to install other packages with GUI

# Verify FFmpeg Installation
ffmpeg -version #I got the version 7.1-essentials_build