---
title: VMs
type: docs
prev: docs/Debian/
draft: false
---

## Why Virtualization?

* Save Resources: Virtualization helps use computer servers more efficiently. Instead of having one computer server for each task, you can have multiple tasks running on one server. This saves money on buying lots of servers and uses less electricity.

* Stay Safe: Virtualization makes it safer to run different programs or tasks on the same computer. If one program has a problem, it won't affect the others. This is important for keeping your computer secure.

* Be Flexible: Virtualization allows you to change your computer setup quickly. You can add new programs or make your computer bigger or smaller without buying new physical parts. It's like rearranging furniture in a room to fit your needs.

## How to Virtualize?

We can run an OS inside our main OS from Windows, mac or Linux. This guide will show you how to do it from a Debian distro as main OS.

### Pre-Requisites

Do we have Hardware Virtualization Available?

```sh
egrep -c '(vmx|svm)' /proc/cpuinfo #if >0 we have hardware virtualization
```

Can KVM acceleration be used in our hardware?

```sh
apt install cpu-checker
kvm-ok
```

You might need to enable it in the BIOS.

### Installing QEMU-KVM

You are right, we are ~~not going to use VirtualBox nor VMWare~~, but QEMU.

QEMU-KVM (Kernel-based Virtual Machine) is a virtualization technology for Linux-based systems that allows you to run virtual machines on a host system. It combines the **QEMU emulator with the KVM kernel module** to provide efficient and **high-performance virtualization capabilities**.

```sh
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon
```

```sh
#sudo systemctl status libvirtd
sudo systemctl enable --now libvirtd
```

#### A GUI for our VMs

```sh
#sudo systemctl status libvirtd
sudo apt install virt-manager
```

{{< callout type="info" >}}
You can always get out of the VM by using: **CTRL+ALT+G**
{{< /callout >}}

#### Using QEMU

You will need to create a Virtual Disk if you want to store data in the VM - By default it will be at:
/var/lib/libvirt/images/the_name_you_want.qcow2

<https://www.youtube.com/watch?v=VC9Kk7Ao944>


## FAQ

### I heard it is possible to run MacOS in Linux, is it True?

Yes, you can quickly try MacOS [thanks to](#https://snapcraft.io/install/sosumi/ubuntu):

```sh
sudo snap install sosumi
#sosumi

#CTRL+ALT+G
```