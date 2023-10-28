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

# Ruta completa del archivo recibido como argumento
input_file="$1"

# Verificar que se haya proporcionado un archivo como argumento
if [ -z "$input_file" ]; then
    echo "Error: Se requiere un archivo como argumento."
    exit 1
fi

# Determinar el tipo de archivo utilizando el comando 'file'
file_type=$(file -b --mime-type "$input_file")

# Obtener la extensión del archivo
extension="${input_file##*.}"

# Directorio de salida principal
output_dir="/tp/outputs"

# Función para clasificar y mover el archivo
clasificar_y_mover() {
    tipo_archivo="$1"
    # Contar la cantidad de archivos en la carpeta de destino
    contador=$(ls -R -1qA "$output_dir" | wc -l)
    
    # Crear el nombre de destino basado en el tipo de archivo, el contador y la extensión
    nombre_destino="$tipo_archivo$contador.$extension"
    
    final_path="$output_dir/$tipo_archivo/$nombre_destino"

    # Mover y renombrar el archivo al destino

    mv -v $input_file $final_path

    echo "Archivo clasificado y movido a: $final_path"
}

# Clasificar el archivo según su tipo y moverlo a la carpeta correspondiente
case "$file_type" in
    "text/plain")
        clasificar_y_mover "text"
        ;;
    "audio/wav")
        clasificar_y_mover "audio"
        ;;
    "audio/x-wav")
        clasificar_y_mover "audio"
        ;;
    "image/png")
        clasificar_y_mover "images"
        ;;
    *)
        echo "Tipo de archivo no reconocido: $file_type"
        exit 1
        ;;
esac


