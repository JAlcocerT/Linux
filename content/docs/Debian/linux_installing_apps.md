---
title: Regular Apps Installation
type: docs
prev: docs/Debian/
---

## Regular Apps installations

Ever wondered about using linux as a regular OS, but afraid of making tedious installations of all your favorite programs, even games?

Those time consuming tasks can be avoided simply with the use of the commands on this file <https://github.com/JAlcocerT/Linux/blob/main/Ubuntu_installations_bash>.

If you would like to install all the programs listed there:

Option 1:

```sh
wget  -cO - https://raw.githubusercontent.com/jalcocert/Linux/main/Ubuntu%20installations%20bash > apps-install-bash.sh && chmod 775 apps-install-bash.sh && sudo ./apps-install-bash.sh
```

Option 2:

If you are interested only in a partial installation of all the apps contained in the mentioned script, you can download it and delete the undesired parts before executing it with the following commands:

```sh
wget  -cO - https://raw.githubusercontent.com/jalcocert/Linux/main/Ubuntu%20installations%20bash > apps-install-bash.sh
```

edit the file, if desired through the command line with:

```sh
sudo nano apps-install-bash.sh
```

For each category, I have been ranking in the top the **Free Open Source Software Apps**some propietary popular apps, like vscode, are also included. 

{{< gist "JAlcocerT/197667ec5ec0da53e78eb58c4253a73f" >}}

## Uninstall Apps

### With GUI

Use Synaptic Package Manager.

### With CLI

Look for packages to uninstall:

```sh
apt list --installed
```

Filter by keyword:

```sh
apt list --installed | grep proton
```

For example:
```sh
sudo apt remove protonmail-bridge
```