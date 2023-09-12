#!/bin/bash

script_dir="$(dirname "$0")"

random=$((RANDOM % 3))

filename="${script_dir}/$(date +%s)."

case $random in
0)base64 /dev/urandom | head -c 500 > "${filename}txt"
ext="txt"
;;
1)ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" "${filename}wav" 2>/dev/null
ext="wav"
;;
2)convert -size 100x100 xc: +noise Random "${filename}png"
ext="png"
;;
esac
hash=$(md5sum "${filename}${ext}" | cut -d ' ' -f 1)

new_filename="${script_dir}/${hash}.${ext}"
mv "${filename}${ext}" "$new_filename"
echo "h"

