#!/bin/bash
ssh $(grep "Host " ~/.ssh/config | awk '{print $2}' | fzf --height=20% --layout=reverse --border)
