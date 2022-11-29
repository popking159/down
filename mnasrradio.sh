#!/bin/sh
##setup command=wget -q "--no-check-certificate" https://github.com/popking159/down/raw/master/mnasrradio.sh -O - | /bin/sh

echo "removing old audio"
rm -rf /etc/enigma2/ipaudio.json
echo "."
echo "..."
echo "....."
echo "......."
echo "........."
echo "..........."
wget -O  /etc/enigma2/ipaudio.json https://github.com/popking159/down/raw/master/ipaudio.json
echo "adding new audio"
echo "."
echo "..."
echo "....."
echo "......."
echo "........."
echo "..........."
echo "ENJOY"

sync
echo "#########################################################"

echo "#########################################################"
sleep 3
#killall enigma2
exit 0
