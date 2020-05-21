#!/bin/bash
jupyter-notebook "$(find ~/. -type f -iname "*.ipynb" | dmenu\
    -nb "${COLOR_BACKGROUND:-#151515}" \
    -nf "${COLOR_DEFAULT:-#aaaaaa}" \
    -sf "${COLOR_HIGHLIGHT:-#589cc5}" \
    -sb "#1a1a1a" \
    -i -p "Notebook: " \
-c -l 10)" &>/dev/null &
