---
title: DevOps
type: docs
prev: /docs/gcp/
next: docs/ansible/
draft: true
---


## CI/CD

### Github CI/CD

### How to Self-Host Jenkins?

We have all been new to CI/CD at some point.

If you want to tinker with Jenkins, a great way is to [Self-Host Jenkins with Docker](https://fossengineer.com/selfhosting-jenkins-ci-cd/).

## Kubernetes

## Monitoring

### Grafana

### NetData

[SelfHost NetData with Docker](https://fossengineer.com/selfhosting-server-monitoring-with-netdata-and-docker/)

## FAQ



### How to monitor the Status of my Services?

You can get help from [Uptime Kuma with Docker](https://fossengineer.com/selfhosting-uptime-Kuma-docker/).

### Transfering Files - What it is a FTP?

FTP stands for **File Transfer Protocol**, and an FTP server is a computer or software application that runs the FTP protocol. Its primary purpose is to facilitate the transfer of files between different computers over a network, such as the internet or a local area network (LAN). 



#### Why FTPs?

In essence, FileZilla acts as **a bridge between your local computer and remote servers**, making it easy to work with files stored on those servers as if they were part of your own file system. It's a popular choice for developers, system administrators, and anyone who needs to transfer files to or from remote servers **securely and efficiently**.

* Sharing Large Files: FTP servers allow you to share really big files that are too large for email or messaging apps.
* Fast and Efficient: They make it easy for multiple people to download the same file at the same time, so you don't have to send it to each person individually.
* Access Anywhere: Your friends or family can access the files from anywhere with an internet connection. They don't have to be at your house.
* Backup and Storage: You can use an FTP server to back up important files and keep them safe in case something happens to your computer.

#### How to use FTP?

* **FileZilla** is open-source software (GPL), and it has desktop applications available for both Windows and Linux. 

FileZilla is similar to a remote folder connection. It allows you to connect to and manage files on remote servers over the internet or a network. Here's how it works:

* Connecting to Remote Servers: FileZilla allows you to connect to various types of remote servers, including FTP (File Transfer Protocol), SFTP (SSH File Transfer Protocol), FTPS (FTP Secure), and more. You provide the server's address (like a website URL or IP address), your username, and password (if required) to establish a connection.
    * http://192.168.3.200:3090/
    * user & pass

* Remote File Management: Once connected, FileZilla displays the files and directories on the remote server in one pane and your local computer's files and directories in another pane. It lets you navigate through the remote server's file system just like you would on your own computer.


```sh
apt update
apt install filezilla
```

* **FTP Servers** - Delfer / vsFTP

#### Other ways - WebDavs and SMB

* Have a look to [Nextcloud with Docker](https://jalcocert.github.io/RPi/posts/selfhosting-nextcloud/)
* [Samba Server with Docker](https://fossengineer.com/selfhosting-samba/)
    * Samba is the de facto open-source implementation of the SMB/CIFS protocol for Unix-like systems, including Linux. You can install and configure Samba on your Linux server to share files and directories with Windows and other SMB clients.