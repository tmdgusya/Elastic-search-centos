FROM --platform=linux/amd64 debian:latest

LABEL email="dev0jsh@gmail.com"
LABEL description="elasticsearch on debian linux"

# setup
RUN apt-get update
RUN apt-get upgrade
RUN apt-get -y install wget
RUN apt-get install -y curl
RUN apt-get install -y dpkg

RUN apt-get update && apt-get install -y gnupg2
RUN apt-get install -y apt-transport-https
RUN apt-get update

# install jdk
RUN apt-get install -y default-jdk
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.1-amd64.deb
RUN dpkg -i elasticsearch-7.14.1-amd64.deb

# elasticsearch engine packages update
RUN apt update
RUN apt install -y elasticsearch

# install kibana
RUN curl -L -O https://artifacts.elastic.co/downloads/kibana/kibana-7.14.1-linux-x86_64.tar.gz
RUN tar xzvf kibana-7.14.1-linux-x86_64.tar.gz



