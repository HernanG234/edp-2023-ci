#!/bin/bash

# Directorio de salida
output_dir="/home/tuia/Escritorio/tp/outputs"

# Verificar si la carpeta de salida existe, si no, crearla
if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi

# Generar un archivo aleatorio
file_type=$((RANDOM % 3))
case $file_type in
    0)
        # Generar archivo de texto
        base64 /dev/urandom | head -c 500 > "$output_dir/random.txt"
        ;;
    1)
        # Generar archivo de sonido
        ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" "$output_dir/random.wav"
        ;;
    2)
        # Generar archivo de imagen
        convert -size 100x100 xc: +noise Random "$output_dir/random.png"
        ;;
    *)
        echo "Tipo de archivo no válido"
        exit 1
        ;;
esac

# Calcular el hash del archivo generado
hash=$(sha256sum "$output_dir/random."* | cut -d ' ' -f 1)

# Renombrar el archivo con el hash
mv "$output_dir/random."* "$output_dir/$hash"

echo "Archivo generado y renombrado: $hash"

