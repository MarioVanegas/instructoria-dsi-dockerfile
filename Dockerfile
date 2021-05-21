FROM debian:stable-slim

WORKDIR /home

MAINTAINER Mario Edgardo Vanegas Cardoza VC17018

RUN apt update && apt upgrade -y && \
    apt install git -y && \
    apt install nginx -y && \
    apt install curl -y && \ 
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \ 
    apt-get install -y nodejs &&\ 
    npm install -g @quasar/cli &&\ 
    git clone "https://github.com/diseno2021/expedientemedico.git"  && \
    cd /home/expedientemedico/ && \ 
    git checkout v1.0 && \ 
    npm install && \
    quasar build && \ 
    cp -r dist/spa/* /var/www/html

 CMD ["nginx", "-g", "daemon off;"]
 EXPOSE 80

