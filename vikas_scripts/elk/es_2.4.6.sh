
#!/bin/sh
yum -y install wget 
yum -y install tar 
yum -y install java-1.8.0-openjdk*
useradd elk 
mkdir /u01/elk 
chown -R elk:elk /u01
echo "L4zyTyp3" | passwd --stdin elk

sudo -u elk bash << EOF 
cd /home/elk
curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.6/elasticsearch-2.4.6.tar.gz
mkdir -p /u01/elk 
tar -xzvf elasticsearch-2.4.6.tar.gz -C /u01/elk
cd /u01/elk/elasticsearch-2.4.6/bin 
nohup ./elasticsearch >startup.out 2>&1 &
EOF 
