---
title: Chocolatey
type: docs
prev: docs/first-page
next: docs/Debian/docker
sidebar:
  open: false
---


## Chocolatey What?

Ok - this is suposed to be Linux related only, but I discovered about this and if there is some Windows user reading this, probably will be wondering if formating and setup a Windows machine from scratch has to be so painful.

**Chocolatey is a package manager** for Windows that enables users to **easily install**, manage, and update software applications from the command line or through a graphical interface.

**Package WHAT?**

> When you want new tools or games, instead of roaming the internet, you tell the package manager what you desire. This *shopkeeper* knows where to find them, handles all the downloading and setup, and even keeps them updated so you don't have to worry about dusty shelves. 

## Installing Chocolatey 🚀

Get Chocolatey ready and forget about being afraid to format C your Windows ever again.

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

You can use it with Graphical User Interface:

```sh
choco install chocolateygui
#chocolateygui
```

### Using Chocolatey

Navigate to **<https://community.chocolatey.org/packages>** and look for the packages that you are interested:

```sh
# Check if Chocolatey is installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install Chrome
Write-Host "Installing Google Chrome..."
choco install googlechrome -y

# Install Steam
Write-Host "Installing Steam..."
choco install steam -y

# Install Visual Studio Code
Write-Host "Installing Visual Studio Code..."
choco install vscode -y

Write-Host "Installation completed."
```

Create a list like this one with your favourite Apps , then use it from the powershell.

> The logic here is Work Smart. Do once, re-use forever ♻️

<script src="https://gist.github.com/JAlcocerT/76f22ddf886277ef2653f82898c634d8"></script>

{{< gist "JAlcocerT/76f22ddf886277ef2653f82898c634d8" >}}