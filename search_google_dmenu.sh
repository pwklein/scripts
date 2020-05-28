#!/bin/bash

[ -z "$QUTE_URL" ] && QUTE_URL='http://google.com'

url=$(echo "$QUTE_URL" | cat - "$QUTE_CONFIG_DIR/quickmarks" "$QUTE_DATA_DIR/history" | dmenu -c -l 15 -p qutebrowser)
url=$(echo "$url" | sed -E 's/[^ ]+ +//g' | grep -E "https?:" || echo "$url")

[ -z "${url// }" ] && exit

echo "open $url" >> "$QUTE_FIFO" || qutebrowser "$url"
