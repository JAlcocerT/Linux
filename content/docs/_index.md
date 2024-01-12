---
title: Documentation
next: about
---

Welcome to the Docs! here you have an overview of what you can learn at **Linux Made Easy**.

<!-- This is a demo of the theme's documentation layout.

## Hello, World!

```go {filename="main.go"}
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
``` -->


```mermaid
graph TD;
    Linux-->Cloud;
    Cloud-->GCP/Azure/AWS;
    Linux-->IoT;
    Linux-->Debian/Arch;
    Linux-->SysEng;
    SysEng-->Dev-Ops;
    SysEng-->Ansible;
    SysEng-->Docker/Podman;
    Debian/Arch-->Gaming;
    Debian/Arch-->ProductivityApps;
```

<!-- This is what you can expect in **the Linux journey**:

```mermaid
journey
    title Your User Journey as a New Linux User Adventure
    section Heard about Linux
        Excitement for Linux: 4: You
    section Getting Started
        Install Linux: 5: You
        Confusion sets in: 2: You
        Google for help: 3: You
    section The Valley of Despair
        Encounter Terminal: 2: You
        "What is sudo?": 2: You
        Stack Overflow Deep Dive: 3: You
    section Climbing the Learning Curve
        Find Linux Made Easy! (YOU are HERE): 4: You
        First successful script: 4: You
    section Triumph!
        Customized desktop: 4: You
        Proud Linux user: 5: You
        Feeling like a hacker: 3: You        
    section Next Steps
        Dreaming in code: 5: You
        Helping others with Linux: 5: You
``` -->

## Im an Android User

Congrats, Android is also Linux - YOu are already a Linux User!

{{% details title="And you can use Android & Linux Together! 🚀" closed="true" %}}

### How to use Android from Linux?

#### KDE Connected

```sh
sudo apt update
sudo apt install kdeconnect
```

Then check devices with the UI or with CLI:

```sh
kdeconnect-cli --refresh
kdeconnect-cli --list-devices
```

You can get it from: <https://f-droid.org/packages/org.kde.kdeconnect_tp/>

Alternatively, you have GSConnect or scrcpy:

```sh
sudo apt install scrcpy
```

{{% /details %}}


## Im a Windows User (For Now)

You can start to try some Debian based Linux, like Ubuntu.

In the meantime, if you are wondering why should it be so painfull to install all your favourite Apps in Windows, you are in a good place.

Making clean install is really simple in Linux thanks to Tools like: Ansible, Docker (you can also use it) or scripts.

> Yes, you also can use **Chocolatey GUI** and avoid the scripting part.

{{% details title="You can use Scripts in Windows as well, together with Chocolatey! 🍫 " closed="true" %}}


### Chocolatey What?

Ok - this is suposed to be Linux related only, but I discovered about this and if there is some Windows user reading this, probably will be wondering if formating and setup a Windows machine from scratch has to be so painful.

**Chocolatey is a package manager** for Windows that enables users to **easily install**, manage, and update software applications from the command line or through a graphical interface.

**Package WHAT?**

When you want new tools or games, instead of roaming the internet, you tell the package manager what you desire. This *shopkeeper* knows where to find them, handles all the downloading and setup, and even keeps them updated so you don't have to worry about dusty shelves. 

### Installing Chocolatey 🚀

Get Chocolatey ready and forget about being afraid to format C your Windows ever again.

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

You can use it with Graphical User Interface:

```sh
choco install chocolateygui
#chocolateygui
```

#### Using Chocolatey

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

{{% /details %}}


--- 

## FAQ

### What it is F-DROID?

It is an alternative Google App Store, full of Open Source Android APPs.