#!/bin/bash

# Generamos un archivo texto
base64 /dev/urandom | head -c 500 > file.txt

NombreTxt=($(md5sum file.txt))

echo "texto generado"

mv file.txt $NombreTxt

# Generamos un archivo de audio
ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" out.wav

echo "audio generado"

NombreAudio=($(md5sum out.wav))

mv out.wav $NombreAudio

# Generamos un archivo de imagen
convert -size 100x100 xc: +noise Random noise.png

echo "imagen generada"

NombreImagen=($(md5sum noise.png))

mv noise.png $NombreImagen

exit 0
