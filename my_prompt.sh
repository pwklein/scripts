#!/bin/bash

# overwrite with my own bash prompt
color0=$(tput setaf 1)
color1=$(tput setaf 178)
color2=$(tput setaf 228);
color3=$(tput setaf 15);
reset=$(tput sgr0);

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\[${color1}\]\u\[${color2}\]{\[${color2}\]\W}\[${color0}\]\$(git_branch)\[${reset}\] $ \[${reset}\]";

export PS1
