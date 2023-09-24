#!/bin/bash
clear

while true;do
	echo "Ingrese una opcion"
	echo "1) para descargar, clasificar y procesar archivos"
	echo "2) para monitorear el sistema"
	echo "3) para salir"
	read opcion
		
	case $opcion in 
		1)
			echo PROCESANDO ARCHIVOS
			/opt/src/downloader.sh
			/opt/src/clasificador.sh
			echo   ;;
		2)
			echo OBTENIENDO INFORMACION DEL SISTEMA
			/opt/src/monitor.sh;;
		3)
			exit 0
			;;
		*)
			echo ERROR, OPCION INVALIDA, INTENTE NUEVAMENTE;;
	esac
done
