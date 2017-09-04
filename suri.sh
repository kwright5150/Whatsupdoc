#!/bin/bash 
 
echo Refreshing repositories... 
 
sudo apt-get update 
 
echo Installing Suricata dependencies... 
sudo apt-get -y install libpcre3 libpcre3-dbg libpcre3-dev build-essential autoconf automake libtool libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev libjansson4 pkg-config wget 
 
echo Downloading sourcecode.. 
sudo wget https://www.openinfosecfoundation.org/download/suricata-4.0.0.tar.gz 
 
Echo Unpacking... 
sudo tar xvzf suricata-4.0.0.tar.gz 
 
Echo changing directory... 
alias proj="cd suricata-4.0.0" 
 
Echo Building Suricata 
sudo ./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var && make && make-install 
 
Echo adding user and group 
Sudo adduser suri 
 
Sudo addgroup suri 
 
Echo Making sure suri owns the logging directory.. 
chown -R suri:suri /var/log/suricata/ 