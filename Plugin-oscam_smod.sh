echo " install enigma2-plugin-softcams-oscam-smod "
wget -O /var/volatile/tmp/enigma2-plugin-softcams-oscam-smod_1.20_git2191.ipk https://drive.google.com/uc?id=1bNwL0yeIcdvdqH8JHPMCob2PnaApCzI8&export=download
wait
opkg install --force-reinstall /var/volatile/tmp/enigma2-plugin-softcams-oscam-smod_1.20_git2191.ipk
wait
rm -r /var/volatile/tmp/enigma2-plugin-softcams-oscam-smod_1.20_git2191.ipk
echo ""
echo "enigma2-plugin-softcams-oscam-smod instlled successfully."
echo ""
echo "Thank you for using my script"
echo ""
echo "MNASR"
wait
sleep 2;
exit 0


