FROM ubuntu

RUN apt-get update
RUN apt-get install -y cron
RUN apt-get install -y ffmpeg
RUN apt-get install -y imagemagick


#copia los archivos desde el host al contenedor
#se copian los archivos desde etc/ a /etc del contenedor, igual opt
ADD ["etc/","/etc/"]
ADD ["opt/","/opt/"]

RUN crontab /etc/cron.d/generador

ENTRYPOINT ["cron","-f","-L","15"]
