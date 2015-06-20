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
# Name			: smartx_bplus_cleanup.sh
# Description	: Script for Cleaning up Previous version SmartX Installation 
#
# Created by    : TEIN_GIST@nm.gist.ac.kr
# Version       : 0.1
# Last Update	: June, 2015
#

# Specific Parameter


# Checking and Clean Up the XEN Hypervisor Services

start=$(date +"%s")
echo Clean Up Start at `date +"%r"`


XEN=`xl list | grep Domain-0`
   
if [ "${XEN:-null}" = null ]; then
	echo "XEN Domain-0 (Hypervisor) is Removed !!!"
else
	echo "XEN Domain-0 (Hypervisor) is running."
	cd /opt/xen-4.3.0/
	make uninstall
	make clean 
	cd /opt/xen-tools-4.3.1/
	make uninstall
	make clean 

	#Restoring the grub default configuration

	sed -i "s/GRUB_DEFAULT='Xen 4.3'/GRUB_DEFAULT=0/g" /etc/default/grub
fi

sleep 5

# Checking and Clean Up the OpenvSwitch Services

OVS=`ovs-vsctl list-br`

if [ "${OVS:-null}" = null ]; then
	echo "OVS Bridge is Removed !!!"
	echo "Continue to Upgrade OS !!!"
	exit 0
else
	echo "OVS Bridge is exists."
	cd /opt/openvswitch-2.0.0/
	make uninstall
	make clean 
fi

echo "Clean are done."
echo "Continue for Upgrading the OS !!!"

# Record the time duration

stop=$(date +"%s")
echo Cleam Up Finish at `date +"%r"`
diff=$(($stop-$start))
echo "$(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
