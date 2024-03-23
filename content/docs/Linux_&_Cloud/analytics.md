---
title: Analytic Tools
type: docs
prev: /docs/gcp/
next: docs/ansible/
draft: false
---

## BI Tools

### Metabase


Get Metabase running locally with [docker-compose](https://github.com/JAlcocerT/Docker/tree/main/IoT/Metabase)


<!-- 

{{< gist "JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-metabase" >}} -->
<!-- 
<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-metabase"></script> -->


<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-metabase.js"></script>

{{< callout type="info" >}}
IoT Project example with Metabase: <https://jalcocert.github.io/RPi/posts/rpi-iot-dht1122-mongo/#metabase>
{{< /callout >}}

> IoT Projec tith [Metabase](https://jalcocert.github.io/RPi/posts/rpi-iot-dht1122-mongo/)


### Redash

Get Redash running locally with [docker-compose](https://github.com/JAlcocerT/Docker/tree/main/IoT/Redash)


> IoT Project example [with Redash]().

<!-- 
<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-redash"></script> -->
<!-- 
{{< gist "JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-redash" >}} -->

<!-- ```sh
git clone https://github.com/getredash/setup
cd setup
rm -rf .git


chmod +x ./setup.sh
./setup.sh
``` -->

### Apache Superset

Get Superset running locally with [docker-compose](https://github.com/JAlcocerT/Docker/tree/main/IoT/Superset).

<!-- > IoT Project example [with Superset](). -->

<!-- 
<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-superset"></script> -->


<!-- 
<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-superset"></script>

{{< gist "JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-superset" >}} -->

<!-- ```sh
git clone https://github.com/apache/superset.git
cd Superset
rm -rf .git


docker compose up -d

git checkout 3.0.0
TAG=3.0.0 docker compose -f docker-compose-non-dev.yml pull
TAG=3.0.0 docker compose -f docker-compose-non-dev.yml up
``` -->

{{< callout type="info" >}}
IoT Project example with Superset: <https://jalcocert.github.io/RPi/posts/rpi-gps-superset/#apache-superset-setup>
{{< /callout >}}


## Databases

https://github.com/JAlcocerT/Docker/tree/main/Dev

<!-- ### MariaDB

### MongoDB

### InfluxDB

TimeScale
 -->

 ## AI Assisted Analytics

 * Github Copilot
 * Codeium
 * Tabby - https://fossengineer.com/selfhosting-Tabby-coding-assistant/
 * [Bito AI](https://docs.bito.ai/feature-guides/ai-that-understands-your-code/how-it-works)


 {{% details title="VS Extensions" closed="true" %}}

```sh
code --list-extensions

#https://marketplace.visualstudio.com/items?itemName=Bito.Bito
#ext install Bito.Bito

#https://marketplace.visualstudio.com/items?itemName=ex3ndr.llama-coder&ssr=false#review-details
#ext install ex3ndr.llama-coder

#https://marketplace.visualstudio.com/items?itemName=Codeium.CodeiumVS
#https://marketplace.visualstudio.com/items?itemName=GitHub.copilotvs
```


{{% /details %}}

You can also try [PandasAI](https://pypi.org/project/pandasai/) and [Sketch](https://pypi.org/project/sketch/) with Python

<!-- 
https://www.quadratichq.com/

Infinite spreadsheet with Python, SQL, and AI.


https://github.com/quadratichq/quadratic/tree/main
https://github.com/quadratichq/quadratic/issues/416
docker build -t quadratic --platform=linux/amd64 . -->



## Product Analytics

* [Umami](https://fossengineer.com/selfhosting-umami-with-docker/)
* PostHog - https://github.com/JAlcocerT/Docker/tree/main/Web/Analytics




---

## FAQ


### Other Tools For Data Analytics

#### Airflow

* <https://fossengineer.com/airflow-docker/>

* Alternatives:
    * Mage - https://www.youtube.com/watch?v=sNagAw91PW0
    * Prefect - https://www.youtube.com/watch?v=f_MPmRj7P_w


https://fossengineer.com/airflow-docker/

### SelfHost These Tools with Docker

<script src="https://gist.github.com/JAlcocerT/953cab1052af58f4241f28dbc0a314a0.js"></script>