#!/bin/bash

output_dir="/home/valentino/edp-2023-ci/estudiantes/loza-valentino/tp/generador_archivos"

tar_dir "./tar"

tar_file="output_files.tar"

if [ -d "$output_dir" ]; then
	mkdir -p "$tar_dir"
	tar -cf "$tar_dir/$tar_file" -C "$output_dir"
	echo "Archivo $tar_file generado correctamente en $tar_dir"
else
	echo "El directorio output no existe en la ubicacion especificada: $output_dir"
fi
