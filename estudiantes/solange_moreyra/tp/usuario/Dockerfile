FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y curl
RUN apt-get install -y file


ADD ["./opt/","/opt/"]

WORKDIR "/opt/src"

ENTRYPOINT ["./menu"]

