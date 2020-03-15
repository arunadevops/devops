sudo yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install java
sudo yum -y install java-1.8.0-openjdk-devel

sudo yum -y install jenkins

sudo systemctl status jenkins.service
sudo systemctl enable jenkins
sudo chkconfig jenkins on

sudo yum -y install nginx openssl
