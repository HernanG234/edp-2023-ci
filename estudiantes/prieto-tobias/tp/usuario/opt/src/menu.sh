#!/bin/bash
clear

while true; do
    echo -e "\nIngrese una opción"
    echo "1) para descargar y clasificar archivos"
    echo "2) para monitorear el sistema"
    echo "3) para comprimir los archivos"
    echo "4) para salir"
    read opcion

    case $opcion in
        1)
            echo -e "\nPROCESANDO ARCHIVOS"
            /opt/src/downloader.sh
            /opt/src/clasificador.sh
            ;;
        2)
            echo -e "\nOBTENIENDO INFORMACIÓN DEL SISTEMA"
            /opt/src/monitor.sh
            ;;
        3)
            echo -e "\nCOMPRIMIENDO OUTPUTS"
            /opt/src/compresor.sh
            ;;
        4)
            exit 0
            ;;
        *)
            echo -e "\nERROR, OPCIÓN INVÁLIDA, INTENTE NUEVAMENTE"
            ;;
    esac
done
