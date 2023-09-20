#!/bin/bash
echo "Ingrese la cantidad de archivos a descargar:"
read cantidad

archivos_desordenados=$(curl -l 'ftp://tuiaedpuser:tuiaedpuser@0.0.0.0' | sort -R | head -n${cantidad})
contador=1
for file in ${archivos_desordenados}; do
	curl -o archivo-descargado$contador 'ftp://tuiaedpuser:tuiaedpuser@0.0.0.0'/$file
	echo "descargadando..."
	mv archivo-descargado$contador salida-random
	contador=$((contador + 1))
done

