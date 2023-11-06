---
date: "2023-08-26T17:27:58+01:00"
draft: false
title: "Chocolatey: A package manager for Windows"
---

# Chocolatey What?

Ok - this is suposed to be Linux related only, but I discovered about this and if there is some Windows user reading this, probably will be wondering if formating and setup a Windows machine from scratch has to be so painful.

**Chocolatey is a package manager** for Windows that enables users to easily install, manage, and update software applications from the command line or through a graphical interface.

**Package WHAT?**

> When you want new tools or games, instead of roaming the internet alleys, you tell the package manager what you desire. This *shopkeeper* knows where to find them, handles all the downloading and setup, and even keeps them updated so you don't have to worry about dusty shelves. 

## Installing Chocolatey

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Using Chocolatey

Navigate to **<https://community.chocolatey.org/packages>** and look for the packages that you are interested.

Create a list like this one that you will use from the powershell:

<script src="https://gist.github.com/JAlcocerT/76f22ddf886277ef2653f82898c634d8"></script>

{{< gist "JAlcocerT/76f22ddf886277ef2653f82898c634d8" >}}