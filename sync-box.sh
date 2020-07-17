#!/bin/bash

if pgrep -x "nextcloudcmd" > /dev/null
then
		notify-send 'Box sync' 'Already running'
		exit 1
fi

notify-send 'Box sync' 'started'

source $HOME/private_files/box_config.sh
OUT_FILE=".nextcloudcmd.txt"

#password="$(dmenu \
		#-nb "${COLOR_BACKGROUND:-#151515}" \
		#-nf "${COLOR_DEFAULT:-#151515}" \
		#-sf "${COLOR_HIGHLIGHT:-#589cc5}" \
		#-sb "#1a1a1a" \
		#-c \
		#-p "password:" <&-)"
if [[ "$(echo $HOSTNAME)" = "gauss" ]]; then
echo "hello"
nextcloudcmd \
		--unsyncedfolders $HOME/scripts/unsynced.txt \
		$HOME/box \
		https://$user:$pass@box.pwklein.com/remote.php/webdav/ </dev/null >"$OUT_FILE" 2>&1
else
nextcloudcmd \
		$HOME/box \
		https://$user:$pass@box.pwklein.com/remote.php/webdav/ </dev/null >"$OUT_FILE" 2>&1
fi

cat .nextcloudcmd.txt | grep "exclude"
FEEDBACK=
if grep 'Authentication failed' "$OUT_FILE" >/dev/null; then
		FEEDBACK="Authentication failed"
		notify-send --urgency=critical 'Box sync' "$FEEDBACK"
elif grep 'Network error' "$OUT_FILE" >/dev/null; then
		FEEDBACK="Network error"
		notify-send --urgency=critical 'Box sync' "$FEEDBACK"
else
		FEEDBACK="done"
		trash-put $OUT_FILE
		notify-send --urgency=normal 'Box sync' "$FEEDBACK"
fi

