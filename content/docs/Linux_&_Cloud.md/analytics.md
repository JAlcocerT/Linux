---
title: Analytic Tools
type: docs
prev: /docs/gcp/
next: docs/ansible/
draft: true
---

## BI Tools

### Metabase


{{< gist "JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-metabase" >}}


### Redash

<https://github.com/getredash/redash>

Install it with: https://github.com/getredash/setup.

{{< gist "JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-redash" >}}

<!-- ```sh
git clone https://github.com/getredash/setup
cd setup
rm -rf .git


chmod +x ./setup.sh
./setup.sh
``` -->

### Apache Superset


{{< gist "JAlcocerT/953cab1052af58f4241f28dbc0a314a0#file-superset" >}}

<!-- ```sh
git clone https://github.com/apache/superset.git
cd Superset
rm -rf .git


docker compose up -d

git checkout 3.0.0
TAG=3.0.0 docker compose -f docker-compose-non-dev.yml pull
TAG=3.0.0 docker compose -f docker-compose-non-dev.yml up
``` -->

## Databases

<!-- ### MariaDB

### MongoDB

### InfluxDB
 -->

## FAQ

### IoT Project example with Metabase

<https://jalcocert.github.io/RPi/posts/rpi-iot-dht1122-mongo/#metabase>

### IoT Project example with Superset

<https://jalcocert.github.io/RPi/posts/rpi-gps-superset/#apache-superset-setup>

### IoT Project example with Redash

TBD

### Other Tools For Data Analytics

#### Airflow
