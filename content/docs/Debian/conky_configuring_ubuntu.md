---
title: Conky
type: docs
prev: docs/Debian/
---


## How to Customize Ubuntu GNOME

We all want to make our Desktop look nice and confortable for our use.

Lets see how to customize your Ubuntu Desktop with [Conky](https://github.com/brndnmtthws/conky).

## Pre-Requisites

First, you will need gnome tweaks:

```sh
sudo apt install gnome-tweaks

sudo apt-get install chrome-gnome-shell
  
sudo apt install conky-all curl jq
  
#copy conky files to ~/.config/conky
  
cp ~/Downloads/conky_config/Graffias ~/.config/conky -r
sudo mkdir ~/.config/autostart
cp ~/Downloads/conky_config/start_conky.desktop ~/.config/autostart/start_conky.desktop -r
```

## Setup Conky

Then, download conky manager:

```sh
sudo apt-get install conky-all curl
sudo apt update
conky --version

wget --no-check-certificate https://github.com/teejee2008/conky-manager/releases/download/v2.4/conky-manager-v2.4-amd64.run

sudo chmod +x conky-manager-v2.4-amd64.run
ls -l
sudo ./conky-manager-v2.4-amd64.run -y

sudo apt install conky p7zip imagemagick rsync
```

## Using Conky

{{< filetree/container >}}
  {{< filetree/folder name="content" >}}
    {{< filetree/file name="_index.md" >}}
    {{< filetree/folder name="docs" state="closed" >}}
      {{< filetree/file name="_index.md" >}}
      {{< filetree/file name="introduction.md" >}}
      {{< filetree/file name="introduction.fr.md" >}}
    {{< /filetree/folder >}}
  {{< /filetree/folder >}}
  {{< filetree/file name="hugo.toml" >}}
{{< /filetree/container >}}


--- 

## FAQ


### Cool GNOME Shell Extension


GNOME developers improved the Quick Settings menu in GNOME 44 to make connecting to previously-paired Bluetooth devices faster, but battery levels for connected devices, like mice, keyboards, headphones, game controllers, etc, aren’t displayed.


```txt
sudo apt install gnome-tweaks
sudo apt-get install chrome-gnome-shell

sudo apt install conky-all curl jq

#copy conky files to ~/.config/conky
cp ~/Downloads/conky_config/Graffias ~/.config/conky -r
sudo mkdir ~/.config/autostart
cp ~/Downloads/conky_config/start_conky.desktop ~/.config/autostart/start_conky.desktop -r




sudo apt-get install conky-all curl
sudo apt update
conky --version

wget --no-check-certificate https://github.com/teejee2008/conky-manager/releases/download/v2.4/conky-manager-v2.4-amd64.run

sudo chmod +x conky-manager-v2.4-amd64.run
ls -l
sudo ./conky-manager-v2.4-amd64.run -y

sudo apt install conky p7zip imagemagick rsync

#https://openweathermap.org/city/756135
## add Graffias to ~/.conky 
#modify the city in /.config/conky/Graffias/scripts/weather.sh
```

### How to tweak KDE Plasma

* Install Kvantum Manager
* Download KDE Themes from: https://store.kde.org/browse?cat=123&ord=latest

* Inspiration:
  * https://www.youtube.com/watch?v=NkmFS3u4sBA
  * https://www.youtube.com/watch?v=sTAE76k8x3g


#### GTK Themes

GTK themes are a way to customize the appearance of applications that use the GTK toolkit. GTK (GIMP Toolkit) is a widely used open-source toolkit for creating graphical user interfaces. It's especially popular in the Linux world, where it's used by many desktop environments and applications, such as GNOME, XFCE, and others.