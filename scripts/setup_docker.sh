#script to install docker ce on centos or rhel or oel
#script by - phanikishorelanka@gmail.com"

echo " Removing any Old Docker Versions" 
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine

yum -y install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --enable docker-ce-edge
yum-config-manager --enable docker-ce-test
yum -y install docker-ce-18.06*

echo "Docker Setup is complete" 

yum list docker-ce --showduplicates | sort -r
echo "Starting up Docker"
systemctl start docker

echo "Docker started successfully" 

echo " CHecking Docker status..........."

systemctl status docker 

echo " setting docker to run after reboot"

chkconfig docker on

echo ################# Checking Docker Version ##############
sleep 3
docker version


#setup virtual box 
wget -N https://download.virtualbox.org/virtualbox/5.2.8/VirtualBox-5.2.8-121009-Linux_amd64.run
chmod a+x VirtualBox-5.2.8-121009-Linux_amd64.run
./VirtualBox-5.2.8-121009-Linux_amd64.run
