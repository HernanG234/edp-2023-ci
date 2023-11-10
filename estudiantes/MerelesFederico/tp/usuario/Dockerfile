FROM ubuntu 

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y file

WORKDIR /usuario

ADD ["clasificador.sh","."]
ADD ["menu.sh","."]
ADD ["downloader.sh","."]
ADD ["monitor.sh","."]
ADD ["reportes/","."]

ENTRYPOINT ["./menu.sh"]


