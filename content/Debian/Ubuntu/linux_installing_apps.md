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

For each category, I have been ranking in the top the **Free Open Source Software Apps**some propietary popular apps, like vscode, are also included. 


{{< expandable label="Expand the list of App you can install" level="2" >}}

<script src="https://gist.github.com/JAlcocerT/197667ec5ec0da53e78eb58c4253a73f#file-z_backups-sh"></script>

{{< /expandable >}}  


{{< expandable label="Design" level="2" >}}

<script src="https://gist.github.com/JAlcocerT/197667ec5ec0da53e78eb58c4253a73f#file-z_design-sh"></script>


{{< /expandable >}}  


{{< expandable label="IoT" level="2" >}}

<script src="https://gist.github.com/JAlcocerT/197667ec5ec0da53e78eb58c4253a73f#file-z_iot-sh"></script>


{{< /expandable >}}  

{{< expandable label="Media" level="2" >}}

<script src="https://gist.github.com/JAlcocerT/197667ec5ec0da53e78eb58c4253a73f#file-z_media-sh"></script>


{{< /expandable >}}  


{{< expandable label="Privacy" level="2" >}}

<script src="https://gist.github.com/JAlcocerT/197667ec5ec0da53e78eb58c4253a73f#file-z_privacy-sh"></script>


{{< /expandable >}}  


{{< expandable label="Productivity" level="2" >}}

<script src="https://gist.github.com/JAlcocerT/197667ec5ec0da53e78eb58c4253a73f#file-z_productivty-sh"></script>


{{< /expandable >}}  




{{< expandable label="Programming" level="2" >}}

<script src="https://gist.github.com/JAlcocerT/197667ec5ec0da53e78eb58c4253a73f#file-z_programming-sh"></script>


{{< /expandable >}}  


{{< expandable label="Social" level="2" >}}

<script src="https://gist.github.com/JAlcocerT/197667ec5ec0da53e78eb58c4253a73f#file-z_social-sh"></script>


{{< /expandable >}}  