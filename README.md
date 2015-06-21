# README #
[SmartX-Automation:BStarInstall] : Linux-based Script (BASH) automated installation tools of SmartX Box type B* for OF@TEIN Testbed.

## Summary ##
### Overview ###
This tool is developed to do automated provisiong (installation and configuration) SmartX Box type B* of OF@TEIN Testbed infrastructure by utilizing DevStack (OpenStack Cloud automatic installer) and OpenvSwitch OpenFlow-SDN configuration.

### Release Version ###
This is the first version of the tools released on June 2015 and it still being developed/verified. 

### Current Support and Caveats ###

This current released tools only support (OF@TEIN Testbed) current environment target:

* Ubuntu Operating System 14.04.02 (Trusty Tahr)
* OpenStack Juno Stable Release
* OpenStack VLAN-based Tenant Network
* OpenvSwitch OpenFlow-SDN VXLAN Overlay Network

## How it works ##

### Hardware (SmartX Box) Requirements ###

In order to install SmartX B* Box using this tool and integrate with current OF@TEIN Testbed infrastructure, the required/recommended hardware specification is:

* Processor (CPU) 	: 4 cores or more
* Memory (RAM)		: 12 GB or more
* Storage (HDD)		: 80 GB or more			
* Network interface : 4 ports (Power + Management + Control + Data)
* Outband Management: IPMI (HP iLO or IBM IMM)

### Required Component and Connection Verification ###

Before the tools are executed, it required some components and verifications such as:

* OF@TEIN Box Specific Configuration : ask the testbed operators (TEIN-GIST@nm.gist.ac.kr) for the details
* OF@TEIN SmartX B* OpenStack Centralized Management (Keystone and Horizon) : 103.22.221.51
* OF@TEIN OpenFlow-SDN Network Slicer (FlowVisor) : 103.22.221.52
* OF@TEIN SmartX Configuration and Access Center : 103.22.221.53
* OF@TEIN Testbed HUB nodes (MYREN or GIST) : 103.26.47.229 or 62.252.52.11


### Current Features ###

There are current features:

* Automated Upgrade Tools from previous SmartX Box type (Remote upgrade include: Clean Up + OS Upgrade + Install)
* Automated clean up tools for previous SmartX B+ Installation (XEN Hypervisor and OpenvSwitch)
* Automated Ubuntu Operating system upgrade to 14.04 LTS version
* Automated Fresh Install Tools of SmartX B*


## Preparation ##

### Dependencies ###
Git Tools

### SmartX Box Local Upgrade/Installation ###
Download the cleanup/OS-upgrade/installation scripts into SmartX Box and Edit the "Specific Parameter" in the Script

* Site 		= Site ID of SmartX Box
* PHY_EXT		= Physical interface for OpenStack external (control) Connection
* BR1_DPID	= Datapath ID for SDN user switch1	
* BR2_DPID 	= Datapath ID for SDN user switch2	
* BRCAP_DPID	= Datapath ID for SDN operator capsulator switch
* DP_IF		= Physical interface for datapath interface 
* DP_GW		= Gateway for data interface to reach the site
* HUB		= Central site (GIST or MYREN)

### SmartX Box Remote Upgrade (still on Development) ###

Download the automated upgrade scripts into Remote Machine (Linux) and Edit the "Specific Parameter" in the script
<But it might still required customized configuration in the script before execution>

## How to Execute (Guidelines) ##

### Connection and Communication Verification ###

Ping to all OF@TEIN components above (103.22.221.51, 103.22.221.52, 103.22.221.53, 103.26.47.229, and 62.252.52.11).
Some of them maybe required specific TCP-level verification based on API/Service Ports. Please check details OpenStack and OpenvSwitch Ports.

### Clean Up and OS Upgrade (for previous SmartX Box Installation) ###

* ./smartx_bplus_cleanup.sh
* ./smartx_bstar_os_upgrade.sh

### (Fresh) Installation ###

* ./smartx_bstar_installation.sh

During installation the script will ask for some additional interactive manual steps for restarting OpenStack Services.


## Support and Contribution ##

* Authors : SmartX Collaboration (GIST NetCS)
* Contributors : Aris Cahyadi Risdianto
* Contact : TEIN-GIST@nm.gist.ac.kr