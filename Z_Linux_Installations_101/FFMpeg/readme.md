Have been playing around with video at:

1. https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/
2. https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#video-workflow
3. https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#video-editing-101
4. https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/

## FFMPEG

### FFMPEG and Linux



```sh
./Video_ffmpeg.sh
```

### FFMPEG with Windows

See `./Win`

```sh
# Install Chocolatey (Run as Administrator)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest -UseBasicParsing 'https://community.chocolatey.org/install.ps1' | Invoke-Expression

# Verify Chocolatey Installation
choco --version

# Install FFmpeg (Run as Administrator)
choco install ffmpeg -y
#choco install chocolateygui #optionally, install a UI to install other packages with GUI

# Verify FFmpeg Installation
ffmpeg -version #I got the version 7.1-essentials_build
```