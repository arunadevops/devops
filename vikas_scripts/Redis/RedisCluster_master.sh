#!/bin/sh 
#yum installs 

sudo yum -y install epel-release
sudo yum update

sudo yum install redis

sudo systemctl start redis
sudo systemctl enable redis

reds-cli ping 

sudo cp -pr /etc/redis.conf /etc/redis.conf.orig
sudo sed -i 's/appendonly[[:space:]]no/appendonly yes/g' /etc/redis.conf

sudo systemctl restart redis

redis-cli ping 


#Tuning Params 
sudo cp -pr /etc/sysctl.conf /etc/sysctl.conf.orig
sudo sysctl vm.overcommit_memory=1



sudo cp /etc/redis.conf /etc/redis.conf.orig2 

IP=`hostname -i`
sed "s/bind[[:space:]]127.0.0.1/bind 127.0.0.1 ${IP}/g" /etc/redis.conf
