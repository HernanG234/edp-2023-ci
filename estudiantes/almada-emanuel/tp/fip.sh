#!/bin/bash 

docker run -d -p 2121 -p 21000-21010-21000-21010 -e USERS="tuiaedpuser|tuiaedpuser" -v ~/edp-2023-ciMANU/outputs_generador/:/ftp/tuiaedpuser delfer/alpine-ftp-server


