#!/bin/bash

# Generamos un archivo texto

SELECT=$(( 3 * $RANDOM / 32767 +1))

if [ $SELECT = 1 ]

then

	base64 /dev/urandom | head -c 500 > file.txt

	NombreTxt=($(md5sum file.txt)) # Obtenemos el hash de verificacion

	echo "texto generado" 

	


	mv file.txt $NombreTxt  # Renombramos al archivo
	
	mv $NombreTxt /home/twentyonepilots/Desktop/edp-2023-ci/estudiantes/MerelesFederico/tp/outputs

	
elif [ $SELECT == 2 ]

then

	# Generamos un archivo de audio
	ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" out.wav

	echo "audio generado"

	NombreAudio=($(md5sum out.wav)) # Obtenemos el hash de verificacion

	mv out.wav $NombreAudio

	mv $NombreAudio /home/twentyonepilots/Desktop/edp-2023-ci/estudiantes/MerelesFederico/tp/outputs

else
	# Generamos un archivo de imagen
	convert -size 100x100 xc: +noise Random noise.png

	echo "imagen generada"

	NombreImagen=($(md5sum noise.png)) # obtenemos el hash de verificacion

	mv noise.png $NombreImagen
	
	mv $NombreImagen /home/twentyonepilots/Desktop/edp-2023-ci/estudiantes/MerelesFederico/tp/outputs

	
fi

