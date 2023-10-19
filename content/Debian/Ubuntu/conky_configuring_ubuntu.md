---
title: "Customizing your Ubuntu desktop with Conky"
date: 2023-04-15T10:20:21+01:00
draft: false
tags: ["Guides"]
---

First, you will need gnome tweaks:

{{< gist "JAlcocerT/197667ec5ec0da53e78eb58c4253a73f#file-z_gnome_tweak" >}}


Then, download conky manager:

``` 
sudo apt-get install conky-all curl
sudo apt update
conky --version

wget --no-check-certificate https://github.com/teejee2008/conky-manager/releases/download/v2.4/conky-manager-v2.4-amd64.run

sudo chmod +x conky-manager-v2.4-amd64.run
ls -l
sudo ./conky-manager-v2.4-amd64.run -y

sudo apt install conky p7zip imagemagick rsync
```