#!/bin/bash

#   Tested on : Ubuntu 16.04 LTS    
#   Date      : 19-May-2016
#                                                        
#   This program is distributed in the hope that it will be useful, 
#   but WITHOUT ANY WARRANTY; without even the implied warranty of  
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.            

set -- `zenity --title="Scheduled-action" \
    --forms \
    --text='<span foreground="green">Enter Relative time</span>'  \
    --add-entry="hours" \
    --add-entry="min" -\
    --add-entry="sec" \
    --separator=".0 " \
    --add-combo=action --combo-values="poweroff|restart|suspend|logout"`

hrs=$1
min=$2
sec=$3
action=$4

time=$hrs\h\ $min\m\ $sec\s

#Checking validity of the input :

re='^[0-9]*([.][0-9]+)?$'

if ! [[ $hrs =~ $re ]] || ! [[ $min =~ $re ]] || ! [[ $sec =~ $re ]]
then
    zenity  --error \
            --title="Invalid Input" \
            --text="You have entered an Invalid time! \n\nOnly positive integers supported"
            exit 1
fi



case $action in
    "poweroff")
        zenity --title=Confirm --question \
        --text="Your system is about to <span foreground=\"red\">$action</span> in ${hrs%%.*} hours ${min%%.*} minutes ${sec%%.*} seconds. \nAre you sure \?"
        if [ $? -eq 0 ]
        then 
            sleep $time && poweroff
        else
            exit
        fi  ;;

    "restart")
        zenity --title=Confirm --question \
        --text="Your system is about to <span foreground=\"red\">$action</span> in ${hrs%%.*} hours ${min%%.*} minutes ${sec%%.*} seconds. \nAre you sure \?"
        if [ $? -eq 0 ]
        then 
            sleep $time && reboot
        else
            exit
        fi  ;;
    "suspend")

        zenity --title=Confirm --question \
        --text="Your system is about to <span foreground=\"red\">$action</span> in ${hrs%%.*} hours ${min%%.*} minutes ${sec%%.*} seconds. \nAre you sure \?"
        if [ $? -eq 0 ]
        then 
            sleep $time && systemctl suspend -i
        else
            exit
        fi  ;;
    "logout")
        zenity --title=Confirm --question \
        --text="Your system is about to <span foreground=\"red\">$action</span> in ${hrs%%.*} hours ${min%%.*} minutes ${sec%%.*} seconds. \nAre you sure \?"
        if [ $? -eq 0 ]
        then 
            sleep $time && gnome-session-quit --logout --no-prompt
        else
            exit
        fi  ;;
esac
