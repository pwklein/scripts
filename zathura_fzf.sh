#!/bin/bash
zathura "$(find ~/. -type f -iname "*.pdf" | fzf --layout=reverse --border --height=20%)"
