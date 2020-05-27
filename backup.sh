#!/bin/bash

color1=$(tput setaf 199);
color2=$(tput setaf 15);
reset=$(tput sgr0);


echo "${color2}*** Backup to CPHT started ${reset}"
echo "${color2}*** Do you wish to continue with the backup? [yes/no] ${reset}"
 
read answer

if [ "$answer" = "yes" ]; then
        rsync -aAXvhut --progress --exclude=.cache/* --delete --backup --backup-dir="x_date_$(date +\\%Y-\\%m-\\%d)_time_$(date +\\%H-\\%M)" /home/pwk casimir8:~/work/
        echo "${color2}*** Backup to CPHT completed${reset}"
else
        echo "${color2}*** Backup to CPHT cancelled${reset}"
fi
