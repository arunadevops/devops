cd /scratch/binaries/apr-util*
mkdir -p /usr/local/apr-util
./configure --prefix=/usr/local/apr-util --with-apr=/usr/local/apr
make 
make install 
