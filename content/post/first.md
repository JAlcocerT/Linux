---
title: "Regular Apps Installation"
date: 2022-10-30T23:20:21+01:00
draft: false
tags: ["Guides"] 
---

### Regular apps installations

Ever wondered about using linux as a regular OS, but afraid of making tedious installations of all your favorite programs, even games?

Those time consuming tasks can be avoided simply with the use of the commands on this file <https://github.com/JAlcocerT/Linux/blob/main/Ubuntu_installations_bash>.

If you would like to install all the programs listed there:


Option 1:

```
wget  -cO - https://raw.githubusercontent.com/jalcocert/Linux/main/Ubuntu%20installations%20bash > apps-install-bash.sh && chmod 775 apps-install-bash.sh && sudo ./apps-install-bash.sh
```

Option 2:

If you are interested only in a partial installation of all the apps contained in the mentioned script, you can download it and delete the undesired parts before executing it with the following commands:

```
wget  -cO - https://raw.githubusercontent.com/jalcocert/Linux/main/Ubuntu%20installations%20bash > apps-install-bash.sh
```

edit the file, if desired through the command line with:

```
sudo nano apps-install-bash.sh
```

The list includes:

{{< expandable label="A section of dummy text" level="2" >}}

**FOSS ->** :heavy_check_mark:

* General:
   * Synaptic  :heavy_check_mark:
   * PPA GUI Manager :heavy_check_mark:
   * Snap store :heavy_check_mark:
   * Docker ---> :fire: **BONUS** :rocket: Extra apps can be installed easily - [Apps list and config files](https://github.com/JAlcocerT/Docker) :heavy_check_mark:
    
* Media:
    * VLC :heavy_check_mark:
    * Spotify
    
* Browsers:
    * Brave :heavy_check_mark:
    * Librewolf :heavy_check_mark:
    * Chrome
    
* Design
    * Blender :heavy_check_mark:
    * FreeCad :heavy_check_mark:
    * OpenSCad :heavy_check_mark:
    * GIMP :heavy_check_mark:
    * Photoscape :heavy_check_mark:
    * Kazam :heavy_check_mark:
    * Cura
    * Inkscapee
    * KiCad
    * Audacity
    
* Programming:
   * Octave :heavy_check_mark:
   * VSCode
   * Flutter
   * Android Studio
   * RStudio :heavy_check_mark:
   * GH Desktop :heavy_check_mark:
   * Slack
   
* Gaming:
    * WINE :heavy_check_mark:
    * Lutris :heavy_check_mark:
    * Steam
    * Epic Games
    * Origin
    
* BackUps:
   * NextCloud :heavy_check_mark:
   * Syncthing  :heavy_check_mark:
   * Timeshift :heavy_check_mark:
   * Dropbox
   * MegaSync
   * Synkron
   * Grsync
   
* Others:
   * VBOX
   * VMWare
   * VNC Server :heavy_check_mark:
   * GUFW :heavy_check_mark:
   * VPN 
     * Tailscale :heavy_check_mark:
     * Wireguard Client
   * UnetBootin :heavy_check_mark:

 {{< /expandable >}}  