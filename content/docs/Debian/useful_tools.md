---
title: Useful Tools for Linux
type: docs
prev: docs/Debian/
---


## Useful Tools

### System Info

* Info about Hardware, Network, OS (Kernel...), even benchmarks

```sh
sudo apt-get install hardinfo
```
* For Benchmarks (Cross-Platform, Free at this moment, but not Open Source)

```sh
curl -O https://cdn.geekbench.com/Geekbench-6.2.2-Linux.tar.gz  #https://www.geekbench.com/download/linux/ 
tar -xzf Geekbench-6.2.2-Linux.tar.gz
cd Geekbench-6.2.2-Linux
./geekbench_x86_64
```

You will get something like: <https://browser.geekbench.com/v6/cpu/your_id_number> which will tell you single core and multi core scores. *I got ~1100 and ~3300 with a laptop*

* Terminal Based:

```sh
sudo apt install neofetch
#neofetch
```

* For Open Source: https://github.com/akopytov/sysbench


```sh
curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | sudo bash
sudo apt -y install sysbench
```

### Hardware Monitor

#### CPU Freq

Adjusting CPU Freq in Laptops with [AUto-CPUFreq](https://github.com/AdnanHodzic/auto-cpufreq#auto-cpufreq-installer):

```sh
#sudo snap install auto-cpufreq
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
```

#### Mission Center

A Windows like Task Manager for Linux.

```sh
flatpak install flathub io.missioncenter.MissionCenter
```

#### System Monitor

```sh
sudo apt-get install htop

#htop
```

### Network Monitor

#### Net Tools

```sh
sudo apt install net-tools -y
```

Get your public ip:

```sh
curl ifconfig.me
```

Get your local ip:

```sh
ip address
#ip a
```

#### Testing DNS

```sh
sudo apt install dnsutils

#example
#nslookup google.com
#ping google.com
```

Worth to have a look: https://weberblog.net/benchmarking-dns-namebench-dnseval/


```sh
cat /etc/resolv.conf
```

You can see the DNS of each Network in your PC with:

```sh
resolvectl status #see which one you want to change, ex: enp2s0
#resolvectl dns enp2s0 9.9.9.9 149.112.112.112
#resolvectl status enp2s0
```

> [Quad9](https://quad9.net/service/service-addresses-and-features/) is a good start point

## General Ubuntu

### Crontab Tasks

Open crontab:


```sh
crontab -e
```
Update it every midnight and every restart:


```sh
0 0 * * * sudo apt update && sudo apt upgrade
@reboot sudo apt update && sudo apt upgrade
```

If your script isn’t executing, check the system log for cron events: grep cron /var/log/syslog

If you’d wish to view your scheduled tasks without editing you can use the command:


```sh
crontab -l 
```

### Example - Install GIT and sync your repositories

```sh
sudo apt install git &&
 git clone https://github.com/jalcocert/RPi.git &&
 cd RPi &&
 git pull #to make sure its up to date (a cron task could be scheduled)
 ```

If you want to add a cron task for this, simply edit, as explained:


```sh
0 0 * * * cd RPi && git pull
@reboot cd RPi && git pull
```

### Create users

```sh
#simple:
useradd pruebecita
#with sudo rights:
useradd -g users -G sudo -s /bin/bash -m -c "Your name" user_desired_name
#without sudo rights:
useradd -g user -s /bin/bash -m -c "Your name" user_desired_name
```

To make the home folders only visible but the specific users, just do:


```sh
chmod -R go-rwx /home/user_name_1
chmod -R go-rwx /home/user_name_2
chmod -R go-rwx /home/user_name_3
```

### Create your own mount points

Lets first check the storages connected to the machine and identify their current path:


```sh
sudo fdisk -l
```

With this information we can create an automount entry in fstab:


```sh
sudo mkdir /mnt/data_mounted \
mount /dev/sdb1 /mnt/data_mounted/ #example
```

Depending on the file system, this might be needed:


```sh
mount -t ntfs /dev/sdb1 /mnt/data_mounted
```

If we know the UUID of the device, we can simply:


```sh
sudo mount UUID=92C269FAC269E2C9 /mnt/data_mounted
```

To do it automatically for a specific external device that we would have we need to find the UUID (Universal Unique Identifier) of the particular drive:

Option 1:


```sh
sudo blkid | grep /dev/sda2 | grep UUID= #example
```

Check what is mounted and where with:


```sh
df -h
```

lets add the automount entry in:


```sh
sudo nano /etc/fstab
#UUID=14D82C19D82BF81E_example /mnt/data_mounted    auto nosuid,nodev,nofail,x-gvfs-show 0 0
```
Then we have to simply execute to mount as per our guidelines:


```sh
sudo mount -a
```

Always remember to unmount your external storeges safely with:


```sh
sudo umount /my_volume
```

Option 2: Another option would be to set a cron task with:


```sh
@reboot mount /dev/sdb1 /mnt/data_mounted/ #example
```

### Create Custom Aliases

Lets edit this file:


```sh
nano ~/.bash_aliases
```

Add this line to know your public ip address by typing myip on the terminal:


```sh
alias myip='curl ipinfo.io/ip' #public ip address
```

Use this command to be able to use the new alias already in the current session


```sh
source ~/.bashrc
```

<!-- Personally, I have a file saved with all my alias ready right here, which i simply have to download and my favourite alias will be set in any server with this simple command:


```
tbd
``` -->

TMUX:

```sh
apt install tmux
#tmux #CTRL+B CTRL+D to detacht and CTRL+A to attach again
```

https://tmuxcheatsheet.com/

* Cleaning the System with UI: clean cache, monitor processes, snap packages installed, apt repositories...

```sh
sudo add-apt-repository ppa:oguzhaninan/stacer
sudo apt-get update
sudo apt-get install stacer
#stacer
```

---

## FAQ

### Must know CLI

```sh
systemctl suspend
```

### Mac in Linux?

```sh
#https://snapcraft.io/install/sosumi/ubuntu
sudo snap install sosumi

#CTRL+ALT+G #to get out of the VM


#sudo snap remove sosumi
```

Interested in [VMs? Check this out](https://jalcocert.github.io/Linux/docs/debian/virtualization/#how-to-virtualize).

### What's taking that much disk space?

```sh
du -h --max-depth=1 ~/ | sort -rh

#sudo apt-get install ncdu
#ncdu /
```

### How to Clone a SSD?

{{% details title="Clone your drives with Clonezilla" closed="true" %}}

Save and restores only used blocks in a hard drive [with Clonezilla](https://github.com/stevenshiau/clonezilla) 

```sh
apt update
apt install clonezilla
```

You can also download the ISO, boot clonezilla from usb and select: [device to device](https://www.youtube.com/watch?v=34MT6frNp5w) 

Be carefull with the options you choose (source device, destination...)

{{% /details %}}