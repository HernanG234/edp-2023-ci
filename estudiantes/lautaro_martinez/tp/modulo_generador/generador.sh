#!/bin/bash

# Directorio de salida
IMAGE_DIR="outputs/images"
TEXT_DIR="outputs/text"
AUDIO_DIR="outputs/audio"


# Verificar si la carpeta de salida existe, si no, crearla
if [ ! -d "$IMAGE_DIR" ]; then
    mkdir -p "$IMAGE_DIR"
fi

if [ ! -d "$TEXT_DIR" ]; then
    mkdir -p "$TEXT_DIR"
fi

if [ ! -d "$AUDIO_DIR" ]; then
    mkdir -p "$AUDIO_DIR"
fi

# Generar un archivo aleatorio
file_type=$((RANDOM % 3))
case $file_type in
    0)
        # Generar archivo de texto
        extension="txt"
        base64 /dev/urandom | head -c 500 > "$TEXT_DIR/random.$extension"

        # Calcular el hash del archivo generado
        hash=$(sha256sum "$TEXT_DIR/random.$extension" | cut -d ' ' -f 1)
        # Renombrar el archivo con el hash y la extensión
        mv "$TEXT_DIR/random.$extension" "$TEXT_DIR/$hash.$extension"
        echo "Archivo generado y renombrado: $hash.$extension"
        ;;
    1)
        # Generar archivo de sonido
        extension="wav"
        ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" "$AUDIO_DIR/random.$extension"
        
        # Calcular el hash del archivo generado
        hash=$(sha256sum "$AUDIO_DIR/random.$extension" | cut -d ' ' -f 1)
        mv "$AUDIO_DIR/random.$extension" "$AUDIO_DIR/$hash.$extension"
        echo "Archivo generado y renombrado: $hash.$extension"
        ;;
    2)
        # Generar archivo de imagen
        extension="png"
        convert -size 100x100 xc: +noise Random "$IMAGE_DIR/random.$extension"
        
        hash=$(sha256sum "$IMAGE_DIR/random.$extension" | cut -d ' ' -f 1)
        mv "$IMAGE_DIR/random.$extension" "$IMAGE_DIR/$hash.$extension"
        echo "Archivo generado y renombrado: $hash.$extension"
        ;;
    *)
        echo "Tipo de archivo no válido"
        exit 1
        ;;
esac
