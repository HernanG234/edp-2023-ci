#!/bin/bash

generate_text() {
	local filename="text_$(date +%Y%m%d%H%M%S)_$(uuidgen).txt"
	base64 /dev/urandom | head -c 500 > "$filename"
	echo "Texto aleatorio generado correctamente: $filename"
}

generate_sound() {
	local filename="sound_$(date +%Y%m%d%H%M%S)_$(uuidgen).wav"
	ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" "$filename"
	echo "Sonido aleatorio generado correctamente: $filename"
}

generate_images() {
	local filename="image_$(date +%Y%m%d%H%M%S)_$(uuidgen).png"
	convert -size 100x100 xc: +noise Random "$filename"
	echo "Imagen aleatoria generada correctamente: $filename"
}

output_dir="~/edp-2023-ci/estudiantes/loza-valentino/tp/generador_archivos/"

mkdir -p "$output_dir"

generate_text
generate_sound
generate_images

for file in "$output_dir"/*; do
    if [ -f "$file" ]; then
        hash=$(sha256sum "$file" | awk '{print $1}')
        mv "$file" "${file%.*}_$hash.${file##*.}"
        echo "Archivo renombrado a: ${file%.*}_$hash.${file##*.}"
    fi
done
