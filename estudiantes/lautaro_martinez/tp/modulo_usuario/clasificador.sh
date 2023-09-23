#!/bin/bash

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
output_dir="../outputs"

# Función para clasificar y mover el archivo
clasificar_y_mover() {
    tipo_archivo="$1"
    carpeta_destino="$output_dir/$tipo_archivo"

    # Crear la carpeta de destino si no existe
    mkdir -p "$carpeta_destino"

    # Contar la cantidad de archivos en la carpeta de destino
    contador=$(ls -1qA "$carpeta_destino" | wc -l)
    
    # Crear el nombre de destino basado en el tipo de archivo, el contador y la extensión
    nombre_destino="$tipo_archivo$contador.$extension"

    # Mover y renombrar el archivo al destino
    mv "$input_file" "$carpeta_destino/$nombre_destino"

    echo "Archivo clasificado y movido a: $carpeta_destino/$nombre_destino"
}

# Clasificar el archivo según su tipo y moverlo a la carpeta correspondiente
case "$file_type" in
    "text/plain")
        clasificar_y_mover "txt"
        ;;
    "audio/wav")
        clasificar_y_mover "snd"
        ;;
    "image/png")
        clasificar_y_mover "img"
        ;;
    *)
        echo "Tipo de archivo no reconocido: $file_type"
        exit 1
        ;;
esac


