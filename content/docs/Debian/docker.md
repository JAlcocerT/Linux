---
title: Docker 101
type: docs
prev: docs/Debian/
---

## Docker

Docker is a platform that allows developers to create, deploy, and run applications in containers. These containers are lightweight and self-contained, which makes them easy to manage and deploy across different environments.

Consider it as a powerful tool that can help developers **streamline the application development and deployment process**, while also providing a range of benefits in terms of **portability, consistency, efficiency, and isolation**. For you, this means that when a service/app runs in one computer, it will behave in the same way in any other device.

To install docker, docker compose and portainer, simply copy the following code chunks:

```sh
sudo apt-get update && sudo apt-get upgrade && curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh && sudo docker --version
sudo apt install docker-compose -y
```

This might not be the [latest version of docker-compose](https://jalcocert.github.io/Linux/docs/debian/docker/#how-to-install-the-latest-version-of-docker-compose), but it will work.

Testing that Docker works with:

```sh
sudo systemctl status docker
``` 

And check the installed versions with:

```sh
docker --version
docker-compose --version
```

### Portainer - GUI for Containers

Not really confortable with the command line yet? 

No worries, once Docker is installed, you can use a GUI, thanks to [Portainer to ~~install~~ *deploy* your Apps](https://fossengineer.com/selfhosting-portainer-docker/).

```sh
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```

### Dockge - A Great Container GUI

Today, I discovered another great project to manage our containers via GUI: **[Dockge](https://github.com/louislam/dockge)**

To use it we just need:

```sh
# Create directories that store your stacks and stores Dockge's stack
mkdir -p /opt/stacks /opt/dockge
cd /opt/dockge

# Download the compose.yaml
curl https://raw.githubusercontent.com/louislam/dockge/master/compose.yaml --output compose.yaml
#curl https://raw.githubusercontent.com/louislam/dockge/master/compose.yaml --output docker-compose.yaml

# Start the server
docker compose up -d

# If you are using docker-compose V1 or Podman
# docker-compose up -d #change version to 2.2 if error
```

And that's it, Dockge is waiting for us on: localhost:5001

![Docke-GUI](/images/dockge-gui.png)



## FAQ

### How to install the latest version of Docker-Compose?


{{% details title="Get the Latest Docker-Compose" closed="true" %}}


Visit their Github Repo: <https://github.com/docker/compose/tags>

And execute the code below with the desired version (example v2.23.0):

```sh
#sudo rm /usr/local/bin/docker-compose #if you installed other version before
sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```


{{% /details %}}