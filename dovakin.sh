#!/bin/bash
# simple menu to do various functions

 
echo "     .___                   __   .__  "      
echo "   __| _/_______  _______  |  | _|__|  ___ Ver 1.2" 
echo "  / __ |/  _ \  \/ /\__  \ |  |/ /  |/    \  airmon-zc"
echo " / /_/ (  <_> )   /  / __ \|    <|  |   |  \ "
echo " \____ |\____/ \_/  (____  /__|_ \__|___|  / "
echo "      \/                 \/     \/       \/ "
echo " $(tput setaf 1) To make this script executable use chmod +x dovakin1.2.sh $(tput sgr0)"
echo ""


while :
do
echo "Select from the following functions"
echo "  [0]   exit"
echo "  [1]   wlan0 monitor mode"
echo "  [2]   wlan1 monitor mode"
echo "  [3]   wlan2 monitor mode"
echo "  [4]   start metasploit services"
echo "  [5]   start armitage"
echo "  [6]   kill wifi card"
echo "  [7]   update kali"
echo "  [8]   airodump-ng"
echo "  [9]   install ethtool" 

read -p "Enter Number " answer
    case $answer in
       0) break ;;
       1) echo "wlan0 monitor mode"
	ifconfig wlan0 down
	macchanger -r wlan0
	ifconfig wlan0 up
	airmon-zc start wlan0;;
       2) echo "wlan1 monitor mode" 
        ifconfig wlan1 down
        macchanger -r wlan1
        ifconfig wlan1 up
	airmon-zc start wlan1;;
       3) echo "wlan2 monitor mode" 
        ifconfig wlan2 down
        macchanger -r wlan2
        ifconfig wlan2 up
	airmon-zc start wlan2;;
       4) echo "start metasploit services"
	service postgresql start && service metasploit start;;
       5) echo "start armitage"
	/etc/init.d/metasploit-postgres start
	armitage;;
       6) echo "kill wifi cards"
	 ifconfig wlan0 down
	 ifconfig wlan1 down
	 ifconfig wlan2 down
	 ifconfig wlan0mon down
	 ifconfig mon0 down
	;;
	7) echo "update kali"
	apt-get update && apt-get upgrade -y;;
	8) echo "airodump-ng"
	airodump-ng wlan0mon;;
	9) echo "install ethtool"
	apt-get install ethtool;;
       *) break ;;
   esac 
   echo "press RETURN for menu"
   read key
done
exit 0
