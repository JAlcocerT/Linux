---
title: How to Benchmark a CPU with Linux
type: docs
prev: /docs/linux__cloud/selfhosting/
next: /docs/linux__cloud/llms/
---


https://jalcocert.github.io/RPi/posts/minipc-vs-pi/


https://jalcocert.github.io/RPi/posts/pi-vs-orange/

* Rpi 4 2GB - 4 threads 113k total number of events
* Orange Pi 5 8GB - 4 cores 100k total number of events & 8 cores 134.k

Install phoronix in ubuntu or arch.

```sh
sysbench cpu --threads=4 run
```


Intel Core i5-1135G7 ~ 41.14s & 91.1k total events 4 cores / 

<!-- 
https://openbenchmarking.org/result/2403222-NE-INTELI54190 -->


AMD 2200g

AMD 4600G

AMD 5600G

* Phoronix: ~11.6s
* sysbench: 4 threads total number of events 194.4k / 1 thread 48.5 / all (6x2) cores 334.3k


---

## FAQ