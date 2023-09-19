#!/bin/bash

# Nombre del archivo original que contiene los hashes
archivo_original="archivo-lista"

# Comprobar si el archivo original existe
if [ ! -e "$archivo_original" ]; then
    echo "El archivo $archivo_original no existe."
    exit 1
fi

# Crear un archivo temporal con líneas aleatorias
archivo_temporal="hashes_temp.txt"
cat "$archivo_original" | shuf > "$archivo_temporal"

# Preguntar al usuario cuántos archivos desea mostrar
echo -n "Ingrese la cantidad de archivos que desea mostrar: "
read cantidad_archivos

# Verificar si la entrada del usuario es válida
if ! [[ "$cantidad_archivos" =~ ^[0-9]+$ ]]; then
    echo "Entrada no válida. Ingrese un número entero."
    exit 1
fi

# Leer el archivo temporal y mostrar la cantidad de archivos solicitada de forma aleatoria
contador=0
while IFS= read -r linea && [ "$contador" -lt "$cantidad_archivos" ]; do
    echo "Este es el archivo llamado $linea con hash $linea"
    contador=$((contador + 1))
done < "$archivo_temporal"

# Eliminar el archivo temporal
rm "$archivo_temporal"
