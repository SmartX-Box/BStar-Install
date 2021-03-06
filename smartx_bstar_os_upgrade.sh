#!/bin/bash
#
# Copyright 2015 SmartX Collaboration (GIST NetCS). All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#
# Name			: smartx_bstar_os_upgrade.sh
# Description	: Script for upgrading Ubuntu Operating Systems 
#
# Created by    : TEIN_GIST@nm.gist.ac.kr
# Version       : 0.1
# Last Update	: June, 2015
#

# Specific Parameter


# Checking the Current Ubuntu Operating System Version

start=$(date +"%s")
echo Upgrade Start at `date +"%r"`


echo "Checking Ubuntu OS Distribution"

OS_VERSION=`lsb_release -r | grep Release | awk '{ print $2}'`
echo $OS_VERSION

if [ "$OS_VERSION" = "14.04" ]; then
	echo "It has already upgraded...."
	
	# Upgrading the Ubuntu Operating System to latest stable version of distribution

	echo "Updating the repository"
    apt-get update
	echo "Upgrading the packages to latest LTS version"
	apt-get -y upgrade
	
	# Record the time duration

	stop=$(date +"%s")
	echo Upgrade Finish at `date +"%r"`
	diff=$(($stop-$start))
	echo "$(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
	echo "Continue with OpenStack Installation !!!"
	exit 0
else
	echo "It will initiate the upgrade..."

fi


# Updating the Ubuntu Operating System Repository
echo "Updating the repository"
apt-get update

# Upgrading the Ubuntu Operating System to latest stable version of distribution
echo "Upgrading the packages to latest LTS version"
apt-get -y upgrade
sleep 5
echo "Current time" `date +"%r"` 

# Upgrading the Ubuntu Operating System to newest stable version
echo "Upgrading Operating system to Ubuntu 14.04"
do-release-upgrade -f DistUpgradeViewNonInteractive
sleep 5

# Calculate the upgrade duration

stop=$(date +"%s")
echo Upgrade Finish at `date +"%r"`
diff=$(($stop-$start))
echo "$(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
