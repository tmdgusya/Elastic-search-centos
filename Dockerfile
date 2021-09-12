FROM ubuntu:20.04

LABEL email="dev0jsh@gmail.com"
LABEL description="elasticsearch on debian linux"

# setup
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get install -y curl
RUN apt-get install -y dpkg

RUN apt-get update && apt-get install -y gnupg2
RUN apt-get install -y apt-transport-https
RUN apt-get update

# install jdk
RUN apt-get install -y default-jdk

# install elasticsearch
RUN curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt update
RUN apt install -y elasticsearch

# install kibana
RUN curl -L -O https://artifacts.elastic.co/downloads/kibana/kibana-7.14.1-linux-x86_64.tar.gz
RUN tar xzvf kibana-7.14.1-linux-x86_64.tar.gz

EXPOSE 9200
EXPOSE 9300



