#! /bin/bash
# Author: Edward Brookman
# Purpose: Simple template with examples.
#======================================

clear

while true; do
	CHOICE=$(
		whiptail --title "Brkmn Main Menu" --backtitle "Author: Edward Brookman" --menu "Make your choice" 16 100 9 \
			"1)" "Host Information." \
			"2)" "Option 2." \
			"3)" "Option 3." \
			"4)" "Option 4." \
			"5)" "Option 5." \
			"6)" "Option 6. " \
			"9)" "EXIT SCRIPT" 3>&2 2>&1 1>&3
	)

	## Parsing system information.

	result=$(whoami)
	UNA=$(awk 'BEGIN { print ENVIRON["HOSTNAME"] }')
	extip=$(curl -s ifconfig.me)
	intip=$(ip -o -f inet addr show | awk '/scope global/ {print $4}')
	mypwd=$(awk 'BEGIN { print ENVIRON["PWD"] }')
	OP=$(uptime | awk '{print $3 " days";}')

	case $CHOICE in
	"1)")

		result="Current User: $result \nOperating Sys: $UNA \nUptime: $OP \nExt IP: $extip \nInt IP: $intip \nCurrent Dir: $mypwd"
		;;
	"2)")
		result="OPTION 2"
		;;
	"3)")
		result="OPTION 3"
		;;
	"4)")
		result="OPTION 4"
		#read -r result < result
		;;
	"5)")
		result="OPTION 5"
		#read -r result < result
		;;
	"6)")
		result="OPTION 6"
		#read -r result < result
		;;
	"9)")
		exit
		;;
	esac
	whiptail --msgbox "$result" 20 78
done
exit
