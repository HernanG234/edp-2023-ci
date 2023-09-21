# !/bin/bash

# Directorio de salida principal
output_dir="../outputs"

# Nombre del archivo tar
tar_file="$output_dir.tar"

# Comprobar si el directorio 'outputs' existe
if [ ! -d "$output_dir" ]; then
    echo "El directorio 'outputs' no existe. Asegúrate de clasificar archivos antes de comprimirlos."
    exit 1
fi

# Comprimir el directorio 'outputs' en un archivo .tar
tar -cvf "$tar_file" -C "$output_dir" .

echo "Directorio 'outputs' comprimido en $tar_file"

