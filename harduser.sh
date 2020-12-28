THIS IS STILL A ROUGH SKETCH. THE SCRIPT WON’T RUN IN THIS STATE

#INITIAL GREETING
echo “Welcome to the PureOS hardening script”
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
#rkhunter
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

#SET CRON JOBS
echo “Configuring ongoing cleanup, security scans, and settings”
#Set ClamAV to run daily? Weekly?
#How often to run rkhunter?
@reboot
	Macspoofer
@daily
@weekly
apt-get purge && apt-get autoremove
#Empty trash
#Purge temporary files. Where are all the temp files stored?

#OVERWRITE BLANK SPACE
echo “Overwriting blank hard drive space to improve privacy. This will take a long time…”
#run sfill

#SET WALLPAPER

