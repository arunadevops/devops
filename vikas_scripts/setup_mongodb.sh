yum -y install wget 
cd /etc/yum.repos.d/
wget https://raw.githubusercontent.com/phanikishorelanka/docker-k8s-pklanka/master/mongo.repo
cp /etc/security/limits.conf /etc/security/limits.conf.orig
echo mongod soft nofile 64000  >>/etc/security/limits.conf
echo mongod hard nofile 64000 >>/etc/security/limits.conf
sysctl -p

yum -y install mongodb-org
wget https://raw.githubusercontent.com/phanikishorelanka/docker-k8s-pklanka/master/vikas_scripts/sample.js
echo "testing Mongo db status"
mongo < sample.js

