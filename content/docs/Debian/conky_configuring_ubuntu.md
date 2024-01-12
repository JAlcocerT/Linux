---
title: Conky
type: docs
prev: docs/Debian/
---

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