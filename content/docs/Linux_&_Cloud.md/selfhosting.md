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
2. Get the Docker-COmpose ready



## Analytical Tools

* https://github.com/knime/knime-core
* https://hub.docker.com/r/apache/superset


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
pip install -r requirements_versions.txt

python entry_with_update.py

# RUN apt-get update && apt-get install -y \
#     build-essential \
#     curl \
#     software-properties-common \
#     git \
#     && rm -rf /var/lib/apt/lists/*

# Install production dependencies.
#RUN pip install -r requirements.txt
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



### LLMs

* Ollama

### Text-to-Image

* Automatic111
* Fooocus

## Productivity

## Communication

* Matrix Server: https://fossengineer.com/selfhosting-matrix-synapse-docker/

You can connect to Matrix with Thunderbird as well.

## Media

Quick seedbox: Torrents + Mullvad -> Syncthing/Filebrowser

## How to Back Up my Server?

Duplicati to other location (HD / Mega, One drive, s3...)

---

## FAQ

### Where to Learn More about SelfHosting?

* <https://awweso.me/>
* <https://github.com/pluja/awesome-privacy>
* <https://jalcocert.github.io/RPi/about/#where-can-i-learn-more-about-rpi>
* <https://fossengineer.com/tags/self-hosting/>
* <https://github.com/anderspitman/awesome-tunneling>
* <https://github.com/awesome-selfhosted/awesome-selfhosted>
    * <https://awesome-selfhosted.net/>

### How to Secure my Services?

* [NGINX](https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/)
* [Cloudflare](https://fossengineer.com/selfhosting-cloudflared-tunnel-docker/)
* Authelia / Zitadel / Authentik