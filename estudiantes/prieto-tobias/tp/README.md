Pasos a ejecutar:

Crear una carpeta "output" preferentemente en el mismo nivel de jerarquia que el Dockerfile en caso de no existir

Crear imagen:
	docker build -t img-contenedor .

Correr imagen:
	docker run -it -v /home/tobias/edp-2023-ci/estudiantes/prieto-tobias/tp/output:/tmp/output img-generador

Correr servidor ftp: 
	docker run -p 21:21 -p 21000-21010:21000-21010 -e USERS="tuiaedpuser|tuiaedpuser" -v /home/tobias/edp-2023-ci/estudiantes/prieto-tobias/tp/output:/ftp/tuiaedpuser delfer/alpine-ftp-server


Listar elementos del servidor:
	curl -l ftp://tuiaedpuser:tuiaedpuser@0.0.0.0

Crear la imagen del contenedor del usuario:
	docker build -t img-usuario .


Ejecutar el contenedor usuario:
	docker run -it -v /home/tobias/edp-2023-ci/estudiantes/prieto-tobias/tp/usuario/opt/src/salida_compresion/:/opt/src/salida_compresion --network="host" usr /bin/bash

Descomprimir el archivo:
	tar -xzvf outputs.tar.gz