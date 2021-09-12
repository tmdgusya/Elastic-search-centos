docker build . -t elastic-search:debian

docker run -d -p 9200:9200 -it elastic-search:debian /bin/bash 

