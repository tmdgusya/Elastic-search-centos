FROM debian:latest

LABEL email="dev0jsh@gmail.com"
LABEL description="elasticsearch on debian linux"

# setup
RUN apt-get update
RUN apt-get upgrade
RUN apt-get -y install wget

RUN apt-get update && apt-get install -y gnupg2

# install jdk
RUN apt-get install -y default-jdk
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'

# elasticsearch engine packages update
RUN apt update
RUN apt install -y elasticsearch

RUN service elasticsearch restart

EXPOSE 9200



