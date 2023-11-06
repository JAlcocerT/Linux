---
title: Docker 101
type: docs
prev: docs/Debian/
---

## Docker

Docker is a platform that allows developers to create, deploy, and run applications in containers. These containers are lightweight and self-contained, which makes them easy to manage and deploy across different environments.

Consider it as a powerful tool that can help developers streamline the application development and deployment process, while also providing a range of benefits in terms of portability, consistency, efficiency, and isolation. For you, this means that when a service/app runs in one computer, it will behave in the same way in any other device.

To install docker, docker compose and portainer, simply copy the following [code chunks]

```sh
sudo apt-get update && sudo apt-get upgrade && curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh && sudo docker --version
sudo apt install docker-compose -y
```


{{% details title=" How can I test that Docker works?" closed="true" %}}

```sh
sudo systemctl status docker
``` 

### Docker-Compose

Test it with:

```sh
docker --version
docker-compose --version
```
{{% /details %}}

{{% details title=" How can I install Portainer?" closed="true" %}}


### Portainer

Not really confortable with the command line yet? 

No worries, once Docker is installed, you can use [portainer to ~~install~~ *deploy* your Apps](https://fossengineer.com/selfhosting-portainer-docker/).

```sh
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```


{{% /details %}}