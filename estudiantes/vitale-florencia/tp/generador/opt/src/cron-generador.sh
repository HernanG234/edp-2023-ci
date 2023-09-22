#!/bin/bash

#Generador de archivos aleatorio

output_dir=/tmp/output
mkdir -p $output_dir

opciones=("Archivo de texto" "Archivo de sonido" "Archivo de imagen")
opcion_aleatoria=${opciones[$RANDOM % ${#opciones[@]}]}
echo "Se generó un $opcion_aleatoria y se guardo en la carpeta $output_dir"

case "$opcion_aleatoria" in
    "Archivo de texto")
        # Generar un archivo de texto
        base64 /dev/urandom | head -c 500 > $output_dir/file.txt
        mv $output_dir/file.txt $output_dir/file 
        echo "Archivo de texto 'file.txt' creado."
        ;;
    "Archivo de sonido")
        # Generar un archivo de sonido
        ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" $output_dir/file.wav
	mv $output_dir/file.wav $output_dir/file
        echo "Archivo de sonido 'out.wav' creado."
        ;;
    "Archivo de imagen")
        # Generar un archivo de imagen
        convert -size 100x100 xc: +noise Random $output_dir/file.png
        mv $output_dir/file.png $output_dir/file 
        echo "Archivo de imagen 'noise.png' creado."
        ;;
    *)
        echo "Opción no válida. Algo salió mal."
        ;;
esac

checksum=$(md5sum $output_dir/file | cut -d " " -f 1)

mv $output_dir/file $output_dir/$checksum 
