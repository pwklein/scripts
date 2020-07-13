#!/bin/bash

hostname="$(echo $HOSTNAME)"

sudo pacman -Qqe | grep -vx "$(pacman -Qqm)" | grep -vx "$(cat $HOME/scripts/paclist_exclude.txt)" > $HOME/private_files/paclist_${hostname}.txt
echo "*** $(cat $HOME/private_files/paclist_${hostname}.txt | wc -l ) official repo packages written to list"

sudo pacman -Qqm | grep -vx "$(cat $HOME/scripts/paclist_exclude.txt)" > $HOME/private_files/yaylist_${hostname}.txt
echo "*** $(cat $HOME/private_files/yaylist_${hostname}.txt | wc -l ) local packages written to list"
