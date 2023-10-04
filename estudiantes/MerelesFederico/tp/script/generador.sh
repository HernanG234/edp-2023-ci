#!/bin/bash

# Generamos un archivo texto

SELECT=$(($RANDOM % 3 + 1))

if [ $SELECT = 1 ]
then

	base64 /dev/urandom | head -c 500 > file.txt

	NombreTxt=($(md5sum file.txt)) # Obtenemos el hash de verificacion

	echo "texto generado"


	mv /root/file.txt /outputs/$NombreTxt # Movemos el archivo generado dentro del contenedor que se generan en la carpeta root y lo renombramos con su hash correspondiente.


elif [ $SELECT == 2 ]
then

	# Generamos un archivo de audio
	ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" out.wav

	echo "audio generado"

	NombreAudio=($(md5sum out.wav)) # Obtenemos el hash de verificacion

	mv /root/out.wav /outputs/$NombreAudio # Movemos el archivo generado dentro del contenedor que se generan en la carpeta root y lo renombramos con su hash correspondiente.

else
	# Generamos un archivo de imagen
	convert -size 100x100 xc: +noise Random noise.png

	echo "imagen generada"

	NombreImagen=($(md5sum noise.png)) # obtenemos el hash de verificacion

	mv /root/noise.png /outputs/$NombreImagen # Movemos el archivo generado dentro del contenedor que se generan en la carpeta root y lo renombramos con su hash correspondiente.

fi

