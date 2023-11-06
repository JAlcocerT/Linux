---
title: Ansible
type: docs
prev: /
next: docs/folder/
---

Ansible is an **automation tool** that simplifies the management and configuration of servers, applications, and infrastructure. 

# Why Ansible?

It allows you to define tasks in plain text, automate repetitive operations, and ensure consistent system configurations across your network.

**An Automation tool?**

> Imagine having a magical assistant that can perform complex tasks for you without breaking a sweat. You simply describe what you want, and this assistant takes care of the rest, ensuring your systems are always in tip-top shape. That's the power of automation, and Ansible is your digital assistant.

## Installing Ansible

```sh
#sudo apt update
#sudo apt upgrade
sudo apt install ansible

#sudo pacman -Syu
#sudo pacman -S ansible
```

Check the version with:

```sh
ansible --version
```

## Using Ansible

Installing your favourite Apps without effort. I have created some playbooks to install popular apps at: <https://github.com/JAlcocerT/Linux/tree/main/Ansible>