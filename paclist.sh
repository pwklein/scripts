#!/bin/bash

sudo pacman -Qqe > /home/pwk/scripts/paclist.txt
echo $(cat /home/pwk/scripts/paclist.txt | wc -l ) packages written to list
