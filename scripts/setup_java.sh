mkdir -p /tmp/java;cd /tmp/java;

#Download Java 
chmod a+x jdk-8u131-linux-x64.rpm
rpm -ivh jdk-8u131-linux-x64.rpm

#wget jce_policy-8.zip
#unzip jce_policy-8.zip
#cp /tmp/java/UnlimitedJCEPolicyJDK8/*.jar /usr/java/jdk1.8.0_131/jre/lib/security/
chmod -R 777 /usr/java/jdk1.8.0_131/jre/lib/security/
echo "step 3 complete"

update-alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_131/bin/java 1
update-alternatives --install /usr/bin/javac javac /usr/java/jdk1.8.0_131/bin/javac 1
update-alternatives --set java /usr/java/jdk1.8.0_131/bin/java
update-alternatives --set javac /usr/java/jdk1.8.0_131/bin/javac
