#!/bin/bash

# Directorios de entrada
input_dirs=("images" "audio" "text")

# Ruta base
base_dir="../outputs"

# Función para renombrar archivos
renombrar_archivos() {
    tipo_archivo="$1"
    carpeta_origen="$base_dir/$tipo_archivo"

    # Obtener la lista de archivos en la carpeta de origen
    archivos=("$carpeta_origen"/*)

    # Contador para numerar los archivos
    contador=1

    # Iterar sobre los archivos en la carpeta de origen
    for archivo in "${archivos[@]}"; do
        # Ignorar si no es un archivo regular
        if [ ! -f "$archivo" ]; then
            continue
        fi

        # Obtener la extensión del archivo
        extension="${archivo##*.}"

        # Crear el nuevo nombre basado en el tipo de archivo, el contador y la extensión
        nuevo_nombre="$tipo_archivo$contador.$extension"

        # Renombrar el archivo
        mv "$archivo" "${archivo%/*}/$nuevo_nombre"

        echo "Archivo renombrado: ${archivo%/*}/$nuevo_nombre"

        # Incrementar el contador
        contador=$((contador + 1))
    done
}

# Iterar sobre los tipos de archivos
for tipo in "${input_dirs[@]}"; do
    renombrar_archivos "$tipo"
done
