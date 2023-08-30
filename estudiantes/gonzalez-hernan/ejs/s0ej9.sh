#!/bin/bash

#mkdir CREA DIRECTORIOS
#touch CREA ARCHIVOS
#ln CREA ENLACES
source .env

mkdir -p $OUTPUTS_DIR/dir.a/dir.b
mkdir -p $OUTPUTS_DIR/dir.a/dir.c

touch $OUTPUTS_DIR/dir.a/dir.b/file.a
touch $OUTPUTS_DIR/dir.a/dir.b/file.b

ln -s ../dir.b/file.a $OUTPUTS_DIR/dir.a/dir.c/link.a 
