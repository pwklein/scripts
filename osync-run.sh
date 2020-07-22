#!/bin/bash

notification () {
		
		if pgrep -x "dunst" > /dev/null; then
				notify-send 'osync' "$1"
		else
				echo $1
		fi
}

if pgrep -x "rsync" > /dev/null
then
		notification 'Already running'
		exit 1
fi

notification 'started'

sudo osync.sh ~/dotfiles/osync/osync.conf --errors-only --silent

notification 'done'
