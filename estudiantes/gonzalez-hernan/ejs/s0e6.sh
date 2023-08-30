#!/bin/bash

OUTPUTS_DIR="outputs"

if [ ! -d $OUTPUTS_DIR ]; then
	mkdir $OUTPUTS_DIR
fi

echo "Hola $USER" > $OUTPUTS_DIR/archivo.6
