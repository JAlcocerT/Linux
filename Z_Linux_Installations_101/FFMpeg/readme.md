Have been playing around with video at:

1. https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/
2. https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/#video-workflow
3. https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#video-editing-101
4. https://jalcocert.github.io/JAlcocerT/dji-osmo-action-5-pro/

## FFMPEG

Once you got **ffmpeg installed...**

### FFMPEG and Linux

```sh
sudo apt install ffmpeg
#rsync -avP *.MP4 /home/jalcocert/Desktop/oa5pro/ #it creates the folder if its not there | no overwrite
#rsync -avP *.MP4 /media/jalcocert/Backup2TB/DJI-OA5Pro #copy it to an external SSD
rsync -avP --include='*.MP4' --exclude='*' /media/jalcocert/OsmoAction/DCIM/DJI_001/ ~/Desktop/CAM/

#rm *.LRF #clean if needed LRF

./Video_ffmpeg.sh
```

### FFMPEG with Windows

See `./Win` or this [gist](https://gist.github.com/JAlcocerT/76f22ddf886277ef2653f82898c634d8)

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