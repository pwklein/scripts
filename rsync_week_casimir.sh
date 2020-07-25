#!/bin/bash

DAY=$(date +%d)
ssh casimir8 << HERE
if [ -e "$HOME/osync-backup/$DAY" ] ; then
  rm -fr "$HOME/osync-backup/$DAY"
fi
HERE

rsync -az --quiet --delete --inplace --backup --backup-dir=$DAY $HOME/osync casimir8:$HOME/osync-backup/

python ~/scripts/telegram_bot_text.py 'Done daily backup to casimir'
