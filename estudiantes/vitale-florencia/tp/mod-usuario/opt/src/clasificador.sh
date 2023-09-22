#!/bin/bash


#!/bin/bash

# Crear directorios de salida si no existen
mkdir -p "outputs/img"
mkdir -p "outputs/snd"
mkdir -p "outputs/txt"

numero_texto=1
numero_sonido=1
numero_imagen=1

for archivo in descargas/*; do
    nombre=$(basename "$archivo")

    # Calcular la suma de verificación del archivo
    sum_check=$(md5sum "descargas/$nombre" | cut -d " " -f1)

    if [[ "$sum_check" != "$nombre" ]]; then
        echo "La suma de verificación para $nombre no coincide"
        continue
    fi

    # Obtener el tipo de archivo usando "file"
    metadata=$(file "descargas/$nombre")

    if [[ $metadata =~ "ASCII text" ]]; then
        mv "descargas/$nombre" "outputs/txt/texto$numero_texto.txt"
        numero_texto=$((numero_texto+1))
    elif [[ $metadata =~ "WAVE audio" ]]; then
        mv "descargas/$nombre" "outputs/snd/sonido$numero_sonido.wav"
        numero_sonido=$((numero_sonido+1))
    elif [[ $metadata =~ "PNG image" ]]; then
        mv "descargas/$nombre" "outputs/img/imagen$numero_imagen.png"
        numero_imagen=$((numero_imagen+1))
    else
        echo "Archivo no reconocido: $nombre"
    fi
done


