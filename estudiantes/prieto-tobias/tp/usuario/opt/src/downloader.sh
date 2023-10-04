#!/bin/bash
mkdir -p salida-random
echo "Ingrese la cantidad de archivos a descargar:"
read cantidad

archivos_desordenados=$(curl -l 'ftp://tuiaedpuser:tuiaedpuser@0.0.0.0' | sort -R | head -n${cantidad})

for file in ${archivos_desordenados}; do
        curl -o $file 'ftp://tuiaedpuser:tuiaedpuser@0.0.0.0'/$file
        echo "descargando..."
        mv $file salida-random

done
