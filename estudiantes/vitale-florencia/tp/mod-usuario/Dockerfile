FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl file

ADD ["opt/","opt/"]

ENTRYPOINT ["/opt/src/menu.sh"]
