---
title: "Regular Apps Installation"
date: 2022-10-30T23:20:21+01:00
draft: false
tags: ["Guides","Docker"] 
---

### Regular Apps installations

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

{{< expandable label="Expand the list of App you can install" level="2" >}}

For each category, I have been ranking in the top the **Free Open Source Software Apps**, but as you might be interested in using propietary popular apps, like chrome or vscode, they are also included. 

* General:
   * Synaptic  
   * PPA GUI Manager 
   * Snap store 
   * Docker ---> :fire: **BONUS** :rocket: Extra apps can be installed easily - [Apps list and config files](https://github.com/JAlcocerT/Docker). You can also check [my blog for specific self-hosting guides](https://fossengineer.com/tags/self-hosting/).
    
* Media:
    * VLC 
    * Spotify
    
* Browsers:
    * Brave 
    * Librewolf 
    * Chrome
    
* Design
    * Blender 
    * FreeCad 
    * OpenSCad 
    * GIMP 
    * Photoscape 
    * Kazam 
    * Cura
    * Inkscapee
    * KiCad
    * Audacity
    
* Programming:
   * Octave 
   * VSCode
   * Flutter
   * Android Studio
   * RStudio 
   * GH Desktop 
   * Slack
   
* Gaming:
    * WINE 
    * Lutris 
    * Steam
    * Epic Games
    * Origin
    
* BackUps:
   * NextCloud 
   * Syncthing  
   * Timeshift 
   * Dropbox
   * MegaSync
   * Synkron
   * Grsync
   
* Others:
   * VBOX
   * VMWare
   * VNC Server 
   * GUFW 
   * VPN 
     * Tailscale 
     * Wireguard Client
   * UnetBootin 

 {{< /expandable >}}  