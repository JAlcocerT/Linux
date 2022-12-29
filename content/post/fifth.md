---
title: "Docker"
date: 2022-08-28T23:20:21+01:00
draft: false
tags: ["Guides","Docker"]
---

### Docker

To install docker, docker compose and portainer, simply copy the following [code chunks](https://github.com/JAlcocerT/Docker/blob/main/1%20Docker%20%26%20%20Docker%20compose%20%26%20Portainer) in your terminal:


Test it with:

{{< cmd >}}
sudo systemctl status docker 
{{< cmd >}}

#### Docker-Compose

Test it with:

{{< cmd >}}
docker-compose --version
{{< cmd >}}

#### Portainer

{{< cmd >}}
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
{{< cmd >}}