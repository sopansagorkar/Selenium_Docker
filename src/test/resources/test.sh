#!/bin/sh

docker build -t selenium/hub ../../main/resources/Hub/

docker build -t selenium/node-firefox ../../main/resources/NodeFirefox/

docker build -t selenium/node-chrome ../../main/resources/NodeChrome/

sleep 10

echo '\n\n*****Starting Selenium Hub Container...*****\n'

HUB=$(docker run -d --name Hub selenium/hub)

HubURL=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $HUB )

#HUB_NAME=$(docker inspect -f '{{ .Name  }}' $HUB | sed s:/::)

echo '\n\n*****Waiting for Hub to come online...*****\n'

docker logs -f $HUB &

sleep 2

echo '\n*****Starting Selenium Chrome node...*****\n'

NODE_CHROME=$(docker run -d --name nodeChrome --link Hub:hub  selenium/node-chrome)

ipCHROME_NODE=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $NODE_CHROME )


echo '\n*****Starting Selenium firefox node...*****\n'

NODE_FIREFOX=$(docker run -d --name nodeFirefox --link Hub:hub  selenium/node-firefox)

ipFIREFOX_NODE=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $NODE_FIREFOX )


docker logs -f $NODE_CHROME &

docker logs -f $NODE_FIREFOX &

echo '\n******Waiting for nodes to register and come online...******'

sleep 3s

SEARCH1="localhost"

REPLACE1="$HubURL"

sed -i "s%${SEARCH1}%${REPLACE1}%g"  ../java/com/cybage/alm/test/*




