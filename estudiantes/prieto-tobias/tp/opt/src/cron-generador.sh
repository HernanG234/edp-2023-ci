#!/bin/bash


ruta_salida=/tmp/output
mkdir -p $ruta_salida

VARIABLE=$((RANDOM%3))
echo $VARIABLE

if [[ $VARIABLE == 0 ]] ; then
    base64 /dev/urandom | head -c 500 > file.txt
    hash=$(md5sum "file.txt" | cut -d ' ' -f 1)
    mv "file.txt" "$hash"
    mv "$hash" "$ruta_salida"


elif [[ $VARIABLE == 1 ]] ; then
    ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" out.wav 
    hash=$(md5sum "out.wav" | cut -d ' ' -f 1)
    mv "out.wav" "$hash"
    mv "$hash" "$ruta_salida"
else
    convert -size 100x100 xc: +noise Random noise.jpg 
    hash=$(md5sum "noise.jpg" | cut -d ' ' -f 1)
    mv "noise.jpg" "$hash"
    mv "$hash" "$ruta_salida"
fi
