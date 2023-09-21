FROM debian:latest

RUN apt-get update -y
RUN apt-get install bash -y
RUN apt-get install curl -y
RUN apt-get install cron -y
RUN apt-get install procps -y

COPY . /tp

WORKDIR /tp

RUN ls /tp

RUN chmod +x /tp/modulo_usuario/menu.sh
RUN chmod +x /tp/modulo_usuario/clasificador.sh
RUN chmod +x /tp/modulo_usuario/compresor.sh
RUN chmod +x /tp/modulo_usuario/descargador.sh
RUN chmod +x /tp/modulo_usuario/monitor.sh

RUN echo "* * * * * /tp/modulo_generador/generador.sh" > /etc/cron.d/mycronjob

CMD ["/tp/modulo_usuario/menu.sh"]