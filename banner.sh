#!/bin/bash

sudo sh -c 'echo "
$(figlet $(echo $HOSTNAME))
" > /etc/issue'