#!/bin/bash


fecha_hora=$(date +"%d_%m_%y:%H_%M_%S")

nombre_archivo="report_${fecha_hora}.txt"

numero_de_procesos=$(ps aux | wc -l)
resultado=$((numero_de_procesos - 1))

{
    echo "Uso de CPU:"
    top -b -n 1 | head -n 3 | tail -1

    echo -e "\nUso de RAM:"
    free -m | head -2 | tail -1

    echo -e "\nNúmero de procesos en ejecución: "
    echo $resultado

    echo -e "\nEspacio libre en el disco:"
    df -h --output=pcent / | tail -1
} > "$nombre_archivo"

echo "Informe generado y guardado como $nombre_archivo"

mv "$nombre_archivo" outputs/
