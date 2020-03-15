#!/bin/bash
# set debug mode
set -x

# output log of userdata to /var/log/user-data.log
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
# create and put some content in the file
touch /home/ec2-user/created_by_userdata.txt
(
cat << 'EOP'
Hey there!!!
EOP
) > /home/ec2-user/created_by_userdata.txt

echo "hello world"
echo "checking system info"


sudo yum update -y
sudo yum -y install wget 
echo y | sudo amazon-linux-extras install docker
if [ $? = 0 ]
              then
                echo "Docker Setup is successful"  >>/home/ec2-user/created_by_userdata.txt
              else
                echo "Docker Setup has failed"     >>/home/ec2-user/created_by_userdata.txt
              exit
             fi

sudo service docker start
if [ $? = 0 ]
              then
                echo "Docker Start is successful"  >>/home/ec2-user/created_by_userdata.txt
              else
                echo "Docker Start has failed"     >>/home/ec2-user/created_by_userdata.txt
              exit
             fi
sudo usermod -a -G docker ec2-user
sudo docker version  >>/home/ec2-user/created_by_userdata.txt
sudo docker images   >>/home/ec2-user/created_by_userdata.txt

sudo docker pull centos
sudo docker pull nginx
sudo docker pull ubuntu
sudo docker pull alpine    
