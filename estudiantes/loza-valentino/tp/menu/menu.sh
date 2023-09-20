#!/bin/bash

procesar_archivos() {
	echo "Procesando archivos"
	/home/valentino/edp-2023-ci/estudiantes/loza-valentino/tp/generador_archivos/generador.sh
	/home/valentino/edp-2023-ci/estudiantes/loza-valentino/tp/clasificador_archivos/clasificador.sh
	/home/valentino/edp-2023-ci/estudiantes/loza-valentino/tp/compresor/compresor.sh
}

monitoreo_sistema() {
	echo "Generando reporte del sistema"
	/home/valentino/edp-2023-ci/estudiantes/loza-valentino/tp/monitor/monitor.sh
}

while true; do
	echo "Ingrese una opcion"
	echo "1. Procesar archivos"
	echo "2. Monitoreo del sistema"
	echo "3. Salir"
	
	read opcion

	case $opcion in
		1)
			procesar_archivos
			;;
		2)
			monitoreo_sistema
			;;
		3)
			echo "Saliendo"
			exit 0
			;;
		*)
			echo "Ingrese una opcion valida"
			;;
		esac
done
