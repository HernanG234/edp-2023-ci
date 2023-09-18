# !/bin/bash

# Genera un archivo aleatorio
output_file="file.txt"
base64 /dev/urandom | head -c 500 > "$output_file"

# Calcula el hash del archivo
file_hash=$(md5sum "$output_file" | awk '{print $1}')

# Renombra el archivo con el hash
mv "$output_file" "$file_hash.txt"

# Copia el archivo al volumen compartido
cp "$file_hash.txt" /modulo_servidor

