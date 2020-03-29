#!/bin/bash

# overwrite with my own bash prompt
color1=$(tput setaf 178)
color2=$(tput setaf 228);
color3=$(tput setaf 15);
reset=$(tput sgr0);

PS1="\[${color1}\]\u\[${color2}\]@\[${color1}\]\W\[${color2}\]$ \[${reset}\]";

export PS1
