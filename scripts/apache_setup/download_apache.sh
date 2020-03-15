export http_proxy=http://www-proxy.us.oracle.com:80 ;export https_proxy=http://www-proxy.us.oracle.com:80 ; export bootstrap_proxy=http://www-proxy.us.oracle.com:80
mkdir -p /scratch/binaries ; cd /scratch/binaries
echo "Downloading Apache Files"
wget http://mirrors.hust.edu.cn/apache//httpd/httpd-2.4.27.tar.gz
wget http://mirror.bit.edu.cn/apache//apr/apr-1.6.2.tar.gz
wget http://mirror.bit.edu.cn/apache//apr/apr-util-1.6.0.tar.gz
wget https://ftp.pcre.org/pub/pcre/pcre-8.00.tar.gz
for i in `ls *gz`
do
echo $i
tar -xvf $i
done

