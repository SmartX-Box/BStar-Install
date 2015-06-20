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
# Name			: smartx_bstar_automated_upgrade.sh
# Description	: Script for automated upgrade SmartX BStar 
#
# Created by    : TEIN_GIST@nm.gist.ac.kr
# Version       : 0.1
# Last Update	: June, 2015
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

# Record Total time duration

stop=$(date +"%s")
echo SmartX Upgrade Finish at `date +"%r"`
diff=$(($stop-$start))
echo "Total $(($diff / 3600)) hours $(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed for SmartX Upgrade."