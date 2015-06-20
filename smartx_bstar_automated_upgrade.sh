#!/bin/bash
#
# Name			: smartx_bstar_automated_upgrade.sh
# Description	: Script for automated upgrade SmartX BStar 
#
# Created by    : TEIN_GIST@nm.gist.ac.kr
# Version       : 0.1
# Last Update	: April, 2015
#

# Specific Parameter

SITE=TEST

start=$(date +"%s")
echo SmartX Upgrade Start at `date +"%r"`

# Copying scripts
echo "Copying Upgrade Script"
scp smartx_bplus_cleanup.sh smartx_bstar_os_upgrade.sh smartx_bstar_installation.sh root@smartx-bplus-$SITE:

# Execute Scripts
ssh root@smartx-bplus-$SITE './smartx_bplus_cleanup.sh'
ssh root@smartx-bplus-$SITE './smartx_bstar_os_upgrade.sh'
ssh root@smartx-bplus-$SITE './smartx_bstar_installation.sh'

stop=$(date +"%s")
echo SmartX Upgrade Finish at `date +"%r"`
diff=$(($stop-$start))
echo "Total $(($diff / 3600)) hours $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed for SmartX Upgrade."