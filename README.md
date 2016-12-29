# Selenium Docker

This project having capabilities of running selenium test cases on docker container

also having capabilities of selenium grid

folder description:

- __src/main/resources__: Image for running a Selenium Grid Hub,Selenium node with Chrome installed, needs to be connected to a Selenium Grid Hub,Selenium node with Firefox installed, needs to be connected to a Selenium Grid Hub
- __src/test/resources__: Contains two files test.sh and tearDown.sh

test.sh : This file is used to build docker images available in /Hub , /NodeChrome and /NodeFirefox folder. Also using this file we can run all containers

tearDown.sh : This file is used to stop and remove all containers 
