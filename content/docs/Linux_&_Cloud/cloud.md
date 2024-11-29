---
title: Cloud
type: docs
prev: /docs/
next: docs/folder/
---

There is live in the Cloud Space apart from AWS,GCP and Azure.

{{< callout type="info" >}}
You can use any of these to deploy services: like [your own **VPN with Wireguard**](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#desktop-with-vps-as-vpn-with-wireguard)
{{< /callout >}}


## MainStream Clouds

For just compute resources, other providers normally provide better value for money (and more predictable billing)

And generally a shared server (where you get virtual CPU cores) will be cheaper than a pure bare metal.  

But these ones are interesting for the fully managed services.

### AWS

{{% details title="Checking AWS BedRock" closed="true" %}}

Let's connect to our server:

```sh
ssh root@yourserverip #you can also do it with ssh keys
```

{{% /details %}}



### GCP

{{% details title="Checking VertexAI" closed="true" %}}

Let's connect to our server:

```sh
ssh root@yourserverip #you can also do it with ssh keys
```

{{% /details %}}

### Azure

### Other Clouds

At the time of writing, Hetzner appears to provide a very interesting value for money (and newer CPU architecture)

While Vultr is the more affordable VPS I found.

Very interesting [VPS price comparison gist](https://gist.github.com/justjanne/205cc548148829078d4bf2fd394f50ae)

{{< callout type="info" >}}
I was writing a comparison between Cloud (Hetzner), SBCs and MiniPCs in [this post](https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers)
{{< /callout >}}

I have applied the **sysbench test** on these VPS.

For reference them with a RPi4 4GB which provides: Cortex-A72 ~ BCM2835 Broadcom SoC family
* Using 4 cores 27.9k
* Using 1 core 6.9k

#### Digital Ocean - DO

* Digital Ocean - https://www.digitalocean.com/pricing - VPS are called **Droplets**
* 4$/m for x1CPU 512mb RAM, 10GB SSD and 500GB Transfer
    * CPU seems to be ~ Intel Xeon Broadwell processors, such as Intel Xeon E5-2600 v4
    * RAM is 138/458mb  | Total events 3k
    * ISP appear as `DigitalOcean`

{{< callout type="info" >}}
With [Docker+Portainer+**WGEasy**](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#desktop-with-vps-as-vpn-with-wireguard) - you need **just ~256mb of RAM**
{{< /callout >}}


```sh
ssh root@dropletip #you will choose the password when creating it
apt update && apt upgrade -y

sudo apt install sysbench -y
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=1 run

curl -sS http://ip-api.com/json/ #provides info about country, ISP, ...
npm install --global fast-cli && fast
```

#### OVH Cloud

* https://www.ovh.com/manager/
*  1 vCore / 2 GB / 40 GB SSD NVMe / 250 Mbps ~6$/m
    * 190/1.88GB initially / Seems to be Intel Xeon E5 v3 series (Haswell) ~ 2014, DDR3
    * total number of events ~2500
    * Fast ~236 mbps, ISP appears as `OVH SAS`, but **I had problems to get wgeasy working**

> It will take a while (~15min) between you making the payment and getting the server IP and root user on your mail - You will reset the password after that during the first login

```sh
ssh ubuntu@ovhserverip #change the pass on first login

#nano Selfhosting_101.sh #MAKE SURE YOU UNDERSTAND WHAT YOU WILL BE RUNNING
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh
chmod +x Selfhosting_101.sh
sudo ./Selfhosting_101.sh

#ifconfig ens3 | grep "inet " | awk '{ print $2 }' #go to this IP port 9000 for portainer
```

#### Vultr

* https://www.vultr.com/pricing/
    * With Interesting Servers in Europe: Madrid, **Amsterdam, Warsaw**, Stockholm...

#### Hetzner

1. Register at - https://www.hetzner.com/cloud/
2. Choose the VPS features
* Using the cheapest x2 shared vCPU intel `(2x Skylake @2ghz)` - Very **Interesting value for money** (at least at the time of writing)
* Or...Using the next tier x4 shared vCPU Intel `Intel Xeon Processor (Skylake)`
3. Check the system after receiving credentials via mail
* ISP will appear as: `Cloud FSN` or `Hetzner Online GmbH` when checked with whatismyipaddress.com
* The sysbench for Hetzner is ~3400 for x1 vCPU and ~6.6k for x2 vCPU

{{< callout type="info" >}}
Use the [Hetzner Setup Script](https://github.com/JAlcocerT/Linux/blob/main/Z_Cloud/Hetzner_101.sh) or the [SelfHosting script](https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh)
{{< /callout >}}

```sh
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Cloud/Hetzner_101.sh
# curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh

#MAKE SURE YOU UNDERSTAND WHAT YOU WILL BE RUNNING with nano!

# chmod +x Selfhosting_101.sh
# sudo ./Selfhosting_101.sh

chmod +x Hetzner_101.sh
sudo ./Hetzner_101.sh
```


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

Comparing server costs to [SelfHosting with a mini PC or SBC](https://jalcocert.github.io/RPi/posts/minipc-vs-pi/).



```sh
docker pull python:3.8

git clone https://github.com/JAlcocerT/Py_Trip_Planner/
cd Py_Trip_Planner
time docker build -t pytripplanner .
```

> This took ~77s for the 2 cores vCPU and 48s for the x4 one

Which are similar results to the [BMAX B4, which costs you ~14$/year](https://jalcocert.github.io/JAlcocerT/cloud-vs-single-board-computers/#power-consumption-and-temps), plus its upfront cost.

Now its **your time to decide** what's better for you!

---

## FAQ

| Provider | Result |
| :-- | :-- |
| MiniPC (N95 x86, x4 16GB, 15W TDP) | [~45s](https://jalcocert.github.io/RPi/posts/minipc-vs-pi/) |
| Opi 5 8GB |  [~1700s](https://jalcocert.github.io/RPi/posts/pi-vs-orange/#benchmarking-the-docker-build-process) |
| RPi 4 2GB |  [~3600s](https://jalcocert.github.io/RPi/posts/pi-vs-orange/#benchmarking-the-docker-build-process) |
| Hetzner Shared vCPU (2x Skylake @2ghz) 4GB | ~77s |
| Hetzner Shared vCPU (4x Skylake @2ghz) 8GB | ~45s |

### Other Benchmarks

<!-- 
https://www.youtube.com/watch?v=-DSTOUOhlc0 -->

* [BmaxB4](https://jalcocert.github.io/RPi/posts/minipc-vs-pi/)
* [OrangePi5](https://jalcocert.github.io/RPi/posts/pi-vs-orange/)

* Rpi 4 2GB - 4 threads 113k total number of events
* Orange Pi 5 8GB - 4 cores 100k total number of events & 8 cores 134.k

Install phoronix in ubuntu or arch.

```sh
sysbench cpu --threads=4 run
```


* Intel Core i5-1135G7 ~ 41.14s & 91.1k total events 4 cores / 

<!-- 
https://openbenchmarking.org/result/2403222-NE-INTELI54190 -->


* AMD 4600G
* AMD 5600G

* Phoronix: ~11.6s
* sysbench: 4 threads total number of events 194.4k / 1 thread 48.5 / all (6x2) cores 334.3k


### FFMPEG Benchmark in Linux

Benchmarking with FFmpeg on Linux can help you assess the performance of your system in handling video and audio processing tasks.

1. **Install FFmpeg**: If you haven't already installed FFmpeg on your Linux system, you can do so by using the package manager of your distribution. For example, on Ubuntu or Debian-based systems, you can install FFmpeg with the command:
```sh
sudo apt-get update && sudo apt-get install ffmpeg
```

2. **Select or Prepare Media for Testing**: Choose a video file as your benchmarking material. It's a good idea to use a high-resolution video to really test the capabilities of your system.

3. **Perform the Benchmark**: There are various ways to benchmark FFmpeg, focusing on different aspects such as encoding speed, decoding speed, and filtering. Here are a few examples:

- **Encoding Speed**: Measure how quickly FFmpeg can encode a video. The following command encodes a video to the H.264 codec without saving the output, effectively testing the encoding speed:
```sh
ffmpeg -i input.mp4 -c:v libx264 -f null -
```
Replace `input.mp4` with your video file. The `-f null -` part tells FFmpeg not to save the output.

- **Decoding Speed**: This measures how quickly FFmpeg can decode a video. Use the following command:
```sh
ffmpeg -i input.mp4 -f null -
```
     This command decodes the video and discards the output, focusing the test on the decoding process.

- **Filtering Performance**: To benchmark the performance of specific filters, you can use a command like this:

```sh
ffmpeg -i input.mp4 -vf "filtername=parameter" -f null -
```
Replace `filtername=parameter` with the filter you wish to test. This measures how quickly FFmpeg can process the video with the specified filter.

4. **Interpreting Results**: FFmpeg will display the processing time and frame rate at the end of the benchmark. A higher frame rate and lower processing time indicate better performance.

5. **Compare Different Settings or Systems**: You can repeat the benchmarks with different codecs, filters, or on different machines to compare performance. For example, encoding with H.265 (HEVC) might be slower but more efficient than H.264, and comparing the results can provide insights into the trade-offs.

6. **Advanced Benchmarking**: For more detailed analysis, you can use the `-benchmark` option to get more detailed timing information, or `-benchmark_all` to get even more comprehensive data.

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