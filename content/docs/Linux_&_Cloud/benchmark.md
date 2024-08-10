---
title: Benchmark CPU with Linux
type: docs
prev: /docs/linux__cloud/selfhosting/
next: /docs/linux__cloud/llms/
---

<!-- 
https://www.youtube.com/watch?v=-DSTOUOhlc0 -->

* https://jalcocert.github.io/RPi/posts/minipc-vs-pi/
* https://jalcocert.github.io/RPi/posts/pi-vs-orange/

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


## FFMPEG Benchmark in Linux

Benchmarking with FFmpeg on Linux can help you assess the performance of your system in handling video and audio processing tasks. Here's a guide on how to perform a benchmark using FFmpeg:

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

Remember to consult the FFmpeg documentation for more details on commands and options, as FFmpeg is a powerful tool with many capabilities beyond simple encoding and decoding.

---

## FAQ