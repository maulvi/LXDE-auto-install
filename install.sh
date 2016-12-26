#!/bin/bash
##########################################################################
##  NoMachine 3.5 + LXDE + Firefox/Iceweasel Install Script ##
# script to fetch and install LXDE for x64/x86 debian/ubuntu
###########################################################################
## define packages
packages="lxde lxterminal iceweasel"
##
## display welcome
clear
echo ""
echo "Welcome to LXDE & NX Installer"
echo "This script is designed to be run on a fresh install"
##
## check if root user ##
if [ $(whoami) != "root" ]; then
        echo "You need to run this script as root."
        echo "Use 'sudo ./autolxde.sh' then enter your password when prompted."
        exit 1
fi
echo ""
## see if 32 or 64 bit ##
if [ "`uname -m | grep 64`" ];  then
	V="64"
    else
	V=""
fi
##
echo "Updating Package List"
echo ""
	apt-get update
echo ""
echo "Installing Remote LXDE Desktop"
echo ""
	apt-get install -y --no-install-recommends $packages
	clear
## non-root user setup ##
echo "You cannot login to NoMachine as root"
echo "If you already have a non-root user, you don't have to add another."
echo ""
##
read -p "Add a new user? (y/n) " RESP
	if [ "$RESP" = "y" ]; then
		read -p "What would you like the username to be?   " username
		adduser --gecos "" $username
	fi
##
echo "########################################################################"
echo "#################             Install Complete         #################"
echo "########################################################################"
