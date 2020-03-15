#!/bin/bash
sudo yum -y install wget 
sudo wget https://gist.githubusercontent.com/Greeshu/a5833afa286147d7672e975c798e8691/raw/316e39b97c1af1461de6e013147c626daf5f299e/mongo_script
sudo chmod +x mongo_script
sudo sh -x mongo_script
sudo /sbin/chkconfig mongod on
sudo cp -pr /etc/mongod.conf /etc/mongod.conf.orig 
sudo sed -i s/mongo.domain.net/mongo1.domain.net/g /etc/mongod.conf 
sudo systemctl restart mongod.service
sudo wget https://raw.githubusercontent.com/phanikishorelanka/docker-k8s-pklanka/master/vikas_scripts/sample.js
echo "testing Mongo db status"
mongo mongo1.domain.net --ssl --sslCAFile /etc/ssl/mongo_ssl/CA.pem --sslPEMKeyFile /etc/ssl/mongo_ssl/mclient.pem <sample.js

if [ $? -eq 0 ]; then
    echo "Mongo DB Verification successful Before Security Authentication"
else
    echo "Mongo DB Verification Failed Before Security Authentication"
    exit;
fi

sudo cp -pr /etc/mongod.conf /etc/mongod.conf.orig
sudo sed -i s/^#security/security/g /etc/mongod.conf
sudo sed -i s/^'#  authorization'/'  authorization'/g /etc/mongod.conf
sudo sed -i s/^'#  keyFile'/'  keyFile'/g /etc/mongod.conf
sudo sed -i s/^#replication/replication/g /etc/mongod.conf
sudo sed -i s/^'#  replSetName'/'  replSetName'/g /etc/mongod.conf
sudo service mongod restart

echo "verifying after the cluster has been setup"
wget https://github.com/phanikishorelanka/docker-k8s-pklanka/blob/master/vikas_scripts/sample2.js
mongo mongo1.domain.net --ssl --sslCAFile /etc/ssl/mongo_ssl/CA.pem --sslPEMKeyFile /etc/ssl/mongo_ssl/mclient.pem < sample2.js

if [ $? -eq 0 ]; then
    echo "Mongo DB Verification successful after change"
else
    echo "Mongo DB Verification Failed"
    exit;
fi





