#!/bin/bash

rm -R ./outputs #eliminamos el dir si existe

mkdir outputs # lo creamos nuevamente

read -p "Cuantos imagenes quiere ingresar:" cant

FilesFtp=$(curl -l ftp://$USER:$USER@0.0.0.0  | sort -R | head -n$cant)

for file in $FilesFtp ; do

        curl -o $file ftp://$USER:$USER@0.0.0.0/$file

	echo "Archivo descargado."

	mv $file  ./outputs/

done

exit 0
