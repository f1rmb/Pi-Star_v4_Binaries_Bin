#! /bin/bash
#
# Return the version of the Raspberry Pi we are running on
# Written by Andy Taylor (MW0MWZ)
#

# Pull the CPU Model from /proc/cpuinfo
modelName=`grep 'model name' /proc/cpuinfo | sed 's/.*: //'`
hardwareField=`grep 'Hardware' /proc/cpuinfo | sed 's/.*: //'`

if [[ ${modelName} == "ARM"* ]]; then
	# Pull the Board revision from /proc/cpuinfo
	boardRev=`grep 'Revision' /proc/cpuinfo | awk '{print $3}' | sed 's/^100//'`

	# Make the board revision human readable
	case $boardRev in
	*0002) raspberryVer="Model B r1.0 (256MB)";;
	*0003) raspberryVer="Model B r1.0 + ECN0001 (no fuses, D14 removed) (256MB)";;
	*0004) raspberryVer="Model B r2.0 (256MB)";;
	*0005) raspberryVer="Model B r2.0 (256MB)";;
	*0006) raspberryVer="Model B r2.0 (256MB)";;
	*0007) raspberryVer="Model A Mounting holes (256MB)";;
	*0008) raspberryVer="Model A Mounting holes (256MB)";;
	*0009) raspberryVer="Model A Mounting holes (256MB)";;
	*000d) raspberryVer="Model B r2.0 (512MB)";;
	*000e) raspberryVer="Model B r2.0 (512MB)";;
	*000f) raspberryVer="Model B r2.0 (512MB)";;
	*0010) raspberryVer="Model B+ r1.0 (512MB)";;
	*0011) raspberryVer="Compute Module 1 r1.0 (512MB)";;
	*0012) raspberryVer="Model A+ r1.1 (256MB)";;
	*0013) raspberryVer="Model B+ r1.2 (512MB)";;
	*0014) raspberryVer="Compute Module 1 r1.0 (512MB)";;
	*0015) raspberryVer="Model A+ r1.1";;
	*900021) raspberryVer="Model A+ r1.1 (512MB)";;
	*900032) raspberryVer="Model B+ r1.2 (512MB)";;
	*900092) raspberryVer="Pi Zero r1.2 (512MB)";;
	*900093) raspberryVer="Pi Zero r1.3 (512MB)";;
	*9000c1) raspberryVer="Pi Zero W r1.1 (512MB)";;
	*9020e0) raspberryVer="Pi 3 Model A+ (512MB), Sony, UK";;
	*920092) raspberryVer="Pi Zero r1.2 (512MB)";;
	*920093) raspberryVer="Pi Zero r1.3 (512MB)";;
	*900061) raspberryVer="Compute Module 1 r1.1";;
	*902120) raspberryVer="Pi Zero 2 W r1.0 (512MB)";;
	*a01040) raspberryVer="Pi 2 Model B (1GB), Sony, UK";;
	*a01041) raspberryVer="Pi 2 Model B (1GB), Sony, UK";;
	*a02082) raspberryVer="Pi 3 Model B (1GB), Sony, UK";;
	*a020a0) raspberryVer="Compute Module 3 r1.0 (1GB)";;
	*a020d3) raspberryVer="Pi 3 Model B+ (1GB), Sony, UK";;
	*a21041) raspberryVer="Pi 2 Model B (1GB), Embest, CH";;
	*a22042) raspberryVer="Pi 2 Model B (1GB), Embest, CH";;
	*a22082) raspberryVer="Pi 3 Model B (1GB), Embest, CH";;
	*a220a0) raspberryVer="Compute Module 3 r1.0 (1GB)";;
	*a32082) raspberryVer="Pi 3 Model B (1GB), Sony, JPN";;
	*a52082) raspberryVer="Pi 3 Model B (1GB), Stadium";;
	*a22083) raspberryVer="Pi 3 Model B (1GB), Embest";;
	*a02100) raspberryVer="Compute Module 3+ r1.0 (1GB)";;
	*a03111) raspberryVer="Pi 4 Model B (1GB), Sony, UK";;
	*b03111) raspberryVer="Pi 4 Model B (2GB), Sony, UK";;
	*c03111) raspberryVer="Pi 4 Model B (4GB), Sony, UK";;
	*b03112) raspberryVer="Pi 4 Model B r1.2 (2GB), Sony, UK";;
	*c03112) raspberryVer="Pi 4 Model B r1.2 (4GB), Sony, UK";;
	*d03114) raspberryVer="Pi 4 Model B r1.4 (8GB), Sony, UK";;
	*a03140) raspberryVer="CM4 r1.0 (1GB)";;
	*b03140) raspberryVer="CM4 r1.0 (2GB)";;
	*c03140) raspberryVer="CM4 r1.0 (4GB)";;
	*d03140) raspberryVer="CM4 r1.0 (8GB)";;
	*) raspberryVer="Unknown ARM based System";;
	esac

	if [[ ${hardwareField} == "ODROID"* ]]; then
		echo "Odroid XU3/XU4 System"
	elif [[ ${hardwareField} == *"sun8i"* ]]; then
		echo "sun8i based Pi Clone"
	elif [[ ${hardwareField} == *"s5p4418"* ]]; then
		echo "Samsung Artik"
	else
		echo $raspberryVer
	fi
	
elif [[ ${hardwareField} == *"sun8i"* ]]; then
	echo "sun8i based Pi Clone"
else
	echo "Generic "`uname -p`" class computer"
fi
