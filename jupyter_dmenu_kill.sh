#!/bin/bash
jupyter notebook stop $(jupyter notebook list | dmenu\
    -nb "${COLOR_BACKGROUND:-#151515}" \
    -nf "${COLOR_DEFAULT:-#aaaaaa}" \
    -sf "${COLOR_HIGHLIGHT:-#589cc5}" \
    -sb "#1a1a1a" \
-i -c -l 10 |  grep -o -P '(?<=localhost:).*(?=/?token)' | cut -c1-4)
