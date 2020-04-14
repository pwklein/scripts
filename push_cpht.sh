
#!/bin/bash

color1=$(tput setaf 199);
color2=$(tput setaf 15);
reset=$(tput sgr0);


echo "${color2}*** Push to CPHT started ${reset}"

echo "${color1}$(rsync -avzhut --progress --delete --dry-run --exclude=".*" ~/ casimir8:~/home_pushpull/ | grep deleting  )"

echo "${reset}(to be deleted at CPHT) ${reset}"
echo "${color2}*** Do you wish to continue pushing? [yes/no] ${reset}"

read answer

if [ "$answer" = "yes" ]; then
        rsync -avzhut --progress --delete --exclude=".*" ~/ casimir8:~/home_pushpull/
        echo "${color2}*** Push to CPHT completed${reset}"
else
        echo "${color2}*** Push to CPHT cancelled${reset}"
fi
