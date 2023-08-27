---
date: "2022-06-26T18:27:58+01:00"
title: "The package Manager: NIX"
---

# Nix Package Manager

**Nix package manager** is a powerful and flexible package manager for Linux and other Unix-like operating systems. It is known for its declarative approach to package management, which allows users to specify the desired state of their system and have the package manager handle the installation and management of dependencies.


## Installing NIX

Manage your system dependencies in a more declarative and efficient way. Let's get started with Nix installation **on Debian**, you can follow these steps:


{{< sh >}}
curl -L https://nixos.org/nix/install | sh
#sudo bash ./nix-*-multi-user.sh
{{< /sh >}}

And **on Arch**:

{{< sh >}}
sudo pacman -S base-devel
sudo pacman -S yay
yay -S nix
{{< /sh >}}



Activate Nix **common steps again,** by adding the following lines to your shell profile (e.g., ~/.bashrc):

{{< sh >}} 
. /etc/profile.d/nix.sh
#. /home/orangepi/.nix-profile/etc/profile.d/nix.sh
{{< /sh >}}


Reload your shell profile:

{{< sh >}} 
source ~/.bashrc
{{< /sh >}}

## Using NIX

Once Nix is installed, you can use it to install packages by running the nix-env command. For example, to install the git package, you can run:

{{< sh >}} 
nix-env -i git
{{< /sh >}}


## Finding Packages 

* NIX Site

You can start by looking at <https://search.nixos.org/packages>

* Locally

You can use the nix-env command to search for packages on your local system. For example, to search for packages related to the python programming language, you can run:

{{< sh >}} 
nix-env -qa python
{{< /sh >}}
