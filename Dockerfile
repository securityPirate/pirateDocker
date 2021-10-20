FROM ubuntu:latest

RUN mkdir -p /scripts ~/.config/subfinder ~/.config/notify

WORKDIR /scripts


COPY installGo.sh .
COPY installTools.sh .
RUN chmod +x ./installGo.sh ./installTools.sh 
RUN ./installGo.sh
RUN ./installTools.sh


CMD source ../root/.profile
COPY config.yaml ../root/.config/subfinder/config.yaml
COPY provider-config.yaml ../root/.config/notify/provider-config.yaml