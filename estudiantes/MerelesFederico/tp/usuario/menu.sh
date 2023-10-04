#!/bin/bash


function descyclas() {

	echo "ejecutando descarga y clasificacion de archivos."
	bash ./downloader.sh
	bash ./clasificador.sh
}

function monitor() {
        echo "ejecutando monitor de estado del computador."
        bash ./monitor.sh
}

echo "MENU PRINCIPAL: Ingrese una opcion a realizar"
echo "1. Descargar y clasificar archivos" 
echo "2. Generar un reporte del status de la computadora" 
echo "3. salir"

read cant
echo $cant

if [ $cant -eq 1 ]
then
	descyclas()

elif [ $cant -eq 2 ]
then
	monitor()

elif [ $opcion -eq 3 ]
then
	echo "Saliendo."
	exit 0

else
	echo "ingrese una opcion correcta" 
	exit 1
fi


