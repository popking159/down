#!/bin/sh
##setup command=wget -q "--no-check-certificate" https://github.com/popking159/down/raw/master/novax-fhd-install.sh -O - | /bin/sh

echo "removing old version"
rm -r /usr/share/enigma2/Novax-FHD
echo "downloading new version"
wget -O  /var/volatile/tmp/Novax-FHD-MNASR-v1.1.tar.gz https://github.com/popking159/down/raw/master/Novax-FHD-MNASR-v1.1.tar.gz
echo "installing new version"
tar -xzf /var/volatile/tmp/Novax-FHD-MNASR-v1.1.tar.gz -C /
rm -rf /var/volatile/tmp/Novax-FHD-MNASR-v1.1.tar.gz


sync
echo "#########################################################"

echo "#########################################################"
sleep 3
#killall enigma2
exit 0
