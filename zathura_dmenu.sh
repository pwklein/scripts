#!/bin/bash
zathura --fork "$(find ~/. -type f -iname "*.pdf" | dmenu\
    -nb "${COLOR_BACKGROUND:-#151515}" \
    -nf "${COLOR_DEFAULT:-#aaaaaa}" \
    -sf "${COLOR_HIGHLIGHT:-#589cc5}" \
    -sb "#1a1a1a" \
    -i -p "PDF: " \
-c -l 10 )"