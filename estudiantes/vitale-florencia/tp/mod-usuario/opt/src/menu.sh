#!/bin/bash


echo "Seleccione una opción:"
echo "1. Procesar archivos (Descarga, clasificación y archivo comprimido)"
echo "2. Monitoreo del sistema (Generar reporte del sistema)"
read -p "Ingrese el número de la opción deseada: " opcion

case $opcion in
    1)
        ./descargas.sh  
        ./clasificador.sh  
        ./compresor.sh  
        ;;
    2)
        ./monitor.sh 
        ;;
    *)
        echo "Opción no válida. Por favor, seleccione 1 o 2."
        ;;
esac

