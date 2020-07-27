#!/bin/bash
jupyter-notebook "$(find ~/. -type f -iname "*.ipynb" | dmenu\
    -i -p "Notebook: " \
-c -l 10)" &>/dev/null &
