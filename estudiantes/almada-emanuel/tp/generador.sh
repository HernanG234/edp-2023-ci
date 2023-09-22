#!/bin/bash 

mkdir -p outputs_generador/

var=$((random%3))

if [ $var -eq 0 ]; then 
	base64 /dev/urandom | head -c 500 > file.txt
	archivo=file.txt

elif [ $var -eq 1 ]; then 
	ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" out.wav
	archivo=out.wav

else 
	convert -size 100x100 xc: +noise Random noise.png
        archivo=noise.png
fi 

hash=$(md5sum $archivo/ cut -d ' ' -f1)

mv $archivo outputs_generador/$hash
