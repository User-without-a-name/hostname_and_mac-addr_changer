# hostname_and_mac_changer

This bash script allows you to conviniently change your Mac Address and/or Hostname, it uses the hostnamectl command and updates the /etc/hosts file to match the new hostname. It also provides an Option to schedule automatic hostname changes using crontab

## Prerequisites

- This script requires superuser privileges to modify system settings. Make sure you run the script using `sudo` or as the root user.

## Features
 ![hmchanger](https://github.com/User-without-a-name/hostname_and_mac-addr_changer/assets/141948953/3150fee8-0609-422f-a6e2-bf1dea50d4fb)

  ***Manual Change Hostname and/or Mac address***
  	Choose your Hostname and/or Mac address to any Hostname or mac address you choose
  	
  ***Setup Hostname auto changer***
  	Choose this option to set up automatic hostname changes at specified intervals using crontab. You can configure the script to run at various time intervals (e.g., daily, hourly, etc.).
  	
  ***Generate Random Hostname***
  	This option generates a random hostname and updates both the hostname and hosts file with the new value.
  	
  ***View log***
  	Displays previous changes
  
  ***Exit***
  	Well, Gracefully Exits the script
  
## Usage

1. Clone or download the repository to your local machine.

2. Open a terminal and navigate to the directory containing the script.

3. Run the script using `sudo` or as the root user
   chmod +x hmchanger.sh
   sudo ./hmchanger.sh

## Disclaimer
 This is only for testing purposes and can only be used where strict consent has been given. Do not use this for illegal purposes

## Contribute
 Contributions are always welcome!

## License
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

See 'LICENSE' for more information.
