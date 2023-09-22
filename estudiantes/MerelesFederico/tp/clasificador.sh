#!/bin/bash

archivos=$(ls -p ./outputs | grep -v /)  # ls - p muestra los directorios con el slash / y el -v invertimos el match del grep

# CHEQUEAMOS SI EXISTE LA CARPETA DE IMAGENES

if [ ! -d "./outputs/img" ]
then
	echo "repositorio no existe, creado OK"
	mkdir ./outputs/img
fi

# CHEQUEAMOS SI EXISTE EL DIRECTORIO DE SONIDOS

if [ ! -d "./outputs/snd" ]
then
	echo "repositorio no existe, creado OK"
	mkdir ./outputs/snd
fi

# CHEQUEAMOS SI EXISTE EL DIRECTORIO DE TEXTO

if [ ! -d "./outputs/txt" ]
then
       	echo "repositorio no existe, creado OK"
        mkdir ./outputs/txt
fi

for archivo in $archivos;   # recorremos como un array la variable $archivos.
do
	echo $archivo   # imprimimos por output el achivo que estamos analizando. 

	TipoWav=$(file ./outputs/$archivo | grep -c "RIFF") # variables con la que evaluaremos los tipo de archivo.
	TipoTxt=$(file ./outputs/$archivo | grep -c ASCII.text$) # el grep -c va a dar 1 si es true(match), 0 para false(no match).
	TipoPng=$(file ./outputs/$archivo | grep -c "PNG")

	if [ $TipoWav -eq 1 ]
	then
		echo "es un archivo de audio! Moviendo a la carpeta de audios."
		mv ./outputs/$archivo ./outputs/snd/$archivo
	fi

	if [ $TipoTxt -eq 1 ]
#50
	then
		echo "es tipo de archivo de texto!Moviendo a la carpeta de textos."
		mv ./outputs/$archivo ./outputs/txt/$archivo
	fi

	if [ $TipoPng -eq 1 ]
        then
                echo "es tipo de archivo de imagen! Moviendo a la carpeta de imagenes."
		mv ./outputs/$archivo ./outputs/img/$archivo
	else
		echo "Es un archivo ejecutable"
	fi
	# echo $(file ./outputs/$archivo | grep -c ASCII.text$)
	# echo $(file ./outputs/$archivo | grep -c ^RIFF)

	echo "Siguiente archivo"
	echo "--------------"
done


# RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, mono 48000 Hz
# ASCII text
# PNG image data, 100 x 100, 16-bit/color RGB, non-interlaced
# probando los tipos mathc  file ./outputs/* | grep -c "ASCII text executable"file ./outputs/* | grep -c "RIFF" file ./outputs/* | grep -c "PNG"
