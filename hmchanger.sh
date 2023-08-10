#!/bin/bash

logfile=hmchanger.log
#Function to Change Hostname
change_hostname() {
	/usr/bin/echo "$(/usr/bin/date)[Hostname] Old Hostname:$(hostname) --> New Hostname:$new_hostname" >>$PWD/$logfile 2>>$PWD/$logfile
	/usr/bin/sudo /usr/bin/sed -i "s/$(hostname)/$new_hostname/g" /etc/hosts
	/usr/bin/sudo hostnamectl hostname $new_hostname 2>>./$logfile
}
#Function to change Mac Address
change_mac_addr() {
	old_mac=$(/usr/bin/ip a s $interface | /usr/bin/grep ether | /usr/bin/awk '{print $2}')
	/usr/bin/echo "$(date)[Mac Address] Old Mac_addr:$old_mac --> New Mac_addr:$new_mac_addr" >>./$logfile 2>>./$logfile

	/usr/bin/sudo /usr/bin/ip link set dev $interface down
        /usr/bin/sudo /usr/bin/ip link set dev $interface address $new_mac_addr
        /usr/bin/sudo /usr/bin/ip link set dev $interface up
}
#Mark Executable
/usr/bin/chmod +x $PWD/$0
#Check if Effective User ID is 0,if not throw error and exit
if [ $EUID -ne 0 ]; then
	/usr/bin/echo "[-] script must run with Sudo Privileges or root."
	exit 0
fi

#Checks if Script was run directly by user or cron by examining the variable PPID (Parent Process ID)
if [ "$1" = "from_cron" ]; then
try=0
	while [ $try -le 5 ]; do
		ping -c1 generatorfun.com >>/dev/null 2>>/dev/null
		if [ $? -ne 0 ]; then
	    	    sleep 30
		    if [ $try -eq 5 ]; then
		        echo "[-]Failed to generate new names submit issue in github repo" >> ./$logfile
	     	   fi
		else
	    	    new_hostname=$(curl -s 'https://generatorfun.com/code/model/generatorcontent.php?recordtable=generator&recordkey=261&gen=Y&itemnumber=10&randomoption=undefined&genimage=No&geneditor=No&nsfw=undefined&keyword=undefined&searchfilter=&searchfilterexclude=&tone=Normal&prefix=None&randomai=undefined' | grep "data-text=" | cut -d '(' -f 9 | sed 's/)/-/g' | sed 's/ //g'
)
	    	    break
		fi
		((try++))
	done
	change_hostname
	exit 0
else

/usr/bin/echo "██╗  ██╗    ██╗███╗   ███╗         ██████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ███████╗██████╗ ";
/usr/bin/echo "██║  ██║   ██╔╝████╗ ████║        ██╔════╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██╔════╝██╔══██╗";
/usr/bin/echo "███████║  ██╔╝ ██╔████╔██║        ██║     ███████║███████║██╔██╗ ██║██║  ███╗█████╗  ██████╔╝";
/usr/bin/echo "██╔══██║ ██╔╝  ██║╚██╔╝██║        ██║     ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██╗";
/usr/bin/echo "██║  ██║██╔╝   ██║ ╚═╝ ██║███████╗╚██████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║";
/usr/bin/echo "╚═╝  ╚═╝╚═╝    ╚═╝     ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝";
/usr/bin/echo "                                                                                             ";


#Read Options to user and take user choice
/usr/bin/echo "1 - Manual Change Hostname and/or Mac address"
/usr/bin/echo "2 - Schedule Automatic Hostname Change (Crontab)"
/usr/bin/echo "3 - Generate Random Hostname:"
/usr/bin/echo "4 - View log"
/usr/bin/echo "5 - Exit"

read option

case $option in 
    1) 
      /usr/bin/echo "[+]Enter New Hostname: "
      read new_hostname
      change_hostname

      /usr/bin/echo "[+]Change Mac Address:(Y/N): "
      read option

      if [ "$option" = 'Y' ] || [ "$option" = 'y' ]; then
	/usr/bin/echo "$(ip a s | grep -E '^[0-9]+: ' | awk '{print $1 $2}')"
	/usr/bin/echo "[+]Type out the device name to change the Mac Address"
	read interface
	change_mac_addr
     fi 
	;;
    2) /usr/bin/echo "[+]How often do you want to change Hostname?"
       /usr/bin/echo "1 - Minute"
       /usr/bin/echo "2 - Hour"
       /usr/bin/echo "3 - Daily"
       /usr/bin/echo "4 - Monthly"
       /usr/bin/echo "5 - Yearly"
       read choice
       script_path="$PWD/$0"
      if [ $choice -eq 1 ]; then
	(/usr/bin/crontab -l 2>/dev/null; /usr/bin/echo "* * * * * $PWD/$0 from_cron") | /usr/bin/crontab -
      elif [ $choice -eq 2 ]; then
	(/usr/bin/crontab -l 2>/dev/null; /usr/bin/echo "0  * * * $PWD/$0 from_cron") | /usr/bin/crontab -
      elif [ $choice -eq 3 ]; then
	(/usr/bin/crontab -l 2>/dev/null; /usr/bin/echo "0 0 * * * $PWD/$0 from_cron") | /usr/bin/crontab -
      elif [ $choice -eq 4 ]; then
	(/usr/bin/crontab -l 2>/dev/null; /usr/bin/echo "0 0 1 * * $PWD/$0 from_cron") | /usr/bin/crontab -
      elif [ $choice -eq 5 ]; then
	(/usr/bin/crontab -l 2>/dev/null; /usr/bin/echo "0 0 1 1 * $PWD/$0 from_cron") | /usr/bin/crontab -
      fi
	;;
    3)try=0
	while [ $try -le 5 ]; do
        	        ping -c1 generatorfun.com >>/dev/null 2>>/dev/null
                	if [ $? -ne 0 ]; then
                    	    sleep 30
                    	    if [ $try -eq 5 ]; then
                              echo "[-]Failed to generate new names submit issue in github repo" >> ./$logfile
			      echo "[-]Failed to generate new name, check internet connection and try again"
                   	    fi
                	else
                            new_hostname=$(curl -s 'https://generatorfun.com/code/model/generatorcontent.php?recordtable=generator&recordkey=261&gen=Y&itemnumber=10&randomoption=undefined&genimage=No&geneditor=No&nsfw=undefined&keyword=undefined&searchfilter=&searchfilterexclude=&tone=Normal&prefix=None&randomai=undefined' | grep "data-text=" | cut -d '(' -f 9 | sed 's/)/-/g' | sed 's/ //g'
)
                            break
                        fi
		        (( try++ ))
        done
	change_hostname
	echo "New Hostname is $(hostname)"
		;;
     4) /usr/bin/cat $PWD/$logfile;;
     5) exit 0;;

esac
fi
