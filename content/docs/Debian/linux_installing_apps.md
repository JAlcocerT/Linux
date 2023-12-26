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

apt-get is an older tool, part of the Advanced Packaging Tool (APT) suite.

It's known for its stability and is heavily used in scripts and automation due to its predictable behavior.


## FAQ

### What it is a PPA?

Think of a **PPA**, or Personal Package Archive, in Ubuntu as **a special store for software**.

Ubuntu already comes with a big collection of software, like a standard store where you can find most things you need. However, sometimes you might want a specific software or a newer version of a program that the standard store doesn’t have.

This is where PPAs come in: **PPA's allows any person** to create their own repositories **to distribute software**. They are like smaller, specialized stores run by developers or Linux enthusiasts.

You can add these PPAs to your Ubuntu, and it's like getting access to an exclusive store where you can download and install these special or newer software programs.

PPAs are great for getting the latest features or programs that are not yet available in the main collection of Ubuntu software.

* Examples:
    * Graphics Drivers PPA: This PPA provides the latest graphics drivers for NVIDIA, AMD, and Intel GPUs. It's essential for gamers, graphic designers, and other users who need the latest drivers for optimal performance and features.
    * LibreOffice PPA: LibreOffice is a popular open-source office suite. This PPA offers the latest versions of LibreOffice, which can include new features and improvements not yet available in the version included with Ubuntu.

#### Ubuntu Official Repos

Every [Ubuntu version](http://archive.ubuntu.com/ubuntu/dists/) has its official set of 4 repos:

* Main – Canonical-supported free and open-source software.
* Universe – Community-maintained free and open-source software.
* Restricted – Proprietary drivers for devices.
* Multiverse – Software restricted by copyright or legal issues.

When we use APT (or [NALA](https://jalcocert.github.io/Linux/docs/debian/linux_installing_apps/#nala)), we are checking these repositories for newer version of the software.

#### How about PPA's for other Distros?

PPAs, or Personal Package Archives, are **specific to Debian and its derivatives** like Ubuntu or Linux Mint. They are not directly applicable to other Linux distributions.

However, many **other distributions have their own ways* of handling additional software repositories.

For instance, Fedora uses COPR (Cool Other Package Repo), Arch Linux has the [Arch User Repository](https://jalcocert.github.io/Linux/docs/arch/garuda/#useful-repositories) (AUR), and openSUSE has OBS (Open Build Service).

These are similar in concept to Ubuntu's PPAs in that they allow users to access software that's not in the main repositories, but they work differently and are specific to their respective distributions.

### How to use PPA's?

We just need 3 very simples steps:

* Add the PPA to your system: You need to add the PPA repository to your list of sources.

```sh
add-apt-repository ppa:name-of-ppa
#add-apt-repository ppa:libreoffice/ppa 

#sudo add-apt-repository --remove ppa:name-of-ppa
```

Replace name-of-ppa with the actual PPA's name.

* Update your package list: After adding the PPA, update your package list to include the new software from the PPA:

```sh
apt update
```

* Install the software: Finally, install the software you want from the PPA using:

```sh
apt install name-of-package
#apt-get install libreoffice

#apt-get remove name-of-package
```

Remember, **it's important to trust the PPAs you add**, as they can potentially contain unvetted or harmful software. **Only use PPAs from known and trusted sources.**

### Other ways to Install in Debian

#### UI

With the UI and double click, thanks to **.deb packages**.

.deb packages are **individual software packages** that can be installed directly on your computer, similar to installing software from a CD or a downloaded file. PPAs, on the other hand, are like online repositories that can contain multiple .deb packages. 

#### Snap

**Snap packages** are primarily associated with Canonical, the company behind Ubuntu. However, they are not limited to Ubuntu and can be used on various Linux distributions.

* Automatic Updates: Snap packages are designed to automatically update themselves in the background, ensuring that users have access to the latest versions of applications without manual intervention.

* Centralized Store: Snap packages are distributed through the [Snap Store](https://snapcraft.io/store), a centralized repository where users can find and install a wide range of software applications.

> Snap Packages together with Ubuntu are a great entry point if you are starting your Linux journey.

#### Flatpak

Flatpak is designed to be a **cross-distribution packaging format**. It aims to work on multiple Linux distributions, making it more distribution-agnostic compared to Snap packages.

* Sandboxing: Like Snap, Flatpak uses sandboxing to isolate applications from the host system, improving security and reducing potential conflicts with system libraries.

* Multiple Repositories: Flatpak supports multiple software repositories, allowing users to access applications from various sources, including the [Flathub repository](https://flathub.org/), which is a popular repository for Flatpak packages.

* Manual Updates: While Flatpak does support updates, it typically requires manual intervention or the use of package manager tools to update applications.