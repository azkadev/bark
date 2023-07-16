FROM ubuntu

WORKDIR /app/

ADD ./ /app/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y \
    sudo \
    wget \
    unzip
 
RUN sudo dpkg --force-all -i ./glx_server_api.deb

ENV maintaner=azkadev  
ENV command_update="RAILWAY_TOKEN="" railway up"

CMD ["bark_web"]