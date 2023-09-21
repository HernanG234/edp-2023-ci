#!/bin/bash


fecha_hora=$(date +"%d_%m_%y:%H_%M_%S")

nombre_archivo="report_${fecha_hora}.txt"
{
    echo "Uso de CPU:"
    top -b -n 1 | head -n 10

    echo -e "\nUso de RAM:"
    free -m

    echo -e "\nNúmero de procesos en ejecución:"
    ps aux | wc -l

    echo -e "\nEspacio libre en el disco:"
    df -h
} > "$nombre_archivo"

echo "Informe generado y guardado como $nombre_archivo"

mv "$nombre_archivo" outputs/
