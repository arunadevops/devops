#Commands 
sudo rm /var/lib/dpkg/lock
sudo dpkg --configure -a
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock

sudo apt-get update
sudo apt update

apt-get install net-tools
apt-get install ssh
apt-get install 
