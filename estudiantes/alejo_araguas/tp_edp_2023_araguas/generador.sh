#!/bin/bash

echo ¿Que tipo de archivo deseea generar?
echo 1- Archivo de texto.
echo 2- Archivo de sonido.
echo 3- Archivo de imágen.
echo 0- Salir al menú.
echo Escriba el número de su selección: ; read opc

if [ $opc -eq 1 ]; then
	base64 /dev/urandom | head -c 500 > file.txt
	echo ¡Archivo de texto generado!
	exit 1
elif [ $opc -eq 2 ]; then
	ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" out.wav
	echo ¡Archivo de sonido generado!
	exit 1
elif [ $opc -eq 3 ]; then
	convert -size 100x100 xc: +noise Random noise.png
	echo ¡Archivo de imágen generado!
	exit 1
elif [ $opc -eq 0 ]; then
	echo Saliendo al menú...
	exit 1
else
	echo Número incorrrecto.
	exit 0
fi
convert -size 100x100 xc: +noise Random noise.png

	base64 /dev/urandom | head -c 500 > file.txt
