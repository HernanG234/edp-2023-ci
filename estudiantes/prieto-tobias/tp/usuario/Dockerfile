FROM ubuntu

#le instalo todo eso para entrar al contenedor y trabajar mas comodo
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y file
ADD ["opt/","opt/"]
WORKDIR /opt/src/

ENTRYPOINT ["/opt/src/menu.sh"]
