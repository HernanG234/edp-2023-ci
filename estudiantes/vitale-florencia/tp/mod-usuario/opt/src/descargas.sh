#!/bin/bash

# Obtener el número de archivos disponibles en el servidor FTP
num_archivos_disponibles=$(curl -l ftp://tuiaedpuser:tuiaedpuser@0.0.0.0 | wc -l)

read -p "¿Cuántos archivos desea descargar? (Ingrese un número entre 1 y $num_archivos_disponibles ): " cant_archivos

if [[ $cant_archivos -lt 1 || $cant_archivos -gt $num_archivos_disponibles ]]; then
    echo "Cantidad inválida. Por favor, ingrese un número entre 1 y $num_archivos_disponibles."
else
    output_dir="/tmp/outputs/descargas"
    mkdir -p "$output_dir"
    lista_archivos=$(curl -l ftp://tuiaedpuser:tuiaedpuser@0.0.0.0 | sort -R | head -n "$cant_archivos")

    for archivo in $lista_archivos; do
        nombre="$archivo"
        curl -o "$output_dir/$nombre" "ftp://tuiaedpuser:tuiaedpuser@0.0.0.0/$archivo"

        # Verificar la suma de verificación MD5
        sum_check=$(md5sum "$output_dir/$nombre" | cut -d " " -f1)

        if [[ "$sum_check" != "$nombre" ]]; then
            echo "La suma de verificación para $nombre no coincide"
            # Puedes tomar acciones adicionales aquí si la suma de verificación no coincide
        else
            echo "Descargado y verificado: $nombre"
        fi
    done

    echo "Descarga completada en /tmp/outputs/descargas"
fi

