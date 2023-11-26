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


## Package Management



### With CLI

#### APT

APT is a powerful and widely-used package management system for Debian-based Linux distributions.

It simplifies the process of managing software by automating the installation, upgrade, and removal of packages along with their dependencies. APT accesses a network of repositories to find the software you need and ensures that all dependencies are satisfied, making it much easier to maintain a system with up-to-date and functional software.

It's known for its robustness and efficiency in handling complex package management tasks.

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

You can have a look to the available packages at:

* <https://www.debian.org/distrib/packages>
* <https://packages.ubuntu.com/>


#### NALA

[Nala](https://github.com/volitank/nala) is a front-end interface for the APT package manager, designed to enhance the user experience with more readable output and simpler command structure.

It **wraps around the traditional APT commands**, offering improvements like cleaner and more informative displays, faster download speeds through parallel downloads, and a more intuitive command syntax. Nala aims to **make package management more accessible** and less daunting, especially for those who are new to using Linux and its command-line environment.

The project is great and it has a good wiki on [how to get started with Nala](https://gitlab.com/volian/nala/-/wikis/Installation):

```sh
sudo apt install git python3-apt python3-debian pandoc -y

git clone https://gitlab.com/volian/nala.git
#git clone --branch=v0.12.1 https://gitlab.com/volian/nala.git


cd nala/
```

Then just install from the clonned Gitlab repository:


```sh
sudo make install
```

Once install, you can just use:

```sh
nala update
nala upgrade 

#nala install [package name]
```


### With GUI

Use Synaptic Package Manager.


```sh
sudo apt-get install synaptic
```

apt-get is an older tool, part of the Advanced Packaging Tool (APT) suite. It's known for its stability and is heavily used in scripts and automation due to its predictable behavior.