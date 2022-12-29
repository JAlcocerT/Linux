---
title: "VPN Setup"
date: 2022-09-28T23:20:21+01:00
draft: false
tags: ["Guides"]
---

### Tailscale
To install a home working VPN, the easiest way is to use Tailscale and pair our devices, lets install it with:


```
sudo apt-get install apt-transport-https &&
curl -fsSL https://pkgs.tailscale.com/stable/raspbian/buster.gpg | sudo apt-key add - &&
curl -fsSL https://pkgs.tailscale.com/stable/raspbian/buster.list | sudo tee /etc/apt/sources.list.d/tailscale.list &&
sudo apt-get update &&
sudo apt-get install tailscale &&
sudo tailscale up &&
tailscale ip -4 #get the ip 

#sudo tailscale logout
#sudo tailscale down
#To force all the traffic to go through the device, Port forwarding is needed:
```

```
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf &&
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf &&
sudo sysctl -p /etc/sysctl.conf &&
sudo tailscale down
```

With this final command, the PC/RPi will be an exit node:


```
sudo tailscale up --advertise-exit-node
```
Remember to allow as admin in the tailscale network this machine as exit node as well. In review route settings -> use as exit node.

