#!/bin/bash 

opcion=
echo "¿Qué desea hacer? 1. Procesar archivos. 2. Monitoreo del sistema. 3. Salir del menú." 
read opcion

until [ $opcion -eq 3 ]
do
	if [ $opcion -eq 1 ]; then 
	#ruta a downloader.sh N
	elif [ $opcion -eq 2 ]; then 
	#ruta a monitor.sh 
	else 
	echo"Opción inválidad. Vuelva a intentarlo." 
	fi
done
