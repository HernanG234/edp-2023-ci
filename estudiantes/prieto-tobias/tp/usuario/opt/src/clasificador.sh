#!/bin/bash


mkdir -p outputs
mkdir -p outputs/texto
mkdir -p outputs/sonido
mkdir -p outputs/imagen

cd salida-random
for file in *; do
	tipo_archivo=$(file $file)
	if echo $tipo_archivo | grep -qE "RIFF|audio";then
	mv $file ../outputs/sonido
	elif echo $tipo_archivo | grep -qE "ASCII";then
	mv $file ../outputs/texto
	else
	mv $file ../outputs/imagen
	fi
done
