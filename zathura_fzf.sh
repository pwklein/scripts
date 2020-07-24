#!/bin/bash
i3-swallow zathura "$(find ~/. -type f -iname "*.pdf" | fzf --layout=reverse --border --height=20%)"
