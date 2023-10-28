#!/bin/bash

docker rm -f tp
docker run -it --name tp --network mi_network tp