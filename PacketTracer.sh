#! /bin/bash

#Script for installing Packet Tracer 7.1.1
mkdir packet
mv 'Packet Tracer 7.1.1 for Linux 64 bit.tar.gz' ~/Downloads/packet
cd packet
tar -xvf 'Packet Tracer 7.1.1 for Linux 64 bit.tar.gz'
./install
chmod +x set_ptenv.sh
chmod +x set_qtenv.sh
./set_ptenv.sh
./set_qtenv.sh
cd /opt/pt/bin
cp /opt/pt/lib/libQt5* /usr/lib/x86_64-linux-gnu
wget http://launchpadlibrarian.net/341176988/libicu52_52.1-3ubuntu0.7_amd64.deb
dpkg -i libicu52_52.1-3ubuntu0.7_amd64.deb
updatedb
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo 'deb http://mirrors.kernel.org/ubuntu/ xenial main' >> sources.list
apt update
apt install libpng12-0
exit 0
