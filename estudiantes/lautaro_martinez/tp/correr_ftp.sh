#!/bin/bash

docker run -d -p 21:21 -p 21000-21010:21000-21010 --network mi_network -e USERS="tuiaedpuser|tuiaedpuser" -v /home/tuia/Documentos/GitHub/edp-2023-ci/estudiantes/lautaro_martinez/tp/outputs:/ftp/tuiaedpuser --name ftp delfer/alpine-ftp-server