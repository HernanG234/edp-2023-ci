#!/bin/bash

tar_dir="/home/valentino/edp-2023-ci/estudiantes/loza-valentino/tp/modulo_usuario/clasificador_archivos/output"

tar_file="./tar_file"
if [ ! -d "$tar_dir" ]; then
    echo "El directorio $tar_dir no existe."
    exit 1
fi

tar -cf "$tar_file.tar" -C "$tar_dir" .
if [ $? -eq 0 ]; then
    echo "Archivo output_files.tar generado correctamente en $tar_file"
else
    echo "Error al generar el archivo output_files.tar"
fi

