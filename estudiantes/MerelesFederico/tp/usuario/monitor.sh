#!/bin/bash
if [ ! -d reportes ]
then
	mkdir reportes
fi

CPU=$(top -b -n1 | head -n3 | tail -n1 | awk '{print $2}') # % porcentaje de cpu utilizado

PROCESOS=$(ps aux | sed -e "1d" | wc -l) # El comando sed elimina la primera fila de encabezados

RAM=$(free --giga -h | awk '{print $3}' | head -n2 | tail -n 1) # memoria usada, parametros: --giga values in gb | -h aniade el G al final del numero | awk imprime la tercera columna

DISCO=$(df -h / | sed -e "1d" | awk '{print $4}') # Imprime el disco disponible en GB

report=$(echo "reporte_$(date +%d_%a_%B_%Y=%H:%M:%S)")

echo "MONITOR DE COMPUTADORA"

echo "% de CPU utlizado $CPU" >> $report
echo "cantidad de PID activos $PROCESOS" >> $report
echo "cantidad de RAM(Gb) utilizada $RAM" >> $report
echo "cantidad de DISCO disponible $DISCO" >> $report

mv $report ./reportes/$report
echo "reporte movido a la carpetas de reportes" 

