cd /scratch/binaries/pcre*
mkdir -p /usr/local/pcre
./configure --prefix=/usr/local/pcre --disable-cpp
make 
make install 
