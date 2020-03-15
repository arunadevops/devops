sudo yum -y install java-1.8.0-openjdk-devel

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install jenkins
sudo systemctl start jenkins
systemctl status jenkins

#enable jenkins to start at system startup
sudo systemctl enable jenkins

echo "check your firewall rules and disable firewalld"
echo "jenkins is successfully installed"
echo "http://<hostname>:8080/ to acess jenkins"
echo "initial jenkins password is "
cat /var/lib/jenkins/secrets/initialAdminPassword
