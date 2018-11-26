#! /bin/bash

#Script for installing Packet Tracer 7.1.1
mkdir packet #Creates a folder named 'packet' for the files to be extracted into
mv 'Packet Tracer 7.1.1 for Linux 64 bit.tar.gz' ~/Downloads/packet #Moves the compressed filed into 'packet' directory
cd packet #Change to 'packet' directory
tar -xvf 'Packet Tracer 7.1.1 for Linux 64 bit.tar.gz' #Unzips the compressed Packet Tracer installer
./install #Runs the installer
chmod +x set_ptenv.sh #Makes shell scripts provided in the installer executeable
chmod +x set_qtenv.sh
./set_ptenv.sh #Runs shell scripts provided in the installer
./set_qtenv.sh
cd /opt/pt/bin #Change directory where the PT files reside
cp /opt/pt/lib/libQt5* /usr/lib/x86_64-linux-gnu #Copies PT libraries into the correct folder
wget http://launchpadlibrarian.net/341176988/libicu52_52.1-3ubuntu0.7_amd64.deb #Installs older versions of libraries required to run PT
dpkg -i libicu52_52.1-3ubuntu0.7_amd64.deb
updatedb
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo 'deb http://mirrors.kernel.org/ubuntu/ xenial main' >> sources.list #Adds repository for a missing library
apt update
apt install libpng12-0 #Installs the library
exit 0
