#!/bin/bash 

eutebrowser $( cat ~/.config/qutebrowser/quickmarks | dmenu -c -l 10 | awk '{print $2}') &>/dev/null &
