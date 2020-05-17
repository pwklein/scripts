#!/bin/bash
zathura --fork "$(find ~/. -type f -iname "*.pdf" | dmenu -c -l 10 )"
