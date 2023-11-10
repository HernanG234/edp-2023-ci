#!/bin/bash

while true; do
    clear 

    echo "Seleccione una opción:"
    echo "1. Procesar archivos (Descarga, clasificación y archivo comprimido)"
    echo "2. Monitoreo del sistema (Generar reporte del sistema)"
    echo "3. Limpiar archivos"

    read -p "Ingrese el número de la opción deseada: " opcion

    current_dir=$(dirname "$0")

    case "$opcion" in
        1)
            "$current_dir/descargas.sh"
            "$current_dir/clasificador.sh"
            "$current_dir/compresor.sh"
            ;;
        2)
            "$current_dir/monitor.sh"
            ;;

        3)
            rm -r "/tmp/outputs"

            ;;

        *)
            echo "Opción no válida. Por favor, seleccione 1, 2 o 3."
            ;;
    esac

    read -p "Presione enter para volver a ver el menú"
done


