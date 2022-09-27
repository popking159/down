#!/bin/sh
##setup command=wget -q "--no-check-certificate" https://github.com/popking159/down/raw/master/novax-fhd-install.sh -O - | /bin/sh

echo ""

wget -O  /var/volatile/tmp/Novax-FHD-MNASR-v1.0.tar.gz https://github.com/popking159/down/raw/master/Novax-FHD-MNASR-v1.0.tar.gz
tar -xzf /var/volatile/tmp/Novax-FHD-MNASR-v1.0.tar.gz -C /
rm -rf /var/volatile/tmp/Novax-FHD-MNASR-v1.0.tar.gz


sync
echo "#########################################################"

echo "#########################################################"
sleep 3
#killall enigma2
exit 0
