cd /scratch/binaries/httpd*
mkdir -p /scratch/Apache
./configure --prefix=/scratch/Apache --enable-proxy --enable-rewrite --enable-proxy-connect --enable-proxy-loadbalancer --enable-so --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr-util --with-pcre=/usr/local/pcre
make 
make install 

