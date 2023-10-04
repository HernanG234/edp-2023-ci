FROM ubuntu

RUN apt update -y

#ADD ["./menu","/opt/src/menu"]

#ENTRYPOINT ["cron"]

ADD ["opt/","opt/"]

WORKDIR /opt/src/

ENTRYPOINT ["/opt/src/menu"]
