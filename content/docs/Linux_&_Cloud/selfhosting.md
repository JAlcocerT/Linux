---
title: SelfHosting
type: docs
prev: /docs/debian/docker/
next: docs/ansible/
draft: false
---


You can do it with a Raspberry Pi, with and old laptop, in the cloud...

But you can even do it in the very same computer you are reading this.

1. Get Docker/Podman installed
2. Get the Docker-Compose ready
3. Deploy!

{{% details title="Follow these CLI's! 🚀" closed="true" %}}

```sh
sudo apt update
sudo apt install openssh-server
#systemctl status ssh

sudo ufw allow ssh

#ssh username@<local_minipc_server_ip>
```

Check processes with:

```sh
#systemctl status
htop

#systemctl list-units --type=service
systemctl list-units --type=service --state=running
```

And the ports used:

```sh
sudo lsof -i -P -n
```

Follow the steps of this [SelfHosting-101 script](https://github.com/JAlcocerT/Linux/blob/main/Z_Linux_Installations_101/Selfhosting_101.sh):

```sh
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh
#nano Selfhosting_101.sh #MAKE SURE YOU UNDERSTAND WHAT YOU WILL BE RUNNING

chmod +x Selfhosting_101.sh
sudo ./Selfhosting_101.sh
```

> Remember to go to your Portainer instance and setup the user/pass: `localhost:9000`

If you forget, you will need to restart Portainer:

```sh
docker restart portainer
```

{{% /details %}}

```mermaid
graph LR
    A[Connect via SSH] -- Open f/w if needed --> 
    C(Install Docker/Podman)
    C --> D(Spin your ❤️ Services)
```

{{< card link="https://jalcocert.github.io/RPi/" title="IoT with Raspberry Pi" image="https://jalcocert.github.io/RPi/img/RPi-Projects.png" subtitle="Linux will onboard you to the IoT and Embedding World. Are you ready to take the first step?" >}}




## GenAI

{{< tabs items="Dockerfile,requirements,Config" defaultIndex="2" >}}

  {{< tab >}}**Dockerfile**: 
  
```Dockerfile
FROM python:3.11-slim

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME

RUN apt-get update && apt-get install -y \
    git \
    build-essential

# Clone the private repository
RUN git clone https://github.com/lllyasviel/Fooocus

WORKDIR /app/Fooocus
RUN pip install -r requirements_versions.txt

#python entry_with_update.py

```

  {{< /tab >}}
  {{< tab >}}**requirements**:
  
```txt
#Not needed here, provicded by repo.
```
  {{< /tab >}}
  {{< tab >}}**Config**:
Make sure to build the image first with:

```sh
docker build -t fooocus .
#docker-compose up -d
```
Then, use this to spin up the container:

```yml
version: '3'

services:
  sd-fooocus:
    image: fooocus #python:3.11-slim
    container_name: fooocus
    command: tail -f /dev/null
    volumes:
      - ai_fooocus:/app
    working_dir: /app  # Set the working directory to /app
    ports:
      - "7865:7865"

volumes:
  ai_fooocus:
```
  {{< /tab >}}

{{< /tabs >}}

You can also try with

```sh
python -m venv your-env #(create a virtual environment)
source your-env/bin/activate #(or on Windows your-env\Scripts\activate) (activatea the venv)
#deactivate
```

```sh
conda create -n yourcondaenvironment python=3.11
conda activate yourcondaenvironment
conda deactivate
```

### LLMs

* Ollama

{{< callout type="info" >}}
The [ML Compilation for LLMs](https://github.com/mlc-ai/mlc-llm) project aims to spread the development and deployment of AI Models.
{{< /callout >}}

* Home LLM + Home Assistant - https://www.youtube.com/watch?v=kJfIM9siD00
  * https://github.com/acon96/home-llm

```sh
https://flathub.org/apps/com.cassidyjames.butler #HA visualizer
```

> This repo contains interesting projects (𝗟𝗟𝗠𝘀, 𝗟𝗟𝗠𝗢𝗽𝘀, and 𝘃𝗲𝗰𝘁𝗼𝗿 𝗗𝗕𝘀) to have a look: https://github.com/iusztinpaul/hands-on-llms



### Voice to Text

* [Piper](https://github.com/rhasspy/piper) - Also works [Text to Voice](https://www.youtube.com/watch?v=SzRF50UwzYk)
  * [Voices at HF](https://huggingface.co/rhasspy/piper-voices/tree/main)

### Affordable Local Gen AI with iGPU's


<iframe width="560" height="315" src="https://www.youtube.com/embed/xsvTEzTirlQ" frameborder="0" allowfullscreen></iframe>

Thanks to to [Tech-Practice](https://www.youtube.com/watch?v=HPO7fu7Vyw4&t=445s) for inspiration.


---

## FAQ

{{< dropdown title="Where to Learn More about SelfHosting?" closed="true" >}}

* <https://awweso.me/>
* https://awsmfoss.com/
* https://selfh.st/apps/
* <https://github.com/pluja/awesome-privacy>
* <https://jalcocert.github.io/RPi/about/#where-can-i-learn-more-about-rpi>
* <https://fossengineer.com/tags/self-hosting/>
* <https://github.com/anderspitman/awesome-tunneling>
* <https://github.com/awesome-selfhosted/awesome-selfhosted>
    * <https://awesome-selfhosted.net/>

{{% /details %}}

{{< dropdown title="How to Secure my Services?" closed="true" >}}

* [NGINX](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/)
* [Cloudflare](https://fossengineer.com/selfhosting-cloudflared-tunnel-docker/)
  * It allows
* Authelia / Zitadel / Authentik

{{% /details %}}


### Decentralized Storage

* Centralization -> Simplicity and Single Point of Failure

* Some alternatives:
  * [IPFS](https://ipfs.tech/) -  an open system to manage data without a central server
  * [Filecoin](https://filecoin.io/) - an open-source cloud storage marketplace, protocol, and incentive layer.

> Great intro video from [Naomi on Decentralized Storage](https://www.youtube.com/watch?v=rOtMGJVp2MU)


### How to Back Up my Server?

Duplicati to other location (HD / Mega, One drive, s3...)

## Windows inside Docker

Thanks to the [Dockur Project](https://github.com/dockur/windows) and by using the [Image](https://hub.docker.com/r/dockurr/windows#!)

{{% details title=" With this Docker-Compose 👈" closed="true" %}}

```yml
version: '3.3'

services:
  windows:
    image: dockurr/windows
    container_name: windows
    devices:
      - /dev/kvm
    cap_add:
      - NET_ADMIN
    ports:
      - "8006:8006" #UI
      - "3389:3389/tcp"
      - "3389:3389/udp"
    stop_grace_period: 2m
    restart: on-failure
    volumes:
      - ./data:/storage
    environment:
      RAM_SIZE: 8GB
      CPU_CORES: 3
      DISK_SIZE: 75GB
      VERSION: "win10"
```

{{% /details %}}
