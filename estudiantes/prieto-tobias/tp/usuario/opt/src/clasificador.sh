#!/bin/bash

mkdir -p outputs
mkdir -p outputs/texto
mkdir -p outputs/sonido
mkdir -p outputs/imagen

cont_audio=1
cont_imagen=1
cont_texto=1

cd salida-random
for file in *; do
    tipo_archivo=$(file "$file")
    
    if echo "$tipo_archivo" | grep -qE "RIFF|audio"; then
        mv "$file" "archivo-sonido${cont_audio}.wav"
        mv "archivo-sonido${cont_audio}.wav" "../outputs/sonido"
        cont_audio=$((cont_audio + 1))
    elif echo "$tipo_archivo" | grep -qE "ASCII"; then
        mv "$file" "archivo-texto${cont_texto}.txt"
        mv "archivo-texto${cont_texto}.txt" "../outputs/texto"
        cont_texto=$((cont_texto + 1))
    else
        mv "$file" "archivo-imagen${cont_imagen}.png"
        mv "archivo-imagen${cont_imagen}.png" "../outputs/imagen"
        cont_imagen=$((cont_imagen + 1))
    fi
done

cd ..

tar -czvf outputs.tar.gz outputs/
