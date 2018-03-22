#!/bin/sh
echo "Provisioning virtualbox link to install vm drivers"
echo "sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11" >> updatescreen.sh
echo "reboot">> updatescreen.sh
chmod +x updatescreen.sh
# to be combined with https://ubuntuforums.org/showthread.php?t=1238559
