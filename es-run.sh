docker build . -t elastic-search:ubuntu

docker run -d -p 9200:9200 -p 9300:9300 -it elastic-search:ubuntu /bin/bash 

