#!/bin/bash

notification () {
		
		if pgrep -x "dunst" > /dev/null; then
				notify-send 'Box sync' "$1"
		else
				echo $1
		fi
}

if pgrep -x "nextcloudcmd" > /dev/null
then
		notification 'Already running'
		exit 1
fi

notification 'started'

source $HOME/private_files/box_config.sh
OUT_FILE="$HOME/.local/.nextcloudcmd.txt"

#password="$(dmenu \
		#-nb "${COLOR_BACKGROUND:-#151515}" \
		#-nf "${COLOR_DEFAULT:-#151515}" \
		#-sf "${COLOR_HIGHLIGHT:-#589cc5}" \
		#-sb "#1a1a1a" \
		#-c \
		#-p "password:" <&-)"
if [[ "$(echo $HOSTNAME)" = "gauss" ]]; then
nextcloudcmd \
		--unsyncedfolders $HOME/scripts/unsynced.txt \
		$HOME/box \
		https://$user:$pass@box.pwklein.com/remote.php/webdav/ </dev/null >"$OUT_FILE" 2>&1
else
nextcloudcmd \
		$HOME/box \
		https://$user:$pass@box.pwklein.com/remote.php/webdav/ </dev/null >"$OUT_FILE" 2>&1
fi

FEEDBACK=
if grep 'Authentication failed' "$OUT_FILE" >/dev/null; then
		FEEDBACK="Authentication failed"
		notification "$FEEDBACK"
elif grep 'Network error' "$OUT_FILE" >/dev/null; then
		FEEDBACK="Network error"
		notification "$FEEDBACK"
else
		FEEDBACK="done"
		trash-put $OUT_FILE
		notification "$FEEDBACK"
fi

