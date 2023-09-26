#!/bin/bash

echo "Ingrese la cantidad de archivos que desea descargar: "
read num_archivos

ftp_server="localhost"
ftp_user="valentino"
ftp_pwd="MiC0ntr4s3ñ@Ftp"
download_dir="./archivos_descargados"

lista_archivos=$(curl -u "$ftp_user:$ftp_pwd" -l "ftp://$ftp_server/")
mkdir -p "$download_dir"

if [ -z "$lista_archivos" ]; then
	echo "La lista de archivos en el servidor FTP está vacia."
	exit 1
fi

download_random_files() {
	for ((i=1; i<=$num_archivos; i++))
	do
		random_file=$(echo "$lista_archivos" | shuf -n 1)
		if [ -f "$download_dir/$archivo_aleatorio" ]; then
			echo "El archivo $random_file ya existe, no se descargará"
		else
			curl -u "$ftp_user:$ftp_pwd" -o "$download_dir/$random_file" "ftp://$ftp_server/$random_file"
			echo "Archivo descargado: $random_file"
		fi
	done
}
download_random_files
