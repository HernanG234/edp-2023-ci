#!/bin/bash

# Menú principal
while true; do
    echo "Menú Principal:"
    echo "1. Procesar archivos (Descargar, Clasificar, Comprimir)"
    echo "2. Monitoreo del sistema (Generar informe)"
    echo "3. Salir"

    read -p "Seleccione una opción (1/2/3): " opcion

    case $opcion in
        1)
            # Ejecutar el script de Descargador (Downloader)
            ./downloader.sh

            # Ejecutar el script de Clasificador de Archivos (clasificador.sh)
            ./clasificador.sh

            # Ejecutar el script de Compresor (compresor.sh)
            ./compresor.sh
            ;;
        2)
            echo "Generando informe de monitoreo del sistema..."
            # Ejecutar el script de Monitoreo del Sistema (monitor.sh)
            ./monitor.sh
            echo "Informe de monitoreo del sistema generado."
            ;;
        3)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Seleccione una opción válida (1/2/3)."
            ;;
    esac
done

