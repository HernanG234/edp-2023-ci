#!/bin/bash

var=$((RANDOM%3))
if [ $var -eq 0 ]; then
	base64 /dev/urandom | head -c 500 > file.txt  #texto
elif [ $var -eq 1 ]; then
	convert -size 100x100 xc: +noise random_noise.png  #imagenes
else
	ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" out.wav  #sonidos
fi

bash=$(md5sum archivo|cut -d ' ' -fmd5sum archivo|cut -d ' ' -f1)

mv $bash output/



#docker run -d -p 21:21 -p 21000-21010:21000-21010 -e USERS="tuiaedpuser|tuiaedpuser" -v <ruta al outputs del generador>:/ftp/tuiaedpuser delfer/alpine-ftp-server
