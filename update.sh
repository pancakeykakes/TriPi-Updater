#!/bin/bash

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

echo "$(tput setaf 1)01010100 01110010 01101001 01010000 01101001 00110010 00101110 00110000"
echo "$(tput setaf 2)                        _______     _  _____   _"
echo "                       |__   __|   (_)|  __ \ (_)  "
echo "                          | | _ __  _ | |__) | _   "
echo "                          | || '__|| ||  ___/ | |  "
echo "                          | || |   | || |     | |  "
echo "                          |_||_|   |_||_|     |_|  "
echo
echo -e "$(tput setaf 1)01010100 01110010 01101001 01010000 01101001 00110010 00101110 00110000\n"

echo -e "$(tput setaf 2;tput bold)Hi!\n"
echo -e "This is the TriPi updater script."
echo
echo -e "I am going to install updates to your TriPi environment.\n"
echo "This could potentially break things, so you should make sure you read the README.md file on the TriPi github, and that you are capable of recovering"
echo "from any issues you run into."
echo "Not all updates are the same, so check the README.md file to find out if it is an alpha, beta, or stable release!"
echo -e "I will begin in 20 seconds...\n\n"

sleep 20

cd /home/pi/TriPi-Updater

echo "$(tput setaf 2;tput bold)Checking xboxdrv... $(tput sgr 0)"

apt-get -y install xboxdrv
adduser pi root

echo "$(tput setaf 2;tput bold)Checking auto-login and Xbox360 controller navigation..."
rm {/boot/config.txt,/etc/inittab,/etc/profile.d/emu.sh,/etc/rc.local,/home/pi/RetroPie/roms/ports/kodi.sh,/home/pi/.bashrc}

cp config.txt /boot/
cp inittab /etc/
cp rc.local /etc/
cp emu.sh /etc/profile.d/
cp {TriPi-Updater.sh,kodi.sh} /home/pi/RetroPie/roms/ports
cp .bashrc /home/pi

echo -e "\nSetting permissions for new files...$(tput sgr 0)"

sleep 1

chmod +x /home/pi/RetroPie/roms/ports/kodi.sh
chmod +x /etc/profile.d/emu.sh

echo -e "\n$(tput setaf 2;tput bold)Done!\n" 

echo "I will reboot your Raspberry Pi in 15 seconds. ENJOY! -Pancakeykakes$(tput sgr 0)"

SECONDS_TILL_REBOOT=15

while [[ ${SECONDS_TILL_REBOOT} -gt 0 ]]; do
  sleep 1
  SECONDS_TILL_REBOOT=$[${SECONDS_TILL_REBOOT} -1]
  if [[ $((${SECONDS_TILL_REBOOT} % 5)) -eq 0 ]]; then
    echo "${SECONDS_TILL_REBOOT} seconds until reboot"
  fi
done

reboot
