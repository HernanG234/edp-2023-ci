#!/bin/bash

base64 /dev/urandom | head -c 500 > file.txt

ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" out.wav

convert -size 100x100 xc: +noise Random noise.png
