#!/bin/bash

download_dir="/home/valentino/edp-2023-ci/estudiantes/loza-valentino/tp/downloader/archivos_descargados"
output_dir="/home/valentino/edp-2023-ci/estudiantes/loza-valentino/tp/clasificador_archivos/output"

if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi

img_counter=1
snd_counter=1
txt_counter=1

for file in "$download_dir"/*; do
    if [ -f "$file" ]; then
        file_type=$(file -b --mime-type "$file")
        case "$file_type" in    
            "image/png")
                category="img"
                ext=".png"
                counter="$img_counter"
                ((img_counter++))
                ;;
            "audio/wav")
                category="snd"
                ext=".wav"
                counter="$snd_counter"
                ((snd_counter++))
                ;;
            "text/plain")
                category="txt"
                ext=".txt"
                counter="$txt_counter"
                ((txt_counter++))
                ;;
            *)
                category="unk"
                ;;
        esac

        if [ "$category" != "unk" ]; then
            filename=$(basename "$file")
            new_filename="${category}${counter}${ext}"
            mkdir -p "$output_dir/$category"    
            mv "$file" "$output_dir/$category/$new_filename"
   	        echo "Archivo clasificado y movido a la carpeta: $category: $new_filename"
	    fi
    fi
done

