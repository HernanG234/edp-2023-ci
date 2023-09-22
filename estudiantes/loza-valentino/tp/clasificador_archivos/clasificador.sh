#!/#!/bin/bash

local_download_dir="/home/edp-2023-ci/estudiantes/loza-valentino/tp/clasificador_archivos/temp"

output_dir="/home/edp-2023-ci/estudiantes/loza-valentino/tp/clasificador_archivos/output"

if [ ! -d "$output_dir/img" ]; then
    mkdir -p "$output_dir/img"
fi

if [ ! -d "$output_dir/snd" ]; then
    mkdir -p "$output_dir/snd"
fi

if [ ! -d "$output_dir/txt" ]; then
    mkdir -p "$output_dir/txt"
fi

clasificar_archivo() {
    archivo="$1"

    extension="${archivo##*.}"

    case "$extension" in
        "txt")
            tipo="txt"
            ;;
        "wav")
            tipo="snd"
            ;;
        "png")
            tipo="img"
            ;;
        *)
            tipo="desconocido"
            ;;
    esac

    if [ "$tipo" != "desconocido" ]; then
        nuevo_nombre="${tipo}_$(date +%Y%m%d%H%M%S).$extension"
        mv "$archivo" "$output_dir/$tipo/$nuevo_nombre"
        echo "Archivo clasificado y renombrado: $nuevo_nombre"
    else
        echo "Archivo con extension desconocida: $archivo"
    fi
}

main() {
    echo "Clasificador de archivos"

    archivos_descargados=("$local_download_dir"/*)

    for archivo in "${archivos_descargados[@]}"; do
        clasificar_archivo "$archivo"
    done

    echo "Clasificacion de archivos completada."
}

main
