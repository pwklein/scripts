#!/bin/bash

sudo pacman -Qqe | grep -vx "$(pacman -Qqm)" | grep -vx "$(cat $HOME/scripts/paclist_exclude.txt)" > $HOME/scripts/paclist.txt
echo "*** $(cat $HOME/scripts/paclist.txt | wc -l ) official repo packages written to list"

sudo pacman -Qqm | grep -vx "$(cat $HOME/scripts/paclist_exclude.txt)" > $HOME/scripts/yaylist.txt
echo "*** $(cat $HOME/scripts/yaylist.txt | wc -l ) local packages written to list"
