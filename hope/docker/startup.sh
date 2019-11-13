#!/bin/bash
#chmod -R 755 ./bazaar
service mysql start 
service apache2 start
echo "Staring Java App"
# java path: /usr/local/openjdk-8/bin/java
#/usr/bin/java -Djava.net.useSystemProxies=true -server -jar dataturks-1.0-SNAPSHOT.jar server onprem.yml &
java -Djava.net.useSystemProxies=true -server -jar dataturks-1.0-SNAPSHOT.jar server onprem.yml &
sleep 7
#Run node app
cd bazaar
echo "Staring npm run start-onprem"
npm run start-onprem

while true; do sleep 1; done