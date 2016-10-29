#!/bin/bash

yum install epel-release -y

sleep 5

yum install java-1.8.0-openjdk.x86_64 -y

sleep 5

java -version

cp /etc/profile /etc/profile_backup

echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile

source /etc/profile

sleep 5

echo $JAVA_HOME

echo $JRE_HOME

exit 0
