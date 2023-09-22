#!/bin/bash

num_archivos_disponibles=$(curl -l ftp://tuiaedpuser:tuiaedpuser@0.0.0.0 | wc -l)

read -p "¿Cuántos archivos desea descargar? (Ingrese un número entre 1 y $num_archivos_disponibles ): " cant_archivos

if [[ $cant_archivos -lt 1 || $cant_archivos -gt $num_archivos_disponibles ]]; then
    echo "Cantidad inválida. Por favor, ingrese un número entre 1 y $num_archivos_disponibles."
else
    mkdir -p descargas
    lista_archivos=$(curl -l ftp://tuiaedpuser:tuiaedpuser@0.0.0.0 | sort -R | head -n $cant_archivos)

    for archivo in $lista_archivos
    do
        nombre=$archivo
        curl -o "descargas/$nombre" "ftp://tuiaedpuser:tuiaedpuser@0.0.0.0/$archivo"
    done

    echo "Descarga completada."
fi


