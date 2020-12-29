#THIS IS STILL A ROUGH SKETCH. THE SCRIPT WON’T RUN IN THIS STATE
#TODO for current version:
#	What firewall does PureOS ship with?
#	Create shortcuts on the desktop?
#		EFF surveillance self-defense
#		12 days to 2FA
#		Securityinabox.org
#		Add README to desktop which orients users to the OS and changes from this script.
#	Write script to rename all files in BURN_BARREL folder on desktop and securely erase
#		srm -r /PATH TO BURN_BARREL/*.*
#b	backup utility

#FUTURE FUNCTIONALITY?
#	USB 'safe window'?
#	script to hash and compare certain files for integrity?
#	Configure macchanger to run at boot?
#	Write script to 'super clean'
#		run apt-get update && apt-get upgrade
#		run apt-get autoremove
#		run apt-get clean
#		srm browser storage folders
#			srm browser downloads?
#		srm bash history
#		srm all temp files
#		srm BURN_BARREL
#		srm trash
#		remove metadata from all files in certain folders?
#			photos
#			documents
#			downloads
#		script to hash and compare certain files for integrity?
#		run sfill /
#		run sswap
#		run smem
#		run backup utility
#		shutdown -P
#	Write script to 'prepare for travel', a less intense version of 'super clean'

#start the script
#!/bin/bash

#check for root. Required to run many of the following commands
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Log in as root or sudo and restart the script"
    sleep 5s
    exit
else
echo "Verified root"
fi

#check for internet connectivity. Required to run many of the following commands
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "Network connected"
else
  echo "Please connect to the internet and restar the script"
  sleep 5s
  exit
fi

#welcome and introduction
echo "Welcome to harduser, a PureOS hardening script."
sleep 3s
echo "This automatic script will update PureOS, install and configure additional software, improve security settings, and configure no-maintenance security scans."
sleep 10s
echo "This process will take a long time to run. Once complete, your system will shut down."
sleep 5s
echo "The script will begin in 10 seconds. Press Control + C at any time to cancel."
sleep 10s
echo "Beginning..."

#create harduser file structure
echo "Creating /home/harduser. This is where important logs and configuration files will be stored."
sleep 3s
echo "Refer to it often for reports on malware and suspicious activity on your system."
sleep 3s
mkdir /home/harduser
mkdir /home/harduser/support
#UNCOMMENT ONCE FUNCTIONALITY IS IN PLACE TO BURN
#mkdir /burn_barrel

#Update and add new packages
echo "Updating all programs."
#NEED TO Add Debian security repository
Apt-get update && apt-get dist-upgrade
echo "Installing new software"
apt-get install haveged -y
apt-get install secure-delete -y
apt-get install clamav -y
apt-get install rkhunter -y
apt-get install macchanger -y
apt-get install bitwarder -y
#RESEARCH Does PureOS Include SELinux or AppArmor?
#Install metadata remover
#Signal
#veracrypt
#ProtonVPN
#authy
Apt-get update && apt-get upgrade
apt-get autoremove
apt-get clean

#malware
echo "Configuring ClamAV antivirus"
wget -O /home/harduser/support/clamav.conf - https://github.com/flintsaw/harduser/blob/main/clamav.conf
wget -O /home/harduser/support/rkhunter.conf - https://github.com/flintsaw/harduser/blob/main/rkhunter.conf
#NEEDTO run freshclam with configuration flags
#NEEDTO run clamav with configuration flags
echo "Configuring rkhunter, specialized malware detection"
#NEEDTO update rkhunter version and run --update
##NEEDTO run rkhunter with configuration flags

#configure users
#NEEDTO add user "user"

#PERMISSIONS
echo "Setting permissions for users and groups"
#NEEDTO give user suro permissions
#NEEDTO edit group, user, and program permissions

#VARIOUS PROGRAM CONFIGURATIONS
echo “Initial program configurations”
echo “firewall”
#firewall
echo “Firefox browser”
#change config
#import default profile from github
#bookmark eff surveillance self defense
#bookmark opt-out websites
#bookmark haveibeenpwned

#helpful resources
#NEEDTO place harduser_GUIDE.txt on desktop
#NEEDTO place harduser_GUIDE.txt in /home/harduser
#NEEDTO place harduser_diceware.txt on desktop
#NEEDTO place harduser_diceware.txt in /home/harduser
#NEEDTO create shortcut to /home/harduser on desktop

#SET CRON JOBS
echo “Configuring ongoing cleanup, security scans, and settings”
#Set ClamAV to run daily? Weekly?
#How often to run rkhunter?
#rkhunter --propupd
#rkhunter --versioncheck
#rkhunter --update
rkhunter --versioncheck --update --sk --rwo -l /home/harduser rkhunter.log
@reboot
	#Macspoofer
	#update clamav signatures? Confirm if done automatically
@daily
crontab -e 
@weekly
apt-get purge
apt-get autoremove
apt-get clean
#Empty trash
#Purge temporary files. Where are all the temp files stored?

#kernel hardening and configuration
#refer to various hardening guides. Include links in comments
echo "Hardening Linux Kernel, the core of your system"
#Adjust sysctl settings
#Disable Bluetooth by default?

#overwrite blank hard drive space
echo "Traces of your old files and operating system are present on the hard drive and can easily be recovered."
echo "These files are now being securely overwritten. This will take a long time but it's worth the wait."
sfill /

#system cleaning
echo "Setting up ongoing system cleaning"
#NEEDTO setup logrotate

#SET WALLPAPER
#FINAL WRAPUP
apt-get check
apt-get update
apt-get upgrade
apt-get clean
apt-get purge
apt-get clean
echo "The harduser script is now complete. Enjoy using PureOS with custom hardening!"
echo "The system will shutdown in 1 minute."
sleep 1m
shutdown -P
