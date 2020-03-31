#new!/bin/bash

color1=$(tput setaf 199);
color2=$(tput setaf 15);
reset=$(tput sgr0);


echo "${color2}*** Restore from CPHT started ${reset}"

echo "${color1}$(rsync -avzhut --dry-run --update --progress casimir8:~/home_save_desktop/ ~/ | grep deleting  )"

echo "${reset}(to be deleted on your machine) ${reset}"
echo "${color2}*** Do you wish to continue restoring? [yes/no] ${reset}"

read answer

if [ "$answer" = "yes" ]; then
	rsync -avzhut --update --progress casimir8:~/home_save_desktop/ ~/
	echo "${color2}*** Restoring from CPHT completed${reset}"
else
	echo "${color2}*** Restoring from CPHT cancelled${reset}"
fi
