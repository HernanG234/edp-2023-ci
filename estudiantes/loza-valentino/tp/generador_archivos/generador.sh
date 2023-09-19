#!/bin/bash

random_number=$((1 + RANDOM % 3))
file_name="file_$(date '+%Y%m%d%H%M%S')."
output="./output"
mkdir -p "$output"
case $random_number in
    1)
        base64 /dev/urandom | head -c 500 > "$file_name.txt"
        ;;
    2)
        ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" "$file_name.wav"
        ;;
    3)
        convert -size 100x100 xc: +noise Random "$file_name.png"
        ;;
    *)
        ;;
esac

file_hash=$(sha256sum "$file_name"* | awk '{print $1}')

mv "$file_name"* "$file_hash"
mv "$file_hash" "$output/"
