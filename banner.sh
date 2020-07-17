#!/bin/bash

sudo sh -c 'echo "
$(figlet -f /home/pwk/scripts/figlet_font.flf "$(echo $HOSTNAME)")
" > /etc/issue'
