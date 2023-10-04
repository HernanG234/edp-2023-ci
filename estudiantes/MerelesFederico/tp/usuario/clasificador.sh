#!/bin/bash

archivos=$(ls -p ./outputs | grep -v /)  # ls - p muestra los directorios con el slash / y el -v invertimos el match del grep

rm -R ./files
mkdir files
if [ ! -d "./files/img" ]
then
	echo "repositorio no existe, creado OK"
	mkdir ./files/img
fi

# CHEQUEAMOS SI EXISTE EL DIRECTORIO DE SONIDOS

if [ ! -d "./files/snd" ]
then
	echo "repositorio no existe, creado OK"
	mkdir ./files/snd
fi

# CHEQUEAMOS SI EXISTE EL DIRECTORIO DE TEXTO

if [ ! -d "./files/txt" ]
then
       	echo "repositorio no existe, creado OK"
        mkdir ./files/txt
fi

for archivo in $archivos;   # recorremos como un array la variable $archivos.
do

	if  [ -d ./outputs/$archivo ]
	then
		continue

	elif [ $(file ./outputs/$archivo | grep -c "RIFF") -eq 1 ]
	then
		echo "es un archivo de audio! Moviendo a la carpeta de audios."
		mv ./outputs/$archivo ./files/snd/$archivo

	elif [ $(file ./outputs/$archivo | grep -c ASCII.text$) -eq 1 ]
	then
		echo "es tipo de archivo de texto!Moviendo a la carpeta de textos."
		mv ./outputs/$archivo ./files/txt/$archivo

	elif [ $(file ./outputs/$archivo | grep -c "PNG") -eq 1 ]
	then
                echo "es tipo de archivo de imagen! Moviendo a la carpeta de imagenes."
		mv ./outputs/$archivo ./files/img/$archivo

	fi

	echo "Siguiente archivo"
	echo "--------------"
done
