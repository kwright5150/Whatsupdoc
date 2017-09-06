#!/bin/bash 
 
echo Refreshing repositories... 
 
# apt-get update 
 
echo Installing Suricata dependencies... 
apt-get -y install libpcre3 libpcre3-dbg libpcre3-dev build-essential autoconf automake libtool libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev libjansson4 pkg-config wget net-tools tcpdump 
 
echo Downloading sourcecode.. 
wget https://www.openinfosecfoundation.org/download/suricata-4.0.0.tar.gz 
 
Echo Unpacking... 
tar xvzf suricata-4.0.0.tar.gz 
 
Echo changing directory... 
alias proj="cd suricata-4.0.0" 
 
Echo Building Suricata 
./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var && make && make-install 
 
echo adding user and group 
adduser suri 

## don't need to add group because suricata does this by default 

echo Making sure suri owns the logging directory.. 

mkdir /var/log/suricata

chown -R suri:suri /var/log/suricata/ 
