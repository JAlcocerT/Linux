---
title: "Secure your Linux"
date: 2022-10-28T23:20:21+01:00
draft: false
tags: ["Guides"]
---



### Setup fail2ban

```sh
#fail2ban
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg2 \
vim \
fail2ban \
ntfs-3g
```

Then:


```
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local && #copying it to edit
sudo nano /etc/fail2ban/jail.local
```

Add this to the file to ban for 24h if retry +3 times:


```
bantime = 86400
port    = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s
maxretry = 3
```

```
sudo service fail2ban restart &&
sudo nano /var/log/fail2ban.log
```

### Create SSH keys

This will make possible to log in to your linux server without typing a password when both computers have the same key files.

In combination with fail2ban described before, it makes the brutte-force attacks to loose sense with your server.

### Firewall setup (ufw)

sudo ss -tupln #ports in use


```
sudo apt install ufw && #ufw
sudo ufw status &&
sudo ufw allow 22 && #allow ssh
sudo ufw enable &&
sudo ufw status &&
sudo ufw reload #restart it
sudo ufw allow 717 #example to allow conexion
```

Typical ports that are used: 22 for ssh, 443 for https, 80 for http.

### Check devices in local network

```
sudo apt install nast nmap \
sudo nast -m
```

or


```
nmap -sP 192.168.1.0/24 | grep "scan"
```