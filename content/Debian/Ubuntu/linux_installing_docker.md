---
title: "Docker 101"
date: 2022-08-28T23:20:21+01:00
draft: false
tags: ["Guides","Docker"]
---

## Docker

Docker is a platform that allows developers to create, deploy, and run applications in containers. These containers are lightweight and self-contained, which makes them easy to manage and deploy across different environments.

Consider it as a powerful tool that can help developers streamline the application development and deployment process, while also providing a range of benefits in terms of portability, consistency, efficiency, and isolation. For you, this means that when a service/app runs in one computer, it will behave in the same way in any other device.

To install docker, docker compose and portainer, simply copy the following [code chunks](https://github.com/JAlcocerT/Docker/blob/main/1%20Docker%20%26%20%20Docker%20compose%20%26%20Portainer) in your terminal:

{{< expandable label="How can I test that it works?" level="2" >}}


{{< cmd >}}
sudo systemctl status docker 
{{< /cmd >}}

### Docker-Compose

Test it with:

```
docker-compose --version
```

### Portainer

Not really confortable with the command line yet? No worries, once Docker is installed, you can use [portainer to ~~install~~ deploy your Apps](https://fossengineer.com/selfhosting-portainer-docker/).

```
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```


 {{< /expandable >}}  