---
title: "Customizing your Ubuntu desktop with Conky"
date: 2023-04-15T10:20:21+01:00
draft: false
tags: ["Guides"]
---

First, you will need gnome tweaks:

{{< cmd >}} 
sudo apt install gnome-tweaks
sudo apt-get install chrome-gnome-shell

sudo apt install conky-all curl jq

#copy conky files to ~/.config/conky
cp ~/Downloads/conky_config/Graffias ~/.config/conky -r
sudo mkdir ~/.config/autostart
cp ~/Downloads/conky_config/start_conky.desktop ~/.config/autostart/start_conky.desktop -r
{{< /cmd >}}

Then, download conky manager:

{{< cmd >}} 
sudo apt-get install conky-all curl
sudo apt update
conky --version

wget --no-check-certificate https://github.com/teejee2008/conky-manager/releases/download/v2.4/conky-manager-v2.4-amd64.run

sudo chmod +x conky-manager-v2.4-amd64.run
ls -l
sudo ./conky-manager-v2.4-amd64.run -y

sudo apt install conky p7zip imagemagick rsync
{{< /cmd >}}