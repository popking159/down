#!/bin/sh
##wget https://raw.githubusercontent.com/popking159/down/master/installer-ffmpeg.sh -qO - | /bin/sh
######### Only These two lines to edit with new version ######
version=7.7
description="Some bug fixes"
#############################################################

TEMPATH='/tmp'
PLUGINPATH='/usr/lib/enigma2/python/Plugins/Extensions/IPAudio'

CHECK='/tmp/check'
BINDIR='/usr/bin/'
FFPPLAYERA='/tmp/ipaudio/bin/arm/ff4/ff-ipaudio'
FFPPLAYERM='/tmp/ipaudio/bin/mips/ff4/ff-ipaudio'
IPAUDIO='/tmp/ipaudio/usr/*'
PLAYLIST='/tmp/ipaudio/etc/ipaudio.json'
ASOUND='/tmp/ipaudio/etc/asound.conf'

uname -m >$CHECK
killall -9 ff-ipaudio
rm -r /usr/bin/ff-ipaudio >/dev/null 2>&1


# check depends packges
if [ -f /var/lib/dpkg/status ]; then
        STATUS='/var/lib/dpkg/status'
        OS='DreamOS'
else
        STATUS='/var/lib/opkg/status'
        OS='Opensource'
fi

if grep -q 'ffmpeg' $STATUS; then
        ffmpeg='Installed'
fi

if grep -q 'alsa-plugins' $STATUS; then
        alsaPlug='Installed'
fi

if [ "$ffmpeg" = "Installed" ] && [ "$alsaPlug" = "Installed" ]; then
        echo ""
else
        if [ $OS = "DreamOS" ]; then
                echo "=========================================================================="
                echo "Some Depends Need to Be downloaded From Feeds ...."
                echo "=========================================================================="
                echo "apt update ..."
                echo "=========================================================================="
                apt-get update
                echo "========================================================================"
                echo " Downloading ffmpeg ......"
                apt-get install ffmpeg -y
                echo "========================================================================"
                echo " Downloading alsa-plugins ......"
                apt-get install alsa-plugins -y
                echo "========================================================================"
        else
                echo "=========================================================================="
                echo "Some Depends Need to Be downloaded From Feeds ...."
                echo "=========================================================================="
                echo "Opkg Update ..."
                echo "========================================================================"
                opkg update
                echo "========================================================================"
                echo " Downloading ffmpeg ......"
                opkg install ffmpeg
                echo "========================================================================"
                echo " Downloading alsa-plugins ......"
                opkg install alsa-plugins
                echo "========================================================================"
        fi
fi


if grep -q 'alsa-plugins' $STATUS; then
        echo ""
else
        echo "#########################################################"
        echo "#         alsa-plugins Not found in feed                #"
        echo "#         IPaudio has not been installed                #"
        echo "#########################################################"
        rm -r /tmp/ipaudio >/dev/null 2>&1
        rm -f $CHECK >/dev/null 2>&1
        exit 1
fi

if grep -q 'ffmpeg' $STATUS; then
        echo ""
else
        echo "#########################################################"
        echo "#            FFmpeg Not found in feed                   #"
        echo "#         IPaudio has not been installed                #"
        echo "#########################################################"
        rm -r /tmp/ipaudio >/dev/null 2>&1
        rm -f $CHECK >/dev/null 2>&1
        exit 1
fi

ffmpeg_version=$(ffmpeg -version 2>&1 | sed -n "s/.* version \([^ ]*\).*/\1/p;")
IFS='.' read -r -a version_array <<<"$ffmpeg_version"
if [[ ${version_array[0]} -ge 5 ]]; then
        echo "[ FFmpeg 5 detected ]"
        FFPPLAYERA="/tmp/ipaudio/bin/arm/ff-ipaudio"
        FFPPLAYERM="/tmp/ipaudio/bin/mips/ff-ipaudio"
elif [[ "$ffmpeg_version" =~ ^n[4-9] ]]; then
        echo "[ FFmpeg 4 detected ]"

else
        echo "#########################################################"
        echo "#          FFmpeg version is below 4.x.x                #"
        echo "#         IPaudio has not been installed                #"
        echo "#########################################################"
        rm -r /tmp/ipaudio >/dev/null 2>&1
        rm -f $CHECK >/dev/null 2>&1
        exit 1
fi

# remove old version
rm -rf $PLUGINPATH >/dev/null 2>&1
rm -f /usr/bin/ff-ipaudio >/dev/null 2>&1

cd $TEMPATH
set -e
wget -q "https://raw.githubusercontent.com/popking159/down/master/ipaudio-$version-ffmpeg.tar.gz"

tar -xzf ipaudio-"$version"-ffmpeg.tar.gz -C /tmp
set +e
rm -f ipaudio-"$version"-ffmpeg.tar.gz
cd ..

if grep -qs -i 'mips' cat $CHECK; then
        echo "[ Your device is MIPS ]"
        cp -a $FFPPLAYERM $BINDIR
        chmod 0775 /usr/bin/ff-ipaudio
elif grep -qs -i 'armv7l' cat $CHECK; then
        echo "[ Your device is armv7l ]"
        cp -a $FFPPLAYERA $BINDIR
        chmod 0775 /usr/bin/ff-ipaudio
else
        echo "###############################"
        echo "## Your stb is not supported ##"
        echo "###############################"
        rm -r /tmp/ipaudio
        rm -f $CHECK
        exit 1
        echo ""
fi

mkdir -p $PLUGINPATH
cp -r $IPAUDIO $PLUGINPATH

if [ ! -f /etc/enigma2/ipaudio.json ]; then
        cp -a $PLAYLIST /etc/enigma2
fi

if [ ! -f /etc/asound.conf ]; then
        echo "Sending asound.conf to /etc"
        cp -a $ASOUND /etc
fi

rm -r /tmp/ipaudio
rm -f $CHECK

echo ""
sync
echo "#########################################################"
echo "#          IPAudio $version INSTALLED SUCCESSFULLY      #"
echo "#                          BY ZIKO                      #"
echo "#   https://www.tunisia-sat.com/forums/threads/4171372  #"
echo "#            I hope support will be back soon           #"
echo "#########################################################"
echo "#           your Device will RESTART Now                #"
echo "#########################################################"
if [ $OS = 'DreamOS' ]; then
        systemctl restart enigma2
else
        killall -9 enigma2
fi
exit 0
