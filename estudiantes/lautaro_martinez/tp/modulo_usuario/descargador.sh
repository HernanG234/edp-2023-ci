#!/bin/bash

read -p "Ingresa un número > " num_files

# Se usa localhost en caso de correr el script de forma local   
#ftp_server="localhost"
ftp_server="ftp"
ftp_user="tuiaedpuser"
ftp_password="tuiaedpuser"

local_temp="temp"

wget -r --ftp-user="$ftp_user" --ftp-password="$ftp_password" "ftp://$ftp_server" -P "$local_temp"

if [ $? -eq 0 ]; then
    echo "Descarga completada correctamente."
else
    echo "Error en la descarga."
    exit 1
fi

archivos="$(du -a $local_temp | egrep -oh "[a-z]*\/.*\.[a-z]*")"
mi_array=($(echo $archivos | tr ";" " "))

longitud=${#mi_array[@]}
echo "Hay: $longitud archivos en el servidor"

elementos_seleccionados=()

for ((i = 0; i < $num_files; i++)); do
    indice_aleatorio=$(( RANDOM % $longitud ))
    elemento_aleatorio=${mi_array[$indice_aleatorio]}
    elementos_seleccionados+=($elemento_aleatorio)
    
    longitud=$((longitud - 1))
done

longitud=${#elementos_seleccionados[@]}

carpeta_dest="outputs"
for ((i = 0; i < $longitud; i++)); do
    elemento=${elementos_seleccionados[$i]}
    extension=$(echo $elemento | egrep -oh "\..*") 
    if [ "$extension" == ".txt" ] 
    then 
        cp $elemento "$carpeta_dest/text/"
    elif [ "$extension" == ".wav" ] 
    then
        cp $elemento "$carpeta_dest/audio/"
    elif [ "$extension" == ".png" ] 
    then
        cp $elemento "$carpeta_dest/images/"
    fi
done
