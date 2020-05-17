#!/bin/bash
jupyter-notebook "$(find ~/. -type f -iname "*.ipynb" | dmenu -c -l 10)" &>/dev/null &
