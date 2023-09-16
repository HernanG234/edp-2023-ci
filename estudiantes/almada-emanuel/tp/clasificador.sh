#!/bin/bash 

inputs=input_downloader/

mkdir -p outputs_clasificador/
mkdir -p outputs_clasificador/txt/ 
mkdir -p outputs_clasificador/snd/ 
mkdir -p outputs_clasificador/img/ 

n_img=1
n_txt=1
n_snd=1

for i in $(ls $inputs/)
do

 dwnld=$(file $1) # archivos de la carpeta


 if [[ $dwnld =~ "ASCII" ]]; then
   mv $1 outputs_clasificador/txt/ 
   mv outputs_clasificador/txt/$1 outputs_clasificador/txt/texto${n_txt}.txt
   n_txt=$((n_txt+1))

 elif [[ $dwnld =~ "RIFF" ]]; then
	mv $1 outputs_clasificador/snd/
        mv outputs_clasificador/snd/$1 outputs_clasificador/snd/sonido${n_snd}.wav
	n_snd=$((n_snd+1))

 else 
	mv $1 outputs_clasificador/img/
	mv outputs_clasificador/img/$1 outputs_clasificador/img/imagen${n_img}.png
	n_img=$((n_img+1))

 fi 
 $cant_archivos=$(($cant_archivos-1))
done
