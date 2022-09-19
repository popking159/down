#!/bin/sh
##setup command=wget -O  /var/volatile/tmp/ipaudio8.9.tar.gz https://github.com/popking159/down/raw/master/ipaudio8.9.tar.gz

echo ""

wget -O  /var/volatile/tmp/ipaudio8.9.tar.gz https://github.com/popking159/down/raw/master/ipaudio8.9.tar.gz
tar -xzf /var/volatile/tmp/ipaudio8.9.tar.gz -C /
rm -rf /var/volatile/tmp/ipaudio8.9.tar.gz


sync
echo "#########################################################"

echo "#########################################################"
sleep 3
#killall enigma2
exit 0
