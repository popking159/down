echo " install keyadder 4.4 mod MNASR "
wget -O /var/volatile/tmp/enigma2-plugin-extensions-keyadder_4.4_mod_MNASR_all.ipk https://drive.google.com/uc?id=1RI2_fFiJIqKE_JrGJh3k2eNUuGEUfw9L&export=download
wait
opkg install --force-reinstall /var/volatile/tmp/enigma2-plugin-extensions-keyadder_4.4_mod_MNASR_all.ipk
wait
rm -r /var/volatile/tmp/enigma2-plugin-extensions-keyadder_4.4_mod_MNASR_all.ipk
echo ""
echo "keyadder 4.4 mod MNASR instlled successfully."
echo ""
echo "Thank you for using my script"
echo ""
echo "MNASR"
wait
sleep 2;
exit 0


