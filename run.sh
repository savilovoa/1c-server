#!/bin/sh

docker run --name 1c-srv --restart=always \
   -d \
  --volume /home/usr1cv8:/home/usr1cv8 \
  --volume /var/log/1C:/var/log/1C \
  --volume /etc/localtime:/etc/localtime:ro \
  -p 1540-1541:1540-1541 -p 1560-1591:1560-1591 \
  -h ais-b-u \
  --link=postgresql:db \
 savilovoa/1c-server:8.3.10-2699
