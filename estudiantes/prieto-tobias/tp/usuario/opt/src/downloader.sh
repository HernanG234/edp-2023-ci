#!/bin/bash

# Ejecuta el comando curl para obtener la lista de archivos y guárdala en una variable
lista_archivos=$(curl -s "ftp://tuiaedpuser:tuiaedpuser@0.0.0.0")

# Convierte la lista en un array de Bash (los elementos están separados por nuevas líneas)
IFS=$'\n' read -d '' -r -a lista_archivos_arr <<< "$lista_archivos"

# Imprime la lista de archivos para que el usuario elija
echo "Lista de archivos disponibles para descargar:"
for i in "${!lista_archivos_arr[@]}"; do
  echo "$i: ${lista_archivos_arr[$i]}"
done

# Pide al usuario que elija un número de archivo
echo -n "Por favor, ingrese el número del archivo que desea descargar: "
read opcion

# Verifica si la opción ingresada por el usuario es válida
if [[ "$opcion" =~ ^[0-9]+$ && "$opcion" -ge 0 && "$opcion" -lt "${#lista_archivos_arr[@]}" ]]; then
  archivo_seleccionado="${lista_archivos_arr[$opcion]}"
  # Ahora puedes usar $archivo_seleccionado para descargar el archivo seleccionado con curl
  # Ejemplo: curl -O "URL_del_Servidor/$archivo_seleccionado"
  curl -o "ftp://tuiaedpuser:tuiaedpuser@0.0.0.0/$archivo_seleccionado"
  echo "Descargando $archivo_seleccionado..."
else
  echo "Opción no válida."
fi

