---
title: "Useful Tools for Linux"
date: 2022-10-28T23:20:21+01:00
draft: false
tags: ["Guides"]  
---

## Useful Tools

### System Monitor

```
sudo apt-get install htop

#htop
```

### System Info

```
sudo apt install neofetch
#neofetch
```

### Net Tools

```
sudo apt install net-tools -y
```

Get your public ip:
```
curl ifconfig.me
```

Get your local ip:
```
ip address
#ip a
```

### Testing DNS

```
sudo apt install dnsutils

#example
#nslookup google.com
```

### Crontab tasks:

Open crontab:


```
crontab -e
```
Update it every midnight and every restart:


```
0 0 * * * sudo apt update && sudo apt upgrade
@reboot sudo apt update && sudo apt upgrade
```

If your script isn’t executing, check the system log for cron events: grep cron /var/log/syslog

If you’d wish to view your scheduled tasks without editing you can use the command:


```
crontab -l 
```

### Example - Install GIT and sync your repositories

```
sudo apt install git &&
 git clone https://github.com/jalcocert/RPi.git &&
 cd RPi &&
 git pull #to make sure its up to date (a cron task could be scheduled)
 ```

If you want to add a cron task for this, simply edit, as explained:


```
0 0 * * * cd RPi && git pull
@reboot cd RPi && git pull
```

## Create users

```
#simple:
useradd pruebecita
#with sudo rights:
useradd -g users -G sudo -s /bin/bash -m -c "Your name" user_desired_name
#without sudo rights:
useradd -g user -s /bin/bash -m -c "Your name" user_desired_name
```

To make the home folders only visible but the specific users, just do:


```
chmod -R go-rwx /home/user_name_1
chmod -R go-rwx /home/user_name_2
chmod -R go-rwx /home/user_name_3
```

## Create your own mount points

Lets first check the storages connected to the machine and identify their current path:


```
sudo fdisk -l
```

With this information we can create an automount entry in fstab:


```
sudo mkdir /mnt/data_mounted \
mount /dev/sdb1 /mnt/data_mounted/ #example
```

Depending on the file system, this might be needed:


```
mount -t ntfs /dev/sdb1 /mnt/data_mounted
```

If we know the UUID of the device, we can simply:


```
sudo mount UUID=92C269FAC269E2C9 /mnt/data_mounted
```

To do it automatically for a specific external device that we would have we need to find the UUID (Universal Unique Identifier) of the particular drive:

Option 1:


```
sudo blkid | grep /dev/sda2 | grep UUID= #example
```

Check what is mounted and where with:


```
df -h
```

lets add the automount entry in:


```
sudo nano /etc/fstab
#UUID=14D82C19D82BF81E_example /mnt/data_mounted    auto nosuid,nodev,nofail,x-gvfs-show 0 0
```
Then we have to simply execute to mount as per our guidelines:


```
sudo mount -a
```

Always remember to unmount your external storeges safely with:


```
sudo umount /my_volume
```

Option 2: Another option would be to set a cron task with:


```
@reboot mount /dev/sdb1 /mnt/data_mounted/ #example
```

## Create Custom Aliases

Lets edit this file:


```
nano ~/.bash_aliases
```

Add this line to know your public ip address by typing myip on the terminal:


```
alias myip='curl ipinfo.io/ip' #public ip address
```

Use this command to be able to use the new alias already in the current session


```
source ~/.bashrc
```

<!-- Personally, I have a file saved with all my alias ready right here, which i simply have to download and my favourite alias will be set in any server with this simple command:


```
tbd
``` -->