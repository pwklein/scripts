
#!/bin/bash

color1=$(tput setaf 199);
color2=$(tput setaf 15);
reset=$(tput sgr0);


echo "${color2}*** Saving to CPHT started ${reset}"

echo "${color1}$(rsync -avzhut --progress --delete --dry-run ~/ casimir8:~/home_save_desktop/ | grep deleting  )"

echo "${reset}(to be deleted at CPHT) ${reset}"
echo "${color2}*** Do you wish to continue saving to CPHT? [yes/no] ${reset}"

read answer

if [ "$answer" = "yes" ]; then
        rsync -avzhut --progress --delete ~/ casimir8:~/home_save_desktop/
        echo "${color2}*** Saving to CPHT completed${reset}"
else
        echo "${color2}*** Saving to CPHT cancelled${reset}"
fi
