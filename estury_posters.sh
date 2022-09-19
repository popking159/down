#!/bin/sh
##setup command=wget -O  /var/volatile/tmp/EstuaryV2XPoster3P.tar.gz https://github.com/popking159/down/raw/master/EstuaryV2XPoster3P.tar.gz

echo ""

wget -O  /var/volatile/tmp/EstuaryV2XPoster3P.tar.gz https://github.com/popking159/down/raw/master/EstuaryV2XPoster3P.tar.gz
tar -xzf /var/volatile/tmp/EstuaryV2XPoster3P.tar.gz -C /
rm -rf /var/volatile/tmp/EstuaryV2XPoster3P.tar.gz


sync
echo "#########################################################"

echo "#########################################################"
sleep 3
#killall enigma2
exit 0
