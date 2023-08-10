# hostname_and_mac-addr_changer

This bash script allows you to conviniently change your Mac Address and/or Hostname, it uses the hostnamectl command and updates the /etc/hosts file to match the new hostname. It also provides an Option to schedule automatic hostname changes using crontab

## Prerequisites

- This script requires superuser privileges to modify system settings. Make sure you run the script using `sudo` or as the root user.

## Features
 
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

4. ## Disclaimer
5. This is only for testing purposes and can only be used where strict consent has been given. Do not use this for illegal purposes

6. ## Contribute
7. Contributions are always welcome!
