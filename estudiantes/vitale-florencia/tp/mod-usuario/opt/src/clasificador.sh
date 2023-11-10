#!/bin/bash

output_dir="/tmp/outputs"

mkdir -p "$output_dir/img"
mkdir -p "$output_dir/snd"
mkdir -p "$output_dir/txt"

numero_texto=1
numero_sonido=1
numero_imagen=1

descargas_dir="/tmp/outputs/descargas"  
for archivo in "$descargas_dir"/*; do
    nombre=$(basename "$archivo")
    metadata=$(file "$descargas_dir/$nombre")

    if [[ $metadata =~ "ASCII text" ]]; then
        mv "$descargas_dir/$nombre" "$output_dir/txt/texto$numero_texto.txt"
        numero_texto=$((numero_texto+1))
    elif [[ $metadata =~ "WAVE audio" ]]; then
        mv "$descargas_dir/$nombre" "$output_dir/snd/sonido$numero_sonido.wav"
        numero_sonido=$((numero_sonido+1))
    elif [[ $metadata =~ "PNG image" ]]; then
        mv "$descargas_dir/$nombre" "$output_dir/img/imagen$numero_imagen.png"
        numero_imagen=$((numero_imagen+1))
    else
        echo "Archivo no reconocido: $nombre"
    fi
done

