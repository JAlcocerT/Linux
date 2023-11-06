---
title: Trying Arch - Garuda Linux
type: docs
prev: docs/Debian/
---

## Garuda Linux

Garuda Linux is a rolling-release, Arch Linux-based distribution that boasts a user-friendly approach, a focus on performance, and a visually striking desktop experience, catering to both newcomers and experienced Linux users.

A rolling release is a software distribution model where updates and new features are continuously rolled out to users as soon as they're ready, eliminating the need for major version upgrades. This means that you always have the latest software versions and improvements without needing to reinstall the entire operating system.

In comparison, Debian-based distributions, like Ubuntu, follow a more traditional release model. They have fixed release cycles (e.g., every 6 months or every 2 years) where a new version is created, tested, and released as a complete package. Users then upgrade to the new version by performing an upgrade process.

## Advantages of a rolling release

- **Continuous Updates:** You're always running the latest software versions without waiting for a new release.
- **Less Disruption:** No need to perform major version upgrades, which can sometimes require a lot of time and effort.
- **Access to New Features:** You can access new features and improvements as soon as they're available.

## Advantages of a fixed release 

Like Debian-based distributions:
- **Stability:** Software updates are thoroughly tested before being released, which can lead to a more stable experience.
- **Predictability:** You know when major releases will occur, allowing for better planning.
- **Long-term Support:** Some fixed-release distributions offer long-term support (LTS) versions, which receive updates and security patches for an extended period.

Fixed releases prioritize stability and ease of maintenance but might not have the latest features as soon as they're released.

Garuda Linux, being a rolling-release distribution, continually delivers the latest software to users, providing them with the cutting-edge experience.


## Pacman - Garuda Package Manager

Garuda Linux uses the Arch Linux package manager, which is called "Pacman." Pacman is a powerful command-line package manager that handles software installation, upgrades, removals, and dependency resolution. 

Additionally, Garuda Linux also provides a graphical package manager called "Pamac" for those who prefer a user-friendly interface.



Update repos with:

```sh
sudo pacman -Syu
```


And install packages with:

```sh
sudo pacman -S firefox
```

### Useful Repositories


* Arch User Repository (AUR)

The AUR is a community-driven repository that contains a wide range of software packages not available in the official Arch Linux repositories. Garuda Linux users can also benefit from the AUR.

AUR Website: <https://aur.archlinux.org/>


* Arch Linux Package Search

The official Arch Linux website provides a package search tool that lets you search for packages available in the official repositories.

Arch Linux Package Search: <https://archlinux.org/packages/>


When you visit these websites, you can use the search functionality to look for packages by name. 

The AUR website is particularly useful for finding user-contributed packages that may not be in the official repositories. Once you find a package you want to install, you can note its name and use it with the pacman or yay command in the terminal, or search for it in the Pamac graphical package manager.

Remember that when installing packages from the AUR, you should follow the AUR guidelines and consider using an AUR helper like yay for better package management and dependency handling.