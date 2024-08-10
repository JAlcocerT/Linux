---
title: Cloud
type: docs
prev: /docs/
next: docs/folder/
---

## AWS

### AWS BEDROCK


{{% details title="Setting up Hetzner Server" closed="true" %}}

Let's connect to our server:

```sh
ssh root@yourserverip #you can also do it with ssh keys
```

{{% /details %}}



## GCP

## Azure

## Other Clouds

### Hetzner

* https://www.hetzner.com/cloud/
    1. Using the cheapest x2 shared vCPU intel `(2x Skylake @2ghz)`
    2. Using the next tier x4 shared vCPU Intel `Intel Xeon Processor (Skylake)`
    * [Hetzner_101.sh]
    * [Selfhosting_101](https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh)

{{% details title="Setting up Hetzner Server" closed="true" %}}

Let's connect to our server: 

```sh
ssh root@yourserverip #you can also do it with ssh keys
#you will be prompted to change the password (and will have to type it manuallys)
```

Check system resources:

```sh
sudo apt update && sudo apt upgrade -y
#lscpu
#cat /proc/cpuinfo
#nproc
```

Lets do some benchmarks:

```sh
sudo apt install sysbench -y
sysbench cpu --threads=2 run #https://github.com/akopytov/sysbench#general-command-line-options
#sysbench cpu --threads=4 run 
```

1. It was ~1480 events/s and 14.8k total events.
2. It was ~3610 events/s and 36.1k total events.

```sh
sudo apt install speedtest-cli  # For Debian/Ubuntu
speedtest-cli --simple
```
Awsome upload/download speed of **1200++ Mbit/s**

Use scripts for [quick setup](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/):

```sh
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh
#nano Selfhosting_101.sh #MAKE SURE YOU UNDERSTAND WHAT YOU WILL BE RUNNING

chmod +x Selfhosting_101.sh
sudo ./Selfhosting_101.sh
#docker --version && docker-compose --version
```

{{% /details %}}

#### Hetzner Value for Money

Comparing server costs to [SelfHosting with a mini PC or SBC](https://jalcocert.github.io/RPi/posts/minipc-vs-pi/)

```sh
docker pull python:3.8

git clone https://github.com/JAlcocerT/Py_Trip_Planner/
cd Py_Trip_Planner
time docker build -t pytripplanner .
```

This took ~77s for the 2 cores vCPU and 48s for the x4 one

<!-- 
### Digital Ocean
https://www.digitalocean.com/pricing
https://lowendbox.com/
https://www.netcup.de/
 -->

---

## FAQ

| Provider | Result |
| :-- | :-- |
| MiniPC (N95 x86, x4 16GB, 15W TDP) | [~45s](https://jalcocert.github.io/RPi/posts/minipc-vs-pi/) |
| Opi 5 8GB |  [~1700s](https://jalcocert.github.io/RPi/posts/pi-vs-orange/#benchmarking-the-docker-build-process) |
| RPi 4 2GB |  [~3600s](https://jalcocert.github.io/RPi/posts/pi-vs-orange/#benchmarking-the-docker-build-process) |
| Hetzner Shared vCPU (2x Skylake @2ghz) 4GB | ~77s |
| Hetzner Shared vCPU (4x Skylake @2ghz) 8GB | ~45s |

### GCP Free Tier Deploy - CLI

* Google Free Tier (*as of now*): <https://cloud.google.com/free/docs/free-cloud-features#compute>
    * e2-micro and us-east1 is important!

```sh
gcloud compute instances create instance-2 \
    --project=your_project_name \
    --zone=us-east1-b \
    --machine-type=e2-micro \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --no-restart-on-failure \
    --maintenance-policy=TERMINATE \
    --provisioning-model=SPOT \
    --instance-termination-action=STOP \
    --service-account=your_service_account@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=http-server,https-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-2,image=projects/debian-cloud/global/images/debian-11-bullseye-v20231212,mode=rw,size=10,type=projects/projectrpi-398008/zones/us-east1-b/diskTypes/pd-standard \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any
```