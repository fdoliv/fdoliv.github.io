---
title: How to download youtube live streams?
categories:
 - Tutorial
 - Youtube
tags:
---

Today I needed to download live stream videos from youtube (i.e., that are still live). To do this, I used the command-line utility [Streamlink](https://streamlink.github.io/){:target="_blank"}, which extracts streams from various services and pipes them into a video player of choice or a file.

# Install Streamlink

To install Streamlink on Debian like systems, we need to execute on terminal:
```bash
sudo apt install streamlink
```
# Streamlink usage
Now, to use the tool we need to run:

```bash
streamlink --hls-live-restart -o <output file name> <URL> best
```
Here the ```--hls-live-restart``` parameter is to skip to the beginning of a live stream, or as far back as possible. The ```-o``` parameter is to set the output file, were is indicate in ``` <output file name>```. Replacing the ```<URL>``` with the video URL (e.g. from youtube),we indicate the source site of the video. Finally, the parameter ```best``` is to indicate the stream quality, it also can be 144p (worst), 240p, 360p, 480p, 720p (best). 

For example, we can download the [NASA TV video stream](https://youtu.be/21X5lGlDOfg){:target="_blank"} from youtube. To do this is enouth run in terminal:

```bash
streamlink --hls-live-restart -o nasa.mp4 https://youtu.be/21X5lGlDOfg best
 ```