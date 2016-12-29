#!/bin/sh

echo '\n\n*************************************** logs of CHROME node container *******************************************'
#  docker logs $NODE_CHROME | tee node_chrome.log
  echo '\nTearing down Selenium Chrome Node container *** Chrome node down ***\n'
  docker stop nodeChrome
  docker rm nodeChrome


echo '\n\n*************************************** logs of FIREFOX node container *******************************************'
#  docker logs $NODE_FIREFOX | tee node_firefox.log
  echo '\nTearing down Selenium Firefox Node container *** FireFox node down ***\n'
  docker stop nodeFirefox
  docker rm nodeFirefox


echo '\n\n*************************************** logs of HUB container *******************************************'
#  docker logs $HUB | tee hub.log
  echo '\n***  At last removing hub  ***'
 docker stop Hub
  docker rm Hub


echo '\nDone'
echo '\n\n\n*******************************************end of script******************************************'
