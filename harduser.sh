THIS IS STILL A ROUGH SKETCH. THE SCRIPT WON’T RUN IN THIS STATE
#!/bin/bash

#INITIAL GREETING
echo “Welcome to the PureOS hardening script”
mkdir /home/harduser
wget -O - https://github.com/flintsaw/harduser/blob/main/clamav.conf -P /home/harduser
#Any user input here?
#check for root.
#check for internet connectivity

#UNCATEGORIZED
#create shortcuts on the desktop? EFF surveillance self-defense, 12 days to 2FA, etc.
Securityinabox.org
Add README to desktop which orients users to the OS and changes from this script.

#ADD AND UPDATE PACKAGES
Echo “Updating and upgrading packages.”
#Add Debian security repository
Apt-get update && apt-get upgrade
Apt-get install haveged
Apt-get install secure-delete
#Does PureOS Include SELinux or AppArmor?
#clamav
#signatures for clamav
apt-get install rkhunter
#Install metadata remover
#Macspoofer
#Bitwarden
#Signal
#veracrypt
#ProtonVPN
#authy
Apt-get update && apt-get upgrade

#LOGROTATE
echo “Configuring logs”
#setup logrotate

#CONFIGURE USERS
echo “Configuring users and permissions”
#Add user? SUID? Etc.

#PERMISSIONS
echo “Setting permissions for users and groups”
Group, user, and program permissions



#KERNEL CONFIGURATION
echo “Hardening Linux Kernel”
#Adjust sysctl settings
#Disable Bluetooth by default?
#refer to various hardening guides. Include links in comments

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

#ANTIVIRUS
echo "ClamAV Antivirus"
wget -O - https://github.com/flintsaw/harduser/blob/main/harduser.sh


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
apt-get purge && apt-get autoremove
#Empty trash
#Purge temporary files. Where are all the temp files stored?

#OVERWRITE BLANK SPACE
echo "Traces of your old files and operating system are present on the hard drive and can easily be recovered."
echo "These files are now being securely overwritten. This will take a long time but it's worth the wait."
sfill /

#SET WALLPAPER
#FINAL WRAPUP
apt-get check
apt-get update
apt-get upgrade
apt-get autoremove
apt-get purge
apt-get clean
echo "The harduser script is now complete. Enjoy using PureOS with custom hardening!"
echo "The system will shutdown in 1 minute."
sleep 1m
shutdown -P
