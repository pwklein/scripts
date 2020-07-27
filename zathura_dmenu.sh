#!/bin/bash
zathura --fork "$(find ~/. -type f -iname "*.pdf" | dmenu\
    -i -p "PDF: " \
	-c -l 10 )"
