#!/bin/bash 

mkdir -p outputs/
mkdir -p outputs/txt/ 
mkdir -p outputs/snd/ 
mkdir -p outputs/img/ 

n_img=1
n_txt=1
n_snd=1

# while o for 

dwnld=$(file $1) # archivos de la carpeta


if [[ $dwnld =~ "ASCII" ]]; then
   mv $1 outputs/txt/ 
   mv outputs/txt/$1 outputs/txt/texto${n_txt}.txt
   n_txt=$((n_txt+1))

elif [[ $dwnld =~ "RIFF" ]]; then
	mv $1 outputs/snd/
        mv outputs/snd/$1 outputs/snd/sonido${n_snd}.wav
	n_snd=$((n_snd+1))

else 
	mv $1 outputs/img/
	mv outputs/img/$1 outputs/img/imagen${n_img}.png
	n_img=$((n_img+1))

fi 

