#!/bin/bash
sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev
wget http://nginx.org/download/nginx-1.9.15.tar.gz
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
tar -zxvf nginx-1.9.15.tar.gz
unzip master.zip
cd nginx-1.9.15
./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master
make
sudo make install
echo "rtmp {\n\tserver {\n\t\tlisten 1935;\n\t\tchunk_size4096\n\t\tapplication live{\n\t\t\tlive on;\n\t\t\tecord off;\n\t\t}\n\t}\n}" >> /usr/local/nginx/conf/nginx.conf
