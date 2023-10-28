# !/bin/bash

# Directorio de salida principal
output_dir="/tp/output_file.tar"
compress_dir="/tp/outputs"


# Comprobar si el directorio 'outputs' existe
if [ ! -d "$compress_dir" ]; then
    echo "El directorio $compress_dir no existe. Asegúrate de clasificar archivos antes de comprimirlos."
    exit 1
fi

# Comprimir el directorio 'outputs' en un archivo .tar
tar -cvf "$output_dir" -C "$compress_dir" .

echo "Directorio 'outputs' comprimido a $tar_file en $output_dir"